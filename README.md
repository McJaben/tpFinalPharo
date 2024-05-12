# Trabajo Práctico Final

Programación Orientada a Objetos

![Enter image alt description](Images/BBe_Image_1.png)






7. Fecha de entrega: 08/03/2024.

8. Integrantes:

- Benjamín Morales

- Kevin Quintero
- Índice:


[Introducción:	1](#Introducción)
[Objetivo del Informe	2](#objetivodelinforme)
[Enunciado: Empresa de Turismo.	3](#enunciadoempresadeturismo3)
[Resolución:	5](#resolucin5)
[Diagrama de clases:	5](#diagramadeclases5)
[Diagramas de secuencia principales:	6](#diagramasdesecuenciaprincipales6)
	[Generar un contrato y todo lo que implica:	6](#generaruncontratoytodoloqueimplica6)
	[Verificar un viaje entre dos fechas:	9](#verificarunviajeentredosfechas9)
[Explicación de cada clase del sistema	10](#explicacindecadaclasedelsistema10)
	[1) Clase EmpresaTurismo:	10](#1claseempresaturismo10)
	[2) Clase Cliente:	10](#2clasecliente10)
	[3) Clase DatosCliente:	10](#3clasedatoscliente10)
	[4) Clase ViajeroFrecuente:	10](#4claseviajerofrecuente10)
	[5) Clase Viaje:	11](#5claseviaje11)
	[6) Clase ViajeEspecial:	11](#6claseviajeespecial11)
	[7) Clase ViajeOrganizado:	11](#7claseviajeorganizado11)
	[8) Clase FechaElegible:	11](#8clasefechaelegible11)
	[9) Clase Etapa:	12](#9claseetapa12)
	[10) Clase Excursion:	12](#10claseexcursion12)
	[11) Clase ExcursiónElegida:	12](#11claseexcursinelegida12)
	[12) Clase Contrato:	12](#12clasecontrato12)
	[13) Clase ContratoFlexible:	12](#13clasecontratoflexible12)
	[14) Clase Cuota:	13](#14clasecuota13)
[Guía rápida de usuario - Interfaz gráfica:	13](#guarpidadeusuariointerfazgrfica13)
[Conclusión:	14](#conclusin14)
# Introducción: 

- El presente informe busca ofrecer una explicación detallada del proceso de desarrollo de la aplicación solicitada. Desde la comprensión inicial del enunciado hasta la implementación final de la interfaz gráfica.

- Objetivo del Informe

- El objetivo es proporcionar una guía paso a paso, desde la conceptualización hasta la materialización de la aplicación requerida. Se utilizarán diversas herramientas y metodologías, aprendidas durante el transcurso de la materia, como diagramas UML, diagramas de clase y diagramas de secuencia, para abordar cada fase del proceso con precisión y claridad.
- 
# Enunciado: Empresa de Turismo.

Una empresa de turismo ofrece a sus clientes viajes a distintos lugares del mundo. Mantiene en su lista de clientes a todos los que alguna vez han contratado un viaje en la empresa. De cada cliente mantiene los siguientes datos: Apellido, dni, ciudad en que vive y datos de contacto.

Todos los viajes se identifican con un nombre y tienen asociado un costo por persona y el valor correspondiente a impuestos.

La empresa ofrece distintos tipos de viajes:

- **“viajes especiales”**, que se contratan para alguna actividad particular (por ejemplo “viaje de compras”, “asistencia al recital de ... “, etc). En este caso se registra, además del “nombre” del viaje, la ciudad, fecha de salida y, fecha de regreso (Por ejemplo viaje “Concierto de Los Pericos”, en Córdoba, salida el 19/8, regreso el 22/8, ...). También tienen disponibilidad, que se irá actualizando a medida que el viaje sea contratado.

- **“viajes organizados”**. Estos viajes ofrecen varias opciones de fecha de salida, y el cupo correspondiente a cada una. Además se tiene la cantidad de días de duración del viaje y un “plan de viaje” en el que se indican todas las actividades incorporadas en el mismo. El plan de viaje se presenta a partir de las “etapas” que conforman el viaje. Para cada etapa se tiene información del día de llegada, cantidad de días que se permanecerá en la ciudad, hotel, tipo de pensión, lista de actividades (por ejemplo: mañana libre, excursion 1, excursion 2)

- Por ejemplo: Turquía y Grecia, 20 días, para 30 personas, salidas 15/8, 20/9, 2/11.

- etapas: (... día 3- Estambul- llegada 16.50 hs.- Actividades /visita a la basílica de Santa Sofía, visita al Palacio de Topkapi .../)... (dia15- Santorini - Actividades /recorrido de la isla/) ...(día 20 - Buenos Aires).

La empresa tiene “contratos” con sus clientes. Cada vez que un cliente contrata un paquete turístico se genera un Contrato, que tiene un número de contrato y fecha de contrato, viaje o paquete contratado, fecha seleccionada para el viaje y cantidad de personas que viajarán. Los contratos pueden pagarse en cuotas. Para ello se tiene la cantidad de cuotas del contrato y la fecha del próximo vencimiento. Los vencimientos son cada 30 días.

Existe un tipo de contrato “flexible” que tiene las siguientes características: a partir del pago de un plus es posible reprogramar el viaje para una nueva fecha. El valor del plus varía según el viaje, dado que hay viajes y fechas más solicitadas que otras. En caso de no ser posible el cambio se da la opción de cancelar la reserva y el reembolso al cliente se dará según lo siguiente:

- hasta 3 meses antes del viaje el 75% del valor total.

- entre 2 y 3 meses antes del viaje, el 50% del valor total.

- menos de 2 meses el 25% del valor total.

Para los viajes organizados se ofrecen excursiones opcionales cuyo costo NO ESTÁ considerado en el costo base del viaje por persona. Las excursiones opcionales pueden agregarse hasta 1 semana antes del viaje, y pueden contratarse para una cantidad de personas menor a la del contrato.

Es decir, si el contrato considera 5 personas, puede contratarse una excursión OP1 para 3 personas y otra excursión OP2 para 1 persona.

De cada cliente se mantienen todos los contratos realizados: los viejos y los actuales (si hubiera). Se registra cuáles son las preferencias del cliente para poder enviarle información de nuevos paquetes turísticos. Los clientes que son viajeros frecuentes (aquellos que realizan al menos un viaje organizado por año, con la empresa) participan de un sistema de millas de la empresa. Por cada nuevo contrato efectivizado (viaje que realizan) suman millas. Esas millas pueden ser utilizadas para cancelar el 10% de un contrato.

En el caso de los clientes “Viajero Frecuente” cuando se realiza una cancelación el reembolso se hace en millas.

En cualquier caso, un contrato debe estar pagado completamente 1 semana antes de la fecha del viaje asociado al contrato.

Fin del enunciado.

# Resolución:

## <span style="text - decoration: underline;">Diagrama de clases</span>:

![Enter image alt description](Images/fRe_Image_2.png)

Links a los diagramas de clase y de secuencia (también se sube a PEDCO el archivo .drawio para abrirlo en dicha página):

[draw.io](https://app.diagrams.net/?mode=google#G1Sp5r-MM9s-xKqSzJf390D0CYKn6UxwoT)

[https://drive.google.com/file/d/1Sp5r-MM9s-xKqSzJf390D0CYKn6UxwoT/view](https://drive.google.com/file/d/1Sp5r-MM9s-xKqSzJf390D0CYKn6UxwoT/view)

[https://app.diagrams.net/?mode=google#G1Sp5r-MM9s-xKqSzJf390D0CYKn6UxwoT](https://app.diagrams.net/?mode=google#G1Sp5r-MM9s-xKqSzJf390D0CYKn6UxwoT)

## <span style="text - decoration: underline;">Diagramas de secuencia principales</span>:

### Generar un contrato y todo lo que implica:

![Enter image alt description](Images/sYQ_Image_3.png)

![Enter image alt description](Images/Onx_Image_4.png)

![Enter image alt description](Images/shk_Image_6.png)

![Enter image alt description](Images/ciU_Image_7.png)

![Enter image alt description](Images/N9E_Image_8.png)

Los mensajes de buscarCliente y de verificarDisponibilidad se encuentran en el archivo del draw.io.

### Verificar un viaje entre dos fechas:

![Enter image alt description](Images/iBZ_Image_9.png)

![Enter image alt description](Images/4Jj_Image_10.png)

## Explicación de cada clase del sistema

1. 1) Clase EmpresaTurismo: 

Es la clase “principal” o del sistema.

**Relaciones:**

- Relación uno a muchos con la clase Cliente (porque el enunciado dice que se mantiene una lista de clientes que ya han realizado al menos un viaje con la empresa).

- Relación uno a muchos con la clase Viaje (porque mínimo debe haber un viaje para ofrecer a los clientes).

**Variables de instancia:** nombre, colClientes (rel), colViajes (rel).

- 2) Clase Cliente:

**Relaciones:**

- Relación uno a muchos con la clase Contrato (es mínimo uno, dado que se registran los clientes que han contratado al menos un viaje).

- Relación uno a uno con la clase DatosCliente.

**Variables de instancia:** datosCliente (rel), colContratos (rel), preferencias.

La variable colContratos es una OrderedCollection de contratos y datosCliente una referencia a una instancia de DatosCliente.

- 3) Clase DatosCliente:

**Variables de instancia:** apellido, dni (sería su identificación), ciudad, teléfono, email.

- 4) Clase ViajeroFrecuente:

- Subclase de Cliente. Hereda las relaciones y atributos de su superclase.

**Relaciones:**

- Iguales a la de la clase Cliente.

**Variables de instancia:** cantMillas.

**Variables de clase:** ValorMillas.

Es una clase para diferenciar a un cliente normal de un viajero frecuente (cliente que cuenta con al menos un viaje organizado en el último año), este tipo de cliente participa de un sistema de millas de la empresa, teniendo la posibilidad de pagar un viaje con las millas obtenidas mediante la efectivización de los contratos, entre otras.

### 5) Clase Viaje:

Es una clase abstracta, define los atributos y comportamiento común para sus subclases ViajeEspecial y ViajeOrganizado.

**Relaciones:**

- Relación de herencia con las subclases ViajeEspecial y ViajeOrganizado.

**Variables de instancia:** nombre (id), costoPorPersona, valorImp.

**Variables de clase:** no tiene.

**Mensaje de clase**: Posee un mensaje llamado calcularPlus. Este método calcula un "plus" en el monto del viaje basado en la fecha del viaje, el monto original y la cantidad de destinos. Inicialmente, se establece el montoPlus como el 2% del monto original multiplicado por la cantidad de destinos. Luego, se ajusta este monto según si la fecha del viaje cae entre marzo y noviembre, agregando un 2%, o fuera de este rango, agregando un 5%. El resultado final es el monto total, incluyendo el "plus". \
Este método se utiliza al generar un contrato flexible, dado que se debe pagar un plus por el mismo.

- 6) Clase ViajeEspecial:

Subclase de Viaje.

**Variables de instancia:** ciudad, fechaSalida, fechaRegreso, disponibilidad.

**Relaciones:** ninguna desde esta clase. La clase Contrato sí tiene una relación con Viaje y, por lo tanto, con sus subclases.

- 7) Clase ViajeOrganizado:

Subclase de Viaje.

**Relaciones:**

- Relación muchos a uno con la clase Etapa.

- Relación muchos a uno con la clase FechaElegible. Cada ViajeOrganizado puede tener varias fechas de salida, y cada fecha tiene su propio cupo disponible.

**Variables de instancia:** diasDuracion, colEtapas (rel), colFechas(rel). \
Dado que los viajes organizados ofrecen varias fechas de salida y cada una de estas fechas tiene un cupo, tiene sentido crear una clase FechaElegible para gestionar esta información. De esta manera, cada ViajeOrganizado tiene una colección de objetos FechaElegible, donde cada objeto FechaElegible representa una fecha de salida y su cupo disponible.

- 8) Clase FechaElegible:

**Variables de instancia:** unaFecha, cupo.

Es una clase con el único propósito de poder indicar la cantidad de cupos que tiene una fecha en un viaje organizado.

- 9) Clase Etapa:

**Relaciones**: 1 a muchos con Excursión.

**Variables de instancia**: diaLlegada, diasPermanencia, hotel, tipoPension, listaActividades, ciudad, colExcursiones(rel).

**Decisión grupal:** La colección de excursiones se relaciona con la clase Etapa, y representa todas las opciones de excursiones que el cliente puede seleccionar. Ahora bien, el Cliente tiene una variable de instancia llamada colExcursiones donde almacena los objetos ExcursiónElegida que seleccionó para el viaje contratado. 

- 10) Clase Excursion:

**Relaciones**: no tiene.

**Atributos**: nombre, costoE.

### 11) Clase ExcursiónElegida:

**Relaciones**: 1 a 1 con excursión.

**Atributos**: excursion(rel), cantPersonas.

Clase que contiene a una instancia de Excursión y que sirve para guardar las excursiones elegidas para un contrato.

### 12) Clase Contrato:

**Relaciones**:

- Relación de herencia con la subclase *ContratoFlexible*.

- Relación uno a uno con la clase *Viaje* (porque cada contrato está relacionado con un único ViajeEspecial o ViajeOrganizado).

- Relación 0 a muchos con la clase *Cuota* (consideramos que pueden ser cero, dado que el cliente podría escoger pagar el 100% del valor de contado y, en este caso, la variable fechaProxVto sería nula, lo que indicaría que ya está pagado el viaje contratado).

- Relación 0 a muchos con la clase *ExcursiónElegida*. El atributo colExcursiones almacena la colección (OrderedCollection) de excursiones opcionales seleccionadas para este contrato, junto con la cantidad de personas que contrataron cada una.

**Variables de instancia:**: numeroCont (id), fechaCont, viajeContratado (rel), fechaViaje, cantPersonas, colCuotas (rel), fechaProxVto.

**Variables de clase:** cantContratosCreados. Es para llevar un contador de los contratos generados/creados y poder asignarle un número único a cada uno.

- 13) Clase ContratoFlexible:

Subclase de Contrato. Hereda de la clase Contrato los atributos, relaciones y mensajes.

**Relaciones:** 

- con Viaje, hereda esta relación de la superclase Contrato.

**Variables de instancia:** valorPlus, reembolso. El valorPlus será un porcentaje del monto total del viaje.

Contrato que permite, a partir del pago de un plus, reprogramar el viaje para una nueva fecha.

- 14) Clase Cuota:

**Variables de instancia**: vencimiento, monto, fechaPago. 

Representa las cuotas de un contrato. La relación de Contrato hacia Cuota es de 1 a 1, y la cantidad de cuotas de un contrato se calcula mediante el monto de la cuota y el monto pagado.

## <span style="text - decoration: underline;">Guía rápida de usuario - Interfaz gráfica</span>:

Bienvenido a la interfaz de nuestra aplicación. Aquí hay una breve descripción de los botones principales y sus funciones:

![Enter image alt description](Images/pDQ_Image_11.png)

**1. ****<span style="text - decoration: underline;">Viajes**</span>**:**

- **Alta Viaje:**

- Especial: Crea un nuevo viaje especial, ingresando todos los datos correspondientes al mismo (nombre, ciudad de destino, fecha de salida, cupos de disponibilidad, costos, etc).

- Organizado: Crea un nuevo viaje organizado, como en el viaje especial pero con sus correspondientes etapas, excursiones y distintas fechas de salida.

- **Baja Viaje**: Elimina un viaje existente.

- **Modificar Viaje**: Realiza cambios en los detalles de un viaje.

- **Ver Viajes entre Fechas**: Consulta los viajes disponibles en un rango de fechas.

**2. ****<span style="text - decoration: underline;">Contratos**</span>**:**

- **Generar Contrato**: Crea un nuevo contrato. Permite elegir entre un contrato normal o uno flexible (con posibilidad de cambiar de fecha o de solicitar un reembolso al cancelarlo), también muestra los valores de cada uno.

- **Efectivizar Contrato**: Confirma la efectivización de un contrato existente.

- **Cancelar Contrato**: Anula un contrato y reembolsa en caso de que corresponda.

- **Modificar Contrato**: Cambia la fecha de viaje de un contrato flexible.

- **Pagar cuotas**: Realiza el pago de cuotas pendientes.

**3. ****<span style="text - decoration: underline;">Inicio del Día**</span>**:**

- Ejecuta una revisión rutinaria mediante el mensaje llamado <code>revisionRutinaria</code>.

- Notifica a los clientes con contratos a punto de vencer sobre los pagos pendientes.

- Convierte automáticamente a los clientes comunes en Viajeros Frecuentes si cumplen los requisitos.

¡Explorá y disfrutá de la funcionalidad de nuestra aplicación de turismo!

*Nota: Todos los cambios realizados se reflejarán instantáneamente en la base de datos de la EmpresaTurismo.*

# Conclusión: 

Este trabajo nos brinda la oportunidad de explorar más allá de la programación orientada a objetos, permitiéndonos abordar problemas de una manera diferente a la que estábamos acostumbrados.

Además, esta experiencia implicó debatir los requerimientos del sistema y los problemas a resolver, diseñar los distintos diagramas que modelan la solución y luego poder implementar este diseño en un lenguaje de programación. Por último, al comenzar con los diagramas, cuando avanzamos hacia la implementación de la interfaz gráfica del programa, notamos que era necesario modificar el diseño inicial. Con esto, podemos concluir que, si bien los diagramas son de gran ayuda para tener una visión abstracta del sistema, al momento de la implementación pueden sufrir cambios o adaptaciones no previstos.
