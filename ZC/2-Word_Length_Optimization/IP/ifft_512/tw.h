#include <complex>

typedef struct {
    std::complex<float> *tw;
    uint16_t *br_lut;
    int len;
    int bits;
} TwiddleTable;

const extern TwiddleTable t;
