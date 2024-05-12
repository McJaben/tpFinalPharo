Class {
	#name : #ViajeOrganizado,
	#superclass : #Viaje,
	#instVars : [
		'diasDuracion',
		'colEtapas',
		'colFechas'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
ViajeOrganizado class >> crearConNombre: nomb costoPersona: costoP  costoImpuestos: costoImp  colEtapas: unaCol colFechas: otraCol [
	|viajeOrganizado|
	viajeOrganizado := self new.
	viajeOrganizado inicializarConNombre: nomb costoPersona: costoP  costoImpuestos: costoImp colEtapas: unaCol colFechas: otraCol.
	^viajeOrganizado
]

{ #category : #propias }
ViajeOrganizado >> actualizarDisponibilidad: cantPersonas fecha: fecha [

	| fechaDetectada |
	fechaDetectada := colFechas detect: [ :i | i verificarFecha: fecha ].
	fechaDetectada ifNotNil: [fechaDetectada actualizarDisponibilidad: cantPersonas]
]

{ #category : #propias }
ViajeOrganizado >> calcularDestinos [

	| cantDestinos |
	cantDestinos := 0.

	colEtapas do: [ :i | cantDestinos := cantDestinos + 1 ].
	
^cantDestinos
]

{ #category : #propias }
ViajeOrganizado >> calcularDias: unaCol [

	| dias |
	dias := 0.
	unaCol do: [ :etapa | dias := dias + etapa diasPermanencia ].
	^ dias
]

{ #category : #'as yet unclassified' }
ViajeOrganizado >> cambiarFecha: fechaVieja personas: cantidad fechaNueva: fechaNueva [

	colFechas do: [ :i |
		(i verificarFecha: fechaVieja) ifTrue: [ i aumentarCupos: cantidad ].
		(i verificarFecha: fechaNueva) ifTrue: [
			i actualizarDisponibilidad: cantidad ] ].
	^true.
	
]

{ #category : #getters }
ViajeOrganizado >> colEtapas [

	^ colEtapas
]

{ #category : #setters }
ViajeOrganizado >> colEtapas: anObject [

	colEtapas := anObject
]

{ #category : #setters }
ViajeOrganizado >> colFechas: anObject [

	colFechas := anObject
]

{ #category : #'as yet unclassified' }
ViajeOrganizado >> costoImpuesto [
	^ valorImpuesto 
]

{ #category : #'as yet unclassified' }
ViajeOrganizado >> costoPersona [
	^ costoPorPersona 
]

{ #category : #getters }
ViajeOrganizado >> diasDuracion [

	^ diasDuracion
]

{ #category : #setters }
ViajeOrganizado >> diasDuracion: anObject [

	diasDuracion := anObject
]

{ #category : #'as yet unclassified' }
ViajeOrganizado >> getColEtapas [

 	^ colEtapas .
]

{ #category : #'as yet unclassified' }
ViajeOrganizado >> getColFechas [

	^ colFechas 
]

{ #category : #getters }
ViajeOrganizado >> getFechas [
|listaFechas|

	^ listaFechas := colFechas collect: [:fecha| fecha fecha ].
]

{ #category : #getters }
ViajeOrganizado >> getNombre [ 
	^nombre
]

{ #category : #initialization }
ViajeOrganizado >> inicializarConNombre: nomb costoPersona: costoP costoImpuestos: costoImp colEtapas: unaCol colFechas: otraCol [

	| totalDias |
	nombre := nomb.
	costoPorPersona := costoP.
	valorImpuesto := costoImp.
	colEtapas := unaCol.
	colFechas := otraCol.
	totalDias := self calcularDias: unaCol.
	diasDuracion := totalDias
]

{ #category : #propias }
ViajeOrganizado >> verificarDisponibilidad: cantidad fecha: unaFecha [

    | rta fechaDetectada |
    rta := false.
    fechaDetectada := colFechas
                          detect: [ :i | i verificarFecha: unaFecha ]
                          ifNone: nil.
    fechaDetectada ifNotNil: [
        rta := fechaDetectada tieneDisponibilidad: cantidad ].
     ^rta
]

{ #category : #propias }
ViajeOrganizado >> verificarEntreFechas: fecha1 fecha2: fecha2 [

	| fechaDetectada |
	fechaDetectada := colFechas detect: [ :fechaElegible |
		                  fechaElegible
			                  verificarEntreFechas: fecha1 
			                  fecha2: fecha2 ] ifNone: [nil].
	^ fechaDetectada isNotNil
]
