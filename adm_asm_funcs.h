#ifndef INC_ADM_ASM_FUNCS_H_
#define INC_ADM_ASM_FUNCS_H_

#include <stdint.h>

void zeros_asm(uint32_t *vector, uint32_t longitud);
void productoEscalar32_asm(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar);
void productoEscalar16_asm(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);
void productoEscalar12_asm(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);
void filtroVentana10_asm(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitudVectorIn);
void pack32to16_asm(int32_t *vectorIn, int16_t *vectorOut, uint32_t longitud);
int32_t max_asm(int32_t *vectorIn, uint32_t longitud);
void downsampleM_asm(int32_t *vectorIn, int32_t *vectorOut, uint32_t longitud, uint32_t N);
void invertir_asm(uint16_t *vector, uint32_t longitud);
void corr_asm(int16_t *vectorX, int16_t *vectorY, int32_t *vectorCorr, uint32_t longitud);
void corr_asm_simd(int16_t *vectorX, int16_t *vectorY, int32_t *vectorCorr, uint32_t longitud);

#endif /* INC_ADM_ASM_FUNCS_H_ */
