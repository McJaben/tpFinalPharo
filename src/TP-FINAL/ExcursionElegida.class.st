Class {
	#name : #ExcursionElegida,
	#superclass : #Object,
	#instVars : [
		'excursion',
		'cantPersonas'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
ExcursionElegida class >> crearConExc: unaExc cantPersonas: cant [
	|excEleg|
	excEleg := self new.
	excEleg inicializarConExc: unaExc cantPersonas: cant.
	^excEleg 
]

{ #category : #getters }
ExcursionElegida >> cantPersonas [

	^ cantPersonas
]

{ #category : #setters }
ExcursionElegida >> cantPersonas: anObject [

	cantPersonas := anObject
]

{ #category : #getters }
ExcursionElegida >> excursion [

	^ excursion
]

{ #category : #setters }
ExcursionElegida >> excursion: anObject [

	excursion := anObject
]

{ #category : #initialization }
ExcursionElegida >> inicializarConExc: unaExc cantPersonas: cant [
	excursion := unaExc .
	cantPersonas := cant 
]
