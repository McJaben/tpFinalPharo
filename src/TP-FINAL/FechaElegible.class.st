Class {
	#name : #FechaElegible,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'cupos'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
FechaElegible class >> crearConFecha: unaFecha cupos: cantCupos [
	|fech|
	fech := self new.
	fech inicializarConFecha: unaFecha cupos: cantCupos.
	^fech
]

{ #category : #'de aplicacion' }
FechaElegible >> actualizarDisponibilidad: cantPersonas [

	cupos := cupos - cantPersonas.
]

{ #category : #'as yet unclassified' }
FechaElegible >> aumentarCupos: cantPersonas [

    cupos := cupos + cantPersonas
]

{ #category : #getters }
FechaElegible >> cupos [

	^ cupos
]

{ #category : #setters }
FechaElegible >> cupos: anObject [

	cupos := anObject
]

{ #category : #getters }
FechaElegible >> fecha [

	^ fecha
]

{ #category : #setters }
FechaElegible >> fecha: anObject [

	fecha := anObject 
]

{ #category : #initialization }
FechaElegible >> inicializarConFecha: unaFecha cupos: cantCupos [

	fecha := unaFecha asDate.
	cupos := cantCupos
]

{ #category : #'de aplicacion' }
FechaElegible >> tieneDisponibilidad: cantidadP [
	^ cupos >= cantidadP
]

{ #category : #'de aplicacion' }
FechaElegible >> verificarEntreFechas: fecha1 fecha2:fecha2 [ 
^ fecha >=fecha1 and: fecha<=fecha2
]

{ #category : #'de aplicacion' }
FechaElegible >> verificarFecha: unaFecha [
	^ fecha = unaFecha
]
