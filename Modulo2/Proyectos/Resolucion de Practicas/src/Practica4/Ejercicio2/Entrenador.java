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
public class Entrenador extends Empleado{
        private int cantCamp;
        
        public Entrenador(String nombre, double sueldo, int antiguedad, int cantCamp){
            super(nombre,sueldo,antiguedad);
            this.cantCamp = cantCamp;
        }
        
        public int getCantCamp(){
            return cantCamp;
        }
        public void setCantCamp(int cantCamp){
            this.cantCamp = cantCamp;
        }
        
        @Override
        public double calcularEfectividad(){
            return ((double)cantCamp / getAntiguedad());
        }
        
        @Override
        public double calcularSueldoACobrar(){
            double monto = calcularSueldo();
            int cant = cantCamp;
            if ((cant>=1)&&(cant<=4))
                monto += 5000;
            else 
                if((cant>=5)&&(cant<=10))
                    monto+= 30000;
            else 
                if(cant>10)
                    monto+= 50000;
            return monto;
        }
}

