Class {
	#name : #Etapa,
	#superclass : #Object,
	#instVars : [
		'diaLlegada',
		'diasPermanencia',
		'ciudad',
		'hotel',
		'tipoPension',
		'listaActividades',
		'colExcursiones'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
Etapa class >> crearConDiaLlegada: unDia diasPermanencia: dias ciudad: unaCiudad hotel: unHotel tipoPension: tipo listaActividades: unaLista colExcursiones: unaCol [
	|unaEtapa|
	unaEtapa := self new.
	unaEtapa inicializarConDiaLlegada: unDia diasPermanencia: dias ciudad: unaCiudad hotel: unHotel tipoPension: tipo listaActividades: unaLista colExcursiones: unaCol.
	^unaEtapa
]

{ #category : #getters }
Etapa >> ciudad [

	^ ciudad
]

{ #category : #setters }
Etapa >> ciudad: anObject [

	ciudad := anObject
]

{ #category : #getters }
Etapa >> colExcursiones [

	^ colExcursiones
]

{ #category : #setters }
Etapa >> colExcursiones: anObject [

	colExcursiones := anObject
]

{ #category : #getters }
Etapa >> diaLlegada [

	^ diaLlegada
]

{ #category : #setters }
Etapa >> diaLlegada: anObject [

	diaLlegada := anObject
]

{ #category : #getters }
Etapa >> diasPermanencia [

	^ diasPermanencia
]

{ #category : #setters }
Etapa >> diasPermanencia: anObject [

	diasPermanencia := anObject
]

{ #category : #getters }
Etapa >> hotel [

	^ hotel
]

{ #category : #setters }
Etapa >> hotel: anObject [

	hotel := anObject
]

{ #category : #initialization }
Etapa >> inicializarConDiaLlegada: unDia diasPermanencia: dias ciudad: unaCiudad hotel: unHotel tipoPension: tipo listaActividades: unaLista colExcursiones: unaCol [
	diaLlegada:= unDia.
	diasPermanencia:= dias.
	ciudad:=unaCiudad.
	hotel:= unHotel.
	tipoPension := tipo.
	listaActividades := unaLista.
	colExcursiones := unaCol
]

{ #category : #getters }
Etapa >> listaActividades [

	^ listaActividades
]

{ #category : #setters }
Etapa >> listaActividades: anObject [

	listaActividades := anObject
]

{ #category : #getters }
Etapa >> tipoPension [

	^ tipoPension
]

{ #category : #setters }
Etapa >> tipoPension: anObject [

	tipoPension := anObject
]
