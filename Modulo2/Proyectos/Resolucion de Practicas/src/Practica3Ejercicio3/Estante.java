/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3Ejercicio3;

/**
 *
 * @author Fede
 * * 
 * 
 *  * 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
* 
(i) devolver la cantidad de libros almacenados 
(ii) devolver si el estante está lleno
(iii) agregar un libro al estante
(iv) devolver el libro con un título particular que se recibe.
* 
 */
public class Estante {
    private Libro [] estante;
    private int dimF = 20;
    private int dimL;
    
    public Estante (){
        estante = new Libro [dimF];
        dimL = 0;
    }
    
    public int obtenerCantidad(){
        return dimL;
    }
    
    public boolean estaLleno(){
        return dimL==dimF;
    }
    
    public void agregarLibro(Libro unLibro){
        estante[dimL]= unLibro;
        dimL ++;
    }
    
    public Libro obtenerLibro(String titulo){
        int i=0;
        
        while (i<dimL){
            if (estante[i].getTitulo().equals(titulo)){
                return estante[i];
            }
            else {
                i++;
            }
        }
        return null;
    }
}