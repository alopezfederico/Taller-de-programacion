/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;
/**
 *
 * @author Federico
 */
public class Ejecricio2 {
    public static void main (String [] args){
        int DIMF = 15;
        double [] altura = new double[DIMF];
        
        int i;
        for (i=0; i<15; i++){
          System.out.println("Ingrese altura del jugador " + (i+1) + ": ");
          altura[i] = Lector.leerDouble();
        }
        double suma = 0;
        for (i=0; i<15; i++)
            suma += altura[i];
        double promedio = suma / DIMF;
        
        int cant = 0;
        for (i=0; i<15; i++)
            if (altura[i]>promedio){
                cant ++;
            }
        
        System.out.println("Altura promedio: "+promedio);
        System.out.println("Cantidad de jugadores por encima del promedio: " + cant);
    }
}
