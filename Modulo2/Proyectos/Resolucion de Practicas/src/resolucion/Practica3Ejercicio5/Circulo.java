/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion.Practica3Ejercicio5;

/**
 *
 * @author Fede
 */
public class Circulo {
    private double radio;
    private String relleno;
    private String linea;
    
    public Circulo (double unRadio, String unRelleno, String unaLinea){
        radio = unRadio;
        relleno = unRelleno;
        linea = unaLinea;
    }
    
    public Circulo(){        
    }
    
    public double getRadio(){
        return radio;
    }
    public String getRelleno(){
        return relleno;
    }
    public String getLinea(){
        return linea;
    }
    
    
    public void setRadio(double unRadio){
        radio = unRadio;
    }
    public void setRellenio(String unRelleno){
        relleno = unRelleno;
    }
    public void setLinea(String unaLinea){
        linea = unaLinea;
    }
    
    public double calcularPerimetro(){
        return (Math.PI * radio * 2);
    }
    
    public double calcularArea(){
        return (Math.PI * radio * radio);
    }
}
