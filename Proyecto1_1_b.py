#!/bin/python3
#Script que sube y baja un pin GPIO en lenguaje Python
#Se importan las librerías necesarias
import RPi.GPIO as GPIO
import time

GPIO.setwarnings(False)

#Configuración inicial del pin
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.OUT)

#Creamos un ciclo while que enciende y apague el LED hasta que el usuario termine el proceso
while True:
   GPIO.output(17, True)
   time.sleep(1)
   GPIO.output(17, False)
   time.sleep(1)

GPIO.cleanup()