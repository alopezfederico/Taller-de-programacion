{3.- Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).


b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)

c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.

}

program Ejercicio3;
const 
    r_min = 300;
    r_max = 1550;

    dimF = 20;

type 
    vector = Array [1 .. dimF] of integer;


procedure CargarVector( var V:vector; var dimL:integer);
    var
        num:integer;
    begin
       if (dimL<dimF) then
            begin
                num:= random(r_max-r_min +1) + r_min;

                V[dimL]
    end;