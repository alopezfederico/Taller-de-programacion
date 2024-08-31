{Implementar un programa que contenga:

a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. 
La información que se lee es
 legajo, 
 código de materia, 
 fecha 
 nota. 

La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.

b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.

c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).

d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program Ejercicio3;
const
    corte = 0;
type
    fecha_ = record
        dia:integer;
        mes:integer;
        anio:integer;
        end;

    final_=record
        legajo:integer;
        codigo:integer;
        fecha:fecha_;
        nota:integer;
        end;        

    Lista_ = ^NodoLista;
    NodoLista = record
        dato:final;
        end;

    reg_arbol = record
        legajo:integer;
        L:Lista_;
        end;

    arbol = record
        dato:reg_arbol;
        HI:arbol;
        HD:arbol;
    end;
        