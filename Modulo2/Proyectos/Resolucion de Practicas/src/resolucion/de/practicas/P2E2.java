/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion.de.practicas;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author fede_
 * 
 * 
- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI.

* 
* Defino vector
* Genero nombre, dni, edad
* seteo parsona en posicion i del vector con los valores generados
* x15
* 
* leo vector
* 
 */
public class P2E2 {
    public static void main(String[] args){
        Persona [] p = new Persona [15];
        String nombre;
        int DNI;
        int edad;
        int i;
        for (i=0; i<15; i++){
            System.out.print("Ingrese persona: ");
             
             nombre = GeneradorAleatorio.generarString(7);
             DNI = GeneradorAleatorio.generarInt(1000)+10000000;
             edad = GeneradorAleatorio.generarInt(70);
             
             p[i] = new Persona(nombre, DNI, edad);
        }
        
        for (i=0; i<15; i++){
            System.out.println("Nombre: " + p[i].getNombre() + " | DNI: " + p[i].getDNI()+" | Edad: " + p[i].getEdad());
            System.out.println("___________________________________________");
        }     
    }
}
