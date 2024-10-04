/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion;

import PaqueteLectura.*;


/**
 *
 * @author Federico
 * - Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.
 */
public class P2E4 {
    public static void main(String[] args) {
    Persona [][] casting = new Persona [5][8];
    int [] ocupado = new int [5];
    int i ;
    for (i=0; i<5; i++){
        ocupado[i]=0;
    }
    
    int cupo = 40;
    int DNI, edad, dia;
    String nombre;
    System.out.print("Ingrese nombre: ");
    nombre = GeneradorAleatorio.generarString(3);
    System.out.println(nombre);
    while ((cupo != 0) && (! nombre.equals("ZZZ"))){
        System.out.print("Ingrese DNI: ");
        DNI = GeneradorAleatorio.generarInt(1000)+10000000 ;
        System.out.println(DNI);
        System.out.print("Ingrese edad: ");
        edad = GeneradorAleatorio.generarInt(100);
        System.out.println(edad);
        cupo --;
        
        System.out.println("Ingrese el dia: ");
        dia = Lector.leerInt();
        if (ocupado[dia-1]==8){
            System.out.println("El dia no tiene turno disponible");
        }
        else{
            casting[dia-1][ocupado[dia-1]]= new Persona(nombre,DNI,edad);
            ocupado[dia-1]++;
        }
        System.out.print("Ingrese nombre: ");
        nombre = GeneradorAleatorio.generarString(3);
        System.out.println(nombre);
    }
     
    for (i=0; i<5; i++){
        System.out.println("Cantidad de inscriptos dia  " + (i+1) + ": " + ocupado[i]);
    }

 
    }
}
