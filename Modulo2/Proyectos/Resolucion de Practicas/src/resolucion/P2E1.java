package resolucion;

import PaqueteLectura.Lector;

public class P2E1{
    public static void main (String[] args){
        
        System.out.print("Ingrese Nombre: ");
        String nombre = Lector.leerString();
        System.out.print("Ingrese DNI: ");
        int DNI = Lector.leerInt();
        System.out.print("Ingrese edad: ");
        int edad = Lector.leerInt();
        
        Persona persona1;
        persona1 = new Persona(nombre, DNI,edad);
        
        System.out.println("Nombre: "+ persona1.getNombre() + " | DNI: " + persona1.getDNI() + " | Edad: " + persona1.getEdad());
        
    }
            
}