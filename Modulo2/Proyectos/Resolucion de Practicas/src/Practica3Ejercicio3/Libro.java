
package Practica3Ejercicio3;

/**
 *
 * @author Fede
 */
public class Libro {
    private String titulo;
    private Autor primerAutor;
    private String ISBN;
    private String editorial;
    private int anio;
    private double precio;
    
    
    public Libro(String unTitulo, Autor unAutor, String unaEditorial, int unAnio, String unISBN, double unPrecio){
        titulo = unTitulo;
        primerAutor = unAutor;
        editorial = unaEditorial;
        anio = unAnio;
        ISBN = unISBN;
        precio = unPrecio;
    }
    
    public Libro(String unTitulo, Autor unAutor, String unaEditorial, String unISBN){
        titulo = unTitulo;
        primerAutor = unAutor;
        editorial = unaEditorial;
        ISBN = unISBN;
        anio =2020;
        precio = 1000;
    }
    
    public Libro(){
        
    }
    
    public String getTitulo(){
        return titulo;
    }
    
    public Autor getAutor(){
        return primerAutor;
    }
    
    public String getEditorial(){
        return editorial;
    }
    
    public int getAnio(){
        return anio;
    }
    
    public String getISBN(){
        return ISBN;
    }
    
    public double getPrecio(){
        return precio;
    }
    
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
    
    public void setAutor(Autor unAutor){
        primerAutor=unAutor;
    }
    
    public void setEditorial(String unaEditorial){
        editorial=unaEditorial;
    }
    
    public void setAnio (int unAnio){
        anio = unAnio;
    }
    
    public void setISBN(String unISBN){
        ISBN = unISBN;
    }
    
    public void setPrecio(double unPrecio){
        precio = unPrecio;
    }
    
@Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor + " - " + anio + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
     
    
}
