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
public class Jugador extends Empleado{    
    private int partidos;
    private int goles;
    
    public Jugador(String nombre, double sueldo, int antiguedad, int partidos, int goles){
        super(nombre, sueldo, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }
    
    public int getPartidos(){
        return partidos;
    }
    public int getGoles(){
        return goles;
    }
    public void setPartidos(int partidos){
        this.partidos = partidos;
    }
    public void setGoles(int goles){
        this.goles=goles;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double monto = calcularSueldo();
        if (calcularEfectividad()>0.5)
            monto += getSueldo();
        return monto;
    }
    
    @Override
    public double calcularEfectividad(){
        return ((double)goles/partidos);
    }
    
}
