Class {
	#name : #Excursion,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'costoE'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
Excursion class >> crearConNombre: unNombre costoExc: unCosto [
	|unaExcursion|
	unaExcursion := self new.
	unaExcursion inicializarConNombre: unNombre costoExcursion: unCosto .
	^unaExcursion
]

{ #category : #getters }
Excursion >> costoE [

	^ costoE
]

{ #category : #setters }
Excursion >> costoE: anObject [

	costoE := anObject
]

{ #category : #initialize }
Excursion >> inicializarConNombre: unNombre costoExcursion: unCosto [
	nombre:= unNombre .
	costoE := unCosto
]

{ #category : #getters }
Excursion >> nombre [

	^ nombre
]

{ #category : #setters }
Excursion >> nombre: anObject [

	nombre := anObject
]
