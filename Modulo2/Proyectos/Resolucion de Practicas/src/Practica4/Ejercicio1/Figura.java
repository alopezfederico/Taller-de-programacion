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
public abstract class Figura {
    private String colorRelleno, colorLinea;
    
    public Figura(String unColorRelleno, String unColorLinea){
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;
    }
    public void setColorLina(String unColor){
        colorLinea = unColor;
    }
    
    public void despintar(){
        colorRelleno = "Blanco";
        colorLinea = "Negro";
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
    
    @Override
    public String toString(){
        return(" | Color relleno: " + colorRelleno + " | Color de linea: " + colorLinea);
    }
}
