/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucion;

/**
 *
 * @author Federico
 */
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor(String unNombre, String unaBiografia, String unOrigen){
        nombre = unNombre;
        biografia = unaBiografia;
        origen = unOrigen;
    }
    
<<<<<<< HEAD
    public Autor(){
        
    }
=======
    public  Autor (String unNombre, String unaBiografia,String unOrigen){
        nombre = unNombre;
        biografia = unaBiografia;
        origen = unOrigen;
    }
    
    public Autor (String unNombre){
        nombre = unNombre;
        biografia = " _ ";
        origen = " _ ";
    }
    
    public Autor(){
        
    }
    
>>>>>>> bc972e37ec249bc187fc60e305003476d9043b3e
    public String getNombre(){
        return nombre;
    }
    public String getBiografia(){
        return biografia;
    }
    public String getOrigen(){
        return origen;
    }
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
<<<<<<< HEAD
=======
    
>>>>>>> bc972e37ec249bc187fc60e305003476d9043b3e
    public void setBiografia(String unaBiografia){
        biografia = unaBiografia;
    }
    public void setOrigen(String unOrigen){
        origen = unOrigen;
    }
    
    @Override
    public String toString(){
        String aux;
<<<<<<< HEAD
        aux = "Autor: " + nombre + "\n Biografia: " + biografia + "\n Origen: " + origen;
        return (aux);
    }
=======
        aux =  nombre + " | Bio: " + biografia + " | Origen: " + origen;
        return (aux);
    }
    
>>>>>>> bc972e37ec249bc187fc60e305003476d9043b3e
}
