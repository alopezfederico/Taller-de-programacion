/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion.Practica3Ejercicio5;

import PaqueteLectura.Lector;

/**
 *
 * @author Fede
 */
public class pp {
    public static void main(String[] args) {
        double radio;
        String relleno, linea;
        
        System.out.println("Ingrese radio: ");
        radio = Lector.leerInt();
        System.out.println("Ingrese color de relleno: ");
        relleno = Lector.leerString();
        System.out.println("Ingrese color de borde: ");
        linea = Lector.leerString();
        
        Circulo c = new Circulo(radio,relleno,linea);
        
        System.out.println("Perimetro: " + c.calcularPerimetro());
        System.out.println("Area: "+ c.calcularArea());
    }
    
    
}
