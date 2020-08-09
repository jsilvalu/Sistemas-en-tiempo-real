//Compilación por consola: gcc p2_2.c -o p2_2 -lpthread
//Configuración en eclipse: botón derecho sobre el proyecto -> Properties -> C/C++ Build -> Settins -> Cross GCC Linker -> Libraries -> Añadir pthread

//Añadir la librería de utilización de señales
#include <signal.h>
//Añadir la librería de utilización de pthreads
#include <pthread.h>
//Otras librerías necesarias
#include <stdlib.h>
#include <stdio.h>

void HiloSigInt (int *num_capturas) {

	int capturas=0;
	int sig;

	//Crear un conjunto de señales
	sigset_t conjuntoSennales;
	//Inicializar el conjunto de señales a vacío
	sigemptyset(&conjuntoSennales);
	//Añadir SIGINT al conjunto de señales
	sigaddset(&conjuntoSennales, SIGINT);
	//Añadir el conjunto de señales a la máscara de señales bloqueadas
	pthread_sigmask(SIG_BLOCK, &conjuntoSennales, NULL);
	//Mientras no se capturen num_capturas señales
	//Esperar por el conjunto de señales (solamente contiene SIGINT)
	//Incrementar las capturas
	while(capturas < *num_capturas){
		if (sigwait(&conjuntoSennales, &sig) == 0 && sig == SIGINT) {
			printf("Tenemos SIGINT\n");
			capturas++;
			printf(" Incrementando capturas %d  \n", capturas);
		}
	}
}

int main (int argc, char *argv[]) {
	if (argc!=2) {
		printf("Error en la ejecución. El formato correcto es p2_2 num_capturas\n");
		return 0;
	}
	int num_capturas=atoi(argv[1]);


	//Crear un conjunto de señales
	sigset_t conjuntoSennales;
	//Inicializar el conjunto de señales a vacío
	sigemptyset(&conjuntoSennales);
	//Añadir SIGINT al conjunto de señales
	sigaddset(&conjuntoSennales, SIGINT);
	//Añadir el conjunto de señales a la máscara de señales bloqueadas
	pthread_sigmask(SIG_BLOCK, &conjuntoSennales, NULL);
	//Crear un identificador de hilo de tipo pthread_t
	pthread_t hilo1;
	//Crear un hilo con la función HiloSigInt y el número de capturas por las que se desea esperar
	pthread_create(&hilo1, NULL, (void*) HiloSigInt, &num_capturas);
	//Esperar por el hilo anterior
	pthread_join(hilo1, NULL);
}
