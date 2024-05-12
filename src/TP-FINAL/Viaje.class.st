Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'costoPorPersona',
		'valorImpuesto'
	],
	#category : #'TP-FINAL'
}

{ #category : #propias }
Viaje class >> calcularPlus: fechaViaje monto: montoT destinos: cantDestinos [

	| montoPlus fechaActual marzo noviembre |
	montoPlus := montoT * 0.02 * cantDestinos.
	fechaActual := Date today.
	marzo := Date newDay: 31 month: 3 year: fechaActual year.
	noviembre := Date newDay: 30 month: 11 year: fechaActual year.
	montoPlus := fechaViaje > marzo & (fechaViaje < noviembre)
		             ifTrue: [ montoPlus + (montoT * 1.02) ]
		             ifFalse: [ montoPlus + (montoT * 1.05) ].
	 ^montoPlus
]

{ #category : #'as yet unclassified' }
Viaje >> actualizarDisponibilidad: cantPersonas fecha: fecha [
	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
Viaje >> calcularDestinos [
	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
Viaje >> calcularMontoTotal: cant excursiones: excursiones [

	| monto |
	monto := costoPorPersona * cant + valorImpuesto.
	excursiones ifNotNil: [
		excursiones do: [ :i | monto := monto + i costoE ] ].
	^ monto
]

{ #category : #inicializar }
Viaje >> calcularPlus [

	| cantDestinos |
	cantDestinos := self calcularDestinos
	"Llamo al método de clase calcular plus"
	
]

{ #category : #inicializar }
Viaje >> calcularPlus: fechaViaje monto: monto [

	| cantDestinos valorPlus|
	cantDestinos := self calcularDestinos.
	"Llamo al método de clase calcular plus"
	valorPlus:= self class
		calcularPlus: fechaViaje
		monto: monto
		destinos: cantDestinos.
	^valorPlus
]

{ #category : #'as yet unclassified' }
Viaje >> cambiarFecha: fechaVieja personas: cantidad fechaNueva: fechaNueva [

^false
]

{ #category : #inicializar }
Viaje >> getColEtapas [

	self subclassResponsibility
]

{ #category : #inicializar }
Viaje >> getFechas [
	
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
Viaje >> verificarDisponibilidad: cantidad fecha: unaFecha [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
Viaje >> verificarEntreFechas:fecha1 fecha2:fecha2 [
self subclassResponsibility 
]
