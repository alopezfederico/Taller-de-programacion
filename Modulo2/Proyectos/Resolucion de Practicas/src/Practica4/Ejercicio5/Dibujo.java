/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio5;

import Practica4.Ejercicio1.Figura;

/**
 *
 * @author Fede
 */
public class Dibujo {
    private String titulo;
    private Figura [] vector;
    private int guardadas;
    private int capacidadMaxima=10;
    //inicia el dibujo, sin figuras
    public Dibujo (String titulo){
        this.titulo = titulo;
    }
    //agrega la figura al dibujo
    public void agregar(Figura f){
        
        System.out.println("la figura "+
        f.toString() +
        "se ha guardado");
    }
    //calcula el área del dibujo:
    //suma de las áreas de sus figuras
    public double calcularArea(){
        return 0;
    }
    public void mostrar(){

    }
//retorna está lleno el dibujo
    public boolean estaLleno() {
        return (guardadas == capacidadMaxima);
    }
}

    
//sigue a la derecha ->