{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.

b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.

c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.

d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.

e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

program ejercicio2;
const
    corte = 100;
    
    r_min = 100;
    r_max = 200;
type
    Lista = ^Nodo;
    Nodo = record
        dato:integer;
        sig:Lista;
        end;

procedure GenerarLista(var L:Lista);

    procedure Agregar(var L:Lista; num:integer);
        var 
            nue:Lista;
        begin
            New(nue);
            nue^.dato:= num;
            nue^.sig:=L;
            L:=nue;
        end;

    var 
        num:integer;
    begin
        num:= random(r_max-r_min +1) + r_min;
        if (num<>corte) then
            begin
                Agregar(L,num);
                GenerarLista(L)
            end;
    end;

procedure ImprimirLista(L:Lista);
    begin
        if (L<>nil) then
            begin
                 writeln(L^.dato);
                 L:=L^.sig;
                 ImprimirLista(L);
            end;
    end;

{procedure ImprimirListaInvertida(L:Lista);         // Metodo 1

    procedure Numeros(L:Lista);
        begin
            if (L<>nil) then
                begin
                    
                    L:=L^.sig;
                    Numeros(L);
                    if (L<>nil) then
                        writeln(L^.dato);
                        
                end;
        end;
    begin
        Numeros(L);
        writeln(L^.dato);
    end;
}

procedure ImprimirListaInvertida(L:Lista);         // Metodo 2 
    begin
        if (L<>nil) then
            begin
                ImprimirListaInvertida(L^.sig);
                writeln(L^.dato);
            end;
    end;


{function MinimoValor(L:Lista): integer;            // Metodo 1
    begin
        if (L<>nil) then
            begin
                MinimoValor:= MinimoValor(L^.sig); //"No recomendable "
                if (L^.sig = nil) then // "No recomendable referenciar tanto al siguiente en las condiciones"
                    MinimoValor:=999;
                if (L^.dato < MinimoValor) then
                    MinimoValor:= L^.dato;
            end;
    end;
}


function MinimoValor(L:Lista): integer;             // Metodo 2 
    begin
        if (L=nil) then
            MinimoValor:=999
        else 
            begin
                MinimoValor:= MinimoValor(L^.sig);
                if (L^.dato < MinimoValor) then
                    MinimoValor:= L^.dato;
            end;
    end;


{function Existe(L:Lista; valor:integer):boolean;       // Metodo 1
    begin
        if (L = nil) then
            Existe:=false
        else
            begin
                Existe:=Existe(L^.sig, valor);
                if (L^.dato = valor) then
                    Existe:= true;
            end;
    end;
}

function Existe(L:Lista; valor:integer):boolean;        // Metodo 2
    begin
        if (L<>nil) and (L^.dato <> valor) then 
            Existe:= Existe(L^.sig,valor);
        if (L = nil) then
            Existe:=False
        else
            if (L^.dato = valor) then
                Existe:= True;
    end;

var 
    L:Lista;
    valor:integer;
begin
    randomize; 

    L:=nil;
// Inciso A
    GenerarLista(L);

// Inciso B
    writeln('__ORDEN NORMAL__'); writeln();
    ImprimirLista(L);

// Inciso C
    writeln('__ORDEN INVERTIDO__'); writeln();
    ImprimirListaInvertida(L);

// Inciso D
    writeln('__ MINIMO VALOR __'); writeln();
    writeln('Numero :', MinimoValor(L));

// Inciso E
    write('Ingrese un numero: '); readln(valor);
    if(Existe(L,valor))then
        writeln('El numero ', valor,' se encuentra en la lista')
    else
        writeln('El numero ', valor,' no se encuentra en la lista');
end.