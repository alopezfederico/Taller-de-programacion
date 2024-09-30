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
public class Ejercicio5 {
    
    /*5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto*/
    
    public static void main(String[] args) {
        int [][] calif = new int [5][4];
        
        int i,j;
        for (i=0; i<5; i++)
            for(j=0; j<4; j++){
                System.out.println("Escriba calificaicon para aspecto "+(j+1)+": ");
                calif[i][j]=Lector.leerInt();
                while ((calif[i][j]<1) || (calif[i][j]>10))
                    calif[i][j]=Lector.leerInt();
            }
        
        double [] prom = new double [4];
        
        for (i=0; i<4; i++)
            prom[i]=0;
        
        for (j=0; j<4; j++)
            for (i=0; i<5; i++)
                prom[j] += calif[i][j];
        
        for (i=0; i<4; i++){
            System.out.println("Promedio aspecto "+(i+1)+": "+ prom[i]/5);
        }
        
        
    }
}
