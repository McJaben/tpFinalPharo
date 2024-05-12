Class {
	#name : #Contrato,
	#superclass : #Object,
	#instVars : [
		'numeroContrato',
		'fechaContrato',
		'viajeContratado',
		'fechaViaje',
		'cantPersonas',
		'cuota',
		'montoTotal',
		'montoPagado',
		'fechaUltimoPago',
		'colExcursiones'
	],
	#classVars : [
		'CantContratos'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
Contrato class >> crearConViaje: viaje fechaViaje: fechaV cantidadPersona: unaCantPers listaExcursiones: colExc cuotas: cuotas [

	| unContrato |
	unContrato := self new.
	unContrato
		inicializarConViaje: viaje
		fechaViaje: fechaV
		cantidadPersonas: unaCantPers
		listaExcursiones: colExc
		cuotas: cuotas.
	^ unContrato
]

{ #category : #'class initialization' }
Contrato class >> initialize [

	CantContratos := 1
]

{ #category : #'class initialization' }
Contrato class >> reiniciarCant [

	CantContratos := 1
]

{ #category : #propias }
Contrato >> agregarExcursion: unaExc personas: cantidad [

	| unaExcursion exito |
	exito := false.
	(cantidad < cantPersonas and: [ (fechaViaje - Date today) days >= 7 ])
		ifTrue: [
			unaExcursion := ExcursionElegida
				                crearConExc: unaExc
				                cantPersonas: cantidad.
			colExcursiones add: unaExcursion.
			exito := true ].
	^ exito
]

{ #category : #'as yet unclassified' }
Contrato >> calcularMillas: valor [

|millas|

^ millas := ((montoTotal *0.05)/ valor asNumber)
]

{ #category : #propias }
Contrato >> calcularReembolso [
	^0
]

{ #category : #propias }
Contrato >> contratoAVencer [
	^ (montoTotal ~= montoPagado) and: fechaViaje >= Date today. 
]

{ #category : #propias }
Contrato >> estaEfectivo [

	^ montoTotal = montoPagado and: fechaViaje  asDate <= Date today
]

{ #category : #'as yet unclassified' }
Contrato >> estaPago [

^ montoTotal = montoPagado 
]

{ #category : #propias }
Contrato >> generarNro [

	| numero |
	numero := CantContratos.
	CantContratos := CantContratos + 1.
	^ numero
]

{ #category : #'as yet unclassified' }
Contrato >> getCuota [

	^ cuota
]

{ #category : #propias }
Contrato >> getFechaViaje [

	^fechaViaje 
]

{ #category : #'as yet unclassified' }
Contrato >> getMontoPagado [
	   ^ montoPagado 
]

{ #category : #'as yet unclassified' }
Contrato >> getMontoTotal [

	^montoTotal 
]

{ #category : #propias }
Contrato >> getNumeroContrato [

	^numeroContrato 
]

{ #category : #propias }
Contrato >> getPersonas [

^ cantPersonas 
]

{ #category : #inicializar }
Contrato >> getViaje [
	^viajeContratado 
]

{ #category : #inicializar }
Contrato >> inicializarConViaje: unViajeContratado fechaViaje: unaFechaViaje cantidadPersonas: unaCantPers listaExcursiones: colExc cuotas: cuotas [

	numeroContrato := self generarNro.
	fechaContrato := Date today.
	viajeContratado := unViajeContratado.
	fechaViaje := unaFechaViaje.
	cantPersonas := unaCantPers.
	colExcursiones := colExc.
	montoTotal := viajeContratado
		              calcularMontoTotal: unaCantPers
		              excursiones: colExc.
	"Verifica si se pagará en cuotas o el 100% de contado el día que se firma el contrato"
	cuotas > 0
		ifTrue: [
			cuota := Cuota
				         crearConVencimiento: Date today + 30
				         monto: montoTotal / cuotas.
			montoPagado := cuota monto ]
		ifFalse: [ montoPagado := montoTotal ].
	fechaUltimoPago := Date today

	"Actualizar disponibilidad del viaje"
	
]

{ #category : #propias }
Contrato >> modificarFecha: unaFecha [

    ^ false
]

{ #category : #propias }
Contrato >> pagarConMillas: millas [
	"| montoMillasRestantes montoCancelableMax |
	montoMillasRestantes := millas.
	montoCancelableMax := montoTotal * 0.1.
	millas >= montoTotal * 0.05 ifTrue: [
		millas <= montoCancelableMax ifTrue: [
			montoTotal := montoTotal - millas ].
		millas > montoCancelableMax ifTrue: [
			montoTotal := montoTotal - montoCancelableMax.
			montoMillasRestantes := millas - montoCancelableMax ] ].
	^ montoMillasRestantes"

	| montoCancelableMax montoUtilizado |
	montoCancelableMax := montoTotal * 0.1.
	montoUtilizado := millas min: montoCancelableMax.
	montoTotal := montoTotal - montoUtilizado.
	^ millas - montoUtilizado
]

{ #category : #propias }
Contrato >> registrarCuotas: cantidad [
	montoPagado := montoPagado + (cantidad * cuota monto)
]

{ #category : #propias }
Contrato >> verificarContrato: nroContrato [
	^ numeroContrato = nroContrato
]
