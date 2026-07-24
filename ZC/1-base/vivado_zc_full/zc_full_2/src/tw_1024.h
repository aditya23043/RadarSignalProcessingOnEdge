#include <complex.h>
#include <stdint.h>

typedef struct {
    float complex *tw;
    uint16_t *br_lut;
    int len;
    int bits;
} TwiddleTable;

extern TwiddleTable tw_1024_inv;
extern TwiddleTable tw_1024_fwd;
