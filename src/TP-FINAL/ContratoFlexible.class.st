Class {
	#name : #ContratoFlexible,
	#superclass : #Contrato,
	#instVars : [
		'reembolso'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
ContratoFlexible class >> crearConViaje: unViajeContratatado fechaViaje: unaFechaViaje cantidadPersona: unaCantPers listaExcursiones: colExc [

	| unContratoFlex valorPlus|
	unContratoFlex := super
		                  crearConViaje: unViajeContratatado
		                  fechaViaje: unaFechaViaje
		                  cantidadPersona: unaCantPers
		                  listaExcursiones: colExc.
	unContratoFlex calcularPlus.
	^ unContratoFlex
]

{ #category : #inicializar }
ContratoFlexible >> calcularPlus [
	|valorPlus|
	valorPlus := viajeContratado
		             calcularPlus: fechaViaje
		             monto: montoTotal.
	montoTotal := montoTotal + valorPlus.
]

{ #category : #propias }
ContratoFlexible >> calcularReembolso [

	| tiempoRestante |
	tiempoRestante := (fechaViaje asDate - Date today).
	tiempoRestante := tiempoRestante days.
	reembolso := 0.
	tiempoRestante >= 90 ifTrue: [ reembolso := montoPagado * 0.75 ].
	(tiempoRestante < 90 and: tiempoRestante >= 60) ifTrue: [
		reembolso := montoPagado * 0.5 ].
	tiempoRestante < 60 ifTrue: [ reembolso := montoPagado * 0.25 ].
	^reembolso
]

{ #category : #propias }
ContratoFlexible >> modificarFecha: nuevaFecha [

	| disp modificado|
	modificado := false.
	disp := viajeContratado
		        verificarDisponibilidad: cantPersonas
		        fecha: nuevaFecha.
	disp ifTrue: [
		        modificado := viajeContratado
			         cambiarFecha: fechaViaje
			         personas: cantPersonas
			         fechaNueva: nuevaFecha.].
	modificado ifTrue: [ fechaViaje := nuevaFecha ].
	^ modificado
]
