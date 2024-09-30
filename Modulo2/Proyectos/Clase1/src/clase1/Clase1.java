/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase1;

import PaqueteLectura.GeneradorAleatorio;

public class Clase1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Ejercicio1
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
