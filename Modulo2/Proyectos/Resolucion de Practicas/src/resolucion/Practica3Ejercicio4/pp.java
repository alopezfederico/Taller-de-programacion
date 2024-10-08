/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion.Practica3Ejercicio4;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Fede
 * 
 * 4-A- Un hotel posee N habitaciones. 
 * De cada habitación conoce costo por noche, si está ocupada y, en caso de estarlo,\
 guarda el cliente que la reservó (nombre, DNI y edad).
 * 
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
* 
(ii) Implemente los constructores necesarios para iniciar: 
* los clientes a partir de nombre, DNI, edad
* el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 2000
y 8000.
* 
(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
* 
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
* 
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
* 
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación
 */
public class pp{
    public static void main(String[] args) {
        System.out.println("Ingrese cantidad de habitaciones: ");
        int n = Lector.leerInt();
        Hotel hotel = new Hotel(n);
        
        String corte="y";
        String nombre;
        int DNI, edad;
        n=1;
        System.out.print("Ingrese nombre del cliente: ");
        nombre = Lector.leerString();
        while (!nombre.equals(corte) && (!hotel.estaLleno())){
            System.out.print("Ingrese edad del cliente: "); edad = GeneradorAleatorio.generarInt(60)+20; System.out.println(edad);
            System.out.print("Ingrese DNI del clioente: "); DNI = GeneradorAleatorio.generarInt(100); System.out.println(DNI + "\n ");
            System.out.println("Ingrese numero de habitacion: "+n); 
            hotel.agregarCliente(new Persona(nombre,DNI,edad),n);
            n++;
            
            System.out.print("Ingrese nombre del cliente: "); nombre = GeneradorAleatorio.generarString(1); System.out.println(nombre);
        }
        
        System.out.println(hotel.toString() + "\n __________________________________" );
        double monto;
        System.out.println("Ingrese monto de aumento: "); monto = Lector.leerDouble();
        hotel.aumetnarPrecio(monto);
      
        System.out.println(hotel.toString() + "\n __________________________________" );
        
    }
}
