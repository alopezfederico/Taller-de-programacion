/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio1;

/**
 *
 * @author Fede
 */
public class Cuadrado extends Figura {
    private double lado;
    
    public Cuadrado(double unLado, String unColorRelleno, String unColorLinea){
        super(unColorRelleno,unColorLinea);
        lado = unLado;
    }
    
    public double getLado(){
        return lado;
    }
    
    public void setLado(double unLado){
        lado = unLado;
    }
    
    @Override
    public double calcularArea(){
        return (lado*lado);
    }
    
    @Override
    public double calcularPerimetro(){
        return (lado*4);
    }
    
    @Override
    public String toString(){
        return("Cuadrado de lado: " + lado + super.toString());
    }
}
