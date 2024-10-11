/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio4;

public abstract class SistemaDeRegistro {
    private EstacionMeteorologica estacion;
    private int N;
    private int A;

    // Constructor que inicializa los atributos
    public SistemaDeRegistro(EstacionMeteorologica estacion, int N, int A) {
        this.estacion = estacion;
        this.N = N;
        this.A = A;
    }

    // Getters para acceder a los atributos privados desde las subclases
    public EstacionMeteorologica getEstacion() {
        return estacion;
    }

    public int getN() {
        return N;
    }

    public int getA() {
        return A;
    }

    // Método abstracto que deben implementar las subclases
    public abstract String generarReporte();
}
