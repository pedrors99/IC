; Nombre: Pedro Ramos Suárez



;;; Hay incluida una imagen con el nombre "Árbol genealógico.jpeg" para poder ver el árbol entero.



;;; Templates ;;;

(deftemplate Persona
	(multifield Nombre)
	(multifield Apellido)
	(field Sexo
		(allowed-symbols Hombre Mujer))
)

(deftemplate Relacion
	(field Tipo
		(allowed-symbols Esposo Hijo Padre Hermano Nieto Abuelo Suegro Yerno Cuñado Tio Primo))
	(multifield NombreSujeto)
	(multifield ApellidoSujeto)
	(multifield NombreObjeto)
	(multifield ApellidoObjeto)
)



;;; HECHOS GENERALES (Hasta la línea 1714) ;;;

;;; Personas: Datos de cada persona (Nombre, Apellido y Sexo). ;;;

(deffacts Personas
	(Persona
		(Nombre Sven)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Claretta)
		(Apellido Ethridge)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Mary Frowning")
		(Apellido Cloud)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Joe Puffing")
		(Apellido Goat)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Milhouse II")
		(Apellido Rounds)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Fern)
		(Apellido Johnson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Monique)
		(Apellido Lautrec)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Fielding 'Frenchy'")
		(Apellido DuBois)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Zephediah)
		(Apellido Stemple)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Hortensia)
		(Apellido Bodney)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Lambert)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Rupert)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Winifred Running")
		(Apellido Goat)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Humphrey Little")
		(Apellido Goat)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Jane Nervous")
		(Apellido Goat)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Omar)
		(Apellido Stillman)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Ettiwanda)
		(Apellido Trownse)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Milford)
		(Apellido Rounds)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Coquette 'Kookoo'")
		(Apellido DuBois)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Lance)
		(Apellido DuBois)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Clarice)
		(Apellido Stemple)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Zachariah)
		(Apellido Stemple)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Minnie)
		(Apellido Stemple)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Gaylord)
		(Apellido Stemple)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Trixie)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Prudence)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Galston)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Ivy 'Glass-eye'")
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Garwood)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Clowta)
		(Apellido Stillman)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Clem)
		(Apellido Stillman)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Clancey)
		(Apellido Stillman)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Ogilvie)
		(Apellido Stillman)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Dewey 'Square Top'")
		(Apellido Stillman)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Cromwell)
		(Apellido Rounds)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Eugenia)
		(Apellido Rounds)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Missy)
		(Apellido Rounds)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Rooney)
		(Apellido DuBois)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Lolly)
		(Apellido DuBois)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Otto)
		(Apellido Graycomb)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Burton)
		(Apellido Stemple)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Riva)
		(Apellido Herrin)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Paco)
		(Apellido Stemple)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Caleb)
		(Apellido Stemple)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Vic)
		(Apellido Stemple)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Grabby)
		(Apellido Crouse)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Howland)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Zeke)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Pippa)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Floyd)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Horatio)
		(Apellido Dinsdale)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Edwina)
		(Apellido Forayter)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Nellie)
		(Apellido Balliwick)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Bertram)
		(Apellido Hickman)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Wainwright Montgomery")
		(Apellido Burns)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Evelyn)
		(Apellido Graycomb)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Axel)
		(Apellido Graycomb)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Amos)
		(Apellido Graycomb)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Moselle)
		(Apellido Stemple)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Louise 'Pixie'")
		(Apellido Stemple)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Jacques)
		(Apellido Stemple)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Zorina)
		(Apellido Ovadia)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Lou)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Dulcine)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Hugo)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Gaston)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "'Old Tut'")
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre 'Happy')
		(Apellido Dinsdale)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Udell 'Spunky'")
		(Apellido Dinsdale)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Willard)
		(Apellido Hickman)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Theodora)
		(Apellido Hutshing)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Daphne)
		(Apellido Charles)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Clifford)
		(Apellido Burns)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Doreena)
		(Apellido Burns)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Howie)
		(Apellido Graycomb)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Zita)
		(Apellido Graycomb)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Betsy)
		(Apellido Graycomb)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Olivia)
		(Apellido Graycomb)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Humbert)
		(Apellido Twilly)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Griselda)
		(Apellido Johnson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Eckhardt)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Bob)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Twyla)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Woody 'Frisky'")
		(Apellido Schedeen)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Twitta)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Elrita)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Bonita)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Orville)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Yuma)
		(Apellido Hickman)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Zeke)
		(Apellido Hickman)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Charles Montgomery")
		(Apellido Burns)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Cornelia)
		(Apellido Burns)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Sancho)
		(Apellido Hernandez)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Zeph 'Buddy'")
		(Apellido Burns)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Cornelius)
		(Apellido Burns)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Lambert)
		(Apellido Gobel)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Babs 'Babby'")
		(Apellido Twilly)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Verna)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Vern)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre "Eckhardt II")
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Lotus)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Remus)
		(Apellido Krupp)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Fernice)
		(Apellido Schedeen)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Ingrid)
		(Apellido Schedeen)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Edward)
		(Apellido Powell)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Mililani)
		(Apellido Osler)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Abraham)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Penelope)
		(Apellido Olsen)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Pepita 'Squeaky'")
		(Apellido Hernandez)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Romeo)
		(Apellido Bernstein)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Wendy)
		(Apellido Wordsworth)
		(Sexo Mujer)
	)
	(Persona
		(Nombre "Lambert Jr.")
		(Apellido Gobel)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Gerta)
		(Apellido Gobel)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Mort)
		(Apellido Krupp)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Connie)
		(Apellido Krupp)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Endora)
		(Apellido Krupp)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Archie)
		(Apellido Krupp)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Lola)
		(Apellido Krupp)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Pomona)
		(Apellido Krupp)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Walter)
		(Apellido Bazaar)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Coco)
		(Apellido Powell)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Wanda)
		(Apellido Powell)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Carla)
		(Apellido Powell)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Herb)
		(Apellido Powell)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Homer)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Marge)
		(Apellido Bouvier)
		(Sexo Mujer)
	)
	(Persona
		(Nombre David)
		(Apellido Bernstein)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Levi)
		(Apellido Bernstein)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Moshe)
		(Apellido Bernstein)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Murray)
		(Apellido Bernstein)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Saul)
		(Apellido Bernstein)
		(Sexo Hombre)
	)
	(Persona
		(Nombre James)
		(Apellido Gobel)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Hermione)
		(Apellido Gobel)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Alberta)
		(Apellido Bazaar)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Hazel)
		(Apellido Bazaar)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Violet)
		(Apellido Bazaar)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Bart)
		(Apellido Simpson)
		(Sexo Hombre)
	)
	(Persona
		(Nombre Lisa)
		(Apellido Simpson)
		(Sexo Mujer)
	)
	(Persona
		(Nombre Maggie)
		(Apellido Simpson)
		(Sexo Mujer)
	)
)



;;; Relación: Matrimonio ;;;;

(deffacts Matrimonio
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Sven)
		(ApellidoSujeto Simpson)
		(NombreObjeto Claretta)
		(ApellidoObjeto Ethridge)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto "Joe Puffing")
		(ApellidoSujeto Goat)
		(NombreObjeto "Mary Frowning")
		(ApellidoObjeto Cloud)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto "Milhouse II")
		(ApellidoSujeto Rounds)
		(NombreObjeto Fern)
		(ApellidoObjeto Johnson)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto "Fielding 'Frenchy'")
		(ApellidoSujeto DuBois)
		(NombreObjeto Monique)
		(ApellidoObjeto Lautrec)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Zephediah)
		(ApellidoSujeto Stemple)
		(NombreObjeto Hortensia)
		(ApellidoObjeto Bodney)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Rupert)
		(ApellidoSujeto Simpson)
		(NombreObjeto "Winifred Running")
		(ApellidoObjeto Goat)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Omar)
		(ApellidoSujeto Stillman)
		(NombreObjeto Ettiwanda)
		(ApellidoObjeto Trownse)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Milford)
		(ApellidoSujeto Rounds)
		(NombreObjeto "Coquette 'Kookoo'")
		(ApellidoObjeto DuBois)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Lance)
		(ApellidoSujeto DuBois)
		(NombreObjeto Clarice)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Gaylord)
		(ApellidoSujeto Stemple)
		(NombreObjeto Trixie)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Garwood)
		(ApellidoSujeto Simpson)
		(NombreObjeto Clowta)
		(ApellidoObjeto Stillman)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Otto)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Lolly)
		(ApellidoObjeto DuBois)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Paco)
		(ApellidoSujeto Stemple)
		(NombreObjeto Riva)
		(ApellidoObjeto Herrin)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Howland)
		(ApellidoSujeto Simpson)
		(NombreObjeto Grabby)
		(ApellidoObjeto Crouse)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Horatio)
		(ApellidoSujeto Dinsdale)
		(NombreObjeto Edwina)
		(ApellidoObjeto Forayter)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Bertram)
		(ApellidoSujeto Hickman)
		(NombreObjeto Nellie)
		(ApellidoObjeto Balliwick)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto "Wainwright Montgomery")
		(ApellidoSujeto Burns)
		(NombreObjeto Evelyn)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Amos)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Moselle)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Lou)
		(ApellidoSujeto Simpson)
		(NombreObjeto Zorina)
		(ApellidoObjeto Ovadia)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto "'Old Tut'")
		(ApellidoSujeto Simpson)
		(NombreObjeto 'Happy')
		(ApellidoObjeto Dinsdale)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Willard)
		(ApellidoSujeto Hickman)
		(NombreObjeto Theodora)
		(ApellidoObjeto Hutshing)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Clifford)
		(ApellidoSujeto Burns)
		(NombreObjeto Daphne)
		(ApellidoObjeto Charles)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Humbert)
		(ApellidoSujeto Twilly)
		(NombreObjeto Olivia)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Eckhardt)
		(ApellidoSujeto Simpson)
		(NombreObjeto Griselda)
		(ApellidoObjeto Johnson)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto "Woody 'Frisky'")
		(ApellidoSujeto Schedeen)
		(NombreObjeto Twyla)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Orville)
		(ApellidoSujeto Simpson)
		(NombreObjeto Yuma)
		(ApellidoObjeto Hickman)
	)	
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Sancho)
		(ApellidoSujeto Hernandez)
		(NombreObjeto Cornelia)
		(ApellidoObjeto Burns)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Lambert)
		(ApellidoSujeto Gobel)
		(NombreObjeto "Babs 'Babby'")
		(ApellidoObjeto Twilly)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Remus)
		(ApellidoSujeto Krupp)
		(NombreObjeto Fernice)
		(ApellidoObjeto Schedeen)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Edward)
		(ApellidoSujeto Powell)
		(NombreObjeto Mililani)
		(ApellidoObjeto Osler)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Abraham)
		(ApellidoSujeto Simpson)
		(NombreObjeto Penelope)
		(ApellidoObjeto Olsen)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Romeo)
		(ApellidoSujeto Bernstein)
		(NombreObjeto "Pepita 'Squeaky'")
		(ApellidoObjeto Hernandez)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto "Lambert Jr.")
		(ApellidoSujeto Gobel)
		(NombreObjeto Wendy)
		(ApellidoObjeto Wordsworth)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Walter)
		(ApellidoSujeto Bazaar)
		(NombreObjeto Pomona)
		(ApellidoObjeto Krupp)
	)
	(Relacion
		(Tipo Esposo)
		(NombreSujeto Homer)
		(ApellidoSujeto Simpson)
		(NombreObjeto Marge)
		(ApellidoObjeto Bouvier)
	)
)



;;; Relación: Hijos ;;;

(deffacts Hijos
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Lambert)
		(ApellidoSujeto Simpson)
		(NombreObjeto Sven)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Rupert)
		(ApellidoSujeto Simpson)
		(NombreObjeto Sven)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Winifred Running")
		(ApellidoSujeto Goat)
		(NombreObjeto "Joe Puffing")
		(ApellidoObjeto Goat)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Humphrey Little")
		(ApellidoSujeto Goat)
		(NombreObjeto "Joe Puffing")
		(ApellidoObjeto Goat)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Jane Nervous")
		(ApellidoSujeto Goat)
		(NombreObjeto "Joe Puffing")
		(ApellidoObjeto Goat)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Milford)
		(ApellidoSujeto Rounds)
		(NombreObjeto "Milhouse II")
		(ApellidoObjeto Rounds)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Coquette 'Kookoo'")
		(ApellidoSujeto DuBois)
		(NombreObjeto "Fielding 'Frenchy'")
		(ApellidoObjeto DuBois)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Lance)
		(ApellidoSujeto DuBois)
		(NombreObjeto "Fielding 'Frenchy'")
		(ApellidoObjeto DuBois)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Clarice)
		(ApellidoSujeto Stemple)
		(NombreObjeto Zephediah)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Zachariah)
		(ApellidoSujeto Stemple)
		(NombreObjeto Zephediah)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Minnie)
		(ApellidoSujeto Stemple)
		(NombreObjeto Zephediah)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Gaylord)
		(ApellidoSujeto Stemple)
		(NombreObjeto Zephediah)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Trixie)
		(ApellidoSujeto Simpson)
		(NombreObjeto Rupert)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Prudence)
		(ApellidoSujeto Simpson)
		(NombreObjeto Rupert)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Galston)
		(ApellidoSujeto Simpson)
		(NombreObjeto Rupert)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Ivy 'Glass-eye'")
		(ApellidoSujeto Simpson)
		(NombreObjeto Rupert)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Garwood)
		(ApellidoSujeto Simpson)
		(NombreObjeto Rupert)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Clowta)
		(ApellidoSujeto Stillman)
		(NombreObjeto Omar)
		(ApellidoObjeto Stillman)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Clem)
		(ApellidoSujeto Stillman)
		(NombreObjeto Omar)
		(ApellidoObjeto Stillman)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Clancey)
		(ApellidoSujeto Stillman)
		(NombreObjeto Omar)
		(ApellidoObjeto Stillman)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Ogilvie)
		(ApellidoSujeto Stillman)
		(NombreObjeto Omar)
		(ApellidoObjeto Stillman)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Dewey 'Square Top'")
		(ApellidoSujeto Stillman)
		(NombreObjeto Omar)
		(ApellidoObjeto Stillman)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Cromwell)
		(ApellidoSujeto Rounds)
		(NombreObjeto Milford)
		(ApellidoObjeto Rounds)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Eugenia)
		(ApellidoSujeto Rounds)
		(NombreObjeto Milford)
		(ApellidoObjeto Rounds)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Missy)
		(ApellidoSujeto Rounds)
		(NombreObjeto Milford)
		(ApellidoObjeto Rounds)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Rooney)
		(ApellidoSujeto DuBois)
		(NombreObjeto Lance)
		(ApellidoObjeto DuBois)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Lolly)
		(ApellidoSujeto DuBois)
		(NombreObjeto Lance)
		(ApellidoObjeto DuBois)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Burton)
		(ApellidoSujeto Stemple)
		(NombreObjeto Zachariah)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Paco)
		(ApellidoSujeto Stemple)
		(NombreObjeto Gaylord)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Caleb)
		(ApellidoSujeto Stemple)
		(NombreObjeto Gaylord)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Vic)
		(ApellidoSujeto Stemple)
		(NombreObjeto Gaylord)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Howland)
		(ApellidoSujeto Simpson)
		(NombreObjeto Garwood)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Zeke)
		(ApellidoSujeto Simpson)
		(NombreObjeto Garwood)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Pippa)
		(ApellidoSujeto Simpson)
		(NombreObjeto Garwood)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Floyd)
		(ApellidoSujeto Simpson)
		(NombreObjeto Garwood)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Evelyn)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Otto)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Axel)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Otto)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Amos)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Otto)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Moselle)
		(ApellidoSujeto Stemple)
		(NombreObjeto Paco)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Louise 'Pixie'")
		(ApellidoSujeto Stemple)
		(NombreObjeto Paco)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Jacques)
		(ApellidoSujeto Stemple)
		(NombreObjeto Paco)
		(ApellidoObjeto Stemple)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Lou)
		(ApellidoSujeto Simpson)
		(NombreObjeto Howland)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Dulcine)
		(ApellidoSujeto Simpson)
		(NombreObjeto Howland)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Hugo)
		(ApellidoSujeto Simpson)
		(NombreObjeto Howland)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Gaston)
		(ApellidoSujeto Simpson)
		(NombreObjeto Howland)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "'Old Tut'")
		(ApellidoSujeto Simpson)
		(NombreObjeto Howland)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto 'Happy')
		(ApellidoSujeto Dinsdale)
		(NombreObjeto Horatio)
		(ApellidoObjeto Dinsdale)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Udell 'Spunky'")
		(ApellidoSujeto Dinsdale)
		(NombreObjeto Horatio)
		(ApellidoObjeto Dinsdale)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Willard)
		(ApellidoSujeto Hickman)
		(NombreObjeto Bertram)
		(ApellidoObjeto Hickman)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Clifford)
		(ApellidoSujeto Burns)
		(NombreObjeto "Wainwright Montgomery")
		(ApellidoObjeto Burns)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Doreena)
		(ApellidoSujeto Burns)
		(NombreObjeto "Wainwright Montgomery")
		(ApellidoObjeto Burns)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Howie)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Amos)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Zita)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Amos)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Betsy)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Amos)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Olivia)
		(ApellidoSujeto Graycomb)
		(NombreObjeto Amos)
		(ApellidoObjeto Graycomb)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Eckhardt)
		(ApellidoSujeto Simpson)
		(NombreObjeto Lou)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Bob)
		(ApellidoSujeto Simpson)
		(NombreObjeto Lou)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Twyla)
		(ApellidoSujeto Simpson)
		(NombreObjeto Lou)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Twitta)
		(ApellidoSujeto Simpson)
		(NombreObjeto "'Old Tut'")
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Elrita)
		(ApellidoSujeto Simpson)
		(NombreObjeto "'Old Tut'")
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Bonita)
		(ApellidoSujeto Simpson)
		(NombreObjeto "'Old Tut'")
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Orville)
		(ApellidoSujeto Simpson)
		(NombreObjeto "'Old Tut'")
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Yuma)
		(ApellidoSujeto Hickman)
		(NombreObjeto Willard)
		(ApellidoObjeto Hickman)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Zeke)
		(ApellidoSujeto Hickman)
		(NombreObjeto Willard)
		(ApellidoObjeto Hickman)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Charles Montgomery")
		(ApellidoSujeto Burns)
		(NombreObjeto Clifford)
		(ApellidoObjeto Burns)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Cornelia)
		(ApellidoSujeto Burns)
		(NombreObjeto Clifford)
		(ApellidoObjeto Burns)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Zeph 'Buddy'")
		(ApellidoSujeto Burns)
		(NombreObjeto Clifford)
		(ApellidoObjeto Burns)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Cornelius)
		(ApellidoSujeto Burns)
		(NombreObjeto Clifford)
		(ApellidoObjeto Burns)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Babs 'Babby'")
		(ApellidoSujeto Twilly)
		(NombreObjeto Humbert)
		(ApellidoObjeto Twilly)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Verna)
		(ApellidoSujeto Simpson)
		(NombreObjeto Eckhardt)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Vern)
		(ApellidoSujeto Simpson)
		(NombreObjeto Eckhardt)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Eckhardt II")
		(ApellidoSujeto Simpson)
		(NombreObjeto Eckhardt)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Lotus)
		(ApellidoSujeto Simpson)
		(NombreObjeto Eckhardt)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Fernice)
		(ApellidoSujeto Schedeen)
		(NombreObjeto "Woody 'Frisky'")
		(ApellidoObjeto Schedeen)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Ingrid)
		(ApellidoSujeto Schedeen)
		(NombreObjeto "Woody 'Frisky'")
		(ApellidoObjeto Schedeen)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Abraham)
		(ApellidoSujeto Simpson)
		(NombreObjeto Orville)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Pepita 'Squeaky'")
		(ApellidoSujeto Hernandez)
		(NombreObjeto Sancho)
		(ApellidoObjeto Hernandez)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto "Lambert Jr.")
		(ApellidoSujeto Gobel)
		(NombreObjeto Lambert)
		(ApellidoObjeto Gobel)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Gerta)
		(ApellidoSujeto Gobel)
		(NombreObjeto Lambert)
		(ApellidoObjeto Gobel)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Mort)
		(ApellidoSujeto Krupp)
		(NombreObjeto Remus)
		(ApellidoObjeto Krupp)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Connie)
		(ApellidoSujeto Krupp)
		(NombreObjeto Remus)
		(ApellidoObjeto Krupp)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Endora)
		(ApellidoSujeto Krupp)
		(NombreObjeto Remus)
		(ApellidoObjeto Krupp)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Archie)
		(ApellidoSujeto Krupp)
		(NombreObjeto Remus)
		(ApellidoObjeto Krupp)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Lola)
		(ApellidoSujeto Krupp)
		(NombreObjeto Remus)
		(ApellidoObjeto Krupp)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Pomona)
		(ApellidoSujeto Krupp)
		(NombreObjeto Remus)
		(ApellidoObjeto Krupp)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Coco)
		(ApellidoSujeto Powell)
		(NombreObjeto Edward)
		(ApellidoObjeto Powell)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Wanda)
		(ApellidoSujeto Powell)
		(NombreObjeto Edward)
		(ApellidoObjeto Powell)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Carla)
		(ApellidoSujeto Powell)
		(NombreObjeto Edward)
		(ApellidoObjeto Powell)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Herb)
		(ApellidoSujeto Powell)
		(NombreObjeto Edward)
		(ApellidoObjeto Powell)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Homer)
		(ApellidoSujeto Simpson)
		(NombreObjeto Abraham)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto David)
		(ApellidoSujeto Bernstein)
		(NombreObjeto Romeo)
		(ApellidoObjeto Bernstein)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Levi)
		(ApellidoSujeto Bernstein)
		(NombreObjeto Romeo)
		(ApellidoObjeto Bernstein)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Moshe)
		(ApellidoSujeto Bernstein)
		(NombreObjeto Romeo)
		(ApellidoObjeto Bernstein)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Murray)
		(ApellidoSujeto Bernstein)
		(NombreObjeto Romeo)
		(ApellidoObjeto Bernstein)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Saul)
		(ApellidoSujeto Bernstein)
		(NombreObjeto Romeo)
		(ApellidoObjeto Bernstein)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto James)
		(ApellidoSujeto Gobel)
		(NombreObjeto "Lambert Jr.")
		(ApellidoObjeto Gobel)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Hermione)
		(ApellidoSujeto Gobel)
		(NombreObjeto "Lambert Jr.")
		(ApellidoObjeto Gobel)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Alberta)
		(ApellidoSujeto Bazaar)
		(NombreObjeto Walter)
		(ApellidoObjeto Bazaar)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Hazel)
		(ApellidoSujeto Bazaar)
		(NombreObjeto Walter)
		(ApellidoObjeto Bazaar)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Violet)
		(ApellidoSujeto Bazaar)
		(NombreObjeto Walter)
		(ApellidoObjeto Bazaar)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Bart)
		(ApellidoSujeto Simpson)
		(NombreObjeto Homer)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Lisa)
		(ApellidoSujeto Simpson)
		(NombreObjeto Homer)
		(ApellidoObjeto Simpson)
	)
	(Relacion
		(Tipo Hijo)
		(NombreSujeto Maggie)
		(ApellidoSujeto Simpson)
		(NombreObjeto Homer)
		(ApellidoObjeto Simpson)
	)
)




;;; RELACIONES EXTRAS ;;;;

;;; Relaciones Duales: Si una persona A es hijo de una persona B, entonces la persona B es padre de la persona A.  ;;;;
;;; (No implementamos las demás duales (por ejemplo, tio/sobrino) ya que sólo hemos definido la relaciones padre/hijo y esposo/esposa) ;;;

(deffacts RelacionesDuales
	(RelacionDual Hijo Padre)
	(RelacionDual Esposo Esposo)
)

;;; Femeninos: Para imprimir por pantalla ;;;

(deffacts Femeninos
	(Femenino Hijo Hija)
	(Femenino Padre Madre)
	(Femenino Esposo Esposa)
	(Femenino Hermano Hermana)
	(Femenino Nieto Nieta)
	(Femenino Abuelo Abuela)
	(Femenino Tio Tia)
	(Femenino Sobrino Sobrina)
	(Femenino Cuñado Cuñada)
	(Femenino Yerno Nuera)
	(Femenino Suegro Suegra)
	(Femenino Primo Prima)
)

;;; Plurales: Para entradas por pantalla ;;;

(deffacts Plurales
	(Plural Hijo Hijos)
	(Plural Padre Padres)
	(Plural Hermano Hermanos)
	(Plural Nieto Nietos)
	(Plural Abuelo Abuelos)
	(Plural Tio Tios)
	(Plural Sobrino Sobrinos)
	(Plural Cuñado Cuñados)
	(Plural Yerno Yernos)
	(Plural Suegro Suegros)
	(Plural Primo Primos)
)

;;; Relaciones Compuestas: Todas las relaciones que se deducen a partir de Esposo e Hijo ;;;;

(deffacts RelacionesCompuestas
	(RelacionCompuesta Esposo Padre Padre)
	(RelacionCompuesta Hijo Esposo Hijo)
	(RelacionCompuesta Hijo Padre Hermano)
	(RelacionCompuesta Hijo Hijo Nieto)
	(RelacionCompuesta Padre Padre Abuelo)
	(RelacionCompuesta Hermano Padre Tio)
	(RelacionCompuesta Hijo Hermano Sobrino)
	(RelacionCompuesta Hermano Esposo Cuñado)
	(RelacionCompuesta Esposo Hermano Cuñado)
	(RelacionCompuesta Esposo Hijo Yerno)
	(RelacionCompuesta Padre Esposo Suegro)
	(RelacionCompuesta Esposo Tio Tio)
	(RelacionCompuesta Hijo Tio Primo)
)



;;; REGLAS ;;;;

;;; Duales: Implementación de la dualidad. ;;;;

(defrule Dualidad
	(RelacionDual ?Old ?New)
	(Relacion
		(Tipo ?Old)
		(NombreSujeto ?N1)
		(ApellidoSujeto ?A1)
		(NombreObjeto ?N2)
		(ApellidoObjeto ?A2)
	)
	=>
	(assert (Relacion
				(Tipo ?New)
				(NombreSujeto ?N2)
				(ApellidoSujeto ?A2)
				(NombreObjeto ?N1)
				(ApellidoObjeto ?A1)
			)
	)
)

;;; Compuestas: Implementación de las reglas compuestas. ;;;

(defrule Compuestas
	(RelacionCompuesta ?R1 ?R2 ?R3)
	(Relacion
		(Tipo ?R1)
		(NombreSujeto ?N1)
		(ApellidoSujeto ?A1)
		(NombreObjeto ?N2)
		(ApellidoObjeto ?A2)
	)
	(or
		(Relacion
			(Tipo ?R2)
			(NombreSujeto ?N2)
			(ApellidoSujeto ?A2)
			(NombreObjeto ?N3 & ~?N1)
			(ApellidoObjeto ?A3)
		)
		(Relacion
			(Tipo ?R2)
			(NombreSujeto ?N2)
			(ApellidoSujeto ?A2)
			(NombreObjeto ?N3)
			(ApellidoObjeto ?A3 & ~?A1)
		)
	)
	=>
	(assert (Relacion
				(Tipo ?R3)
				(NombreSujeto ?N1)
				(ApellidoSujeto ?A1)
				(NombreObjeto ?N3)
				(ApellidoObjeto ?A3)
			)
	)
)



;;; ENTRADAS Y SALIDAS ;;;

;;; Preguntas y ejemplos. Imprime preguntas y respuestas por pantalla y guarda las respuestas. ;;;

(defrule EjemplosNombres
	(declare (salience 350))
	=>
	(printout t 	 "Ejemplos de nombres (separa nombre de apellido):"
				crlf "	* Homer Simpson"
				crlf "	* \"Charles Montgomery\" Burns"
				crlf "	* \"'Old Tut'\" Simpson"
				crlf
	)
)

(defrule PreguntaNombre
	(declare (salience 300))
	=>
	(printout t crlf "Formato: <Nombre> ó \"<Nombre1> <Nombre2>\" ó \"<Nombre> '<Apodo>'\" ó \"'<Apodo>' <Nombre>\"." 
				crlf "Introduce el nombre de la persona: ")
	(assert (NombrePregunta (read)))
)

(defrule PreguntaApellido
	(declare (salience 200))
	=>
	(printout t 	 "Introduce el apellido de la persona: ")
	(assert (ApellidoPregunta (read)))
)

(defrule EjemplosRelacions
	(declare (salience 150))
	(NombrePregunta ?N)
	(ApellidoPregunta ?A)
	(Persona
		(Nombre ?N)
		(Apellido ?A)
	)
	=>
	(printout t crlf "Relaciones posibles:"
				crlf "	Esposo Esposa"
				crlf "	Hijo   Hija   Hijos"
				crlf "	Padre  Madre  Padres"
				crlf "	Abuelo Abuela Abuelos"
				crlf "	Nieto  Nieta  Nietos"
				crlf "	Tio    Tia    Tios"
				crlf "	Primo  Prima  Primos"
				crlf "	Yerno  Nuera  Yernos"
				crlf "	Suegro Suegra Suegros"
				crlf "	Cuñado Cuñada Cuñados"
				crlf
	)
)

(defrule PreguntaRelacion
	(declare (salience 100))
	(NombrePregunta ?N)
	(ApellidoPregunta ?A)
	(Persona
		(Nombre ?N)
		(Apellido ?A)
	)
	=>
	(printout t crlf "Puede ser masculino para solo los hombres, femenino para solo las mujeres, o plural para ambos."
				crlf "Introduce la relacción: ")
	(assert (RelacionPregunta (read)))
	(printout t crlf)
)

;;; Comprobación de si existe una persona con el nombre introducido ;;;

(defrule CompruebaNombre
	(declare (salience 175))
	(NombrePregunta ?N)
	(ApellidoPregunta ?A)
	(not (Persona
			(Nombre ?N)
			(Apellido ?A)
		)
	)
	=>
	(printout t crlf "El nombre introducido no es correcto." crlf)
)




;;; Respuestas: Existe. Tenemos 4 casos: Uno para masculino, otro para femenino, y otros dos para el masculino y femenino en el caso del plural. ;;;

(defrule RespuestaMasculina
	(NombrePregunta ?N1)
	(ApellidoPregunta ?A1)
	(RelacionPregunta ?R)
	(Relacion
		(Tipo ?R)
		(NombreSujeto ?N2)
		(ApellidoSujeto ?A2)
		(NombreObjeto ?N1)
		(ApellidoObjeto ?A1)
	)
	(Persona
		(Nombre ?N2)
		(Apellido ?A2)
		(Sexo Hombre)
	)
	=>
	(printout t ?N2 " " ?A2 " es el " ?R " de " ?N1 " " ?A1 "." crlf)
	(assert (Existe))

)

(defrule RespuestaFemenina
	(NombrePregunta ?N1)
	(ApellidoPregunta ?A1)
	(RelacionPregunta ?R2)
	(Femenino ?R1 ?R2)
	(Relacion
		(Tipo ?R1)
		(NombreSujeto ?N2)
		(ApellidoSujeto ?A2)
		(NombreObjeto ?N1)
		(ApellidoObjeto ?A1)
	)
	(Persona
		(Nombre ?N2)
		(Apellido ?A2)
		(Sexo Mujer)
	)
	=>
	(printout t ?N2 " " ?A2 " es la " ?R2 " de " ?N1 " " ?A1 "." crlf)
	(assert (Existe))
)

(defrule RespuestaPluralMasculino
	(NombrePregunta ?N1)
	(ApellidoPregunta ?A1)
	(RelacionPregunta ?R2)
	(Plural ?R1 ?R2)
	(Relacion
		(Tipo ?R1)
		(NombreSujeto ?N2)
		(ApellidoSujeto ?A2)
		(NombreObjeto ?N1)
		(ApellidoObjeto ?A1)
	)
	(Persona
		(Nombre ?N2)
		(Apellido ?A2)
		(Sexo Hombre)
	)
	=>
	(printout t ?N2 " " ?A2 " es el " ?R1 " de " ?N1 " " ?A1 "." crlf)
	(assert (Existe))
)

(defrule RespuestaPluralFemenino
	(NombrePregunta ?N1)
	(ApellidoPregunta ?A1)
	(RelacionPregunta ?R2)
	(Plural ?R1 ?R2)
	(Femenino ?R1 ?R3)
	(Relacion
		(Tipo ?R1)
		(NombreSujeto ?N2)
		(ApellidoSujeto ?A2)
		(NombreObjeto ?N1)
		(ApellidoObjeto ?A1)
	)
	(Persona
		(Nombre ?N2)
		(Apellido ?A2)
		(Sexo Mujer)
	)
	=>
	(printout t ?N2 " " ?A2 " es la " ?R3 " de " ?N1 " " ?A1 "." crlf)
	(assert (Existe))
)



;;; Respuestas: No existe. Tenemos dos casos: El masculino (que incluye el plural) y el femenino. ;;;

(defrule RespuestaMasculinoNo
	(declare (salience -10))
	(not (Existe))
	(RelacionPregunta ?R)
	(not (Femenino ? ?R))
	=>
	(printout t crlf "No hay ninguno." crlf)
)

(defrule RespuestaFemeninoNo
	(declare (salience -10))
	(not (Existe))
	(RelacionPregunta ?R)
	(Femenino ? ?R)
	=>
	(printout t crlf "No hay ninguna." crlf)
)