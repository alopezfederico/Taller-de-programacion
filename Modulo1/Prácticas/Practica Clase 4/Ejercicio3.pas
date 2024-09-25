{Implementar un programa modularizado para una librería. Implementar módulos para:

a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.



b. Imprimir el contenido del árbol ordenado por código de producto.

c. Retornar el código de producto con mayor cantidad de unidades vendidas.

d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.

e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.
}
program Ejercicio3;
const
    corte = -1;
type
//Queda almacenado el producto vendido
    producto = record
        cod: integer;
        cant: integer;
        total: real;
        end;
//Se lee la venta realizada
    venta_ = record
        cod_venta:integer;
        cod_producto:integer;
        cant: integer;
        precio:real;
        end;
//Arbol para almacenar productos vendidos 
    arbol = ^NodoArbol;
    NodoArbol = record  
        dato:producto;
        HI:arbol;
        HD:arbol;
        end;


// INCISO A
 procedure GenerarEstructura(var a:arbol);
    procedure LecturaDeVenta(var venta:venta_);
        begin
            write('Ingrese codigo de venta: '); venta.cod_venta:=random(100)-1; writeln(venta.cod_venta); 
            if (venta.cod_venta <> corte) then
                begin
                    write('Ingrese codigo de producto: '); venta.cod_producto:= random(1000); writeln(venta.cod_producto);
                    write('Ingrese cantidad de unidades ventidas: '); venta.cant:= random(100); writeln(venta.cant);
                    write('Ingrese precio unitario: '); venta.precio:= random(100)*5; writeln(venta.precio:4:2);
                    writeln('::::::::::::::::::::::::::');writeln()
                end;
        end;

    procedure PasarInfo(var p:producto; v:venta_);
        begin
            p.cod:= v.cod_producto;
            p.cant:=v.cant;
            p.total:=v.precio * v.cant;
        end;

    procedure AgregarAlArbol(var a:arbol; p:producto);
        begin
            if(a=nil)then
                begin
                    New(a);
                    a^.dato:=p;
                    a^.HI:=nil;
                    a^.HD:=nil;
                end
            else
                if(p.cod<a^.dato.cod)then
                    AgregarAlArbol(a^.HI,p)
                else
                    if(p.cod>a^.dato.cod)then
                        AgregarAlArbol(a^.HD,p)
                    else
                        begin
                            a^.dato.cant:=a^.dato.cant + p.cant;
                            a^.dato.total:= a^.dato.total + p.total;
                        end;
        end;

    var
        v:venta_;
        p:producto;
    begin
        writeln('------INGRESO DE VENTAS------');
        LecturaDeVenta(v);
        while (v.cod_venta<>corte) do
            begin
                PasarInfo(p,v);
                AgregarAlArbol(a,p);
                LecturaDeVenta(v);
            end;
        writeln('-----FIN DE LECTURA-----');
    end;

// INCISO B
 procedure ImprimirArbol(a:arbol);

    procedure InformarActual(p:producto);
        begin
            write('Codigo de producto: ',p.cod);write('  |  ');
            write('Cantidad de elementos ventidos: ', p.cant);write(' | ');
            write('Monto total generado: ', p.total:4:2);
            writeln();
            writeln();
        end;

    begin
        if (a<>nil) then
            begin
                ImprimirArbol(a^.HI);
                InformarActual(a^.dato);
                ImprimirArbol(a^.HD);
            end
    end;

// INCISO C
 procedure RetornarMasVendido(a:arbol);
    
    procedure BuscarMaximo(a:arbol; var max,cod_max:integer);
        begin
            if (a<>nil) then
                begin
                    BuscarMaximo(a^.HD,max,cod_max);
                    BuscarMaximo(a^.HI,max,cod_max);
                    if (a^.dato.cant>max)then
                        begin
                            max:= a^.dato.cant;
                            cod_max:=a^.dato.cod;
                        end
                end;
        end;

    var
        max:integer;
        cod_max:integer;
    begin
        max:=-1;
        BuscarMaximo(a,max,cod_max);
        writeln('||||||||||||||||||||||||');
        if (max<>-1) then
            writeln('El codigo de producto con mas unidades vendidas es: ', cod_max)
        else
            writeln('No hay elementos en el arbol');
    end;
// INCISO D
 procedure InformarD(a:arbol);

    function CantidadMenores(a:arbol; num:integer):integer;
        begin
            if(a=nil)then
                CantidadMenores:=0
            else
                if (a^.dato.cod>=num) then
                    CantidadMenores:= 0 + CantidadMenores(a^.HI,num)
                else
                    if (a^.dato.cod<num) then
                        CantidadMenores:=1 + CantidadMenores(a^.HI,num)+CantidadMenores(a^.HD,num);
        end;

    var 
        num:integer;
    begin
        writeln('___________');
        writeln('Ingrese numero para informar cantidad de codigos existentes menores que el ingresado');
        write('Numero: ');readln(num);
        writeln('|');
        writeln('|');
        writeln('Resultado: ', CantidadMenores(a,num));
    end;

// INCISO E
 procedure InformarTotal(a:arbol);

    function CalcularTotal(a:arbol; n1,n2:integer):real;
        begin
            if (a=nil) then
                CalcularTotal:=0
            else
                if (a^.dato.cod>n1) and (a^.dato.cod<n2) then
                    CalcularTotal:= a^.dato.total + CalcularTotal(a^.HI,n1,n2) + CalcularTotal(a^.HD,n1,n2)
                else
                    if not(a^.dato.cod>n1) then
                        CalcularTotal:= CalcularTotal(a^.HD,n1,n2)
                    else
                        CalcularTotal:=CalcularTotal(a^.HI,n1,n2);
        end;
        
    var 
        n1,n2:integer;
    begin
        writeln('||||||||||||||||||||||||||||||||||||||||||');
        writeln('||||||||||||||||||||||||||||||||||||||||||');
        writeln('-----------Ingrese dos numeros-----------');
        write('Numero 1: '); readln(n1);
        write('Numero 2: '); readln(n2);
        writeln();
        writeln('Monto total recaudado por los productos con codigo entre valores brindados: ');
        write('$',CalcularTotal(a,n1,n2):8:2);
    end;
var 
    a:arbol;
begin
    randomize;
// --- Inciso A
    a:=nil;
    GenerarEstructura(a);

// --- Inciso B
    ImprimirArbol(a);

// --- Inciso C
    RetornarMasVendido(a);

// --- Inciso D
    InformarD(a);

// --- Inciso E
    InformarTotal(a);
end.