program EjemplosTeroria;
type
    Lista = ^Nodo;
    Nodo = record
        dato: integer;
        sig:Lista;
        end;

procedure GenerarEstructura(var L:Lista);
    
    procedure Cargar(var L:Lista; num:integer);
        var 
            nue:Lista;
        begin
            New(nue); 
            nue^.dato:=num;
            nue^.sig:=L;
            L:=nue;
        end;
    var
        num:integer;
    begin
        num:= random (1000);
        while (num <> 20) do
            begin
                Cargar(L,num);
                num:= random (1000);
            end;
    end;

procedure ImprimirIterativo(L:Lista);
    begin
        while (L<>nil) do
            begin
                writeln(L^.dato);
                L := L^.sig;
            end;
    end;

procedure Imprimir (L : Lista); //Recursivo
    begin
        if (L<> nil) then
            begin
                writeln (L^.dato);
                L:= L^.sig;
                Imprimir(L);
            end;
    end;

var
    L:Lista;
begin
    randomize;
    L:= Nil;
    GenerarEstructura(L);
    
    Imprimir(L);
end.
