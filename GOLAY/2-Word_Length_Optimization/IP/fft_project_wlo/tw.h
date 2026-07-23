#ifndef TW_H
#define TW_H

#include "fft.h"

typedef struct {
    fft_tw_cplx_t *tw;
    uint16_t      *br_lut;
    int            len;
    int            bits;
} TwiddleTable;

extern const TwiddleTable t;

#endif
