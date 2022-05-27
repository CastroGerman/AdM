#ifndef INC_ADM_C_FUNCS_H_
#define INC_ADM_C_FUNCS_H_

#include <stdint.h>

void zeros(uint32_t *vector, uint32_t longitud);
void productoEscalar32(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar);
void productoEscalar16(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);
void productoEscalar12(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);

#endif /* INC_ADM_C_FUNCS_H_ */
