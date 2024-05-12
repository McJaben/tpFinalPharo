Class {
	#name : #DatosCliente,
	#superclass : #Object,
	#instVars : [
		'apellido',
		'DNI',
		'ciudad',
		'telefono',
		'email'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
DatosCliente class >> crearConDNI: dni apellido: apellido ciudad: ciudad telefono: telefono email: email [

	| datosCliente |
	datosCliente := self new.
	datosCliente
		inicializarDni: dni
		apell: apellido
		ciudad: ciudad
		tel: telefono
		email: email.
	^ datosCliente
]

{ #category : #'set and get' }
DatosCliente >> getApellido [

	^ apellido
]

{ #category : #'set and get' }
DatosCliente >> getDni [
	^DNI.
]

{ #category : #initialization }
DatosCliente >> inicializarDni: unDni apell: unApe ciudad: unaCity tel: unTel email: unCorreo [

	apellido := unApe.
	DNI := unDni.
	ciudad := unaCity.
	telefono := unTel.
	email := unCorreo.
]
