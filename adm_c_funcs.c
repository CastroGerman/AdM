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

void filtroVentana10(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitudVectorIn){
	uint8_t windowSize = 10;
	for(int i = 0; i<longitudVectorIn; ++i){
		for(int j = 0; j<windowSize; ++j){
			uint8_t windowIdx = i + j;
			while(windowIdx >= longitudVectorIn){
				windowIdx -= longitudVectorIn;
			}
			vectorOut[i] += vectorIn[windowIdx];
		}
		vectorOut[i] /= windowSize;
	}
}

void pack32to16(int32_t *vectorIn, int16_t *vectorOut, uint32_t longitud){
	for(int i = 0; i<longitud; ++i){
		vectorOut[i] = (int16_t)(vectorIn[i]>>16);
	}
}

int32_t max(int32_t *vectorIn, uint32_t longitud){
	int32_t ret = 0;
	for(int i = 0; i<longitud; ++i){
		if(i == 0){
			ret = vectorIn[i];
		}else{
			if(vectorIn[i] > ret) ret = vectorIn[i];
		}
	}
	return ret;
}

void downsampleM(int32_t *vectorIn, int32_t *vectorOut, uint32_t longitud, uint32_t N){
	int32_t choppedCount = 0;
	for(int i = 0; i<longitud; ++i){
		if(((i+1) % N) == 0){
			++choppedCount;
		} else {
			vectorOut[i-choppedCount] = vectorIn[i];
		}
	}
}

void invertir(uint16_t *vector, uint32_t longitud){
	uint16_t aux = 0;
	for(int i = 0; i<(longitud/2); ++i){
		aux = vector[i];
		vector[i] = vector[(longitud-1)-i];
		vector[(longitud-1)-i] = aux;
	}
}

void corr(int16_t *vectorX, int16_t *vectorY, int16_t *vectorCorr, uint32_t longitud){
	for(int i = 0; i < longitud; ++i){
		*(vectorCorr) += vectorX[i] * vectorY[(longitud-1)-i];
	}
}

