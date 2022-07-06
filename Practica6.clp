; Nombre: Pedro Ramos Suárez.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                      ;;
;;        ASESORAMIENTO DE LA RAMA DE INFORMÁTICA       ;;
;;                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; El sistema utilizará:
;;;;;	* Hardware: Si le gusta el hardware o no. Las respuestas válidas son Si o No. Se representa por (Hardware Si|No|-).
;;;;;	* Programar: Si le gusta programar o no. Las respuestas válidas son Si o No. Se representa por (Programar Si|No|-).
;;;;;	* Matemáticas: Si le gustan las matemáticas o no. Las respuestas válidas son Si o No. Se representa por (Matematicas Si|No|-).
;;;;;	* Prácticas/Teoría: Si prefiere las prácticas, la teoría o ambas. Las respuestas válidas son Prácticas, Teória o Ambas. Se representa por (PracticasTeoria Practicas|Teoria|Ambas|-).
;;;;;	* Nota Media: Cuál es su nota media. Las respuestas válidas son un número entero entre 0 y 10, o baja, media o alta. Se representa por (NotaMedia Baja|Media|Alta|-).
;;;;;	* Trabajo: Dónde prefiere trabajar. Las respuestas válidas son empresa pública, empresa privada o docencia. Se representa por (Trabajo Publica|Privada|Docencia|-).
;;;;;	* Trabajador: Qué tan trabajador es. Las respuestas válidas son Si, No, Mucho, Medio o Poco. Se representa por (Trabajador Mucho|Medio|Poco|-).
;;;;; En la representación de todos los valores se usa -, que se usará para indicar que el usario no sabía la respuesta o no queria responder.
;;;;; Cada caso está más detallado en la zona en la que se pregunta.




(defrule seleccionado_ramas
	?f <- (Modo ramas)
	=>
	(retract ?f)
	(assert (Pregunta Hardware))
	(assert (Rama -))
)

(defrule mensaje_inicial_ramas
	(declare (salience 9999))
	(Modo ramas)
	=>
	(printout t crlf "Las respuestas formadas por varias palabras tienen que ir entre comillas, y en caso de que no quieras responder a una pregunta, simplemente introduce \"No sé\"" crlf)
)




;;;;; PREGUNTA HARDWARE: Preguntamos si le gusta o no el hardware.



(defrule PreguntaHardware
	?f <- (Pregunta Hardware)
	=>
	(printout t crlf "¿Te gusta el Hardware?" crlf)
	(assert (RespuestaHardware (read)))
	(retract ?f)
)

(defrule checkRespuestaHardware
	?f <- (RespuestaHardware ?r)
	(test
		(and
			(neq ?r Si)
			(neq ?r Sí)
			(neq ?r si)
			(neq ?r sí)
			(neq ?r No)
			(neq ?r no)
			(neq ?r "No se")
			(neq ?r "No sé")
			(neq ?r "no se")
			(neq ?r "no sé")
			(neq ?r "No lo se")
			(neq ?r "No lo sé")
			(neq ?r "no lo se")
			(neq ?r "no lo sé")
		)
	)
	=>
	(printout t "No entiendo la respuesta." crlf)
	(assert (Pregunta Hardware))
	(retract ?f)
)

(defrule checkRespuestaHardwareSi
	(or
		(RespuestaHardware Si)
		(RespuestaHardware Sí)
		(RespuestaHardware si)
		(RespuestaHardware sí)
	)
	=>
	(assert (Hardware Si))
)

(defrule checkRespuestaHardwareNo
	(or
		(RespuestaHardware No)
		(RespuestaHardware no)
	)
	=>
	(assert (Hardware No))
)

(defrule checkRespuestaHardwareNoSe
	(or
		(RespuestaHardware "No se")
		(RespuestaHardware "No sé")
		(RespuestaHardware "no se")
		(RespuestaHardware "no sé")
		(RespuestaHardware "No lo se")
		(RespuestaHardware "No lo sé")
		(RespuestaHardware "no lo se")
		(RespuestaHardware "no lo sé")
	)
	=>
	(assert (Hardware -))
)



;;;;; PREGUNTA PROGRAMAR: Preguntamos si le gusta programar o no.



(defrule PreguntaProgramar
	?f <- (Pregunta Programar)
	=>
	(printout t crlf "¿Te gusta programar?" crlf)
	(assert (RespuestaProgramar (read)))
	(retract ?f)
)

(defrule checkRespuestaProgramar
	?f <- (RespuestaProgramar ?r)
	(test
		(and
			(neq ?r Si)
			(neq ?r Sí)
			(neq ?r si)
			(neq ?r sí)
			(neq ?r No)
			(neq ?r no)
			(neq ?r "No se")
			(neq ?r "No sé")
			(neq ?r "no se")
			(neq ?r "no sé")
			(neq ?r "No lo se")
			(neq ?r "No lo sé")
			(neq ?r "no lo se")
			(neq ?r "no lo sé")
		)
	)
	=>
	(printout t "No entiendo la respuesta." crlf)
	(assert (Pregunta Programar))
	(retract ?f)
)

(defrule checkRespuestaProgramarSi
	(or
		(RespuestaProgramar Si)
		(RespuestaProgramar Sí)
		(RespuestaProgramar si)
		(RespuestaProgramar sí)
	)
	=>
	(assert (Programar Si))
)

(defrule checkRespuestaProgramarNo
	(or
		(RespuestaProgramar No)
		(RespuestaProgramar no)
	)
	=>
	(assert (Programar No))
)

(defrule checkRespuestaProgramarNoSe
	(or
		(RespuestaProgramar "No se")
		(RespuestaProgramar "No sé")
		(RespuestaProgramar "no se")
		(RespuestaProgramar "no sé")
		(RespuestaProgramar "No lo se")
		(RespuestaProgramar "No lo sé")
		(RespuestaProgramar "no lo se")
		(RespuestaProgramar "no lo sé")
	)
	=>
	(assert (Programar -))
)



;;;;; PREGUNTA MATEMÁTICAS: Preguntamos si le gustan las matemáticas o no.



(defrule PreguntaMatematicas
	?f <- (Pregunta Matematicas)
	=>
	(printout t crlf "¿Te gustan las matemáticas?" crlf)
	(assert (RespuestaMatematicas (read)))
	(retract ?f)
)

(defrule checkRespuestaMatematicas
	?f <- (RespuestaMatematicas ?r)
	(test
		(and
			(neq ?r Si)
			(neq ?r Sí)
			(neq ?r si)
			(neq ?r sí)
			(neq ?r No)
			(neq ?r no)
			(neq ?r "No se")
			(neq ?r "No sé")
			(neq ?r "no se")
			(neq ?r "no sé")
			(neq ?r "No lo se")
			(neq ?r "No lo sé")
			(neq ?r "no lo se")
			(neq ?r "no lo sé")
		)
	)
	=>
	(printout t "No entiendo la respuesta." crlf)
	(assert (Pregunta Matematicas))
	(retract ?f)
)

(defrule checkRespuestaMatematicasSi
	(or
		(RespuestaMatematicas Si)
		(RespuestaMatematicas Sí)
		(RespuestaMatematicas si)
		(RespuestaMatematicas sí)
	)
	=>
	(assert (Matematicas Si))
)

(defrule checkRespuestaMatematicasNo
	(or
		(RespuestaMatematicas No)
		(RespuestaMatematicas no)
	)
	=>
	(assert (Matematicas No))
)

(defrule checkRespuestaMatematicasNoSe
	(or
		(RespuestaMatematicas "No se")
		(RespuestaMatematicas "No sé")
		(RespuestaMatematicas "no se")
		(RespuestaMatematicas "no sé")
		(RespuestaMatematicas "No lo se")
		(RespuestaMatematicas "No lo sé")
		(RespuestaMatematicas "no lo se")
		(RespuestaMatematicas "no lo sé")
	)
	=>
	(assert (Matematicas -))
)



;;;;; PREGUNTA PRÁCTICAS/TEORÍA: Preguntamos si prefiere las prácticas, la teoría o ambas.



(defrule PreguntaPracticasTeoria
	?f <- (Pregunta PracticasTeoria)
	=>
	(printout t crlf "¿Prefieres las prácticas o la teoría?" crlf)
	(assert (RespuestaPracticasTeoria (read)))
	(retract ?f)
)

(defrule checkRespuestaPracticasTeoria
	?f <- (RespuestaPracticasTeoria ?r)
	(and
		(neq ?r Practicas)
		(neq ?r Prácticas)
		(neq ?r practicas)
		(neq ?r prácticas)
		(neq ?r Practica)
		(neq ?r Práctica)
		(neq ?r practica)
		(neq ?r práctica)
		(neq ?r Teoria)
		(neq ?r Teoría)
		(neq ?r teoria)
		(neq ?r teoría)
		(neq ?r Ambas)
		(neq ?r ambas)
		(neq ?r "No se")
		(neq ?r "No sé")
		(neq ?r "no se")
		(neq ?r "no sé")
		(neq ?r "No lo se")
		(neq ?r "No lo sé")
		(neq ?r "no lo se")
		(neq ?r "no lo sé")
	)
	=>
	(printout t "No entiendo la respuesta." crlf)
	(assert (Pregunta PracticasTeoria))
	(retract ?f)
)

(defrule checkRespuestasPracticas
	(or
		(RespuestaPracticasTeoria Practicas)
		(RespuestaPracticasTeoria Prácticas)
		(RespuestaPracticasTeoria practicas)
		(RespuestaPracticasTeoria prácticas)
		(RespuestaPracticasTeoria Practica)
		(RespuestaPracticasTeoria Práctica)
		(RespuestaPracticasTeoria practica)
		(RespuestaPracticasTeoria práctica)
	)
	=>
	(assert (PracticasTeoria Practicas))
)

(defrule checkRespuestaTeoria
	(or
		(RespuestaPracticasTeoria Teoria)
		(RespuestaPracticasTeoria Teoría)
		(RespuestaPracticasTeoria teoria)
		(RespuestaPracticasTeoria teoría)
	)
	=>
	(assert (PracticasTeoria Teoria))
)

(defrule checkRespuestaAmbas
	(or
		(RespuestaPracticasTeoria Ambas)
		(RespuestaPracticasTeoria ambas)
	)
	=>
	(assert (PracticasTeoria Ambas))
)

(defrule checkRespuestaPracticasTeoriaNoSe
	(or
		(RespuestaPracticasTeoria "No se")
		(RespuestaPracticasTeoria "No sé")
		(RespuestaPracticasTeoria "no se")
		(RespuestaPracticasTeoria "no sé")
		(RespuestaPracticasTeoria "No lo se")
		(RespuestaPracticasTeoria "No lo sé")
		(RespuestaPracticasTeoria "no lo se")
		(RespuestaPracticasTeoria "no lo sé")
	)
	=>
	(assert (PracticasTeoria -))
)



;;;;; PREGUNTA NOTA MEDIA: Preguntamos cual es su nota media. Tiene que ser un entero (no decimales), o baja/media/alta. [0,6] se considera baja, [7,8] se considera media, [9,10] se considera alta.



(defrule PreguntaNotaMedia
	?f <- (Pregunta NotaMedia)
	=>
	(printout t crlf "¿Cuál es tu nota media?" crlf)
	(assert (RespuestaNotaMedia (read)))
	(retract ?f)
)

(defrule checkRespuestaNotaMedia
	?f <-  (RespuestaNotaMedia ?r)
	(and
		(neq ?r Alta)
		(neq ?r alta)
		(neq ?r Media)
		(neq ?r media)
		(neq ?r Baja)
		(neq ?r baja)
		(neq ?r 10)
		(neq ?r 9)
		(neq ?r 8)
		(neq ?r 7)
		(neq ?r 6)
		(neq ?r 5)
		(neq ?r 4)
		(neq ?r 3)
		(neq ?r 2)
		(neq ?r 1)
		(neq ?r 0)
		(neq ?r "No se")
		(neq ?r "No sé")
		(neq ?r "no se")
		(neq ?r "no sé")
		(neq ?r "No lo se")
		(neq ?r "No lo sé")
		(neq ?r "no lo se")
		(neq ?r "no lo sé")
	)
	=>
	(printout t "No entiendo la respuesta." crlf)
	(assert (Pregunta NotaMedia))
	(retract ?f)
)

(defrule checkRespuestaNotaMediaAlta
	(or
		(RespuestaNotaMedia Alta)
		(RespuestaNotaMedia alta)
		(RespuestaNotaMedia 10)
		(RespuestaNotaMedia 9)
	)
	=>
	(assert (NotaMedia Alta))
)

(defrule checkRespuestaNotaMedia_Media
	(or
		(RespuestaNotaMedia Media)
		(RespuestaNotaMedia media)
		(RespuestaNotaMedia 8)
		(RespuestaNotaMedia 7)
	)
	=>
	(assert (NotaMedia Media))
)

(defrule checkRespuestaNotaMediaBaja
	(or
		(RespuestaNotaMedia Baja)
		(RespuestaNotaMedia baja)
		(RespuestaNotaMedia 6)
		(RespuestaNotaMedia 5)
		(RespuestaNotaMedia 4)
		(RespuestaNotaMedia 3)
		(RespuestaNotaMedia 2)
		(RespuestaNotaMedia 1)
		(RespuestaNotaMedia 0)
	)
	=>
	(assert (NotaMedia Baja))
)

(defrule checkRespuestaNotaMediaNoSe
	(or
		(RespuestaNotaMedia "No se")
		(RespuestaNotaMedia "No sé")
		(RespuestaNotaMedia "no se")
		(RespuestaNotaMedia "no sé")
		(RespuestaNotaMedia "No lo se")
		(RespuestaNotaMedia "No lo sé")
		(RespuestaNotaMedia "no lo se")
		(RespuestaNotaMedia "no lo sé")
	)
	=>
	(assert (NotaMedia -))
)



;;;;; PREGUNTA TRABAJO: Preguntamos dónde prefiere trabajar, si en una empresa pública, en una empresa privada o en docencia.



(defrule PreguntaTrabajo
	?f <- (Pregunta Trabajo)
	=>
	(printout t crlf "¿Dónde te gustaría trabajar? ¿En una empresa pública, en una empresa privada o en docencia?" crlf)
	(assert (RespuestaTrabajo (read)))
	(retract ?f)
)

(defrule checkPreguntaTrabajo
	?f <- (RespuestaTrabajo ?r)
	(and
		(neq ?r "Empresa publica")
		(neq ?r "Empresa pública")
		(neq ?r "empresa publica")
		(neq ?r "empresa pública")
		(neq ?r publica)
		(neq ?r pública)
		(neq ?r Publica)
		(neq ?r Publica)
		(neq ?r "Empresa privada")
		(neq ?r "empresa privada")
		(neq ?r Privada)
		(neq ?r privada)
		(neq ?r Docencia)
		(neq ?r docencia)
		(neq ?r "No se")
		(neq ?r "No sé")
		(neq ?r "no se")
		(neq ?r "no sé")
		(neq ?r "No lo se")
		(neq ?r "No lo sé")
		(neq ?r "no lo se")
		(neq ?r "no lo sé")
	)
	=>
	(printout t "No entiendo la respuesta." crlf)
	(assert (Pregunta Trabajo))
	(retract ?f)
)

(defrule checkRespuestaTrabajoEmpresaPublica
	(or
		(RespuestaTrabajo "Empresa publica")
		(RespuestaTrabajo "Empresa pública")
		(RespuestaTrabajo "empresa publica")
		(RespuestaTrabajo "empresa pública")
		(RespuestaTrabajo publica)
		(RespuestaTrabajo pública)
		(RespuestaTrabajo Publica)
		(RespuestaTrabajo Pública)
	)
	=>
	(assert (Trabajo Publica))
)

(defrule checkRespuestaTrabajoEmpresaPrivada
	(or
		(RespuestaTrabajo "Empresa privada")
		(RespuestaTrabajo "Empresa privada")
		(RespuestaTrabajo privada)
		(RespuestaTrabajo Privada)
	)
	=>
	(assert (Trabajo Privada))
)

(defrule checkRespuestaTrabajoEmpresaDocencia
	(or
		(RespuestaTrabajo Docencia)
		(RespuestaTrabajo docencia)
	)
	=>
	(assert (Trabajo Docencia))
)

(defrule checkRespuestaTrabajoNoSe
	(or
		(RespuestaTrabajo "No se")
		(RespuestaTrabajo "No sé")
		(RespuestaTrabajo "no se")
		(RespuestaTrabajo "no sé")
		(RespuestaTrabajo "No lo se")
		(RespuestaTrabajo "No lo sé")
		(RespuestaTrabajo "no lo se")
		(RespuestaTrabajo "no lo sé")
	)
	=>
	(assert (Trabajo -))
)



;;;;; PREGUNTA TRABAJADOR: Preguntamos que tan trabajador es. Si se considera como mucho, y no como poco.



(defrule PreguntaTrabajador
	?f <- (Pregunta Trabajador)
	=>
	(printout t crlf "¿Eres trabajador?" crlf)
	(assert (RespuestaTrabajador (read)))
	(retract ?f)
)

(defrule checkRespuestaTrabajador
	?f <- (RespuestaTrabajador ?r)
	(test
		(and
			(neq ?r Si)
			(neq ?r Sí)
			(neq ?r si)
			(neq ?r sí)
			(neq ?r No)
			(neq ?r no)
			(neq ?r Mucho)
			(neq ?r mucho)
			(neq ?r Normal)
			(neq ?r normal)
			(neq ?r Poco)
			(neq ?r poco)
			(neq ?r "No se")
			(neq ?r "No sé")
			(neq ?r "no se")
			(neq ?r "no sé")
			(neq ?r "No lo se")
			(neq ?r "No lo sé")
			(neq ?r "no lo se")
			(neq ?r "no lo sé")
		)
	)
	=>
	(printout t "No entiendo la respuesta." crlf)
	(assert (Pregunta Trabajador))
	(retract ?f)
)

(defrule checkRespuestaTrabajadorMucho
	(or
		(RespuestaTrabajador Si)
		(RespuestaTrabajador Sí)
		(RespuestaTrabajador si)
		(RespuestaTrabajador sí)
		(RespuestaTrabajador Mucho)
		(RespuestaTrabajador mucho)
	)
	=>
	(assert (Trabajador Mucho))
)

(defrule checkRespuestaTrabajadorNormal
	(or
		(RespuestaTrabajador Normal)
		(RespuestaTrabajador normal)
	)
	=>
	(assert (Trabajador Normal))
)

(defrule checkRespuestaTrabajadorPoco
	(or
		(RespuestaTrabajador No)
		(RespuestaTrabajador no)
		(RespuestaTrabajador Poco)
		(RespuestaTrabajador poco)
	)
	=>
	(assert (Trabajador Poco))
)

(defrule checkRespuestaTrabajadorNoSe
	(or
		(RespuestaTrabajador "No se")
		(RespuestaTrabajador "No sé")
		(RespuestaTrabajador "no se")
		(RespuestaTrabajador "no sé")
		(RespuestaTrabajador "No lo se")
		(RespuestaTrabajador "No lo sé")
		(RespuestaTrabajador "no lo se")
		(RespuestaTrabajador "no lo sé")
	)
	=>
	(assert (Trabajador -))
)



;;;;; DECISIONES: Para decidir que recomendar, nos movemos por un árbol hasta llegar a una hoja.



; Hardware: Si
(defrule nodo1
	?f <- (Rama -)
	(Hardware Si)
	=>
	(retract ?f)
	(assert (Rama "Ingeniería del Hardware"))
	(assert (Motivo "te gusta el hardware."))
)

; Hardware: ~Si
(defrule nodo2
	(Rama -)
	(Hardware ~Si)
	=>
	(assert (Pregunta Programar))
)

; Hardware: ~Si, Programar: No
(defrule nodo3
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar No)
	=>
	(retract ?f)
	(assert (Rama "Sistemas de Información"))
	(assert (Motivo "no te gusta ni programar ni el hardware."))
)

; Hardware: ~Si, Programar: -
(defrule nodo4
	(Rama -)
	(Hardware ~Si)
	(Programar -)
	=>
	(assert (Pregunta Trabajo))
)

; Hardware: ~Si, Programar: -, Trabajo: Pública
(defrule nodo5
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo Publica)
	=>
	(retract ?f)
	(assert (Rama "Sistemas de Información"))
	(assert (Motivo "quieres trabajar en una empresa pública, y no sabes si te gusta programar."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica
(defrule nodo6
	(Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	=>
	(assert (Pregunta Matematicas))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: No
(defrule nodo7
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas No)
	=>
	(retract ?f)
	(assert (Rama "Ingeniería del Software"))
	(assert (Motivo "no te gustan las matemáticas ni quieres trabajar en una empresa pública."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: -
(defrule nodo8
	(Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas -)
	=>
	(assert (Pregunta NotaMedia))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: -, NotaMedia: Baja
(defrule nodo9
	(Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas -)
	(NotaMedia Baja)
	=>
	(assert (Pregunta PracticasTeoria))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: -, NotaMedia: Baja, PracticasTeoria: Teoria
(defrule nodo10
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas -)
	(NotaMedia Baja)
	(PracticaTeoria Teoria)
	=>
	(retract ?f)
	(assert (Rama "Sistemas de Información"))
	(assert (Motivo "tu nota media es baja y prefieres la teoría."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: -, NotaMedia: Baja, PracticasTeoria: Practicas|Ambas
(defrule nodo11
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas -)
	(NotaMedia Baja)
	(PracticaTeoria Practicas|Teoria)
	=>
	(retract ?f)
	(assert (Rama "Ingeniería del Software"))
	(assert (Motivo "tu nota media es baja y no prefieres la teoría."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: -, NotaMedia: Media|Alta
(defrule nodo12
	(Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas -)
	(NotaMedia Media|Alta)
	=>
	(assert (Pregunta PracticasTeoria))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: -, NotaMedia: Media|Alta, PracticaTeoria: Practicas|Ambas
(defrule nodo13
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas -)
	(NotaMedia Media|Alta)
	(PracticasTeoria Practicas|Ambas)
	=>
	(retract ?f)
	(assert (Rama "Computación y Sistemas Inteligentes"))
	(assert (Motivo "tienes una nota media alta, y te gustan las prácticas."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: -, NotaMedia: Media|Alta, PracticaTeoria: Teoria
(defrule nodo14
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas -)
	(NotaMedia Media|Alta)
	(PracticasTeoria Teoría)
	=>
	(retract ?f)
	(assert (Rama "Tecnologías de la Información"))
	(assert (Motivo "tienes una nota media alta, y te gusta la teoría."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: Si
(defrule nodo15
	(Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas Si)
	=>
	(assert (Pregunta Trabajador))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: Si, Trabajador: Poco
(defrule nodo16
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas Si)
	(Trabajador Poco)
	=>
	(retract ?f)
	(assert (Rama "Tecnologías de la Información"))
	(assert (Motivo "te gustan las matemáticas y no eres muy trabajador."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: Si, Trabajador: ~Poco
(defrule nodo17
	(Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas Si)
	(Trabajador ~Poco)
	=>
	(assert (Pregunta NotaMedia))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: Si, Trabajador: ~Poco, NotaMedia: Baja
(defrule nodo18
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas Si)
	(Trabajador ~Poco)
	(NotaMedia Baja)
	=>
	(retract ?f)
	(assert (Rama "Ingeniería del Software"))
	(assert (Motivo "tu nota media es baja y no eres muy trabajador."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: Si, Trabajador: ~Poco, NotaMedia: ~Baja
(defrule nodo19
	(Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas Si)
	(Trabajador ~Poco)
	(NotaMedia ~Baja)
	=>
	(assert (Pregunta PracticasTeoria))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: Si, Trabajador: ~Poco, NotaMedia: ~Baja, PracticasTeoria: Prácticas|Ambas
(defrule nodo20
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas Si)
	(Trabajador ~Poco)
	(NotaMedia ~Baja)
	(PracticasTeoria Practicas|Ambas)
	=>
	(retract ?f)
	(assert (Rama "Computación y Sistemas Inteligentes"))
	(assert (Motivo "tienes una nota media alta, y te gustan las matemáticas y las prácticas."))
)

; Hardware: ~Si, Programar: -, Trabajo: ~Publica, Matematicas: Si, Trabajador: ~Poco, NotaMedia: ~Baja, PracticasTeoria: Teoria
(defrule nodo21
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar -)
	(Trabajo ~Publica)
	(Matematicas Si)
	(Trabajador ~Poco)
	(NotaMedia ~Baja)
	(PracticasTeoria Teoria)
	=>
	(retract ?f)
	(assert (Rama "Tecnologías de la Información"))
	(assert (Motivo "tienes una nota media alta, y te gustan las matemáticas y la teoría."))
)

; Hardware: ~Si, Programar: Si
(defrule nodo22
	(Rama -)
	(Hardware ~Si)
	(Programar Si)
	=>
	(assert (Pregunta Matematicas))
)

; Hardware: ~Si, Programar: Si, Matematicas: No
(defrule nodo23
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas No)
	=>
	(retract ?f)
	(assert (Rama "Ingeniería del Software"))
	(assert (Motivo "no te gustan las matemáticas pero si programar."))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No
(defrule nodo24
	(Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	=>
	(assert (Pregunta Trabajador))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: Mucho
(defrule nodo25
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador Mucho)
	=>
	(retract ?f)
	(assert (Rama "Computación y Sistemas Inteligentes"))
	(assert (Motivo "eres trabajador y te gustan las matemáticas y programar."))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: Poco|Medio
(defrule nodo26
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador Poco|Medio)
	=>
	(retract ?f)
	(assert (Rama "Ingeniería del Software"))
	(assert (Motivo "no eres muy trabajador y te gustan las matemáticas y programar."))
)


; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: -
(defrule nodo27
	(Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador -)
	=>
	(assert (Pregunta Trabajo))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: -, Trabajo: Publica
(defrule nodo28
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador -)
	(Trabajo Publica)
	=>
	(retract ?f)
	(assert (Rama "Ingeniería del Software"))
	(assert (Motivo "quieres trabajar en una empresa pública y te gusta programar."))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: -, Trabajo: ~Publica
(defrule nodo29
	(Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador -)
	(Trabajo ~Publica)
	=>
	(assert (Pregunta NotaMedia))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: -, Trabajo: ~Publica, NotaMedia: Baja
(defrule nodo30
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador -)
	(Trabajo ~Publica)
	(NotaMedia Baja)
	=>
	(retract ?f)
	(assert (Rama "Ingeniería del Software"))
	(assert (Motivo "tu nota media es baja y te gusta programar."))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: -, Trabajo: ~Publica, NotaMedia: ~Baja
(defrule nodo31
	(Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador -)
	(Trabajo ~Publica)
	(NotaMedia ~Baja)
	=>
	(assert (Pregunta PracticasTeoria))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: -, Trabajo: ~Publica, NotaMedia: ~Baja, PracticasTeoria: Practicas|Ambas
(defrule nodo32
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador -)
	(Trabajo ~Publica)
	(NotaMedia ~Baja)
	=>
	(retract ?f)
	(assert (Rama "Computación y Sistemas Inteligentes"))
	(assert (Motivo "tienes una nota media alta, y te gustan las matemáticas y las prácticas."))
)

; Hardware: ~Si, Programar: Si, Matemáticas: ~No, Trabajador: -, Trabajo: ~Publica, NotaMedia: ~Baja, PracticasTeoria: Teoría
(defrule nodo33
	?f <- (Rama -)
	(Hardware ~Si)
	(Programar Si)
	(Matematicas ~No)
	(Trabajador -)
	(Trabajo ~Publica)
	(NotaMedia ~Baja)
	=>
	(retract ?f)
	(assert (Rama "Tecnologías de la Información"))
	(assert (Motivo "tienes una nota media alta, y te gustan las matemáticas y la teoría."))
)



;;;;; SALIDAS: Salidas por pantalla con la rama recomendada, o con ninguna en caso de que falte información para elegir.




(defrule Recomendacion
	(Rama ?r)
	(test (neq ?r -))
	(Motivo ?m)
	=>
	(printout t crlf "Te recomiendo " ?r " porque " ?m crlf)
)

(defrule NoRecomendación
	(declare (salience -9999))
	(Rama -)
	=>
	(printout t crlf "No tengo suficiente información para recomendar una especialidad." crlf)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                         ;;
;;        ELECCION ENTRE ASIGNATURAS       ;;
;;                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts certeza_inicial
	(Asignatura IC) (Asignatura AA) (Asignatura TSI) (Asignatura MAC)
	(FactorCerteza IC Si 0) (FactorCerteza AA Si 0) (FactorCerteza TSI Si 0) (FactorCerteza MAC Si 0)
)



;;; PREGUNTAS ASIGNATURAS



(defrule entrada_asignatura1
	?f <- (Modo asignatura)
	=>
	(retract ?f)
	(printout t crlf "Introduce la primera de las asignaturas entre las que dudas (IC, AA, TSI o MAC):" crlf)
	(assert (Check_asignatura1 (read)))
)

(defrule check_asignatura1_false
	?f <- (Check_asignatura1 ?r)
	(not (Asignatura ?r))
	=>
	(retract ?f)
	(printout t crlf "Asignatura no válida. Tiene que ser IC, AA, TSI o MAC." crlf)
	(assert (Modo asignatura))
)

(defrule check_asignatura1_true
	?f <- (Check_asignatura1 ?r)
	(Asignatura ?r)
	=>
	(retract ?f)
	(assert (Read Asignatura2))
	(assert (Asignatura1 ?r))
)

(defrule entrada_asignatura2
	?f <- (Read Asignatura2)
	=>
	(retract ?f)
	(printout t crlf "Introduce la segunda de las asignaturas entre las que dudas (IC, AA, TSI o MAC):" crlf)
	(assert (Check_asignatura2 (read)))
)

(defrule check_asignatura2_false1
	?f <- (Check_asignatura2 ?r)
	(not (Asignatura ?r))
	=>
	(retract ?f)
	(printout t crlf "Asignatura no válida. Tiene que ser IC, AA, TSI o MAC." crlf)
	(assert (Read Asignatura2))
)

(defrule check_asignatura2_false2
	?f <- (Check_asignatura2 ?r2)
	(Asignatura1 ?r1)
	(test (eq ?r1 ?r2))
	=>
	(retract ?f)
	(printout t crlf "Asignatura no válida. No puede ser igual a la primera." crlf)
	(assert (Read Asignatura2))
)

(defrule check_asignatura2_true
	?f <- (Check_asignatura2 ?r2)
	(Asignatura1 ?r1)
	(Asignatura ?r2)
	(test (neq ?r1 ?r2))
	=>
	(retract ?f)
	(assert (Asignatura2 ?r2))
	(assert (Pregunta_escala Matematicas))
)



;;; LOGICA DE FACTORES DE CERTEZA



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

(defrule combinar
	(declare (salience 2))
	?f <- (FactorCerteza ?h ?r ?fc1)
	?g <- (FactorCerteza ?h ?r ?fc2)
	(test (neq ?fc1 ?fc2))
	=>
	(retract ?f ?g)
	(assert (FactorCerteza ?h ?r (combinacion ?fc1 ?fc2)))
)

(defrule combinar_signo
	(declare (salience 3))
	?f <- (FactorCerteza ?h Si ?fc1)
	?g <- (FactorCerteza ?h No ?fc2)
	=>
	(retract ?f ?g)
	(assert (FactorCerteza ?h Si (- ?fc1 ?fc2)))
)

(deffunction transforma_escala (?valor)
	(bind ?new_valor (- (* ?valor 2.0) 1.0))
	?new_valor
)



;;; PREGUNTAS ESCALA



; ENTRADA: MATEMATICAS

(defrule entrada_matematicas
	?f <- (Pregunta_escala Matematicas)
	=>
	(retract ?f)
	(printout t crlf "Del 0 al 1, ¿cuánto te gustan las matemáticas? (0 - No me gustan, 1 - Me gustan mucho):" crlf)
	(assert (Respuesta_escala Matematicas (read)))
)

(defrule check_entrada_matematicas
	?f <- (Respuesta_escala Matematicas ?r)
	(test
		(or
			(< ?r 0)
			(> ?r 1)
		)
	)
	=>
	(retract ?f)
	(printout t crlf "Valor no válido, tiene que estar entre 0 y 1" crlf)
	(assert (Pregunta_escala Matematicas))
)

(defrule transforma_entrada_matematicas
	?f <- (Respuesta_escala Matematicas ?r)
	(test
		(and
			(<= ?r 1)
			(>= ?r 0)
		)
	)
	=>
	(retract ?f)
	(assert (Escala Matematicas (transforma_escala ?r)))
	(assert (Pregunta_escala Programar))
)

; ENTRADA: PROGRAMAR

(defrule entrada_programar
	?f <- (Pregunta_escala Programar)
	=>
	(retract ?f)
	(printout t crlf "Del 0 al 1, ¿cuánto te gusta programar? (0 - No me gusta, 1 - Me gusta mucho):" crlf)
	(assert (Respuesta_escala Programar (read)))
)

(defrule check_entrada_programar
	?f <- (Respuesta_escala Programar ?r)
	(test
		(or
			(< ?r 0)
			(> ?r 1)
		)
	)
	=>
	(retract ?f)
	(printout t crlf "Valor no válido, tiene que estar entre 0 y 1" crlf)
	(assert (Pregunta_escala Programar))
)

(defrule transforma_entrada_programar
	?f <- (Respuesta_escala Programar ?r)
	(test
		(and
			(<= ?r 1)
			(>= ?r 0)
		)
	)
	=>
	(retract ?f)
	(assert (Escala Programar (transforma_escala ?r)))
	(assert (Pregunta_escala Teoria))
)

; ENTRADA: TEORIA

(defrule entrada_teoria
	?f <- (Pregunta_escala Teoria)
	=>
	(retract ?f)
	(printout t crlf "Del 0 al 1, ¿qué prefieres? ¿Las prácticas o la teoría? (0 - Prácticas, 1 - Teoría):" crlf)
	(assert (Respuesta_escala Teoria (read)))
)

(defrule check_entrada_teoria
	?f <- (Respuesta_escala Teoria ?r)
	(test
		(or
			(< ?r 0)
			(> ?r 1)
		)
	)
	=>
	(retract ?f)
	(printout t crlf "Valor no válido, tiene que estar entre 0 y 1" crlf)
	(assert (Pregunta_escala Teoria))
)

(defrule transforma_entrada_teoria
	?f <- (Respuesta_escala Teoria ?r)
	(test
		(and
			(<= ?r 1)
			(>= ?r 0)
		)
	)
	=>
	(retract ?f)
	(assert (Escala Teoria (transforma_escala ?r)))
	(assert (Pregunta_escala Dificultad))
)

; ENTRADA: DIFICULTAD

(defrule entrada_dificultad
	?f <- (Pregunta_escala Dificultad)
	=>
	(retract ?f)
	(printout t crlf "Del 0 al 1, ¿qué prefieres? ¿Que una asignatura sea fácil o difícil? (0 - Fácil, 1 - Difícil):" crlf)
	(assert (Respuesta_escala Dificultad (read)))
)

(defrule check_entrada_dificultad
	?f <- (Respuesta_escala Dificultad ?r)
	(test
		(or
			(< ?r 0)
			(> ?r 1)
		)
	)
	=>
	(retract ?f)
	(printout t crlf "Valor no válido, tiene que estar entre 0 y 1" crlf)
	(assert (Pregunta_escala Dificultad))
)

(defrule transforma_entrada_dificultad
	?f <- (Respuesta_escala Dificultad ?r)
	(test
		(and
			(<= ?r 1)
			(>= ?r 0)
		)
	)
	=>
	(retract ?f)
	(assert (Escala Dificultad (transforma_escala ?r)))
	(assert (Razonar Si))
)



;;; REGLAS



(deffacts valores
	(Valor IC Matematicas -0.4)  (Valor IC Programar -0.2)  (Valor IC Teoria 0.4)   (Valor IC Dificultad 0)
	(Valor AA Matematicas 0.8)   (Valor AA Programar 0.6)   (Valor AA Teoria 0.2)   (Valor AA Dificultad 0.8)
	(Valor TSI Matematicas -0.6) (Valor TSI Programar 0.8)  (Valor TSI Teoria -0.6) (Valor TSI Dificultad -0.6)
	(Valor MAC Matematicas 0.8)  (Valor MAC Programar -0.8) (Valor MAC Teoria 0.8)  (Valor MAC Dificultad 0.6)
)

(defrule R1
	(declare (salience 1))
	(Asignatura ?a)
	(Escala ?e ?fc1)
	(Valor ?a ?e ?fc2)
	;(test (>= ?fc1 0))
	=>
	(assert (FactorCerteza ?a Si (encadenado ?fc1 ?fc2)))
)





;;; SALIDAS



(defrule razonar_problema
	?f <- (Razonar Si)
	(FactorCerteza ?p1 Si ?v1)
	(FactorCerteza ?p2 Si ?v2)
	(test (>= ?v1 ?v2))
	(or
		(and
			(Asignatura1 ?p1)
			(Asignatura2 ?p2)
		)
		(and
			(Asignatura1 ?p2)
			(Asignatura2 ?p1)
		)
	)

	(not (Recomendacion ?p1 ?v1))
	=>
	(retract ?f)
	(printout t crlf "Razonando..." crlf)
	(assert (Recomendacion ?p1 ?v1))
)

(defrule salida
	(declare (salience -1))
	?f <- (Recomendacion ?p ?v)
	(test (> ?v 0))
	=>
	(retract ?f)
	(printout t crlf "Te recomiendo " ?p " con certeza " ?v "." crlf)
	(assert (ImprimeCertezas 1))
)

(defrule no_salida1
	(declare (salience -2))
	?f <- (Reomendacion ?p ?v)
	(test (= ?v 0))
	=>
	(retract ?f)
	(printout t crlf "No puedo saber que recomendar en este caso." crlf)
	(assert (ImprimeCertezas 1))
)

(defrule no_salida2
	(declare (salience -2))
	(not (Reomendacion ?p ?v))
	(not (ImprimeCertezas ?))
	=>
	(printout t crlf "No puedo saber que recomendar en este caso." crlf)
	(assert (ImprimeCertezas 1))
)

(defrule imprime_certezas1
	(declare (salience -2))
	?f <- (ImprimeCertezas 1)
	=>
	(retract ?f)
	(printout t crlf "Certezas:" crlf)
	(assert (ImprimeCertezas 2))
)

(defrule imprime_certezas2
	(declare (salience -3))
	(ImprimeCertezas 2)
	(FactorCerteza ?x ?r ?v)
	=>
	(printout t ?x ": " ?v "." crlf)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                          ;;
;;        SELECCION DE FUNCIONAMIENTO       ;;
;;                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts inicial
	(Modo entrada)
)

(defrule seleccion_funcionamiento
	?f <- (Modo entrada)
	=>
	(retract ?f)
	(printout t crlf "¿Quiéres que te ayude a elegir una rama (1) o a elegir entre dos asignaturas (2)?" crlf)
	(assert (entrada (read)))
)

(defrule check_entrada
	?f <- (entrada ?r)
	(test
		(and
			(neq ?r 1)
			(neq ?r 2)
		)
	)
	=>
	(retract ?f)
	(printout t crlf "Modo no válido." crlf)
	(assert (Modo entrada))
)

(defrule modo_ramas
	?f <- (entrada 1)
	=>
	(retract ?f)
	(assert (Modo ramas))
)

(defrule modo_asignaturas
	?f <- (entrada 2)
	=>
	(retract ?f)
	(assert (Modo asignatura))
)