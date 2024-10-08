
package Practica4.Ejercicio1;

public class Triangulo extends Figura{
    private double l1,l2,l3;
    
    public Triangulo(double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorLinea){
        super(unColorRelleno, unColorLinea);
        l1 = unLado1;
        l2 = unLado2;
        l3 = unLado3;
    }

    
    public double getLado1(){
        return l1;
    }
    public double getLado2(){
        return l2;
    }
    public double getLado3(){
        return l3;
    }
    
    public void setLado1(double unLado){
        l1=unLado;
    }
    public void setLado2(double unLado){
        l2=unLado;
    }
    public void setLado3(double unLado){
        l3=unLado;
    }
    
    @Override
    public double calcularPerimetro(){
        return (l1 + l2 + l3);
    }
    
    @Override
    public double calcularArea(){
        double s,A;
        s = (l1 + l2 + l3)/2;
        A = Math.sqrt(s* (s-l1)* (s-l2) * (s-l3));
        return (A);
    }
    
    @Override
    public String toString(){
        return("Triangulo | Lado1: " + l1 + " |Lado2: " + l2 + " |Lado3: " + l3 + super.toString());
    }
}

