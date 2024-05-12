Class {
	#name : #ViajeEspecial,
	#superclass : #Viaje,
	#instVars : [
		'ciudad',
		'fechaSalida',
		'fechaRegreso',
		'disponibilidad',
		'costoP',
		'costoI'
	],
	#category : #'TP-FINAL'
}

{ #category : #constructor }
ViajeEspecial class >> crearConNombre: nomb costoPersona: costoP  costoImpuestos: costoImp  ciudad: unaCiudad fechaSalida: fechaSal  fechaRegreso: fechaReg disponibilidad: disp [
	|viajeEspecial|
	viajeEspecial := self new.
	viajeEspecial inicializarConNombre: nomb costoPersona: costoP   costoImpuestos: costoImp unaCiudad: unaCiudad fechaSalida: fechaSal fechaRegreso: fechaReg disponibilidad: disp.
	^viajeEspecial
]

{ #category : #'de aplicacion' }
ViajeEspecial >> actualizarDisponibilidad: cantPersonas fecha: fecha [

	fechaSalida = fecha ifTrue: [ disponibilidad := disponibilidad - cantPersonas ]
]

{ #category : #'de aplicacion' }
ViajeEspecial >> calcularDestinos [

	^1
]

{ #category : #getters }
ViajeEspecial >> ciudad [

	^ ciudad
]

{ #category : #setters }
ViajeEspecial >> ciudad: anObject [

	ciudad := anObject
]

{ #category : #setters }
ViajeEspecial >> costoImpuesto: unCosto [

	costoI := unCosto
]

{ #category : #setters }
ViajeEspecial >> costoPersona: unCosto [
	costoP := unCosto . 
]

{ #category : #accessing }
ViajeEspecial >> costoPorPersona [
	^ costoPorPersona 
]

{ #category : #getters }
ViajeEspecial >> disponibilidad [

	^ disponibilidad
]

{ #category : #setters }
ViajeEspecial >> disponibilidad: anObject [

	disponibilidad := anObject
]

{ #category : #getters }
ViajeEspecial >> fechaRegreso [

	^ fechaRegreso
]

{ #category : #setters }
ViajeEspecial >> fechaRegreso: anObject [

	fechaRegreso := anObject
]

{ #category : #getters }
ViajeEspecial >> fechaSalida [

	^ fechaSalida
]

{ #category : #setters }
ViajeEspecial >> fechaSalida: anObject [

	fechaSalida := anObject
]

{ #category : #inicializar }
ViajeEspecial >> getColEtapas [

	^ nil
]

{ #category : #inicializar }
ViajeEspecial >> getFechas [
|col|
	col := OrderedCollection new.
	col add: fechaSalida .
	^ col.
]

{ #category : #getters }
ViajeEspecial >> getNombre [

^nombre
]

{ #category : #initialization }
ViajeEspecial >> inicializarConNombre: nomb costoPersona: costoPer costoImpuestos: costoImp unaCiudad: unaCiudad fechaSalida: fechaSal fechaRegreso: fechaReg disponibilidad: disp [

	nombre := nomb.
	costoPorPersona := costoPer.
	valorImpuesto := costoImp.
	ciudad := unaCiudad.
	fechaSalida := fechaSal asDate.
	fechaRegreso := fechaReg.
	disponibilidad := disp
]

{ #category : #setters }
ViajeEspecial >> nombre: unNombre [
	nombre := unNombre 
]

{ #category : #accessing }
ViajeEspecial >> valorImpuesto [
	^valorImpuesto 
]

{ #category : #'de aplicacion' }
ViajeEspecial >> verificarDisponibilidad: cantidad fecha: unaFecha [

    ^ disponibilidad asNumber >= cantidad asNumber and:
          unaFecha = fechaSalida
]

{ #category : #'de aplicacion' }
ViajeEspecial >> verificarEntreFechas: fecha1 fecha2: fecha2 [

	^ fechaSalida between: fecha1 and: fecha2
]
