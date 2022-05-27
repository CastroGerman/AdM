#ifndef INC_ADM_ASM_FUNCS_H_
#define INC_ADM_ASM_FUNCS_H_

#include <stdint.h>

void zeros_asm(uint32_t *vector, uint32_t longitud);
void productoEscalar32_asm(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar);
void productoEscalar16_asm(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);
void productoEscalar12_asm(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);

#endif /* INC_ADM_ASM_FUNCS_H_ */
