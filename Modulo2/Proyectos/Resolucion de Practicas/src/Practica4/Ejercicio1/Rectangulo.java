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
public class Rectangulo extends Figura {
    private double base,altura;
    
    public Rectangulo(double unaBase, double unaAltura, String unRelleno, String unaLinea){
        super(unRelleno, unaLinea);
        base = unaBase;
        altura = unaAltura;
    }
    

    public double getBase(){
        return base;
    }
    public double getAltura(){
        return altura;
    }
    
    public void setBase(double unaBase){
        base = unaBase;
    }
    public void setAltura(double unaAltura){
        altura = unaAltura;
    }
    
    @Override
    public double calcularArea(){
        return (base * altura);
    }
    
    @Override
    public double calcularPerimetro(){
        return ((base * 2)+ (altura * 2));
    }
    @Override
    public String toString(){
        return("Rectangulo | Base: " + base + " | Altura: " + altura + super.toString());
    }
}
