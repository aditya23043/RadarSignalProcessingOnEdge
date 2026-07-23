#ifndef TW_H
#define TW_H

#include "ifft.h"

typedef struct {
    ifft_tw_cplx_t *tw;
    uint16_t       *br_lut;
    int             len;
    int             bits;
} TwiddleTable;

const extern TwiddleTable t;

#endif
