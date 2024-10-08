/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion.Practica3Ejercicio4;

/**
 *
 * @author Fede
 */
public class Hotel {
    private Habitacion [] habitacion;
    private int dimF;
    private int dimL;
    private int i;
    
    public Hotel(int cantH){
        habitacion = new Habitacion [cantH];
        dimF = cantH;
        dimL = 0;
        for (i=0; i<cantH; i++){
            habitacion[i] = new Habitacion();
        }
    }
        
    public Hotel(){
        
    }
    
    public int cantidadClientes(){
        return dimL;
    }
    
    public boolean estaLleno(){
        return (dimL==dimF);
    }
    
    public void agregarCliente(Persona unCliente, int X){
        habitacion[X-1].setCliente(unCliente);
        habitacion[X-1].setOcupada(true);
        dimL++;
    }
    
    public void aumetnarPrecio(double unMonto){
        for (i=0; i<dimF ;i++){
            habitacion[i].aumentar(unMonto);
        }
    }
    
    @Override
    public String toString(){
        String a = "";
        for (i=0; i<dimF; i++){
           a+= "Habitacion " + i + ": " + habitacion[i].toString();
           if (habitacion[i].getOcupada())
               a+= " | " + habitacion[i].getCliente().toString();
           a+= "\n";
       }
        return (a);
    }
    
}
