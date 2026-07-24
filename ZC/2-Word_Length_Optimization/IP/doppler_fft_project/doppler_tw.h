#ifndef DOPPLER_TW_H
#define DOPPLER_TW_H

#include "doppler_fft.h"

// Bit-reversal LUT for 256-point FFT (8-bit reversal)
const extern unsigned short br_lut[FFT_N];

// Twiddle ROM: W_256^k = e^{-j2pi*k/256} for k=0..127
const extern complex_t TWIDDLE_ROM[NUM_TWIDDLES];

#endif
