/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio2;

/**
 *
 * @author Fede
 */
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado(String unNombre, double unSueldo, int unaAntiguedad){
        setNombre(unNombre);
        setSueldo(unSueldo);
        setAntiguedad(unaAntiguedad);
    }
    
    public String getNombre(){
        return nombre;
    }
    public double getSueldo(){
        return sueldo;
    }
    public int getAntiguedad(){
        return antiguedad;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public void setSueldo(double sueldo){
        this.sueldo = sueldo;
    }
    
    public void setAntiguedad(int antiguedad){
        this.antiguedad = antiguedad;
    }
    
    public double calcularSueldo(){
        return (sueldo + (0.1) * sueldo *antiguedad);
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
    
    @Override
    public String toString(){
        return ("Nombre: " + nombre + " | Sueldo: " + this.calcularSueldoACobrar() + " | Efectividad: " + this.calcularEfectividad());
    }
}
