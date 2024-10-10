/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio4;

/**
 *
 * @author Fede
 */
public class Estacion {
    
        
    private String nombre;
    private int longitud;
    private int latitudl;
    private int anioBase;
    private int cantAnios;
    
    
    public Estacion(String nombre, int latitud,int longitud, int anioBase, int cantAnios){
        this.nombre = nombre;
        this.latitudl = latitud;
        this.longitud = longitud;
        this.anioBase = anioBase;
        this.cantAnios = cantAnios;
        
        reg = new Registro [cantAnios];
        
    }
}
