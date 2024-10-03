/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion;

/**
 *
 * @author fede_
 */
// EJEMPLO

// Una clase perro

public class CreacionDeClase {
    private String nombre;
    private int edad;
    private String raza;
    
    public CreacionDeClase(String unNombre, int unaEdad, String unaRaza){
        nombre = unNombre;
        edad = unaEdad;
        raza = unaRaza;
    }
    
    public CreacionDeClase(){
        
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public int getEdad(){
        return edad;
    }
    
    public String getRaza(){
        return raza;
    }
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setEdad(int unaEdad){
        edad = unaEdad;
    }
    
}
