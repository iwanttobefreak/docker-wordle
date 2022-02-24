# docker-wordle
Resuelve wordle

USO:

docker run --rm wordle pluma00020

Donde pluma es la palabra probada y:

0: gris (no contiene la letra)  
1: amarillo (contiene la letra pero no en su posición)  
2: verda (contiene la letra en su posición)  

Devuelve las posibles palabras y el número de palabras posibles.

Se van añadiendo mas palabras:

docker run --rm wordle pluma00020 mismo02022

Resultado:

fiemo  
ritmo  
firmo  
hirmo  
ciemo  
bizmo  
6
