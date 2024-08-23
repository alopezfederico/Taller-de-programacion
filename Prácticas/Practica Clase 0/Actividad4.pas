program Actividad3;
type

    Lista = ^Nodo;
    Nodo = record
        dato:integer;
        sig: Lista;
        end;

procedure CargarListaOrdenada(var L:Lista);
    var
        num:integer;
        nue,ant,act:Lista;
    begin
        num:= random(150-100+1)+100;
        while(num<>120)do
            begin
                New(nue);
                nue^.dato:=num;
                nue^.sig:=nil;
                if (L=nil) then
                    L:=nue
                else
                    begin
                        act:=L;
                        ant:=L;
                        while(act<>nil)and(act^.dato < nue^.dato) do
                            begin
                                ant:=act;
                                act:=act^.sig;
                            end;
                        if (act=ant) then
                            L:=nue
                        else
                            ant^.sig:=nue;
                        nue^.sig:=act;
                    end;

                num:= random(150-100+1)+100;
            end;

    end;

procedure ImprimirLista (L:Lista);
    begin
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
    CargarListaOrdenada(L);
    ImprimirLista(L);
    write('Ingrese numero a buscar: '); readln(num);
    if (BuscarElemento(L,num)) then
        writeln('El numero se encuentra en la lista')
    else
        writeln('El numero no se encuentra en la lsita');
end.