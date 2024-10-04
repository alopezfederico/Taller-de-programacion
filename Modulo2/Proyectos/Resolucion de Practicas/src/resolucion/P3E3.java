/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author fede_
 * 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros.
* Provea métodos para:
(i) devolver la cantidad de libros que almacenados 
(ii) devolver si el estante está lleno
(iii) agregar un libro al estante
(iv) devolver el libro con un título particular que se recibe.

B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
public class P3E3 {
    public static void main (String[] args){
        Estante estante1 = new Estante();
        Libro l1 = new Libro();
        Autor a1 = new Autor();
        
        String nombre, titulo, editorial, isbn;
        
        System.out.println("Ingrese nombre del autor: ");
        nombre = Lector.leerString();
        while (!nombre.equals("ZZZ")){
            System.out.println("Ingrese Titulo del libro");
            titulo = Lector.leerString();
            
            System.out.println("Ingrese editorial: ");
            editorial = GeneradorAleatorio.generarString(3);
            
            System.out.println("Ingrese ISBN: ");
            isbn = GeneradorAleatorio.generarString(4);
            
            a1.setNombre(nombre);
            l1.setTitulo(titulo);
            l1.setPrimerAutor(a1);
            l1.setEditorial(editorial);
            l1.setISBN(isbn);
            
            estante1.agregarLibro(l1);
            
            System.out.println("Ingrese nombre del autor: ");        
            nombre = Lector.leerString();            
        }
        
        System.out.println("Cantidad de libros en el estante: " + estante1.getCantAlmacenados());
        System.out.println("Autor de 'Mujercitas': " + estante1.getLibro("Mujercitas"));
        
    }
}
