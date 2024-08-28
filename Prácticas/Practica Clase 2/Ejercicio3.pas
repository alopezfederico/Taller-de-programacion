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
    indice = 1..dimF;
    Vector = Array [indice] of integer;

procedure CargarVectorRecursivo(var V:Vector; var dimL:integer);
    var 
        num:integer;
    begin
        if (dimL<dimF) then
            begin
                dimL:=dimL+1;
                num:= random(r_max - r_min + 1) + r_min;
                V[dimL]:= num;
                CargarVectorRecursivo(V,dimL);
            end;
    end;

procedure OrdenarVectorINSERCION(var v:vector; dimL:integer); //INSERCION
    var
        i,j: integer;
        actual: integer;
    begin
        for i:= 2 to dimL do
            begin
                actual:= v[i];
                j:= i-1;
                while (j>0) and (v[j] > actual) do
                    begin
                        v[j+1]:= v[j];
                        j:=j-1;
                    end;
                v[j+1]:=actual;
            end;
    end;

procedure ImprimirVector(v:vector; dimL:integer);
    var 
        x:integer;
    begin
        for x:= 1 to dimL do
            writeln('Numero ',x,': ',v[x]);
    end;

{function busquedaDicotomica (v:vector; dimL:integer; num:integer):boolean;
    var
        existe:boolean;
        medio:integer;
        ini:integer;
        fin:integer;
    begin
        existe:=false;
        medio:= dimL div 2;
        ini:=1;
        fin:=dimL;
        writeln();writeln(); writeln('ENTRANDO AL WHILE');
        while (v[medio]<>num) and (ini<=fin)do
            begin
                writeln('Medio: ',medio);
                writeln('Inicio: ',ini);
                writeln('Fin: ', fin);
                readln();
                if (num<v[medio]) then
                    fin:= medio-1
                else 
                    ini:= medio+1;
                medio:= ((fin-ini) div 2) + ini;
            end;
        if (v[medio]=num) then
            existe:=true;
        busquedaDicotomica:=existe;
    end;
}
Procedure busquedaDicotomica (v: vector; ini,fin: integer; dato:integer; var pos: integer);
    var 
        medio:integer;
    begin
        ini:=1;
        pos:=-1;
        medio:=fin div 2;

        while (dato <> v[medio]) and (ini<=fin) do
            begin
                if (dato <v[medio]) then
                    fin:= medio -1
                else 
                    ini:= medio +1;
                medio:= ((fin-ini) div 2) + ini;
            end;
        if (v[medio]=dato) then
            pos:=medio;
    end;

var
    dimL,x,ini,fin,pos:integer;
    V:Vector;
begin
    dimL:=0;
    CargarVectorRecursivo(V,dimL);
    OrdenarVectorINSERCION(V,dimL);

    ImprimirVector(V,dimL);
    write('Ingrese numero: '); readln(x);
    Writeln('Inicializando');
    busquedaDicotomica(V,ini,dimL,x,pos);
    if (pos <> -1) then
        writeln('El numero se encuentra en la posicion ',pos,' de la lista')
    else
        writeln('El numero no se encuentra en la lista');
end.