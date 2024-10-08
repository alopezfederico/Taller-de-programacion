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
public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double unRadio, String unRelleno, String unaLinea){
        super(unRelleno,unaLinea);
        radio = unRadio;
    }
    
    public double getRadio(){
        return radio;
    }
    
    public void setRadio(double unRadio){
        radio = unRadio;
    }
    
    @Override
    public double calcularArea(){
        return (Math.PI * radio *radio);
    }
    
    @Override
    public double calcularPerimetro(){
        return (Math.PI * radio * 2);
    }
    @Override
    public String toString(){
        return("Circulo | Radio: " + radio + super.toString());
    }
}
