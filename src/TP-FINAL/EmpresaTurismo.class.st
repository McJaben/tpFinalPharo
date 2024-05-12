Class {
	#name : #EmpresaTurismo,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'colViajes',
		'colClientes'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
EmpresaTurismo class >> crearNombre: unNombre viajes: viajes clientes: clientes [

	| nuevaEmpresa |
	nuevaEmpresa := self new.
	nuevaEmpresa
		inicializarNombre: unNombre
		viajes: viajes
		clientes: clientes.
	^nuevaEmpresa
]

{ #category : #propias }
EmpresaTurismo >> agregarExcursion: unaExc dni: dni numContrato: numContrato personas: cantidad [

	| unCliente unContrato |
	unCliente := self buscarCliente: dni.
	unContrato := unCliente ifNotNil: [unCliente buscarContrato: numContrato ].
	^ unContrato ifNotNil: [
		  unContrato agregarExcursion: unaExc personas: cantidad ]
]

{ #category : #propias }
EmpresaTurismo >> buscarCliente: dni [

	| clienteEncontrado |
	clienteEncontrado := colClientes
		                     ifEmpty: [ clienteEncontrado := nil ]
		                     ifNotEmpty: [
			                     clienteEncontrado := colClientes  detect: [ :i |
				                                          i verificarCliente: dni ] ifNone: [ nil ] ].

	^ clienteEncontrado
]

{ #category : #propias }
EmpresaTurismo >> buscarViaje: unNombre [

    | unViaje |
    ^ unViaje := colViajes detect: [ :i | i getNombre = unNombre ]
]

{ #category : #propias }
EmpresaTurismo >> cancelarContratoDni: dni numContrato: numContrato [

	| unCliente reembolso |
	unCliente := self buscarCliente: dni.
	reembolso := unCliente
		               ifNotNil: [ unCliente cancelarContrato: numContrato ]
		               ifNil: [ 0 ].
		^ reembolso asString
]

{ #category : #propias }
EmpresaTurismo >> convertirFrecuentesDisponibles [

    | hayViajerosNuevos nuevoViajero nuevaColeccion |
    nuevaColeccion := OrderedCollection new.
    hayViajerosNuevos := false.
    colClientes do: [ :i |
        i puedeSerFrecuente
            ifTrue: [
                hayViajerosNuevos := true.
                nuevoViajero := ViajeroFrecuente
                                    crearDatosPersonales: i getDatos
                                    contratos: i getContratos
                                    cantMillas: 0.
                nuevaColeccion add: nuevoViajero ]
            ifFalse: [ nuevaColeccion add: i ] ].
    colClientes := nuevaColeccion.
    ^ hayViajerosNuevos
]

{ #category : #propias }
EmpresaTurismo >> eliminarViaje: unNombre [

	| elementoAEliminar |
	elementoAEliminar := colViajes
		                     detect: [ :viaje | viaje getNombre = unNombre ]
		                     ifNone: [ nil ].
	elementoAEliminar ifNotNil: [ colViajes remove: elementoAEliminar. self changed ]
]

{ #category : #propias }
EmpresaTurismo >> generarContratoConCliente: cliente viaje: viaje fecha: fecha cant: cant excursiones: excursiones cuotas: cuotas [
	|unCliente|
	unCliente := Cliente new.
	unCliente := cliente.
	unCliente generarContratoViaje: viaje fecha: fecha cant: cant excursiones: excursiones cuotas: cuotas.
]

{ #category : #propias }
EmpresaTurismo >> getViajes [
	^colViajes 
]

{ #category : #inicializar }
EmpresaTurismo >> inicializarNombre: unNombre viajes: viajes clientes: clientes [

	nombre := unNombre.
	colViajes := viajes.
	colClientes := clientes.
]

{ #category : #propias }
EmpresaTurismo >> listarEntreFechas:fecha1 fecha2:fecha2 [
|listaViajes|
listaViajes :=colViajes select:[:viaje|viaje verificarEntreFechas: fecha1 fecha2: fecha2.].
^ listaViajes 
]

{ #category : #propias }
EmpresaTurismo >> modificarFechaContrato: numContrato dni: dni nuevaFecha: nuevaFecha [

    | unCliente unContrato |
    unCliente := self buscarCliente: dni.
    unContrato := unCliente buscarContrato: numContrato.
    ^ unContrato ifNotNil: [ unContrato modificarFecha: nuevaFecha ]
]

{ #category : #propias }
EmpresaTurismo >> pagarConMillas: dni numContrato: nroContrato [

	| unCliente unContrato cantMillas valorMillas montoEnMillas|
	unCliente := self buscarCliente: dni.
	unCliente ifNotNil: [
		cantMillas := unCliente getCantMillas.
		unContrato := cantMillas > 0 ifTrue: [
			              unCliente buscarContrato: nroContrato ].
		valorMillas := unContrato ifNotNil: [ unCliente getValorMillas ].
		montoEnMillas := cantMillas * valorMillas.
		unContrato pagarConMillas: montoEnMillas. 
		 ]
]

{ #category : #propias }
EmpresaTurismo >> pagarCuotasDni: dni numContrato: numContrato cuotas: cantidad [

	| unCliente rta|
	unCliente := self buscarCliente: dni.
	^ unCliente ifNotNil: [
		  rta := unCliente pagarCuotas: cantidad contrato: numContrato ] ifNil:[rta := false].
]

{ #category : #propias }
EmpresaTurismo >> registrarCliente: datosPersonales [
	|unCliente|
	unCliente := Cliente crearDatosPersonales: datosPersonales.
	colClientes add: unCliente.
]

{ #category : #propias }
EmpresaTurismo >> registrarEfectivizacionDni: dni numContrato: numContrato [

	| unCliente rta |
	unCliente := self buscarCliente: dni.
	^ rta := unCliente
		         ifNotNil: [ unCliente efectivizarContrato: numContrato ]
		         ifNil: [ false ]
	
]

{ #category : #propias }
EmpresaTurismo >> registrarViaje: unViaje [

	colViajes add: unViaje.
]

{ #category : #propias }
EmpresaTurismo >> revisionRutinaria [

	| listaClientes |
	^ listaClientes := colClientes select: [ :i | i tieneContratoAVencer ]
]

{ #category : #propias }
EmpresaTurismo >> verificarDisponibilidad: viaje personas: cantidad fechaSalida: unaFecha [

	^ viaje verificarDisponibilidad: cantidad fecha: unaFecha.
	
]
