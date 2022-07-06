; Nombre: Pedro Ramos Suárez.



;;;;;;; JUGADOR DE 4 en RAYA ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;; Version de 4 en raya clásico: Tablero de 6x7, donde se introducen fichas por arriba
;;;;;;;;;;;;;;;;;;;;;;; y caen hasta la posicion libre mas abajo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;; Hechos para representar un estado del juego

;;;;;;; (Turno M|J)   representa a quien corresponde el turno (M maquina, J jugador)
;;;;;;; (Tablero Juego ?i ?j _|M|J) representa que la posicion i,j del tablero esta vacia (_), o tiene una ficha propia (M) o tiene una ficha del jugador humano (J)

;;;;;;;;;;;;;;;; Hechos para representar estado del analisis
;;;;;;; (Tablero Analisis Posicion ?i ?j _|M|J) representa que en el analisis actual la posicion i,j del tablero esta vacia (_), o tiene una ficha propia (M) o tiene una ficha del jugador humano (J)
;;;;;;; (Sondeando ?n ?i ?c M|J)  ; representa que estamos analizando suponiendo que la ?n jugada h sido ?i ?c M|J
;;;

;;;;;;;;;;;;; Hechos para representar una jugadas

;;;;;;; (Juega M|J ?columna) representa que la jugada consiste en introducir la ficha en la columna ?columna 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INICIALIZAR ESTADO


(deffacts Estado_inicial
	(Tablero Juego 1 1 _) (Tablero Juego 1 2 _) (Tablero Juego 1 3 _) (Tablero Juego 1 4 _) (Tablero Juego 1 5 _) (Tablero Juego 1 6 _) (Tablero Juego 1 7 _)
	(Tablero Juego 2 1 _) (Tablero Juego 2 2 _) (Tablero Juego 2 3 _) (Tablero Juego 2 4 _) (Tablero Juego 2 5 _) (Tablero Juego 2 6 _) (Tablero Juego 2 7 _)
	(Tablero Juego 3 1 _) (Tablero Juego 3 2 _) (Tablero Juego 3 3 _) (Tablero Juego 3 4 _) (Tablero Juego 3 5 _) (Tablero Juego 3 6 _) (Tablero Juego 3 7 _)
	(Tablero Juego 4 1 _) (Tablero Juego 4 2 _) (Tablero Juego 4 3 _) (Tablero Juego 4 4 _) (Tablero Juego 4 5 _) (Tablero Juego 4 6 _) (Tablero Juego 4 7 _)
	(Tablero Juego 5 1 _) (Tablero Juego 5 2 _) (Tablero Juego 5 3 _) (Tablero Juego 5 4 _) (Tablero Juego 5 5 _) (Tablero Juego 5 6 _) (Tablero Juego 5 7 _)
	(Tablero Juego 6 1 _) (Tablero Juego 6 2 _) (Tablero Juego 6 3 _) (Tablero Juego 6 4 _) (Tablero Juego 6 5 _) (Tablero Juego 6 6 _) (Tablero Juego 6 7 _)
	(Jugada 0)
)

(defrule Elige_quien_comienza
	=>
	(printout t "Quien quieres que empieze: (escribre M para la maquina o J para empezar tu) ")
	(assert (Turno (read)))
)

;;;;;;;;;;;;;;;;;;;;;;; MUESTRA POSICION ;;;;;;;;;;;;;;;;;;;;;;;
(defrule muestra_posicion
	(declare (salience 10))
	(muestra_posicion)
	(Tablero Juego 1 1 ?p11) (Tablero Juego 1 2 ?p12) (Tablero Juego 1 3 ?p13) (Tablero Juego 1 4 ?p14) (Tablero Juego 1 5 ?p15) (Tablero Juego 1 6 ?p16) (Tablero Juego 1 7 ?p17)
	(Tablero Juego 2 1 ?p21) (Tablero Juego 2 2 ?p22) (Tablero Juego 2 3 ?p23) (Tablero Juego 2 4 ?p24) (Tablero Juego 2 5 ?p25) (Tablero Juego 2 6 ?p26) (Tablero Juego 2 7 ?p27)
	(Tablero Juego 3 1 ?p31) (Tablero Juego 3 2 ?p32) (Tablero Juego 3 3 ?p33) (Tablero Juego 3 4 ?p34) (Tablero Juego 3 5 ?p35) (Tablero Juego 3 6 ?p36) (Tablero Juego 3 7 ?p37)
	(Tablero Juego 4 1 ?p41) (Tablero Juego 4 2 ?p42) (Tablero Juego 4 3 ?p43) (Tablero Juego 4 4 ?p44) (Tablero Juego 4 5 ?p45) (Tablero Juego 4 6 ?p46) (Tablero Juego 4 7 ?p47)
	(Tablero Juego 5 1 ?p51) (Tablero Juego 5 2 ?p52) (Tablero Juego 5 3 ?p53) (Tablero Juego 5 4 ?p54) (Tablero Juego 5 5 ?p55) (Tablero Juego 5 6 ?p56) (Tablero Juego 5 7 ?p57)
	(Tablero Juego 6 1 ?p61) (Tablero Juego 6 2 ?p62) (Tablero Juego 6 3 ?p63) (Tablero Juego 6 4 ?p64) (Tablero Juego 6 5 ?p65) (Tablero Juego 6 6 ?p66) (Tablero Juego 6 7 ?p67)
	=>
	(printout t crlf)
	(printout t ?p11 " " ?p12 " " ?p13 " " ?p14 " " ?p15 " " ?p16 " " ?p17 crlf)
	(printout t ?p21 " " ?p22 " " ?p23 " " ?p24 " " ?p25 " " ?p26 " " ?p27 crlf)
	(printout t ?p31 " " ?p32 " " ?p33 " " ?p34 " " ?p35 " " ?p36 " " ?p37 crlf)
	(printout t ?p41 " " ?p42 " " ?p43 " " ?p44 " " ?p45 " " ?p46 " " ?p47 crlf)
	(printout t ?p51 " " ?p52 " " ?p53 " " ?p54 " " ?p55 " " ?p56 " " ?p57 crlf)
	(printout t ?p61 " " ?p62 " " ?p63 " " ?p64 " " ?p65 " " ?p66 " " ?p67 crlf)
	(printout t  crlf)
)


;;;;;;;;;;;;;;;;;;;;;;; RECOGER JUGADA DEL CONTRARIO ;;;;;;;;;;;;;;;;;;;;;;;
(defrule mostrar_posicion
	(declare (salience 9999))
	(Turno J)
	=>
	(assert (muestra_posicion))
)

(defrule jugada_contrario
	?f <- (Turno J)
	=>
	(printout t "en que columna introduces la siguiente ficha? ")
	(assert (Juega J (read)))
	(retract ?f)
)

(defrule juega_contrario_check_entrada_correcta
	(declare (salience 1))
	?f <- (Juega J ?c)
	(test (and (neq ?c 1) (and (neq ?c 2) (and (neq ?c 3) (and (neq ?c 4) (and (neq ?c 5) (and (neq ?c 6) (neq ?c 7))))))))
	=>
	(printout t "Tienes que indicar un numero de columna: 1,2,3,4,5,6 o 7" crlf)
	(retract ?f)
	(assert (Turno J))
)

(defrule juega_contrario_check_columna_libre
	(declare (salience 1))
	?f <- (Juega J ?c)
	(Tablero Juego 1 ?c ?X) 
	(test (neq ?X _))
	=>
	(printout t "Esa columna ya esta completa, tienes que jugar en otra" crlf)
	(retract ?f)
	(assert (Turno J))
)

(defrule juega_contrario_actualiza_estado
	?f <- (Juega J ?c)
	?g <- (Tablero Juego ?i ?c _)
	(Tablero Juego ?j ?c ?X) 
	(test (= (+ ?i 1) ?j))
	(test (neq ?X _))
	=>
	(retract ?f ?g)
	(assert (Turno M) (Tablero Juego ?i ?c J))
)

(defrule juega_contrario_actualiza_estado_columna_vacia
	?f <- (Juega J ?c)
	?g <- (Tablero Juego 6 ?c _)
	=>
	(retract ?f ?g)
	(assert (Turno M) (Tablero Juego 6 ?c J))
)


;;;;;;;;;;; ACTUALIZAR  ESTADO TRAS JUGADA DE CLISP ;;;;;;;;;;;;;;;;;;

(defrule juega_clisp_actualiza_estado
	?f <- (Juega M ?c)
	?g <- (Tablero Juego ?i ?c _)
	(Tablero Juego ?j ?c ?X) 
	(test (= (+ ?i 1) ?j))
	(test (neq ?X _))
	=>
	(retract ?f ?g)
	(assert (Turno J) (Tablero Juego ?i ?c M))
)

(defrule juega_clisp_actualiza_estado_columna_vacia
	?f <- (Juega M ?c)
	?g <- (Tablero Juego 6 ?c _)
	=>
	(retract ?f ?g)
	(assert (Turno J) (Tablero Juego 6 ?c M))
)

;;;;;;;;;;; CLISP JUEGA SIN CRITERIO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule elegir_jugada_aleatoria
	(declare (salience -9998))
	?f <- (Turno M)
	=>
	(assert (Jugar (random 1 7)))
	(retract ?f)
)

(defrule comprobar_posible_jugada_aleatoria
	?f <- (Jugar ?c)
	(Tablero Juego 1 ?c M|J)
	=>
	(retract ?f)
	(assert (Turno M))
)

(defrule clisp_juega_sin_criterio
	(declare (salience -9999))
	?f<- (Jugar ?c)
	=>
	(printout t "JUEGO en la columna (sin criterio) " ?c crlf)
	(retract ?f)
	(assert (Juega M ?c))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;  Comprobar si hay 4 en linea ;;;;;;;;;;;;;;;;;;;;;

(defrule cuatro_en_linea_horizontal
	(declare (salience 9999))
	(Tablero ?t ?i ?c1 ?jugador)
	(Tablero ?t ?i ?c2 ?jugador) 
	(test (= (+ ?c1 1) ?c2))
	(Tablero ?t ?i ?c3 ?jugador)
	(test (= (+ ?c1 2) ?c3))
	(Tablero ?t ?i ?c4 ?jugador)
	(test (= (+ ?c1 3) ?c4))
	(test (or (eq ?jugador M) (eq ?jugador J) ))
	=>
	(assert (Cuatro_en_linea ?t ?jugador horizontal ?i ?c1))
)

(defrule cuatro_en_linea_vertical
	(declare (salience 9999))
	?f <- (Turno ?X)
	(Tablero ?t ?i1 ?c ?jugador)
	(Tablero ?t ?i2 ?c ?jugador)
	(test (= (+ ?i1 1) ?i2))
	(Tablero ?t ?i3 ?c  ?jugador)
	(test (= (+ ?i1 2) ?i3))
	(Tablero ?t ?i4 ?c  ?jugador)
	(test (= (+ ?i1 3) ?i4))
	(test (or (eq ?jugador M) (eq ?jugador J) ))
	=>
	(assert (Cuatro_en_linea ?t ?jugador vertical ?i1 ?c))
)

(defrule cuatro_en_linea_diagonal_directa
	(declare (salience 9999))
	?f <- (Turno ?X)
	(Tablero ?t ?i ?c ?jugador)
	(Tablero ?t ?i1 ?c1 ?jugador)
	(test (= (+ ?i 1) ?i1))
	(test (= (+ ?c 1) ?c1))
	(Tablero ?t ?i2 ?c2  ?jugador)
	(test (= (+ ?i 2) ?i2))
	(test (= (+ ?c 2) ?c2))
	(Tablero ?t ?i3 ?c3  ?jugador)
	(test (= (+ ?i 3) ?i3))
	(test (= (+ ?c 3) ?c3))
	(test (or (eq ?jugador M) (eq ?jugador J) ))
	=>
	(assert (Cuatro_en_linea ?t ?jugador diagonal_directa ?i ?c))
)

(defrule cuatro_en_linea_diagonal_inversa
	(declare (salience 9999))
	?f <- (Turno ?X)
	(Tablero ?t ?i ?c ?jugador)
	(Tablero ?t ?i1 ?c1 ?jugador)
	(test (= (+ ?i 1) ?i1))
	(test (= (- ?c 1) ?c1))
	(Tablero ?t ?i2 ?c2  ?jugador)
	(test (= (+ ?i 2) ?i2))
	(test (= (- ?c 2) ?c2))
	(Tablero ?t ?i3 ?c3  ?jugador)
	(test (= (+ ?i 3) ?i3))
	(test (= (- ?c 3) ?c3))
	(test (or (eq ?jugador M) (eq ?jugador J) ))
	=>
	(assert (Cuatro_en_linea ?t ?jugador diagonal_inversa ?i ?c))
)

;;;;;;;;;;;;;;;;;;;; DESCUBRE GANADOR
(defrule gana_fila
	(declare (salience 9999))
	?f <- (Turno ?X)
	(Cuatro_en_linea Juego ?jugador horizontal ?i ?c)
	=>
	(printout t ?jugador " ha ganado pues tiene cuatro en linea en la fila " ?i crlf)
	(retract ?f)
	(assert (muestra_posicion))
) 

(defrule gana_columna
	(declare (salience 9999))
	?f <- (Turno ?X)
	(Cuatro_en_linea Juego ?jugador vertical ?i ?c)
	=>
	(printout t ?jugador " ha ganado pues tiene cuatro en linea en la columna " ?c crlf)
	(retract ?f)
	(assert (muestra_posicion))
) 

(defrule gana_diagonal_directa
	(declare (salience 9999))
	?f <- (Turno ?X)
	(Cuatro_en_linea Juego ?jugador diagonal_directa ?i ?c)
	=>
	(printout t ?jugador " ha ganado pues tiene cuatro en linea en la diagonal que empieza la posicion " ?i " " ?c   crlf)
	(retract ?f)
	(assert (muestra_posicion))
) 

(defrule gana_diagonal_inversa
	(declare (salience 9999))
	?f <- (Turno ?X)
	(Cuatro_en_linea Juego ?jugador diagonal_inversa ?i ?c)
	=>
	(printout t ?jugador " ha ganado pues tiene cuatro en linea en la diagonal hacia arriba que empieza la posicin " ?i " " ?c   crlf)
	(retract ?f)
	(assert (muestra_posicion))
) 


;;;;;;;;;;;;;;;;;;;;;;;  DETECTAR EMPATE

(defrule empate
	(declare (salience -9999))
	(Turno ?X)
	(Tablero Juego 1 1 M|J)
	(Tablero Juego 1 2 M|J)
	(Tablero Juego 1 3 M|J)
	(Tablero Juego 1 4 M|J)
	(Tablero Juego 1 5 M|J)
	(Tablero Juego 1 6 M|J)
	(Tablero Juego 1 7 M|J)
	=>
	(printout t "EMPATE! Se ha llegado al final del juego sin que nadie gane" crlf)
)

;;;;;;;;;;;;;;;;;;;;;; CONOCIMIENTO EXPERTO ;;;;;;;;;;
;;;;; ¡¡¡¡¡¡¡¡¡¡ Añadir conocimiento para que juege como vosotros jugariais !!!!!!!!!!!!



;;;;; SIGUIENTE Y ANTERIOR: Definición de siguiente y anterior en cada dirección:


; Siguiente en horizontal significa mantener la fila y aumentar en 1 la columna (derecha).
(defrule siguiente_horizontal
	(Tablero ?t ?i ?c1 ?j)
	(Tablero ?t ?i ?c2 ?j)
	(test (= (+ ?c1 1) ?c2))
	=>
	(assert (Siguiente ?i ?c1 h ?i ?c2))
)

; Siguiente en vertical significa mantener la columna y disminuir en 1 la columna (arriba).
(defrule siguiente_vertical
	(Tablero ?t ?i1 ?c ?j)
	(Tablero ?t ?i2 ?c ?j)
	(test (= (- ?i1 1) ?i2))
	=>
	(assert (Siguiente ?i1 ?c v ?i2 ?c))
)

; Siguiente en diagonal1 significa aumentar en la fila y la columna (abajo - derecha).
(defrule siguiente_diagonal_1
	(Tablero ?t ?i1 ?c1 ?j)
	(Tablero ?t ?i2 ?c2 ?j)
	(test (= (+ ?i1 1) ?i2))
	(test (= (+ ?c1 1) ?c2))
	=>
	(assert (Siguiente ?i1 ?c1 d1 ?i2 ?c2))
)

; Siguiente en diagonal2 significa disminuir en 1 la fila y aumentar en 1 la columna (arriba - derecha).
(defrule siguiente_diagonal_2
	(Tablero ?t ?i1 ?c1 ?j)
	(Tablero ?t ?i2 ?c2 ?j)
	(test (= (- ?i1 1) ?i2))
	(test (= (+ ?c1 1) ?c2))
	=>
	(assert (Siguiente ?i1 ?c1 d2 ?i2 ?c2))
)

; Anterior de x significa que eres el siguiente para x.
(defrule anterior
	(Siguiente ?i1 ?c1 ?d ?i2 ?c2)
	=>
	(assert (Anterior ?i2 ?c2 ?d ?i1 ?c1))
)



;;;;; CAÍDAS: Creación y actualización de las posiciones en las que acabará una pieza si colocas en una columna.




; Añadir las caídas que son en la última fila (6).
(defrule anade_caidas_1
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t 6 ?c _)
	=>
	(assert (Cae ?t 6 ?c))
)

; Añadir las caídas que no son en la última fila, sino sobre otra pieza.
(defrule anade_caidas_2
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ~_)
	(Tablero ?t ?i2 ?c2 _)
	(Siguiente ?i1 ?c1 v ?i2 ?c2)
	=>
	(assert (Cae ?t ?i2 ?c2))
)

; Borrar las caídas. Es necesario borrarlas para actualizarlas en el siguiente turno.
(defrule borra_caidas
	(declare (salience -100))
	(Turno M)
	?f <- (Cae ?t ?i ?c)
	=>
	(retract ?f)
)



;;;;; 3 EN LINEA: Definiciones de 3 en línea. Comprobamos que se pueda expandir a 4.



; Tres en línea seguidos, sin espacios entre medias.
(defrule 3_en_linea_siguiente
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Siguiente ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 ?j)
	(Siguiente ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 ?j)
	(Siguiente ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 _)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Tres_en_linea ?t ?i4 ?c4 ?j))
)

; Tres en línea seguidos, sin espacios entre medias, pero en la otra dirección.
(defrule 3_en_linea_anterior
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Anterior ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 ?j)
	(Anterior ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 ?j)
	(Anterior ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 _)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Tres_en_linea ?t ?i4 ?c4 ?j))
)

; Dos en línea seguidos por un espacio y otra pieza del mismo jugador.
(defrule 3_en_linea_dos_uno
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Siguiente ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 ?j)
	(Siguiente ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 _)
	(Siguiente ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i3 ?c3 ?d ?i4 ?c4)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Tres_en_linea ?t ?i3 ?c3 ?j))
)

; Dos en línea seguidos por un espacio y otra pieza del mismo jugador (en la otra dirección al anterior).
(defrule 3_en_linea_uno_dos
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Siguiente ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 _)
	(Siguiente ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 ?j)
	(Siguiente ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i3 ?c3 ?d ?i4 ?c4)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Tres_en_linea ?t ?i2 ?c2 ?j))
)

; Borramos los tres en línea para actualizarlos para el siguiente turno.
(defrule 3_en_linea_borra
	(declare (salience -100))
	(Turno M)
	?f <- (Tres_en_linea ?t ?i ?c ?j)
	=>
	(retract ?f)
)




;;;;; 2 EN LINEA: Definiciones de 3 en línea. También comprobamos que esos 3 en línea puedan expandirse a 4 (es decir, que no esten bloqueados por el límite del tablero o por el otro jugador.)



; Dos en línea seguidos.
(defrule 2_en_linea_siguiente
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Siguiente ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 ?j)
	(Siguiente ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 _)
	(Siguiente ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 _)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Dos_en_linea ?t ?i3 ?c3 ?j))
)

; Dos en línea, pero en la otra dirección.
(defrule 2_en_linea_anterior
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Anterior ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 ?j)
	(Anterior ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 _)
	(Anterior ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 _)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Dos_en_linea ?t ?i3 ?c3 ?j))
)

; Dos en línea con un espacio vacío entre medias.
(defrule 2_en_linea_uno_uno_siguiente
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Siguiente ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 _)
	(Siguiente ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 ?j)
	(Siguiente ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 _)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Dos_en_linea ?t ?i2 ?c2 ?j))
)

; Igual que el anterior, pero en la otra dirección. Necesario para poder comprobar que se puede expandir a 4.
(defrule 2_en_linea_uno_uno_anterior
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Anterior ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 _)
	(Anterior ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 ?j)
	(Anterior ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 _)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Dos_en_linea ?t ?i2 ?c2 ?j))
)

; Dos en línea con dos espacios vacíos entre medias.
(defrule 2_en_linea_uno_uno
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Siguiente ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 _)
	(Siguiente ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 _)
	(Siguiente ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 ?j)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Dos_en_linea ?t ?i2 ?c2 ?j))
)

; Igual que con 3, borramos los dos en línea al acabar el turno para poder actualizarlos.
(defrule 2_en_linea_borra
	(declare (salience -100))
	(Turno M)
	?f <- (Dos_en_linea ?t ?i ?c ?j)
	=>
	(retract ?f)
)



;;;;; 1 EN LINEA: Definiciones de 1 en línea, que son piezas sueltas que pueden expandirse (tienen espacio) hasta convertirse en 4.



; Una pieza con las tres siguientes vacías.
(defrule 1_en_linea_siguiente
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Siguiente ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 _)
	(Siguiente ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 _)
	(Siguiente ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 _)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Uno_en_linea ?t ?i2 ?c2 ?j))
)

; Una pieza con las tres anteriores vacías.
(defrule 1_en_linea_anterior
	(declare (salience 9999))
	(Turno M)
	(Tablero ?t ?i1 ?c1 ?j)
	(Anterior ?i1 ?c1 ?d ?i2 ?c2)
	(Tablero ?t ?i2 ?c2 _)
	(Anterior ?i2 ?c2 ?d ?i3 ?c3)
	(Tablero ?t ?i3 ?c3 _)
	(Anterior ?i3 ?c3 ?d ?i4 ?c4)
	(Tablero ?t ?i4 ?c4 _)
	(test (or (eq ?j M) (eq ?j J)))
	=>
	(assert (Uno_en_linea ?t ?i2 ?c2 ?j))
)

; Igual que con dos y tres en línea, borramos para poder actualizar.
(defrule 1_en_linea_borra
	(declare (salience -100))
	(Turno M)
	?f <- (Uno_en_linea ?t ?i ?c ?j)
	=>
	(retract ?f)
)



;;;;; ACTUALIZAR ANÁLISIS: Actualizamos el tablero de análisis.


; Modificamos tablero de análisis para que sea igual al de juego. (Finalmente no use el tablero de análisis, por lo que esta regla es innecesaria)
(defrule actualizar_analisis
	(declare (salience 9900))
	(Tablero Juego ?i ?c ?j)
	?f <- (Tablero Analisis ?i ?c ~?j)
	=>
	(retract ?f)
	(assert (Tablero Analisis ?i ?c ?j))
)



;;;;; JUGADAS CLIPS: Reglas que deciden la jugada de Clips.



; Si Clips tiene tres en línea, colocará la cuarta ganando la partida.
(defrule clips_3_en_linea_M
	(declare (salience 10))
	(Turno M)
	(Tres_en_linea Juego ?i ?c M)
	(Cae Juego ?i ?c)
	(not (Jugar M ?))
	=>
	(printout t "JUEGO en la columna (consigue 4) " ?c crlf)
	(assert (Jugar M ?c))
)

; Si el jugador tiene tres en línea, Clips colocará la cuarta impidiéndole ganar la partida (con menos prioridad que ganar).
(defrule clips_3_en_linea_J
	(declare (salience 9))
	(Turno M)
	(Tres_en_linea Juego ?i ?c J)
	(Cae Juego ?i ?c)
	(not (Jugar M ?))
	=>
	(printout t "JUEGO en la columna (impide 4) " ?c crlf)
	(assert (Jugar M ?c))
)

; Si Clips tiene dos en línea, colocará para tener tres en línea (menos prioridad que los tres en línea).
; También comprobamos que esta jugada no le permita ganar al jugador.
(defrule clips_2_en_linea_M
	(declare (salience 6))
	(Turno M)
	(Dos_en_linea Juego ?i ?c M)
	(Cae Juego ?i ?c)
	(not (Jugar M ?))
	(not 
		(and
			(Siguiente ?i ?c ?v ?i2 ?c2)
			(Tres_en_linea Juego ?i2 ?c2 J)
		)
	)
	=>
	(printout t "JUEGO en la columna (consigue 3) " ?c crlf)
	(assert (Jugar M ?c))
)

; Si el jugador tiene tres en línea, Clips colocará impidiéndole conseguir tres en línea (menos prioridad que tres en línea y que conseguir tres en línea).
; También comprobamos que esta jugada no le permita ganar al jugador.
(defrule clips_2_en_linea_J
	(declare (salience 5))
	(Turno M)
	(Dos_en_linea Juego ?i ?c J)
	(Cae Juego ?i ?c)
	(not (Jugar M ?))
	(not 
		(and
			(Siguiente ?i ?c ?v ?i2 ?c2)
			(Tres_en_linea Juego ?i2 ?c2 J)
		)
	)
	=>
	(printout t "JUEGO en la columna (impide 3) " ?c crlf)
	(assert (Jugar M ?c))
)

; Si Clips tiene una pieza que puede expandir a cuatro en línea, colocará para tener dos en línea (menos prioridad que los tres y dos en línea).
; También comprobamos que esta jugada no le permita ganar al jugador.
(defrule clips_1_en_linea_M
	(declare (salience 2))
	(Turno M)
	(Uno_en_linea Juego ?i ?c M)
	(Cae Juego ?i ?c)
	(not (Jugar M ?))
	(not 
		(and
			(Siguiente ?i ?c ?v ?i2 ?c2)
			(Tres_en_linea Juego ?i2 ?c2 J)
		)
	)
	=>
	(printout t "JUEGO en la columna (consigue 2) " ?c crlf)
	(assert (Jugar M ?c))
)

; Si el jugador tiene una pieza que puede expandir a cuatro en línea, Clips colocará para impedir tener dos en línea (menos prioridad que los tres y dos en línea, y que consiguir dos en línea).
; También comprobamos que esta jugada no le permita ganar al jugador.
(defrule clips_1_en_linea_J
	(declare (salience 1))
	(Turno M)
	(Uno_en_linea Juego ?i ?c J)
	(Cae Juego ?i ?c)
	(not (Jugar M ?))
	(not 
		(and
			(Siguiente ?i ?c ?v ?i2 ?c2)
			(Tres_en_linea Juego ?i2 ?c2 J)
		)
	)
	=>
	(printout t "JUEGO en la columna (impide 2) " ?c crlf)
	(assert (Jugar M ?c))
)

; Realización de la jugada obtenida por las reglas anteriores. Se realiza por separado para que entre medias se borren las caídas y las piezas en línea para poder actualizarlas en el siguiente turno.
(defrule clips_jugada
	(declare (salience -500))
	?f <- (Turno M)
	?g <- (Jugar M ?c)
	=>
	(retract ?f)
	(retract ?g)
	(assert (Juega M ?c))
)