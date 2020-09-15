# Minion 1

![Captura 1](https://github.com/rodrigoep94/invd-minion1-2020s2/blob/master/capturas/captura.png)

Link al juego: 

https://rodrigoep94.github.io/invd-minion1-2020s2/

### Reglas

- El círculo sigue al puntero del mouse, es decir, avanza hacia el puntero con cierta velocidad.
- Los triángulos aparecen en los agujeros y persiguen al circulo. Tienen un tiempo de vida finito. Hay una cantidad máxima de triángulos en juego. Los triángulos tienen inercia.
 - El círculo colecciona los rombitos rojos al tocarlos.
 - Debe mostrarse en pantalla un contador de rombitos recolectados (un texto con la cantidad en números, no importa el estilo del texto).
 - Hay un contador de rombos rojos recolectados.
 - Los triangulos rompen el círculo si lo tocan. El juego se reinicia cuando esto ocurre.
 - Al presionar la barra espaciadora, el personaje hace un "dash" hacia la dirección en la que apunte en ese momento. Donde dash significa, en este caso, aumentar su velocidad x3 durante 0.4 segundos, pero pierde la capacidad de cambiar de dirección por ese tiempo.

Bonus:
 - Al perder una partida, no se resetea el juego instantáneamente, sino que se espera unos segundos con una pantalla de game over, y se le da la opción de volver a intentarlo con un botón.
 - Cada vez que se reinicia el juego, los agujeros aparecen en diferentes lugares.
 - Aparecen nuevos rombos cada X tiempo.
 
Bonus extra:
 - Se puede seleccionar la dificultad(De esto dependerá la velocidad de los triángulos), y al perder se puede cambiar la dificultad volviendo al menú principal
