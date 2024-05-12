Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'datosCliente',
		'colContratos',
		'preferencias'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
Cliente class >> crearDatosPersonales: datosCliente [
	"Se utiliza para registrar un cliente nuevo, que no ha contratado aún.
	Los datos personales del cliente se cargan previamente y se pasa una instancia de DatosCliente como parámetro en este constructor.
	La colección de contratos se inicializa vacía"

	| nuevoCliente unaColVacia |
	nuevoCliente := self new.
	unaColVacia := OrderedCollection  new.
	nuevoCliente
		inicializarDatosCliente: datosCliente
		contratos: unaColVacia.
	^ nuevoCliente
]

{ #category : #constructor }
Cliente class >> crearDatosPersonales: datosCliente contratos: contratos [
	"Los datos personales del cliente se cargan previamente y se pasa una instancia de DatosCliente como parámetro en este constructor. La colección de contratos también se pasa por parámetro."

	| nuevoCliente |
	nuevoCliente := self new.
	nuevoCliente
		inicializarDatosCliente: datosCliente
		contratos: contratos.
^ nuevoCliente
]

{ #category : #propias }
Cliente >> buscarContrato: numContrato [

|contrato|

	contrato := colContratos ifEmpty: [ contrato := nil ] ifNotEmpty: [ contrato := colContratos detect: [ :i | i verificarContrato: numContrato ] ifNone:[contrato := nil] ].
	^ contrato.
	
]

{ #category : #propias }
Cliente >> cancelarContrato: numContrato [

	| unContrato unReembolso |
	unContrato := self buscarContrato: numContrato asNumber.
	unReembolso := unContrato ifNotNil: [ unContrato calcularReembolso ].
	colContratos remove: unContrato.
	^ unReembolso := '$',unReembolso asString
]

{ #category : #propias }
Cliente >> efectivizarContrato: numContrato [

	| unContrato rta |
	unContrato := self buscarContrato: numContrato.
	^ rta := unContrato
		         ifNotNil: [ unContrato estaEfectivo ]
		         ifNil: [ false ]
	
]

{ #category : #propias }
Cliente >> generarContratoFlexViaje: viaje fecha: fecha cant: cant excursiones: excursiones cuotas: cuotas [

	| unContrato |
	unContrato := ContratoFlexible
		              crearConViaje: viaje
		              fechaViaje: fecha
		              cantidadPersona: cant
		              listaExcursiones: excursiones
		              cuotas: cuotas.
	colContratos add: unContrato.
	^ unContrato getNumeroContrato .
]

{ #category : #propias }
Cliente >> generarContratoViaje: viaje fecha: fecha cant: cant excursiones: excursiones cuotas: cuotas [

	| unContrato |
	unContrato := Contrato
		              crearConViaje: viaje
		              fechaViaje: fecha
		              cantidadPersona: cant
		              listaExcursiones: excursiones
		              cuotas: cuotas.
	colContratos add: unContrato.
	^ unContrato getNumeroContrato 
]

{ #category : #'set and get' }
Cliente >> getApellido [

	^ datosCliente getApellido
]

{ #category : #propias }
Cliente >> getCantMillas [
	^ 0
]

{ #category : #propias }
Cliente >> getContratos [
	^ colContratos 
]

{ #category : #'set and get' }
Cliente >> getDNI [

	^datosCliente getDni
]

{ #category : #propias }
Cliente >> getDatos [
	^ datosCliente 
]

{ #category : #initialization }
Cliente >> inicializarDatosCliente: clientData contratos: unaColContratos [

	datosCliente:= clientData.
	colContratos := unaColContratos
]

{ #category : #propias }
Cliente >> pagarCuotas: cantidad contrato: nroContrato [

	| unContrato rta|
	unContrato := self buscarContrato: nroContrato.
	unContrato ifNotNil: [
		unContrato estaPago ifFalse: [ unContrato registrarCuotas: cantidad. rta := true ] ifTrue: [ rta := false ] ] ifNil:[rta := false.].
	^ rta
]

{ #category : #propias }
Cliente >> puedeSerFrecuente [

	| fecha fechaIni fechaFin rta contrato |
	rta := false.
	fecha := Date today.
	fechaIni := Date newDay: 01 month: 01 year: fecha year.
	fechaFin := Date newDay: 31 month: 12 year: fecha year.
	contrato := colContratos
		            detect: [ :x |
			            (x getViaje isKindOf: ViajeOrganizado) and:
				            (x getFechaViaje between: fechaIni and: fechaFin) ]
		            ifNone: [ nil ].
	^ rta := contrato isNotNil
]

{ #category : #propias }
Cliente >> tieneContratoAVencer [

	| unContrato |
	"unContrato := colContratos detect: [ :i | i contratoAVencer ].
	^ unContrato isNil"
	
unContrato := colContratos
                      detect: [ :i | i contratoAVencer ]
                      ifNone: nil.
    ^ unContrato isNotNil
]

{ #category : #propias }
Cliente >> verificarCliente: dniC [

	^ self getDNI = dniC
]
