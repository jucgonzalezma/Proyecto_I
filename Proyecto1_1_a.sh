#!/bin/bash
#Script que sube y baja  un pin GPIO en lenguaje Bash
#Configuración del pin de salida
#Se crea un condicional que verifica si ya está creado o no el directorio GPIO17
if ! [ -d /sys/class/gpio/gpio17/ ]
then
    echo "17" > /sys/class/gpio/export
    sleep 0.1
    echo "out" > /sys/class/gpio/gpio17/direction
    sleep 0.1
else
    echo "out" > /sys/class/gpio/gpio17/direction
fi

#Se crea el ciclo while que encienda y apague el LED hasta que la persona detenga el proceso
while true
do
    echo "1" > /sys/class/gpio/gpio17/value
    sleep 1
    echo "0" > /sys/class/gpio/gpio17/value
    sleep 1
done