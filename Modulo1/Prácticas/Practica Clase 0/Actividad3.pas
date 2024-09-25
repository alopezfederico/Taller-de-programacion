program Actividad3;
type

    Lista = ^Nodo;
    Nodo = record
        dato:integer;
        sig: Lista;
        end;

procedure CargarLista(var L:Lista);
    var
        num:integer;
        nue:Lista;
    begin
        writeln('Principio de modulo CargarLista');
        repeat
            num:= random(150-100+1)+100;
            New(nue);
            nue^.dato:=num;
            nue^.sig:=L;
            L:=nue;
        until (num = 120);
    end;

procedure ImprimirLista (L:Lista);
    begin
        writeln('Principio de modulo ImprimirLista');
        while (L<>nil) do
            begin
                writeln('Numero de la lista: ', L^.dato);
                L:=L^.sig;
            end;
    end;

function BuscarElemento(L:Lista; num:integer): boolean;
    var
        ok:boolean;
    begin
        ok:=False;
        while (L<>nil) and (ok = False) do
            begin
                if (L^.dato=num) then
                    ok:=True
                else
                    L:=L^.sig;
            end;
        BuscarElemento:=ok;
    end;

var
    num:integer;
    L:Lista;
begin
    randomize;
    L:=Nil;
    CargarLista(L);
    ImprimirLista(L);
    write('Ingrese numero a buscar: '); readln(num);
    if (BuscarElemento(L,num)) then
        writeln('El numero se encuentra en la lista');
end.