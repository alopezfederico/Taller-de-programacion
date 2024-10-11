/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio4;

/**
 *
 * @author Fede
 * 
 * 4- sistema que permita registrar, para una determinada estación meteorológica, 
 * la temperatura promedio mensual de N años consecutivos a partir de un año A dado. 
Además, necesita dos versiones del sistema: 
una que tenga funcionalidad para reportar el promedio histórico por años 
y otra que tenga funcionalidad para reportar el promedio histórico por meses. 

De la estación, interesa conocer: nombre, y latitud y longitud donde se encuentra.
Implemente las clases, constructores y métodos que considere necesarios para:
* 
a) Crear el sistema de registro/reporte, que funcionará en una determinada estación,
para N años consecutivos a partir de un año A. Inicie cada temperatura en un valor
muy alto.
b) Registrar la temperatura de un mes y año recibidos por parámetro. Nota: El mes está
en rango 1..12 y el año está en rango A..A+N-1.
* 
* c) Obtener la temperatura de un mes y año recibidos por parámetro. Nota: El mes está
en rango 1..12 y el año está en rango A..A+N-1. En caso de no haberse registrado
temperatura para ese mes/año se retorna el valor muy alto.
d) Devolver un String que concatena el mes y año en que se registró la mayor
temperatura. Nota: Suponga que ya están registradas las temperaturas de todos
los meses y años.
e) Devolver un String con el nombre de la estación, su latitud y longitud, y los promedios
mensuales o anuales según corresponda:
- La versión del sistema que reporta por años deberá calcular el promedio para
cada año (el promedio del año X se calcula con los datos mensuales de ese año).
Ej: “La Plata (34,921 S - 57,955 O):
- Año 2020: 23,8 ºC;
- Año 2021: 26,1 ºC;
- Año 2022: 25,3 ºC. ”
- La versión del sistema que reporta por meses deberá calcular el promedio para
cada mes (el promedio del mes M se calcula con los datos de todos los años en ese
mes).
Ej: “La Plata (34,921 S - 57,955 O):
- Enero: 28,2 ºC;
- Febrero: 26,8 ºC;
- Marzo: 24.3 ºC
- …..”
Nota: Suponga que ya están registradas las temperaturas de todos los meses
y años. Utilice el carácter \n para concatenar un salto de línea.
f) Realice un programa principal que cree un Sistema con reporte anual para 3 años
consecutivos a partir del 2021, para la estación La Plata (latitud -34.921
y longitud -57.955). Cargue todas las temperaturas (para todos los meses y años).
Informe los promedios anuales, y el mes y año en que se registró la mayor
temperatura.
Luego cree un Sistema con informe mensual para 4 años a partir de 2020, para la
estación Mar del Plata (latitud -38.002 y longitud -57.556). Cargue todas las
temperaturas (para todos los meses y años). Informe los promedios mensuales, y el
mes y año en que se registró la mayor temperatura.
NOTA: Preste atención de no violar el encapsulamiento al resolver el ejercicio
 */
public class Programa {
    
    public static void main(String[] args) {
        // Crear el sistema de registro anual para la estación La Plata
        EstacionMeteorologica estacionLaPlata = new EstacionMeteorologica("La Plata", -34.921, -57.955, 3);
        SistemaDeRegistroAnual sistemaAnual = new SistemaDeRegistroAnual(estacionLaPlata, 3, 2021);

        // Registrar las temperaturas de La Plata (3 años consecutivos desde 2021)
        // Valores simulados, pueden ser ajustados según sea necesario
        for (int i = 0; i < 3; i++) {  // N = 3 años
            for (int j = 0; j < 12; j++) {  // 12 meses
                double temperatura = 20 + Math.random() * 15;  // Simulando temperaturas aleatorias entre 20 y 35 grados
                estacionLaPlata.setTemperatura(i, j, temperatura);
            }
        }

        // Mostrar el reporte anual de La Plata
        System.out.println("Reporte anual de La Plata:");
        System.out.println(sistemaAnual.generarReporte());

        // Crear el sistema de registro mensual para la estación Mar del Plata
        EstacionMeteorologica estacionMarDelPlata = new EstacionMeteorologica("Mar del Plata", -38.002, -57.556, 4);
        SistemaDeRegistroMensual sistemaMensual = new SistemaDeRegistroMensual(estacionMarDelPlata, 4, 2020);

        // Registrar las temperaturas de Mar del Plata (4 años consecutivos desde 2020)
        for (int i = 0; i < 4; i++) {  // N = 4 años
            for (int j = 0; j < 12; j++) {  // 12 meses
                double temperatura = 18 + Math.random() * 12;  // Simulando temperaturas aleatorias entre 18 y 30 grados
                estacionMarDelPlata.setTemperatura(i, j, temperatura);
            }
        }

        // Mostrar el reporte mensual de Mar del Plata
        System.out.println("\nReporte mensual de Mar del Plata:");
        System.out.println(sistemaMensual.generarReporte());
    }
}
