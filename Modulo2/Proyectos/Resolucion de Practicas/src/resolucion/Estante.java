/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion;

/**
 *
 * @author fede_
 */
public class Estante { 
    private Libro [] l= new Libro [20];
    private int dimF = 20;
    private int dimL = 0;
    
    public Estante(Libro l1){
        l[dimL] = l1;
    }
    
    public Estante(){  
    }
    
    public int getCantAlmacenados(){
        return (dimL);
    }
    
    public String getLleno(){
        if (dimL==dimF){
           return ("Estante lleno");
        }
        else return ("El estante no está lleno");
    }
    
    public void agregarLibro(Libro l1){
        if (dimL < dimF){
              l[dimL]=l1;
              dimL ++;
        }
    }
    
    public Libro getLibro(String unTitulo){
        Libro libro = new Libro();
        
        int cont = 0;
        boolean encontre = false;
        while ((cont < dimF)&&(! encontre)){
            if (l[cont].getTitulo().equals(unTitulo)){
                libro = l[cont];
                encontre = true;
            }
            else
                cont ++;
        }
        if (encontre){
            return libro;
        }
        else 
            return null;
    }
    
    
}
