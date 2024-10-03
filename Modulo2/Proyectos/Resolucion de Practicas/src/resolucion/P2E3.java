/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author fede_
 * 
 * - Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
 * 
 * a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: 
las personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
* 
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
* 
* 
* 
 */
/*
public class P2E3 {
    public static void main(String[] args) {
    Persona [][] casting = new Persona [5][8];
     
    int cupo = 40;
    int DNI, edad;
    int dia = 0;
    int turno = 0;
    String nombre;
     
    System.out.println("Ingrese nombre: ");
    nombre = Lector.leerString();
        
    while ((cupo != 0) && (! nombre.equals("ZZZ"))){
        System.out.println("Ingrese DNI: ");
        DNI = Lector.leerInt();
        System.out.println("Ingrese edad: ");
        edad = Lector.leerInt();
        cupo --;
        if (turno != 7){
            casting[dia][turno] = new Persona(nombre,DNI,edad);
            turno ++;
        }
        else {
            turno = 0;
            dia ++;
            casting[dia][turno] = new Persona(nombre,DNI,edad);
        } 
        System.out.println("Ingrese nombre: ");
        nombre = Lector.leerString();        
    }
     
    }
}
*/
public class P2E3 {
    public static void main(String[] args) {
    Persona [][] casting = new Persona [5][8];
     
    int cupo = 40;
    int DNI, edad;
    int dia = 0;
    int turno = 0;
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
        if (turno != 8){
            casting[dia][turno] = new Persona(nombre,DNI,edad);
            System.out.println("DIA: " + dia + " | TURNO: " + turno + " | CUPO: "+cupo);
            System.out.println("________________________________");
            turno ++;
        }
        else {
            turno = 0;
            dia ++;
            casting[dia][turno] = new Persona(nombre,DNI,edad);
            System.out.println("DIA: " + dia + " | TURNO: " + turno + " | CUPO: "+cupo);
            System.out.println("________________________________");
            turno ++;
        } 
        System.out.print("Ingrese nombre: ");
        nombre = GeneradorAleatorio.generarString(3);
        System.out.println(nombre);
    }
    System.out.println("CUPO "+cupo);
    System.out.println("");
    int cant = 0;  
    for (int i=0; i<5; i++){
        for (int j=0; j<8; j++){
            nombre = casting[i][j].getNombre();
            System.out.println("Nombre: " + nombre);
            cant ++;
        }
    }
    System.out.println("Cant: "+ cant);

 
    }
}
