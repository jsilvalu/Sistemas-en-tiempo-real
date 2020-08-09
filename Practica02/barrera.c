#include "barrera.h"

/**
Inicializa  las  variables  mutex  y  de  condición necesarias así  como el  número  
de  hebras  que  se  bloquean en la  barrera  (parámetro int num_hilos). 
*/
void crea (barrera_t *b, int num_hilos) {
	printf(" + CREACIÓN\n");
	//Inicializar permitidos al valor de N
	b->permitidos=num_hilos;
	//Inicializar el mutex
	pthread_mutex_init(&b->mutex, NULL);
	//Inicializar la variable de condición
	pthread_cond_init(&b->condicion, NULL);
}

/**
Liberará las variables de condición y del mutex. 
*/
void destruye (barrera_t *b) {
	printf(" - DESTRUCCIÓN\n");
	//Destruir el mutex
	pthread_mutex_destroy(&b->mutex);
	//Destruir la variable de condición
	pthread_cond_destroy(&b->condicion);
}

/**
Si la hebra invocante no es la n‐ésima, se bloquea, si  es la n‐ésima, libera al resto y 
continúa la ejecución. En este caso, como la condición de  bloqueo  solo  se  debe  
comprobar  una  vez,  no  es  necesario  usar  un  bucle  while, 
basta con una sentencia if. 
*/
void sincronizar (barrera_t *b) {
	printf(" X sincronización\n");
	//Entrar en el mutex
	pthread_mutex_lock(&b->mutex);
	//Decrementar permitidos
	b->permitidos--;
	//Si permitidos no es 0 liberar a todos los hilos de la variable de condición
	//Si no, bloquearse en la variable de condición
	if(b->permitidos == 0){
		pthread_cond_broadcast(&b->condicion);
	}else{
		printf("BARRERA - Bloqueando hilo... %d\n", b->permitidos);
		pthread_cond_wait(&b->condicion, &b->mutex);
		printf("BARRERA - Desbloqueando hilo...\n");
	}
	//Incrementar permitidos para que cuando salgan todos los hilos pueda volverse a usar la barrera
	b->permitidos++;
	//Liberar el mutex
	pthread_mutex_unlock(&b->mutex);
	//pthread_cond_signal(&b->condicion); ???
}
