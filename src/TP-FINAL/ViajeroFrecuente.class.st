Class {
	#name : #ViajeroFrecuente,
	#superclass : #Cliente,
	#instVars : [
		'cantMillas'
	],
	#classVars : [
		'ValorMillas'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
ViajeroFrecuente class >> crearDatosPersonales: datosPersonales contratos: contratos cantMillas: millas [

	| nuevoViajeroF |
	nuevoViajeroF := self
		                 crearDatosPersonales: datosPersonales
		                 contratos: contratos.
		                 
	nuevoViajeroF inicializarCantMillas: millas.
	^ nuevoViajeroF
]

{ #category : #propias }
ViajeroFrecuente >> cancelarContrato: numContrato [
	| reembolso aux|
	reembolso := super cancelarContrato: numContrato.
	aux := self convertirAMillas: reembolso.
	^ cantMillas := cantMillas + aux.
]

{ #category : #propias }
ViajeroFrecuente >> convertirAMillas: monto [
	^ monto / ValorMillas.
]

{ #category : #propias }
ViajeroFrecuente >> efectivizarContrato: nroContrato [

	| rta contrato valMilla millas |
	rta := super efectivizarContrato: nroContrato.
	rta ifTrue: [
		contrato := self buscarContrato: nroContrato.
		valMilla := self getValorMillas.
		millas := contrato calcularMillas: valMilla.
		cantMillas := cantMillas + millas. ].

	^ rta
]

{ #category : #propias }
ViajeroFrecuente >> getCantMillas [
	^ cantMillas 
]

{ #category : #'set and get' }
ViajeroFrecuente >> getValorMillas [

	^ ValorMillas.
]

{ #category : #inicializar }
ViajeroFrecuente >> inicializarCantMillas: millas [
	cantMillas:= millas.
]

{ #category : #inicializar }
ViajeroFrecuente >> initialize [
	"Inicializa la variable de clase ValorMillas "

	ValorMillas := 1
]

{ #category : #'as yet unclassified' }
ViajeroFrecuente >> puedeSerFrecuente [

    ^ false
]
