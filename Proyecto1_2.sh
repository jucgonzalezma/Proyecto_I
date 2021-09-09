#!/bin/bash
#Script que lee y almacena valores del sensor DS18B20

#Configuración para leer el sensor
sudo modprobe w1-gpio && sudo modprobe w1_therm

#Declaro la función que permite almacenar la temperatura en un archivo *.csv
funcion_temperatura(){
while true
do
    sleep 1
    temperatura=`cat /sys/bus/w1/devices/28-3c01e076d9c4/temperature`
    sleep 4
    real=$(echo "scale=3; $temperatura/1000" | bc)
    eval echo `date "+%Y%m%d %H%M%S"` "," `echo $real`" °C" >> /home/pi/$(date +%Y%m%d)_temperatura.csv
    sleep 4
done
}

#Se verifica si ya existe un fichero creado o no, para proceder a sobreescribirlo o  generarlo de nuevo
fichero=/home/pi/$(date +%Y%m%d)_temperatura.csv
if [ -f $fichero ]
then
    echo "Actualmente existe un fichero con el nombre $(date +%Y%m%d)_temperatura.csv"
    read -p "Desea sobreescribirlo S/N? " opc
    case $opc in
    [Ss]*) rm /home/pi/$(date +%Y%m%d)_temperatura.csv
           funcion_temperatura;;
    [Nn]*) funcion_temperatura;;
    esac
else
    funcion_temperatura
fi