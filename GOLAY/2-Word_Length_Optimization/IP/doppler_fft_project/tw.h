#ifndef TW_H
#define TW_H

#include <complex>
#include <stdint.h>

typedef struct {
    std::complex<float> *tw;
    uint16_t            *br_lut;
    int                  len;
    int                  bits;
} TwiddleTable;

extern const TwiddleTable t;

#endif
