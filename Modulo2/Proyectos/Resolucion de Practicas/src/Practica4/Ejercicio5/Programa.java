/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4.Ejercicio5;

import Practica4.Ejercicio1.Cuadrado;
import Practica4.Ejercicio1.Rectangulo;

/**
 *
 * @author Fede
 * 5 A- Queremos representar dibujos. Un dibujo guarda su título y las figuras
que lo componen (círculos, triángulos, cuadrados, rectángulos, etc). Piense,
con lo visto hasta ahora (no es necesario implementar):
i- ¿Dónde almacenará las figuras que componen el dibujo?. ¿Cuántas
estructuras se necesitarán?.
* 
* 
* 
ii- ¿Cómo agregará las distintas figuras al dibujo?. ¿Cuántos métodos agregar
necesita implementar?
* 
* 
* 
iii- ¿Qué problema surge a medida que aumentan las posibles figuras en la
jerarquía?
 */
public class Programa {
    public static void main(String[] args) {
        Dibujo d = new Dibujo("un dibujo");
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        d.agregar (c1);
        d.agregar (r);
        d.agregar (c2);
        d.mostrar();
}

}
