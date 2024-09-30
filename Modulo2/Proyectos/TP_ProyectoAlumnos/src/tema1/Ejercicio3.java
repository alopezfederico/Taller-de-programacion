/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Federico 8)
 */
public class Ejercicio3 {
/*
3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java

*/
    public static void main (String[] args){
        GeneradorAleatorio.iniciar();
        int [][] matriz = new int [5][5];
        int i;
        int j;
        for (i=0; i<5; i++)
            for (j=0; j<5; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(31);    
        
        //Mostrar matriz
        
        for (i=0; i<5; i++){
            for (j=0; j<5; j++)
                System.out.print(matriz[i][j] + " | ");
            System.out.println();
        }
        
        // Suma de la fila 1
        int sumaF1=0;
        for(j=0; j<5; j++)
            sumaF1 += matriz[1][j];
        
        System.out.println("Suma de elementos de la fila 1: " + sumaF1);
        
        // V de 5 posiciones
        int [] sumaJ = new int [5];
        for (i=0; i<5; i++)
            sumaJ[i]=0;
        
        for (j=0; j<5; j++){
            for (i=0; i<5; i++){
                sumaJ[j]+=matriz[i][j];
            }
        }
        for (i=0; i<5; i++)
            System.out.print(sumaJ[i] + " | ");
            
        // Leer valor entero
        int valor = Lector.leerInt();
        int posI = -1, posJ = -1;
        i = 0;
        j = 0;
        while ((posI == -1) && (i<5)){
            while ((posI==-1) && (j<5)){
                if (valor == matriz[i][j]){
                    posI=i;
                    posJ=j;
                }
                j++;
            }
            i++;
        }
        
         if (posI!= -1){
             System.out.println("Elemento en la fila: " + posI + " | Columna: " + posJ);
         }
         else{
             System.out.print("No se encontró el elemento"); //Escribir SOUT *TAB
         }
    }
}
