{4.-  Una  librería  requiere  el  procesamiento  de  la  información  de  sus  productos.

De  cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.  

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos: 

a.  Lea  los  datos  de  los  productos  y  los  almacene  ordenados  por  código  de  producto  y 
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza 
cuando se lee el precio 0.          // Por error el corte de control fue codigo de producto = 0;

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro. 

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que 
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.  

d.  Ordene,  por  precio,  los  elementos  del  vector  generado  en  c)  utilizando  alguno  de  los  dos  métodos vistos en la teoría.  

e. Muestre los precios del vector resultante del punto d). f. Calcule el promedio de los precios del vector resultante del punto d).}

program Actividad4;
const
    dimF = 8;
    corte = 0;
type
    rango_rubros = 1..dimF;

    producto = record
        codigo:integer;
        rubro:rango_rubros;
        precio:real;
        end;

    Lista = ^Nodo;
    Nodo = record
        dato:producto;
        sig:Lista;
        end;

    Vector = Array [rango_rubros] of Lista;

procedure GenerarEstructura (var v:Vector);

    procedure Lectura (var p:producto);
        begin
            write('Ingrese codigo de producto: '); p.codigo:= random(1000); writeln(p.codigo);
            if (p.codigo <> corte) then
                begin
                    write('Ingrese numero de rubro: '); p.rubro:= random(8)+1; writeln(p.rubro);
                    write('Ingrese precio del producto: '); p.precio:= random(100000)+1 + random(10)*0.1; writeln(p.precio:6:2);
                end;
        end;
        
    procedure AgregarEnVector (var L:Lista; p:producto);
        var 
            nue, act, ant:Lista;
        begin
            New(nue);
            nue^.dato:=p;
            nue^.sig:=nil;
            if (L=nil) then
                L:=nue
            else
                begin
                    act:=L;
                    ant:=L;
                    while (act<>nil) and (act^.dato.codigo < nue^.dato.codigo) do
                        begin
                            ant:= act;
                            act:= act^.sig;
                        end;
                    if (ant=act) then
                        L:=nue
                    else
                        ant^.sig:=nue;
                    nue^.sig:=act;
                end;
        end;

    var 
        p:producto;
    begin
        Lectura(p);
        while(p.codigo<>corte)do
            begin
                AgregarEnVector(v[p.rubro],p);
                Lectura(p);
            end;
    end;

procedure InformarCodigos(v:Vector);
    var
        x:integer;
    begin
        for x:= 1 to dimF do
            begin
                 writeln('______________________');
                 writeln('____ RUBRO ',x,' _____');
                 while (v[x]<>nil)do
                    begin
                        writeln('Codigo de producto: ',(v[x]^.dato.codigo));
                        v[x]:=v[x]^.sig;
                    end;
            end;
    end;

var
    x: integer;
    v: Vector;
begin
    randomize;
    for x:= 1 to dimF do 
        v[x]:=nil;

// Inciso A
    GenerarEstructura(v);

// Inciso B
    InformarCodigos(v);
end.