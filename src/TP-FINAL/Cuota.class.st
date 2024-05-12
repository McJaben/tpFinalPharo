Class {
	#name : #Cuota,
	#superclass : #Object,
	#instVars : [
		'vencimiento',
		'monto'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
Cuota class >> crearConVencimiento: unaFecha monto: unMonto [
	|unaCuota|
	unaCuota := self new.
	unaCuota inicializarConVencimiento: unaFecha monto: unMonto .
	^unaCuota
]

{ #category : #initialization }
Cuota >> inicializarConVencimiento: unaFecha monto: unMonto [
	vencimiento := unaFecha.
	monto := unMonto
]

{ #category : #getters }
Cuota >> monto [

	^ monto
]

{ #category : #setters }
Cuota >> monto: anObject [

	monto := anObject
]

{ #category : #getters }
Cuota >> vencimiento [

	^ vencimiento
]

{ #category : #setters }
Cuota >> vencimiento: anObject [

	vencimiento := anObject
]
