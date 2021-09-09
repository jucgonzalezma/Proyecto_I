//Script que sube y baja un pin GPIO en lenguaje C++
//Configuración inicial
//Se importan las librerías necesarias para el código
#include <wiringPi.h>
#include <stdio.h>

int main(void){
//Se procede a declarar el pin 0 como salida
 wiringPiSetup();
 pinMode(0, OUTPUT);

//Se crea un ciclo while que enciende y apague el LED hasta que el usuario termine el proceso
 while (1){
 digitalWrite(0, HIGH);
 delay(1000);
 digitalWrite(0, LOW);
 delay(1000);
 }
 return 0;
}