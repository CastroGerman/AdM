#include <adm_c_funcs.h>

void zeros(uint32_t *vector, uint32_t longitud){
	for(int i = 0; i<longitud; ++i){
		vector[i] = (uint32_t) 0;
	}
}

void productoEscalar32(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar){
	for(int i = 0; i<longitud; ++i){
		vectorOut[i] = vectorIn[i] * escalar;
	}
}

void productoEscalar16(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar){
	for(int i = 0; i<longitud; ++i){
		vectorOut[i] = vectorIn[i] * escalar;
	}
}

void productoEscalar12(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar){
	for(int i = 0; i<longitud; ++i){
		vectorOut[i] = vectorIn[i] * escalar;
		if(vectorOut[i] > (uint16_t) 0x0FFF){
			vectorOut[i] = (uint16_t) 0x0FFF;
		}
	}
}
