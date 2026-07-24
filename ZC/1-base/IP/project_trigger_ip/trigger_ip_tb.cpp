/*
 * trigger_ip_tb.cpp  —  Corrected testbench
 * Vitis HLS 2022.1
 *
 * Key insight about ap_ctrl_none + static variables in C simulation:
 *
 * In C sim, every call to the top function is a normal C function call.
 * Static variables DO persist across calls within the same test case
 * (same process lifetime), but they are initialised once at program
 * start and then persist for the entire csim run.
 *
 * This means:
 * - Test 1 sets done=1 and batch_cnt=16
 * - Test 2 uses sync_reset to clear them (this tests the reset path)
 * - Test 3 cannot independently "start fresh" without a reset,
 * because the statics from Test 2's post-reset capture are still set
 *
 * In RTL, the static registers truly persist in hardware until
 * sync_reset is asserted. The testbench must mirror this.
 *
 * Back-pressure test (Test 3): in RTL, once done=1, the IP stops
 * reading from s_axis_in so tready goes LOW and the FIFO stalls.
 * In C sim we cannot directly observe tready, but we can verify
 * that the function returns without consuming from s_in when done=1.
 * We verify this by calling the function with extra data in the stream
 * and checking that the stream size does not decrease.
 *
 * Corrections:
 * 1. Test cases share static state — sequence them correctly
 * 2. Always drain m_out fully before end of test to avoid warnings
 * 3. Back-pressure test done after Test 1 (done=1) without reset
 * 4. Reset test properly sequences the reset before new data
 */

#include "trigger_ip.h"
#include <iostream>
#include <cassert>
#include <complex>

static void push(hls::stream<axis_t> &s, int count, int base=0)
{
    for (int i = 0; i < count; i++) {
        axis_t w;

        // UPDATE: Construct a complex float instead of a raw 64-bit int
        float real_val = (float)(base + i);
        float imag_val = (float)(base + i + 1);
        w.data = std::complex<float>(real_val, imag_val);

        w.keep = -1; w.strb = -1; // -1 safely asserts all byte lanes HIGH
        w.last = 0; w.id = 0; w.dest = 0; w.user = 0;
        s.write(w);
    }
}

static void drain(hls::stream<axis_t> &s)
{
    while (!s.empty()) s.read();
}

int main()
{
    int errors = 0;
    printf("%d\n", NUM_BATCHES);

    /*
     * All tests use the SAME stream objects so that static state in the
     * IP accumulates correctly across tests — mirroring RTL behaviour.
     */
    hls::stream<axis_t> s_in("s_in");
    hls::stream<axis_t> m_out("m_out");
    ap_uint<1> done = 0, rst = 0;

    /* ──────────────────────────────────────────────────────────────────
     * TEST 1 — Full capture: 16 batches × 32768 samples
     * Expected: rx=524288, tlast=16, done=1
     * ────────────────────────────────────────────────────────────────── */
    {
        int total      = FIFO_SIZE * NUM_BATCHES;  /* 524288 */
        int rx_count   = 0;
        int tlast_count = 0;
        int tlast_pos_errors = 0;

        push(s_in, total);

        for (int cycle = 0; cycle < total + 10; cycle++) {
            /* In ap_ctrl_none, call once per clock cycle.
             * When done=1 the IP returns immediately without reading. */
            trigger_ip(s_in, m_out, rst, done);

            while (!m_out.empty()) {
                axis_t o = m_out.read();
                rx_count++;
                if (o.last) {
                    tlast_count++;
                    if (rx_count % FIFO_SIZE != 0) {
                        std::cout << "TEST1: tlast at wrong position "
                                  << rx_count << "\n";
                        tlast_pos_errors++;
                    }
                }
            }

            if ((int)done == 1) break;
        }

        bool pass = (rx_count      == total)       &&
                    (tlast_count   == NUM_BATCHES)  &&
                    (tlast_pos_errors == 0)          &&
                    ((int)done     == 1);

        std::cout << "[TEST 1] rx=" << rx_count << "/" << total
                  << " tlast=" << tlast_count << "/" << NUM_BATCHES
                  << " done=" << (int)done
                  << (pass ? "  PASS" : "  FAIL") << "\n";
        if (!pass) errors++;

        /* s_in should be empty now */
        if (!s_in.empty()) {
            std::cout << "TEST1 WARN: " << s_in.size()
                      << " samples left in stream\n";
        }
    }

    /* ──────────────────────────────────────────────────────────────────
     * TEST 2 — Back-pressure when done=1
     * After Test 1, done=1. Push 100 extra samples.
     * The IP must NOT consume them (it returns immediately when done=1).
     * In C sim: call the function multiple times, stream size must stay 100.
     * ────────────────────────────────────────────────────────────────── */
    {
        /* done is still 1 from Test 1 */
        assert((int)done == 1);

        push(s_in, 100, 9999);
        int before = s_in.size();  /* should be 100 */

        /* Call the IP 50 times — it should not consume anything */
        for (int i = 0; i < 50; i++) {
            trigger_ip(s_in, m_out, rst, done);
        }

        int after = s_in.size();
        bool pass = (before == 100) && (after == 100) && ((int)done == 1);

        std::cout << "[TEST 2] Back-pressure: before=" << before
                  << " after=" << after
                  << " done=" << (int)done
                  << (pass ? "  PASS" : "  FAIL") << "\n";
        if (!pass) errors++;

        /* Drain the 100 extra samples so they don't cause warnings */
        drain(s_in);
        drain(m_out);
    }

    /* ──────────────────────────────────────────────────────────────────
     * TEST 3 — Reset clears done and counters
     * Assert sync_reset for 1 cycle, then verify done=0.
     * ────────────────────────────────────────────────────────────────── */
    {
        rst = 1;
        trigger_ip(s_in, m_out, rst, done);
        rst = 0;

        bool pass = ((int)done == 0);
        std::cout << "[TEST 3] Reset: done after reset="
                  << (int)done
                  << (pass ? "  PASS" : "  FAIL") << "\n";
        if (!pass) errors++;

        drain(m_out);
    }

    /* ──────────────────────────────────────────────────────────────────
     * TEST 4 — Post-reset full capture
     * After reset, run another complete 16-batch capture.
     * Verifies that the IP restarts correctly from zero.
     * ────────────────────────────────────────────────────────────────── */
    {
        int total       = FIFO_SIZE * NUM_BATCHES;
        int rx_count    = 0;
        int tlast_count = 0;

        push(s_in, total, 100);  /* different base value to distinguish */

        for (int cycle = 0; cycle < total + 10; cycle++) {
            trigger_ip(s_in, m_out, rst, done);
            while (!m_out.empty()) {
                axis_t o = m_out.read();
                rx_count++;
                if (o.last) tlast_count++;
            }
            if ((int)done == 1) break;
        }

        bool pass = (rx_count    == total)      &&
                    (tlast_count == NUM_BATCHES) &&
                    ((int)done   == 1);

        std::cout << "[TEST 4] Post-reset capture: rx=" << rx_count
                  << "/" << total
                  << " tlast=" << tlast_count << "/" << NUM_BATCHES
                  << " done=" << (int)done
                  << (pass ? "  PASS" : "  FAIL") << "\n";
        if (!pass) errors++;

        drain(s_in);
        drain(m_out);
    }

    /* ──────────────────────────────────────────────────────────────────
     * TEST 5 — Partial batch then reset mid-capture
     * Send 3 batches worth of data, reset, then verify clean restart.
     * ────────────────────────────────────────────────────────────────── */
    {
        /* Reset first to clear state from Test 4 */
        rst = 1;
        trigger_ip(s_in, m_out, rst, done);
        rst = 0;
        drain(m_out);

        /* Push 3 batches only */
        push(s_in, FIFO_SIZE * 3, 200);
        int partial_rx = 0;

        for (int i = 0; i < FIFO_SIZE * 3 + 10; i++) {
            if (s_in.empty()) break;
            trigger_ip(s_in, m_out, rst, done);
            while (!m_out.empty()) { m_out.read(); partial_rx++; }
        }

        /* Reset mid-capture */
        rst = 1;
        trigger_ip(s_in, m_out, rst, done);
        rst = 0;
        drain(s_in);
        drain(m_out);

        bool reset_ok = ((int)done == 0);
        std::cout << "[TEST 5] Mid-capture reset: partial_rx=" << partial_rx
                  << " done_after_reset=" << (int)done
                  << (reset_ok ? "  PASS" : "  FAIL") << "\n";
        if (!reset_ok) errors++;

        /* Now do a clean full capture to verify restart */
        push(s_in, FIFO_SIZE * NUM_BATCHES, 300);
        int rx2 = 0, tl2 = 0;
        for (int i = 0; i < FIFO_SIZE * NUM_BATCHES + 10; i++) {
            if (s_in.empty() && (int)done == 1) break;
            trigger_ip(s_in, m_out, rst, done);
            while (!m_out.empty()) {
                axis_t o = m_out.read();
                rx2++;
                if (o.last) tl2++;
            }
        }

        bool pass2 = (rx2 == FIFO_SIZE * NUM_BATCHES) &&
                     (tl2 == NUM_BATCHES) && ((int)done == 1);
        std::cout << "[TEST 5] Post-mid-reset capture: rx=" << rx2
                  << " tlast=" << tl2
                  << (pass2 ? "  PASS" : "  FAIL") << "\n";
        if (!pass2) errors++;

        drain(s_in);
        drain(m_out);
    }

    std::cout << "\n" << (errors == 0 ? "ALL TESTS PASS\n" : "SOME TESTS FAILED\n");
    return errors;
}
