; Nombre: Pedro Ramos Suárez.

(deffacts factores_iniciales
	(FactorCerteza problema_starter si 0)
	(FactorCerteza problema_bujias si 0)
	(FactorCerteza problema_bateria si 0)
)

;;; FUNCIONES 

(deffunction encadenado (?fc_antecedente ?fc_regla)
	(if (> ?fc_antecedente 0)
	then
		(bind ?rv (* ?fc_antecedente ?fc_regla))
	else
		(bind ?rv 0)
	)
	?rv
)

(deffunction combinacion (?fc1 ?fc2)
	(if (and (> ?fc1 0) (> ?fc2 0))
	then
		(bind ?rv (- (+ ?fc1 ?fc2) (* ?fc1 ?fc2)))
	else
		(if (and (< ?fc1 0) (< ?fc2 0))
		then
			(bind ?rv (+ (+ ?fc1 ?fc2) (* ?fc1 ?fc2)))
		else
			(bind ?rv (/ (+ ?fc1 ?fc2) (- 1 (min (abs ?fc1) (abs ?fc2)))))
		)
	)
	?rv
)

;;; REGLAS

(defrule combinar
	(declare (salience 1))
	?f <- (FactorCerteza ?h ?r ?fc1)
	?g <- (FactorCerteza ?h ?r ?fc2)
	(test (neq ?fc1 ?fc2))
	=>
	(retract ?f ?g)
	(assert (FactorCerteza ?h ?r (combinacion ?fc1 ?fc2)))
)

(defrule combinar_signo
	(declare (salience 2))
	?f <- (FactorCerteza ?h si ?fc1)
	?g <- (FactorCerteza ?h no ?fc2)
	=>
	(retract ?f ?g)
	(assert (FactorCerteza ?h si (- ?fc1 ?fc2)))
)

(defrule certeza_evidencias
	(Evidencia ?e ?r)
	=>
	(assert (FactorCerteza ?e ?r 1))
)

; R1: Si el motor obtiene gasolina y el motor gira entonces problemas con las bujías con certeza 0.7
(defrule R1
	(FactorCerteza motor_llega_gasolina si ?f1)
	(FactorCerteza gira_motor si ?f2)
	(test (and (> ?f1 0) (> ?f2 0)))
	=>
	(assert (FactorCerteza problema_bujias si (encadenado (* ?f1 ?f2) 0.7)))
)

; R2: Si no gira el motor entonces problema con el starter con certeza 0.8
(defrule R2
	(FactorCerteza gira_motor no ?f1)
	(test (> ?f1 0))
	=>
	(assert (FactorCerteza problema_starter si (encadenado ?f1 0.8)))
)

; R3: Si no encienden las luces entonces problemas con la bateria con certeza 0.9
(defrule R3
	(FactorCerteza encienden_las_luces no ?f1)
	(test (> ?f1 0))
	=>
	(assert (FactorCerteza problema_bateria si (encadenado ?f1 0.9)))
)

; R4: Si hay gasolina en el deposito entonces el motor obtiene gasolina con certeza 0.9
(defrule R4
	(FactorCerteza hay_gasolina_en_deposito si ?f1)
	(test (> ?f1 0))
	=>
	(assert (FactorCerteza motor_llega_gasolina si (encadenado ?f1 0.9)))
)

; R5: Si hace intentos de arrancar entonces problema con el starter con certeza -0.6
(defrule R5
	(FactorCerteza hace_intentos_arrancar si ?f1)
	(test (> ?f1 0))
	=>
	(assert (FactorCerteza problema_starter si (encadenado ?f1 -0.6)))
)

; R6: Si hace intentos de arrancar entonces problema con la bateria 0.5
(defrule R6
	(FactorCerteza hace_intentos_arrancar si ?f1)
	(test (> ?f1 0))
	=>
	(assert (FactorCerteza problema_bateria si (encadenado ?f1 0.5))))

;;; ENTRADAS

; Preguntamos si el motor obtiene gasolina
(defrule pregunta_motor_llega_gasolina
	=>
	(printout t "¿El motor obtiene gasolina? (si = Sí, no = No): ")
	(assert (Evidencia motor_llega_gasolina (read)))
)

; Preguntamos si el motor gira
(defrule pregunta_gira_motor
	=>
	(printout t "¿El motor gira? (si = Sí, no = No): ")
	(assert (Evidencia gira_motor (read)))
)

; Preguntamos si encienden las luces
(defrule pregunta_encienden_las_luces
	=>
	(printout t "¿Se encienden las luces? (si = Sí, no = No): ")
	(assert (Evidencia encienden_las_luces (read)))
)

; Preguntamos si hay gasolina en el deposito
(defrule pregunta_hay_gasolina_en_deposito
	=>
	(printout t "¿Hay gasolina en el deposito? (si = Sí, no = No): ")
	(assert (Evidencia hay_gasolina_en_deposito (read)))
)

; Preguntamos si hace intentos de arrancar
(defrule pregunta_hace_intentos_arrancar
	=>
	(printout t "¿Hace intentos de arrancar? (si = Sí, no = No): ")
	(assert (Evidencia hace_intentos_arrancar (read)))
	(assert (Razonar Si))
)

;;; SALIDAS

(defrule razonar_problema
	(Razonar Si)

	(FactorCerteza ?p1 ?e1 ?v1)
	(not (Evidencia ?p1 ?))

	(FactorCerteza ?p2 ?e2 ?v2)
	(not (Evidencia ?p2 ?))
	(test (>= ?v1 ?v2))

	(FactorCerteza ?p3 ?e3 ?v3)
	(not (Evidencia ?p3 ?))
	(test (>= ?v1 ?v3))

	(test (and (neq ?p1 ?p2) (neq ?p1 ?p3) (neq ?p2 ?p3)))
	(not (Problema ?p1 ?v1))
	=>
	(assert (Problema ?p1 ?v1))
)

(defrule salida
	?f <- (Problema ?p ?v)
	?g <- (Razonar Si)
	(test (> ?v 0))
	=>
	(retract ?f)
	(retract ?g)
	(printout t crlf "El problema es del tipo " ?p " con certeza " ?v "." crlf)
)

(defrule no_salida
	?f <- (Problema ?p ?v)
	?g <- (Razonar Si)
	(test (= ?v 0))
	=>
	(retract ?f)
	(retract ?g)
	(printout t crlf "No puedo saber cual es el problema en este caso." crlf)
)