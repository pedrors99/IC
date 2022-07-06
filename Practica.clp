; (load "/Users/pedro/Desktop/DGIIM/2020\:2021/IC/Prácticas/Practica.clp")

; Nombre: Pedro Ramos Suárez.

(defmodule test (export ?ALL))
	(deffacts A
		(Hardware Si) (hardware si)
	)

(defmodule A (export ?ALL) (import test ?ALL))
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



	(deffacts estado_inicial
		(Pregunta Hardware)
		(Rama -)
	)

	(defrule mensaje_inicial
		(declare (salience 9999))
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



;;; MODULOS



	(defrule transforma_modulo_hardware
		(Hardware ?h)
		=>
		(assert (hardware ?h))
	)

	(defrule transforma_modulo_programar
		(Programar ?p)
		=>
		(assert (programar ?p))
	)

	(defrule transforma_modulo_matematias
		(Matematicas ?m)
		=>
		(assert (matematicas ?m))
	)

	(defrule transforma_modulo_nota_media
		(NotaMedia ?nm)
		=>
		(assert (notamedia ?nm))
	)

	(defrule transforma_modulo_trabajo_publica
		(Trabajo Publica)
		=>
		(assert (trabajar 1))
	)

	(defrule transforma_modulo_trabajo_privada
		(Trabajo Privada)
		=>
		(assert (trabajar 2))
	)

	(defrule transforma_modulo_trabajo_docencia
		(Trabajo Docencia)
		=>
		(assert (trabajar 3))
	)

	(defrule transforma_modulo_trabajo_-
		(Trabajo -)
		=>
		(assert (trabajar 4))
	)

	(defrule transforma_modulo_trabajador
		(Trabajador ?t)
		=>
		(assert (trabajador ?t))
	)



	;;;;; NOTA: Debido a la gran cantidad de nodos para todas las posibilidades permitiendo el caso de que no sepa responder, no he podido probar todas las combinaciones.
	;;;;; Por ello, puede ocurrir que haya algun error debido a un fallo ortográfico y no me haya dado cuenta.



(defmodule B (import A ?ALL) (export ?ALL))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;                                                      ;;
	;;        ASESORAMIENTO DE LA RAMA DE INFORMÁTICA       ;;
	;;                                                      ;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;; Alumno: Pedro Gallego López
	;; Ingeniería del Conocimiento


	;; Para la implementación de este programa se ha hecho uso del ejercicio
	;; de Adquisición del Conocimiento hecho en teoría. Así, los atributos
	;; de los que vamos a requerir información serán:
	;;  - Gustan matemáticas (sí/no). HECHOS: (matematicas Si), (matematicas No)
	;;  - Quiere trabajar en (Empresa Publica/Empresa Privada/Docencia/Le da igual). HECHOS: (trabajar 1), (trabajar 2), (trabajar 3), (trabajar 4)
	;;  - Nota media (alta/media/baja). HECHOS: (notamedia Alta), (notamedia Media), (notamedia Baja)
	;;  - Gusta el hardware (sí/no). HECHOS: (hardware Si), (hardware No)
	;;  - Es trabajador (mucho/normal/poco). HECHOS: (trabajdor Mucho), (trabajador Normal), (trabajador Poco)
	;;
	;; El árbol que se obtuvo fue un árbol en el que no se usaban dos de las variables
	;; propuestas, por lo tanto he suprimido estas variables para la práctica.
	;; El ejercicio de teoria se adjunta al zip para que se pueda ver el árbol resultante.
	;; se han hecho algunas modificaciones mínimas en esta práctica ya que hay reglas que
	;; consideraba que no tenían mucho sentido.
	;;
	;; Para ello entrevistaremos al usuario sacándole la información necesaria conforme
	;; sea necesario. Haremos preguntas genéricas en algún tramo para hacer que el usuario
	;; se meta más en el papel y consiga tener en cuenta todos los factores influyentes,
	;; y en una entrevista fluida conseguiremos los datos que nos ayudarán para decidir
	;; cada rama.
	;;
	;;
	;; FUNCIONAMIENTO DE LA BASE DE CONOCIMIENTO:
	;; Comienzo de la entrevista: Estará marcada por los hechos (Comienzo Si) y seguidamente por (introduccion 1). Al terminar el comienzo
	;; se inicia la entrevista. Este inicio viene marcado por el hecho (entrevista 1). En esta primera versión de la base de conocimiento
	;; solo se ha incluido el hecho (entrevista 1), pero este hecho está creado con la intención de realizar varias "sesiones", utilizando
	;; los hechos (entrevista ?n) con ?n un número que indica el nº de la sesión. Esto vendría bien por si en algún momento no hemos cogido
	;; la información necesaria en la primera sesión: bien sea por una pregunta no contestada, ambigua, o incluso por si el usuario en ese
	;; momento no sabe dar respuesta.
	;;
	;;    Sabremos que hemos cogido bien la información de un atributo cuando el hecho (?atributo ?valor) esté en nuestro conocimiento. Una
	;; forma para ver si es necesario hacer otra sesión, es comprobar que existe un hecho de cada atributo.
	;; Para esta primera versión se ha considerado el árbol que se ha explicado antes, en donde las respuestas a las preguntas sobre atributos
	;; serán siempre recogidas, luego nunca nos será necesario en esta versión hacer otra sesión.
	;;
	;; El código está estructurado en los siguientes bloques:
	;;  1.- Entrevista: conversación con el usuario y preguntas.
	;;  2.- Conclusiones: se recogen las reglas que recomiendan una rama a partir de los atributos.
	;;  3.- Comprobación de respuestas: reglas que analizan la respuesta del usuario y añaden los hechos.
	;;  4.- Borrado de conocimiento: borra todo el conocimiento aportado en la entrevista. Se lanzan cuando ya hemos hecho una recomendacion
	;;      para así terminar el programa.


	;; Representación de Ramas
	(deffacts Ramas
		(Rama2 Computacion_y_Sistemas_Inteligentes)
		(Rama2 Ingenieria_del_Software)
		(Rama2 Ingenieria_de_Computadores)
		(Rama2 Sistemas_de_la_Informacion)
		(Rama2 Tecnologias_de_la_Informacion)
	)

	;; Comienzo de la entrevista
	(defrule comienzo
		=>
		(printout t "Bienvenido, vamos a intentar asesorarte en la elección de la rama de informática." crlf)
		(printout t "Para ello te tenemos que conocer un poco, así que hablaremos un poco sobre la carrera," crlf)
		(printout t "sobre tu paso por ella y sobre tus gustos. Estas preparado? (Si/No)" crlf)
		(assert (Comienzo (read)))
	)

	(defrule comienzo_check
		(declare (salience -999))
		(Comienzo ?r)
		(test (or (eq ?r Si) (or (eq ?r S) (or (eq ?r si) (or (eq ?r sii) (or (eq ?r Sii)   (or (eq ?r Vale) (or (eq ?r vale) (eq ?r valee)))))))))
		=>
		(assert (entrevista 1))
		(assert (introduccion 1))
	)

	(defrule fin_entrevista
		(declare (salience -9999))
		(not (entrevista ?p))
		=>
		(printout t "Pues ya hemos terminado. Hasta pronto y que vaya bien!" crlf)
	)



	;; Aquí me da igual lo que diga, simplemente que hable sobre la carrera en general para que
	;; él mismo se meta en situación y pueda darme mejores respuestas y más naturales
	(defrule primera_ronda_introduccion1
		(entrevista 1)
		?f <- (introduccion 1)
		=>
		(printout t "Con lo que has visto de la carrera, y las experiencias que has tenido. Que te ha parecido la carrera?" crlf)
		(printout t "Era como lo esperabas? Comentame un poco" crlf)
		(read)
		(retract ?f)
		(assert (introduccion 2))
	)

	;; Nos metemos de lleno en su primer año de carrera para empezar a encarrilarlo
	(defrule primera_ronda_introduccion2
		(entrevista 1)
		?f <- (introduccion 2)
		=>
		(printout t "Genial y el primer curso, Que te parecio?" crlf)
		(read)
		(retract ?f)
		(assert (pregunta hardware 1))
	)


	;; MATEMATICAS
	;; Le preguntamos sobre las asignaturas de algebra lineal y fisica, de aquí sacaremos si les gustó o no las asignaturas
	;; necesitamos una respuesta concisa. En caso de duda o que le haya gustado pero sin más, supondremos que no se quiere
	;; dedicar a estudiar más sobre cosas que contengan más matematicas
	(defrule primera_ronda_matematicas1
		(entrevista 1)
		?f <- (pregunta matematicas 1)
		=>
		(printout t "Y de ese primer año, las asignaturas de algebra lineal y fisica, te gustaron?" crlf)
		(printout t "Darias mas asignaturas de ese estilo? O asignaturas de estilo mas matematico? (Si/No)" crlf)
		(retract ?f)
		(assert (comprobarsino matematicas (read)))
	)



	;; HARDWARE
	(defrule primera_ronda_hardware1
		(entrevista 1)
		?f <- (pregunta hardware 1)
		=>
		(printout t "Hablando del primer año, te gustaron las asignaturas TOC, FFT, EC, AC... asignaturas en" crlf)
		(printout t "contacto directo con el hardware. Te gusta el hardware? (Si/No)" crlf)
		(retract ?f)
		(assert (comprobarsino hardware (read)))
	)



	;; SER TRABAJADOR
	(defrule primera_ronda_trabajador1
		(entrevista 1)
		?f <- (pregunta trabajador 1)
		=>
		(printout t "Genial. Algo que deberias saber es que para ciertas ramas se necesita mucha dedicación y trabajo." crlf)
		(printout t "Seria de gran ayuda que me dijeses si te consideras trabajador en la siguiente escala (Mucho/Normal/Poco)" crlf)
		(retract ?f)
		(assert (comprobartrabajador (read)))
	)

	;; NOTA MEDIA
	(defrule primera_ronda_notamedia1
		(entrevista 1)
		?f <- (pregunta notamedia 1)
		=>
		(printout t "Y siguiendo por la misma linea me gustaria preguntarte algo, tu nota media del expediente, puedes escribirme un numero del 0 al 10" crlf)
		(retract ?f)
		(assert (comprobarnota (read)))
	)


	;; DONDE TRABAJAR
	;; Dejamos que escriba algo, a lo que no haremos caso
	(defrule primera_ronda_quiere_trabajar1
		(entrevista 1)
		?f <- (pregunta quieretrabajar 1)
		=>
		(printout t "Y ya una pregunta fuera de todo esto, que te gustaria hacer en un futuro?" crlf)
		(read)
		(retract ?f)
		(assert (pregunta quieretrabajar 2))
	)

	;; Preguntamos para recoger la respuesta que nos sirve.
	(defrule primera_ronda_quiere_trabajar2
		?g <- (entrevista 1)
		?f <- (pregunta quieretrabajar 2)
		=>
		(printout t "Por lo tanto, le gustaria trabajar en:" crlf)
		(printout t " 1.- Empresa Publica" crlf)
		(printout t " 2.- Empresa Privada" crlf)
		(printout t " 3.- Dedicarme a la docencia" crlf)
		(printout t " 4.- Me da igual" crlf)
		(printout t "Seleccione una de las cuatro opciones escribiendo el numero de cada opcion: 1, 2, 3 o 4." crlf)
		(retract ?f ?g)
		(assert (comprobardondetrabajar (read)))
		(assert (conclusion))
	)


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;   CONCLUSIONES SOBRE LAS RESPUESTAS   ;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Las recomendaciones están basadas en las reglas generadas por el árbol
	(defrule recomiendacion_is1
		(declare (salience 9999))
		(hardware No)
		(matematicas No)
		(notamedia Alta)
		=>
		(assert (borrar))
		(printout t "En vista de que no te gusta el hardware te deberías de centrar en las ramas " crlf)
		(printout t "que están más alejadas de los componentes y del tratamiento del ordenador a bajo nivel." crlf)
		(printout t "En vista de que no te gustan las matematicas, una buena eleccion seria Ingenieria del Software" crlf)
		(printout t "ya que con tu nota media tan alta no deberias de tener problema." crlf)
	)


	(defrule recomiendacion_si1
		(declare (salience 9999))
		(hardware No)
		(matematicas No)
		(notamedia Baja|Media)
		(trabajar 2)
		=>
		(assert (borrar))
		(printout t "En vista de que no te gusta el hardware te deberías de centrar en las ramas " crlf)
		(printout t "que están más alejadas de los componentes y del tratamiento del ordenador a bajo nivel." crlf)
		(printout t "En vista de que no te gustan las matematicas, y la nota media no importa mucho puedes hacer la rama de" crlf)
		(printout t "Sistemas de la Informacion, ya que tiene bastantes salidas en la empresa privada" crlf)
	)

	(defrule recomiendacion_is2
		(declare (salience 9999))
		(hardware No)
		(matematicas No)
		(notamedia Baja|Media)
		(trabajar 1|3|4)
		=>
		(assert (borrar))
		(printout t "En vista de que no te gusta el hardware te deberías de centrar en las ramas " crlf)
		(printout t "que están más alejadas de los componentes y del tratamiento del ordenador a bajo nivel." crlf)
		(printout t "En vista de que no te gustan las matematicas, una opcion es intentar Ingenieria del Software" crlf)
		(printout t "puesto que aunque tengas nota baja, hay trabajo en empresas publicas o docencia, como a ti te interesa." crlf)
	)

	(defrule recomendacion_csi1
		(declare (salience 9999))
		(hardware No)
		(matematicas Si)
		(trabajador Mucho)
		=>
		(assert (borrar))
		(printout t "En vista de que no te gusta el hardware te deberías de centrar en las ramas " crlf)
		(printout t "que están más alejadas de los componentes y del tratamiento del ordenador a bajo nivel." crlf)
		(printout t "Como te gustan las matematicas, una rama muy acorde a ellas es la rama de Computacion y Sistemas Inteligentes" crlf)
		(printout t "Hay que ser trabajador para sacarla adelante, Y TU LO ERES." crlf)
	)

	(defrule recomendacion_csi2
		(declare (salience 9999))
		(hardware No)
		(matematicas Si)
		(trabajador Normal)
		(trabajar 2)
		=>
		(assert (borrar))
		(printout t "En vista de que no te gusta el hardware te deberías de centrar en las ramas " crlf)
		(printout t "que están más alejadas de los componentes y del tratamiento del ordenador a bajo nivel." crlf)
		(printout t "Como te gustan las matematicas, una rama muy acorde a ellas es la rama de Computacion y Sistemas Inteligentes." crlf)
		(printout t "Esta rama tiene muchas salidas en las empresas privadas. Seguro que te interesa." crlf)
	)

	(defrule recomendacion_ti1
		(declare (salience 9999))
		(hardware No)
		(matematicas Si)
		(trabajador Normal)
		(trabajar 1|3|4)  ;; Cualquier cosa que no sea empresa privada
		=>
		(assert (borrar))
		(printout t "En vista de que no te gusta el hardware te deberías de centrar en las ramas " crlf)
		(printout t "que están más alejadas de los componentes y del tratamiento del ordenador a bajo nivel." crlf)
		(printout t "Como te gustan las matematicas y se te ve que trabajas mas o menos bien, una buena situacion" crlf)
		(printout t "seria que estudiases la rama de Tecnologias de la Informacion, aunque tiene pocas salidas en " crlf)
		(printout t "empresa privada, pero, por lo que me has contado, eso te da igual. " crlf)
	)

	(defrule recomendacion_ti2
		(declare (salience 9999))
		(hardware No)
		(matematicas Si)
		(trabajador Poco)
		=>
		(assert (borrar))
		(printout t "En vista de que no te gusta el hardware te deberías de centrar en las ramas " crlf)
		(printout t "que están más alejadas de los componentes y del tratamiento del ordenador a bajo nivel." crlf)
		(printout t "Como te gustan las matematicas pero trabajas poco, una rama que exige poco y que te puede " crlf)
		(printout t "interesar a nivel matematico seria Tecnologias de la informacion " crlf)
	)

	(defrule recomendacion_is3
		(declare (salience 9999))
		(hardware Si)
		(trabajador Mucho)
		(trabajar 1|2)
		=>
		(assert (borrar))
		(printout t "Por lo que veo te gusta el hardware, pero veo que eres trabajador y te interesa trabajar en" crlf)
		(printout t "una empresa. Mi recomendacion es que te metas a Ingenieria del Software, con esta rama" crlf)
		(printout t "te sera mas facil asentarte en un trabajo de empresa publica y con ello pivotar a un trabajo mas relacionado con hardware" crlf)
	)

	(defrule recomendacion_ic1
		(declare (salience 9999))
		(hardware Si)
		(trabajador Mucho)
		(trabajar 3|4)
		=>
		(assert (borrar))
		(printout t "Por lo que veo te gusta el hardware, pero veo que eres trabajador y te interesa trabajar en" crlf)
		(printout t "fuera de una empresa. Mi recomendacion es que te metas a Ingenieria de Computadores" crlf)
		(printout t "es la rama mas relacionada con hardware, y seguro que te gustara." crlf)
	)

	(defrule recomendacion_ic2
		(declare (salience 9999))
		(hardware Si)
		(trabajador Normal)
		=>
		(assert (borrar))
		(printout t "Por lo que veo te gusta el hardware, pero veo que trabajas moderadamente," crlf)
		(printout t "Una opcion viable es que te metas a Ingenieria de Computadores" crlf)
		(printout t "es la rama mas relacionada con hardware, y seguro que te gustara." crlf)
	)


	(defrule recomendacion_is4
		(declare (salience 9999))
		(hardware Si)
		(trabajador Poco)
		(trabajar 2)
		=>
		(assert (borrar))
		(printout t "Por lo que veo te gusta el hardware, pero veo que trabajas poco," crlf)
		(printout t "Una opcion viable es que te metas a Ingenieria del Software" crlf)
		(printout t "te sera mas facil asentarte en un trabajo de empresa publica y con ello pivotar a un trabajo mas relacionado con hardware." crlf)
	)

	(defrule recomendacion_ic3
		(declare (salience 9999))
		(hardware Si)
		(trabajador Poco)
		(trabajar 1|3|4)
		=>
		(assert (borrar))
		(printout t "Por lo que veo te gusta el hardware, pero veo que trabajas poco," crlf)
		(printout t "Una opcion viable es que te metas a Ingenieria de Computadores" crlf)
		(printout t "es la rama mas relacionada con hardware, y seguro que te gustara." crlf)
	)


	;; Reglas por defecto, se aplican en caso de asegurar la recomendacion. Si ha llegado a un punto en el que la información no ha aportado
	;; algo distinto de lo que se pensaba en un principio, pues se lanzan estas
	(defrule recomendacion_ic_seguro
		(declare (salience -100))
		(hardware Si)
		=>
		(assert (borrar))
		(printout t "Viendo que te gusta el hardware, una eleccion que te podría interesar es la rama de Ingenieria de Computadores.")
		)

		(defrule recomendacion_csi_seguro
		(declare (salience -100))
		(matematicas Si)
		(hardware No)
		=>
		(assert (borrar))
		(printout t "Viendo que te gustan las matematicas y no el hardware, una eleccion que te podría interesar es la rama de Computacion y Sistemas Inteligentes.")
	)

	(defrule recomendacion_tsi_seguro
		(declare (salience -100))
		(matematicas No)
		(hardware No)
		=>
		(assert (borrar))
		(printout t "Viendo que no te gustan las matematicas ni el hardware, una eleccion que te podría interesar es la rama de Tecnologias de la Informacion.")
	)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;   COMPROBACIONES DE RESPUESTA   ;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;; Comprobamos si ha sido un si
	(defrule comprobar_Si_respuesta_Si_No_Mates
		(declare (salience 9999))
		?f <- (comprobarsino matematicas ?r)
		(test (or (eq ?r Si) (or (eq ?r S) (or (eq ?r si) (or (eq ?r sii) (eq ?r Sii))))))
		=>
		(retract ?f)
		(assert (pregunta trabajador 1))
		(assert (matematicas Si))
	)

	;; Comprobamos si ha sido un no
	(defrule comprobar_No_respuesta_Si_No_Mates
		(declare (salience 9999))
		?f <- (comprobarsino matematicas ?r)
		(test (and (neq ?r Si) (and (neq ?r S) (and (neq ?r si) (and (neq ?r sii) (neq ?r Sii))))))
		=>
		(retract ?f)
		(assert (pregunta notamedia 1))
		(assert (matematicas No))
	)




	;; Comprobamos si ha sido un si
	(defrule comprobar_Si_respuesta_Si_No_Hardware
		(declare (salience 9999))
		?f <- (comprobarsino hardware ?r)
		(test (or (eq ?r Si) (or (eq ?r S) (or (eq ?r si) (or (eq ?r sii) (eq ?r Sii))))))
		=>
		(retract ?f)
		(assert (pregunta trabajador 1))
		(assert (hardware Si))
	)

	;; Comprobamos si ha sido un no
	(defrule comprobar_No_respuesta_Si_No_Hardware
		(declare (salience 9999))
		?f <- (comprobarsino hardware ?r)
		(test (and (neq ?r Si) (and (neq ?r S) (and (neq ?r si) (and (neq ?r sii) (neq ?r Sii))))))
		=>
		(retract ?f)
		(assert (pregunta matematicas 1))
		(assert (hardware No))
	)




	;; Comprobamos la respuesta trabajador (mucho)
	(defrule comprobar_respuesta_trabajador_mucho
		(declare (salience 9999))
		?f <- (comprobartrabajador ?r)
		(test (or (eq ?r Mucho) (or (eq ?r mucho) (eq ?r MUCHO) )))
		=>
		(retract ?f)
		(assert (pregunta quieretrabajar 1))
		(assert (trabajador Mucho))
	)


	;; Comprobamos la respuesta trabajador (normal)
	(defrule comprobar_respuesta_trabajador_normal
		(declare (salience 9999))
		?f <- (comprobartrabajador ?r)
		(test (or (eq ?r Normal) (or (eq ?r normal) (eq ?r NORMAL) )))
		=>
		(retract ?f)
		(assert (pregunta quieretrabajar 1))
		(assert (trabajador Normal))
	)

	;; Comprobamos la respuesta trabajador (poco) caso else MENOR SALIENCE
	(defrule comprobar_respuesta_trabajador_poco
		(declare (salience 9990))
		?f <- (comprobartrabajador ?r)
		=>
		(retract ?f)
		(assert (pregunta quieretrabajar 1))
		(assert (trabajador Poco))
 	)

	;; Comprobamos la respuesta Nota media (alta)
	(defrule comprobar_respuesta_nota_alta
		(declare (salience 9999))
		?f <- (comprobarnota ?r)
		(test (and (>= ?r 8) (<= ?r 10) ))
		=>
		(retract ?f)
		(assert (pregunta quieretrabajar 1))
		(assert (notamedia Alta))
	)


	;; Comprobamos la respuesta Nota media (media)
	(defrule comprobar_respuesta_nota_media
		(declare (salience 9999))
		?f <- (comprobarnota ?r)
		(test (and (>= ?r 6) (< ?r 8) ))
		=>
		(retract ?f)
		(assert (pregunta quieretrabajar 1))
		(assert (notamedia Media))
	)

	;; Comprobamos la respuesta Nota media (baja)
	(defrule comprobar_respuesta_nota_baja
		(declare (salience 9999))
		?f <- (comprobarnota ?r)
		(test (and (>= ?r 0) (< ?r 6) ))
		=>
		(retract ?f)
		(assert (pregunta quieretrabajar 1))
		(assert (notamedia Baja))
	)

	;; Comprobamos la respuesta Nota media (baja)
	(defrule comprobar_respuesta_nota_error
		(declare (salience 9990))
		?f <- (comprobarnota ?r)
		?g <- (pregunta quieretrabajar 1)
		=>
		(retract ?f ?g)
		(assert (volverapreguntarnota))
	)

	;; Volvemos a preguntar la nota
	(defrule volver_a_preguntar_nota
		(declare (salience 9990))
		?f <- (volverapreguntarnota)
		=>
		(printout t "Escribe un numero entre el 0 y el 10" crlf)
		(assert (comprobarnota (read)))
	)


	;; Comprobamos que se han introducido bien las opciones
	(defrule comprobar_dondetrabajar
		(declare (salience 9999))
		?f <- (comprobardondetrabajar ?r)
		(test (or (= ?r 1) (or (= ?r 2) (or (= ?r 3)  (= ?r 4)))))
		=>
		(retract ?f)
		(assert (trabajar ?r))
	)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; BORRADO
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Borramos todas las variables al terminar
	(defrule borrar_matematicas
		(declare (salience 9999))
		(borrar)
		?f <- (matematicas ?e)
		=>
		(retract ?f)
	)


	(defrule borrar_hardware
		(declare (salience 9999))
		(borrar)
		?f <- (hardware ?e)
		=>
		(retract ?f)
	)

	(defrule borrar_notamedia
		(declare (salience 9999))
		(borrar)
		?f <- (notamedia ?e)
		=>
		(retract ?f)
	)

	(defrule borrar_trabajar_en
		(declare (salience 9999))
		(borrar)
		?f <- (trabajar ?e)
		=>
		(retract ?f)
	)

	(defrule borrar_trabajador
		(declare (salience 9999))
		(borrar)
		?f <- (trabajador ?e)
		=>
		(retract ?f)
	)

	(defrule borrar_pregunta
		(declare (salience 9999))
		(borrar)
		?f <- (pregunta ?w ?e)
		=>
		(retract ?f)
	)

	  (defrule borrar_conclusion
		(declare (salience 9999))
		(borrar)
		?f <- (conclusion ?e)
		=>
		(retract ?f)
	)

	(defrule borrar_entrevista
		(declare (salience 9999))
		(borrar)
		?f <- (entrevista ?e)
		=>
		(retract ?f)
	)

	(defrule borrar_borrar
		(declare (salience 9990))
		?f <- (borrar)
		=>
		(retract ?f)
 	)



    ;;; MODULOS



    (defrule module
    	(Rama ?r)
    	=>
    	(printout t crlf ?r crlf)
    )

(defmodule main (import A ?ALL) (import B ?ALL))
	(defrule main
		(Rama ?r)
		=>
		(printout t crlf ?r clrf)
	)