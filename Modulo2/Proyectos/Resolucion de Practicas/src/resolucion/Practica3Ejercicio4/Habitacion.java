/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion.Practica3Ejercicio4;

import PaqueteLectura.*;

/**
 *
 * @author Fede
 */
public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Persona cliente;
    
    public Habitacion(){
        costo = GeneradorAleatorio.generarDouble(6000)+2000;
        ocupada = false;
    }
    
    public double getCosto(){
        return costo;
    }
    public boolean getOcupada(){
        return ocupada;
    }
    public Persona getCliente(){
        return cliente;
    }
    
    public void aumentar (double unMonto){
        costo += unMonto;
    }
    
    public void setCliente(Persona unCliente){
        cliente = unCliente;
    }
    
    public void setCosto(double unCosto){
        costo = unCosto;
    }
    
    public void setOcupada(boolean esOcupada){
        ocupada = esOcupada;
    }

    @Override
    public String toString(){
        String a,b;
        if (ocupada)
            b= "Ocupada";
        else
            b= "Disponible";
        a = " " + b + " | $" + costo; 
        return (a);
    }    

}
