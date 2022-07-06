; Nombre: Pedro Ramos Suárez.

;;; HECHOS

(deffacts datos
	(ave gorrion) (ave paloma) (ave pinguino)
	(mamifero vaca) (mamifero perro) (mamifero caballo)
	(vuela pinguino no seguro)
)

;;; REGLAS

(defrule ave_son_animales
	(ave ?x)
	=>
	(assert (animal ?x))
	(bind ?expl (str-cat "Sabemos que un " ?x " es un animal porque las aves son un tipo de animal."))
	(assert (explicacion animal ?x ?expl))
)

(defrule mamiferos_son_animales
	(mamifero ?x)
	=>
	(assert (animal ?x))
	(bind ?expl (str-cat "Sabemos que un " ?x " es un animal porque los mamiferos son un tipo de animal."))
	(assert (explicacion animal ?x ?expl))
)

(defrule ave_vuela_por_defecto
	(declare (salience -1))
	(ave ?x)
	=>
	(assert (vuela ?x si por_defecto))
	(bind ?expl (str-cat "Asumo que un " ?x " vuela, porque casi todas las aves vuelan."))
	(assert (explicacion vuela ?x ?expl))
)

(defrule retracta_vuelo_por_defecto
	(declare (salience 1))
	?f <- (vuela ?x ?r por_defecto)
	(vuela ?x ?s seguro)
	=>
	(retract ?f)
	(bind ?expl (str-cat "Retractamos que un " ?x " " ?r " vuela por defecto, porque sabemos seguro que " ?x " " ?s " vuela."))
	(assert (explicacion retracta_vuela ?x ?expl))
)

(defrule mayor_parte_animales_no_vuelan
	(declare (salience -2))
	(animal ?x)
	(not (vuela ?x ? ?))
	=>
	(assert (vuela ?x no por_defecto))
	(bind ?expl (str-cat "Asumo que " ?x " no vuela, porque la mayor parte de los animales no vuelan."))
	(assert (explicacion vuela ?x ?expl))
)

;;; ENTRADA Y SALIDA POR PANTALLA

; Preguntamos por el animal
(defrule pregunta_animal
	=>
	(printout t "Introduce el nombre de un animal (gorrion, paloma, pinguino, vaca, perro, caballo): ")
	(assert (pregunta (read)))
)

; Imprimimos si vuela o no.
(defrule razona_vuela
	(pregunta ?x)
	(vuela ?x ?s ?t)
	=>
	(printout t "El animal " ?x " " ?s " vuela " ?t "." crlf)
	(assert (comienza razonamiento))
)

; Imprimimos los motivos
(defrule inicio_razona
	?f <- (comienza razonamiento)
	=>
	(retract ?f)
	(printout t crlf "RAZONAMIENTO:" crlf)
	(assert (explica razonamiento))
)

(defrule razona_explicacion
	(explica razonamiento)
	(pregunta ?x)
	?f <- (explicacion ? ?x ?e)
	=>
	(retract ?f)
	(printout t "· " ?e crlf)
)