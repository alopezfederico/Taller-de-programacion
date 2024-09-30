/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio1 {

    /**
     * Carga un vector que representa la tabla del 2
     * @param args
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int i;      
        
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        int n;
        n = GeneradorAleatorio.generarInt(12);
        while (n!=11){
           System.out.println("2 x " + n + " = " + tabla2[n]);
           n = GeneradorAleatorio.generarInt(12);
    }
    }
}
