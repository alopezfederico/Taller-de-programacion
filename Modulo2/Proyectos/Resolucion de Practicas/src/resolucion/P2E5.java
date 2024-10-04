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
 * 5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). 
* Un objeto partido sabe responder a los siguientes mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate
* 
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
* 
* 
* Inicializo vector vacio de Partidos
* 
* Hasta que no haya 20 partidos, o no se ingrese 'Visitante ZZZ' leer partidos
*/
public class P2E5 {
    public static void main(String[] args) {
        int max = 20;
        int cant=0;
        String corte = "ZZZ";
        Partido [] p = new Partido[20];
        String visitante, local;
        int golLocal,golVisitante;
        
        System.out.println("Ingrese club visitante: ");
        visitante = Lector.leerString();
        
        while((cant!= max)&&(! visitante.equals(corte))){
            System.out.println("Ingrese cantidad de goles del equipo visitante: ");
            golVisitante = Lector.leerInt();
            System.out.println("Ingrese club local: ");
            local = Lector.leerString();
            System.out.println("Ingrese cantidad de goles del equipo local: ");
            golLocal= Lector.leerInt();
            
            p[cant] = new Partido(local,visitante,golLocal,golVisitante); //seteo partido en el vector de partidos
            
            cant ++;
            System.out.println("Ingrese club visitante: ");
            visitante = Lector.leerString();
        }
        
        // Armado de informe
        // EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante 
        int riverWins =0;
        boolean existeRiver = false;
        int golesBoca =0;
        boolean existeBoca = false;
        
        for (int i=0; i<cant; i++){
            System.out.println(p[i].getLocal() + " " + p[i].getGolesLocal()+" VS "+p[i].getVisitante() + " " + p[i].getGolesVisitante());
            
            if ((p[i].getLocal().equals("River"))||(p[i].getVisitante().equals("River"))){
                if ((p[i].getLocal().equals("River"))&&(p[i].getGolesLocal() > p[i].getGolesVisitante())){
                        riverWins ++;
                    }
                else 
                    if(p[i].getGolesLocal() < p[i].getGolesVisitante()){
                        riverWins ++;
                    }
                existeRiver =true;

            }
            
            if (p[i].getLocal().equals("Boca")){
               golesBoca += p[i].getGolesLocal();
               existeBoca=true;
             }
        }
        
        if (existeRiver){
            System.out.println("Cantidad de partidos que ganó River: " + riverWins);
        }
        if (existeBoca) {
            System.out.println("Cantidad de goles que hizo Boca de local: "+ golesBoca);
        }
    }
}
