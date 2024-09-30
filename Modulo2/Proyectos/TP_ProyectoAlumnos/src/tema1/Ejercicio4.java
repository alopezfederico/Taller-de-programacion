/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.*;

/**
 *
 * @author Federico
 */
public class Ejercicio4 {
    /*
    - Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. 
    Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
*/
    public static void main(String[] args) {
        int [][] edificio = new int [8][4];
        int i,j;
        for (i=0; i<8; i++)
            for(j=0; j<4; j++)
                edificio[i][j]=0;
        System.out.println("Ingrese piso: ");
        int piso = Lector.leerInt();
        int ofi;
        while (piso != 9){
            System.out.println("Ingrese oficina: ");
            ofi=Lector.leerInt();
            edificio[piso-1][ofi-1] ++;
            System.out.println("Ingrese piso: ");
            piso = Lector.leerInt();
        }
        
        for (i=0; i<8; i++){
            for (j=0; j<4; j++)
                System.out.print(edificio[i][j] + " | ");
            System.out.println();
        }
    } 
}
