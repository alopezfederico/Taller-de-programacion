/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion;

import PaqueteLectura.Lector;

/**
 *
 * @author Federico
 * 
 * 1-A- Definir una clase para representar triángulos. 
 * Un triángulo se caracteriza por el
tamaño de sus 3 lados (double),
el color de relleno (String) 
y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
* 
* 
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = 𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a, b y c
son los lados y 𝑠 = . La función raíz cuadrada es Math.sqrt(#) 
 * 
 */
public class P3E1 {
    public static void main(String[] args) {
        double lado1,lado2,lado3;
        String relleno, borde;
        
        System.out.print("Ingrese longitud del lado 1: ");
        lado1 = Lector.leerDouble();
        System.out.print("Ingrese longitud del lado 2: ");
        lado2 = Lector.leerDouble();
        System.out.print("Ingrese longitud del lado 3: ");
        lado3 = Lector.leerDouble();
        System.out.print("Ingrese el color de relleno: ");
        relleno = Lector.leerString();
        System.out.print("Ingrese el color del borde: ");
        borde = Lector.leerString();
        
        Triangulo t1;
        t1 = new Triangulo(lado1, lado2, lado3, relleno, borde);
        
        System.out.println("Informacion del triangulo\n");
        System.out.println("PERIMETRO: " + t1.calcularPerimetro());
        System.out.println("AREA: " + t1.calcularArea());
        
    }
}
