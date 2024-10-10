/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio3;

/**
 *
 * @author Fede
 */
public class Persona {
    private String nombre;
    private int DNI;
    private int edad;
    
    public Persona(String nombre, int dni, int edad){
        this.nombre = nombre;
        this.DNI = dni;
        this.edad = edad;
    }
    
    public String getNombre(){
        return nombre;
    }
    public int getDNI(){
        return DNI;
    }
    public int getEdad(){
        return edad;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setDNI (int dni){
        this.DNI = dni;
    }
    public void setEdad(int edad){
        this.edad = edad;
    }
    
    @Override
    public String toString(){
        return ("Mi nombre es " + this.nombre + ", mi DNI es " + this.DNI + " y tengo " + this.edad + " años. ");
    }
    
}
