/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion;

/**
 *
 * @author Federico
 * 
 * 
 * Definir una clase para representar triángulos. 
 * Un triángulo se caracteriza por 
tamaño de sus 3 lados (double),
* el color de relleno (String) 
* y el color de línea (String).
* 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
* 
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = 𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a, b y c
son los lados y 𝑠 = . La función raíz cuadrada es Math.sqrt(#) 
 */
public class Triangulo {
    // Declaracion del estado
    private double lado1;
    private double lado2;
    private double lado3;
    private String relleno;
    private String borde;
    
    public Triangulo(double unLado1, double unLado2, double unLado3, String unRelleno, String unBorde){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        relleno = unRelleno;
        borde = unBorde;
    }
    
    //Metodos
    // public TipoRetorno nombreMetodo(lista de parametros formales)
    
    public Triangulo() {
    
    }
    //Devolver
    
    public double getLado1(){
        return lado1;
    }
    public double getLado2(){
        return lado2;
    }
    public double getLado3(){
        return lado3;
    }
    public String getRelleno(){
        return relleno;
    }
    public String getBorde(){
        return borde;
    }
    
    //Set
    public void setLado1(double unLado1){
        lado1 = unLado1;
    }
    public void setLado2(double unLado2){
        lado2 = unLado2;
    }
    public void setLado3(double unLado3){
        lado3 = unLado3;
    }
    public void setRelleno(String unRelleno){
        relleno = unRelleno;
    }
    public void setBorde(String unBorde){
        borde = unBorde;
    }
    
    //- Calcular el perímetro y devolverlo (método calcularPerimetro)
    public double calcularPerimetro(){
        return lado1 + lado2 + lado3;
    }
    
    //- Calcular el área y devolverla (método calcularArea)
    public double calcularArea(){
        double a,b,c,s;
        a = lado1;
        b = lado2;
        c = lado3;
        
        s = (a+b+c)/2;

        
        return Math.sqrt(s*(s-a)*(s-b)*(s-c));
    }
    
    
}
