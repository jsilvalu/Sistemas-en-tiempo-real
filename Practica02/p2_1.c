//Compilación por consola: gcc p2_1.c barrera.c -o p2_1 -lpthread
//Configuración en eclipse: botón derecho sobre el proyecto -> Properties -> C/C++ Build -> Settins -> Cross GCC Linker -> Libraries -> Añadir pthread

//JUAN ANTONIO SILVA LUJÁN - PRÁCTICA02 STR19/20

#include "barrera.h"
#include "stdlib.h"

typedef struct {
	barrera_t *b;
	int idhilo; //Nos servirá para que el usuario pueda identificar los hilos
} hilo_t;

barrera_t b;

void HiloEnBarrera (hilo_t *h) {
	//Mostrar un mensaje indicando que el hilo con identificador idhilo se bloquea en la barrera
	printf("===El HILO %d está entrando en la barrera...\n", h->idhilo);
	//Invocar a la barrera
	sincronizar(h->b);
	//Mostrar un mensaje indicando que el hilo con identificador idhilo sale de la barrera
	printf("===El HILO %d está saliendo de la barrera...\n", h->idhilo);
}

int main (int argc, char *argv[]) {
	if (argc!=2) {
		printf("Error en la ejecución. El formato correcto es %s num_hilos\n", argv[0]);
		return 0;
	}
	int num_hilos=atoi(argv[1]);

	//Crear un array de identificadores de hilos de tipo pthread_t de tamaño num_hilos
	pthread_t arrayHilos[num_hilos];
	//Crear una barrera e inicializarla con num_hilos
	crea(&b,num_hilos);
	//Crear un array de tipo hilo_t de tamaño num_hilos
	hilo_t datos[num_hilos];
	//Para cada hilo
	//Asignar en la posición correspondiente del array de datos un identificador (único para cada hilo)
	//Asignar en la posición correspondiente del array de datos la dirección de memoria de la barrera (mismo valor para todos los hilos)
	//Crear un hilo usando la posición correspondiente del array de identificadores, la función HiloEnBarrera y la posición correspondiente del array de datos
	int i;
	for (i = 0; i < num_hilos; i++) {
		datos[i].idhilo = i;
		datos[i].b = &b;
		pthread_create(&arrayHilos[i], NULL, (void *) HiloEnBarrera, &datos[i]);
	}
	//Esperar por todos los hilos
	int x;
	for(x=0; x<num_hilos; x++){
			pthread_join(arrayHilos[x], NULL);
	}
	//Destruir la barrera
	destruye(&b);
}
