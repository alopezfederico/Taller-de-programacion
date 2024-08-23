{3.-  Netflix  ha  publicado  la  lista  de  películas  que  estarán  disponibles  durante  el  mes  de 
diciembre de 2022.

 De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror)
 y puntaje promedio otorgado por las críticas.  
 
 Implementar un programa que invoque a módulos para cada uno de los siguientes puntos: 

a.  Lea  los  datos  de  películas,  los  almacene  por  orden  de  llegada  y  agrupados  por  código  de 
género,  y  retorne  en  una  estructura  de  datos  adecuada.  La  lectura  finaliza  cuando  se  lee  el 
código de la película -1.  

b. Genere y retorne  en un vector, para cada género, el código de  película con mayor puntaje 
obtenido entre todas las críticas, a partir de la estructura generada en a).. 

c.  Ordene  los  elementos  del  vector  generado  en  b)  por  puntaje  utilizando  alguno  de  los  dos 
métodos vistos en la teoría.  d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje, 
del vector obtenido en el punto c).
}

program Actividad3;
const
    corte = -1;
type
    rango_genero = 1..8;
    pelicula = record
        cod_pelicula: integer;
        cod_genero: rango_genero;
        puntaje: real;
        end;

    Lista = ^Nodo;
    Nodo = record
        dato: pelicula;
        sig: Lista;
        end;

    vector = Array[rango_genero] of Lista;

    vector_puntajes = Array[rango_genero] of pelicula;


procedure InicializarVector(var v:vector);
    var
        x:integer;
    begin
        for x:= 1 to 8 do
            v[x]:=Nil;
    end;

procedure GenerarEstructura(var v:vector);

    procedure Lectura(var p:pelicula);
        var
            a:real;
        begin
            write('Ingrese codigo de la pelicula: '); p.cod_pelicula:= random(40)-1; writeln(p.cod_pelicula);
            if (p.cod_pelicula <> corte) then
                begin
                    write('Ingrese codigo de genero: '); p.cod_genero:= random(8)+1; writeln(p.cod_genero);
                    write('Ingrese puntaje promedio: '); p.puntaje:=random(10)+1; 
                    if (p.puntaje <> 10) then 
                        begin
                            a:= random(10)+1;
                            a:= a * 0.1;
                            p.puntaje:=p.puntaje + (random(10)+1) * 0.1;
                        end;
                    writeln(p.puntaje:2:2);
                end;
        end;

    procedure AgregarEnVector(var v:vector; p:pelicula);
        var
            ant, act, nue:Lista;
        begin
            New(nue);
            nue^.dato:= p;
            nue^.sig:=nil;
            if (v[p.cod_genero] = nil) then
                v[p.cod_genero]:= nue
            else
                begin
                    act:=v[p.cod_genero];
                    ant:=v[p.cod_genero];
                    while (act <> nil) do
                        begin
                            ant:=act;
                            act:=act^.sig;
                        end;
                    ant^.sig:= nue;
                end;
        end;

    var
        p:pelicula;
    begin
        Lectura(p);
        while (p.cod_pelicula<>corte) do
            begin
                AgregarEnVector(v,p);
                Lectura(p);
            end;
    end;

procedure MejoresPuntajes(var vp:vector_puntajes; v:vector);

    procedure Recorrer (L:Lista; var vp:vector_puntajes; mejor:pelicula);
        begin
            while(L<>nil)do
                begin
                    if (L^.dato.puntaje > mejor.puntaje) then
                        begin
                            mejor.puntaje:= L^.dato.puntaje;
                            mejor.cod_pelicula:=L^.dato.cod_pelicula;
                            mejor.cod_genero:=L^.dato.cod_genero;
                        end;
                    L:=L^.sig;
                end;
                vp[mejor.cod_genero].puntaje:= mejor.puntaje;
                vp[mejor.cod_genero].cod_pelicula:= mejor.cod_pelicula;
                vp[mejor.cod_genero].cod_genero:= mejor.cod_genero;
        end;

    var 
        x:integer;
        mejor:pelicula;
    begin
        for x:= 1 to 8 do
            vp[x].puntaje:=0;
        for x:= 1 to 8 do
            begin
                Recorrer(v[x],vp, mejor);
            end 
    end;

procedure InformarVector(vp:vector_puntajes);
    var
        x:integer;
    begin
        for x:= 1 to 8 do
            begin
                writeln('Mejor pelicula de categoria ',vp[x].cod_genero,': ');
                writeln('Codigo: ',vp[x].cod_pelicula);
                writeln('Con un puntaje de ', vp[x].puntaje:2:2,' puntos');
            end;
    end;

procedure InformarListas(v:vector);
    var
        x: integer;
    begin
        for x:= 1 to 8 do
            begin
                writeln('______________');
                writeln('______________');
                writeln('LISTA DE CATEGORIA: ', x);
                while(v[x]<> nil)do
                    begin
                        writeln('Codigo: ',v[x]^.dato.cod_pelicula);
                        writeln('Cod Genero: ',v[x]^.dato.cod_genero);
                        writeln('Puntaje: ',v[x]^.dato.puntaje:2:2);
                        v[x]:= v[x]^.sig;
                    end;
            end;
    end;

procedure OrdenarVectorINSERCION (var v:vector_puntajes); 
    var 
        i,j:integer;
        actual:pelicula;
    begin
        for i:= 2 to 7 do
            begin
                actual:= v[i];
                j:=i-1;
                while (j>0) and (v[j].puntaje > actual.puntaje) do
                    begin
                        v[j+1]:=v[j];
                        j:=j-1;
                    end;
                v[j+1]:= actual;
            end;
    end;

procedure OrdenarVectorSELECCION (var v:vector_puntajes);
    var 
        i,j,pos:integer;
        item:pelicula;
    begin
        for i:= 1 to 7 do
            begin
                pos:= i;
                for j:=i to 8 do
                    if (v[j].puntaje < v[pos].puntaje) then
                        pos:=j;
                item.puntaje:= v[pos].puntaje;
                item.cod_pelicula:= v[pos].cod_pelicula;
                item.cod_genero:=  v[pos].cod_genero;


                v[pos].puntaje:= v[i].puntaje;
                v[pos].cod_pelicula:= v[i].cod_pelicula;
                v[pos].cod_genero:= v[i].cod_genero;

                v[i].puntaje:= item.puntaje;
                v[i].cod_pelicula:= item.cod_pelicula;
                v[i].cod_genero:= item.cod_genero;

            end;
    end;

var 
    v:vector;
    vp:vector_puntajes;
begin
    randomize;
    InicializarVector(v);
    GenerarEstructura(v);

    InformarListas(v);

    MejoresPuntajes(vp,v);
    InformarVector(vp);

    writeln('_______                 ________');
    writeln('_______ Vector ordenado ________');
   
    //OrdenarVectorINSERCION(vp);
    OrdenarVectorSELECCION(vp);
    InformarVector(vp);
end.