{
Escribir un programa que:

a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.

b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida

c. 
Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.

Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.
}

program Ejercicio2;

type 
    fecha_ = record
        dia:integer;
        mes:integer;
        anio:integer;
        end;

    venta_i = record
        codigo:integer;
        fecha: fecha_;
        cant: integer;
        end;

    arbol_i= ^Nodo_i;
    Nodo_i = record
        dato:venta_i;
        HI:arbol_i;
        HD:arbol_i;
        end;
        //----------------------------------
    venta_ii = record
        codigo:integer;
        cant:integer;
        end;

    arbol_ii= ^Nodo_ii;
    Nodo_ii = record
        dato:venta_ii;
        HI:arbol_ii;
        HD:arbol_ii;
        end;
    
        //----------------------------------
    reg_lista = record
        fecha:fecha_;
        cant:integer;
        end;

    L_ = ^NodoL;
    NodoL = record
        dato:reg_lista;
        sig:L_;
        end;

    venta_iii = record
        codigo:integer;
        L:L_;
        end;

    arbol_iii= ^Nodo_iii;
    Nodo_iii = record
        dato:venta_iii;
        HI:arbol_iii;
        HD:arbol_iii;
        end;
        

    
procedure GenerarEstructura(var a_i:arbol_i; var a_ii: arbol_ii; var a_iii: arbol_iii); 

    procedure CargarVenta(var venta:venta_i);
        begin
            writeln('---------------------------');
            write('Ingrese codio de producto: '); venta.codigo:= random(10000); writeln(venta.codigo);
            if (venta.codigo<>0) then
                begin
                    writeln('--Fecha--');
                    write('Ingrese Dia: '); venta.fecha.dia:= random(31)+1; writeln(venta.fecha.dia);
                    write('Ingrese Mes: '); venta.fecha.mes:= random(12)+1; writeln(venta.fecha.mes);
                    write('Ingrese Anio: '); venta.fecha.anio:= random(12)+1; writeln(venta.fecha.anio);
                    write('Ingrese cantidad de unidades vendidos: '); venta.cant:= random(1000); writeln(venta.cant);
                end;
        end;

    procedure InsertarElemento_i(var a:arbol_i; venta:venta_i);
     {i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
        producto. Los códigos repetidos van a la derecha.}
        begin
            if (a=nil) then
                begin
                    New(a);
                    a^.dato:= venta;
                    a^.HI:= nil;
                    a^.HD:= nil;
                end
            else
                if (venta.codigo < a^.dato.codigo)then
                    InsertarElemento_i(a^.HI, venta)
                else 
                    InsertarElemento_i(a^.HD, venta);
        end;

    procedure InsertarElemento_ii(var a:arbol_ii; venta:venta_ii);
        {ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
        código de producto. Cada nodo del árbol debe contener el código de producto y la
        cantidad total de unidades vendidas.}
        begin
            if(a=nil)then
                begin
                    New(a);
                    a^.dato.codigo:= venta.codigo;
                    a^.dato.cant:= venta.cant;
                    a^.HI:= nil;
                    a^.HD:= nil;
                end
            else
                if (venta.codigo < a^.dato.codigo)then
                    InsertarElemento_ii(a^.HD, venta)
                else 
                    if (venta.codigo > a^.dato.codigo) then
                        InsertarElemento_ii(a^.HI, venta)
                    else 
                        a^.dato.cant := a^.dato.cant + venta.cant;
        end;
    
    Procedure InsertarEnLista(var L:L_; venta:reg_lista);
        var 
            nue:L_;
        begin
            New(nue);
            nue^.dato:=venta;
            nue^.sig:=L;
            L:=nue;
        end;

    procedure InsertarElemento_iii(var a:arbol_iii; venta:venta_iii; reg:reg_lista);
     {iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
        código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
        las ventas realizadas del producto.}
        begin
            if (a=nil) then
                begin
                    New(a);
                    a^.dato:= venta;
                    InsertarEnLista(a^.dato.l,reg);
                    a^.HI:=nil;
                    a^.HD:=nil;
                end
            else
                if (venta.codigo<a^.dato.codigo) then
                    InsertarElemento_iii(a^.HI,venta,reg)
                else 
                    if (venta.codigo > a^.dato.codigo) then
                        InsertarElemento_iii(a^.HD,venta,reg)
                    else 
                    // Inserto en "la lista del arbol" con mismo codigo, la venta nueva                          
                         InsertarEnLista(a^.dato.l,reg);  
        end;

    var 
        v_i:venta_i;
        v_ii:venta_ii;
        v_iii:venta_iii;
        reg:reg_lista;
    begin
        writeln(); writeln('---- Ingreso de ventas y armado del arbol ----'); writeln();
        a_i:=nil;
        a_ii:=nil;
        a_iii:=nil;
        CargarVenta(v_i);
        while (v_i.codigo<>0) do
            begin
                InsertarElemento_i(a_i,v_i);

                v_ii.codigo:= v_i.codigo;
                v_ii.cant:= v_i.cant;
                InsertarElemento_ii(a_ii,v_ii);
                
                v_iii.codigo:=v_i.codigo;
                v_iii.L:=nil;
                reg.cant:=v_i.cant;
                reg.fecha:= v_i.fecha;
                InsertarElemento_iii(a_iii,v_iii,reg);

                CargarVenta(v_i);
            end;
        writeln();writeln('////////////////////////////////////////////////'); writeln();
    end;

function CantidadEnFecha(a:arbol_i; f:fecha_):integer;
    var
        suma:integer;
    begin
        if (a=nil) then
            CantidadEnFecha:=0
        else
            begin
                if (a^.dato.fecha.dia = f.dia) and (a^.dato.fecha.mes = f.mes) and (a^.dato.fecha.anio = f.anio) then
                   suma:= a^.dato.cant
                else 
                    suma:= 0;
                CantidadEnFecha:= suma + CantidadEnFecha(a^.HI,f) + CantidadEnFecha(a^.HD,f);
            end;
    end;
 {b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
 total de productos vendidos en la fecha recibida}

var 
    a_i:   arbol_i;
    a_ii:  arbol_ii;
    a_iii: arbol_iii;
    fecha:fecha_;
begin
    randomize;
    GenerarEstructura(a_i,a_ii,a_iii);
    writeln('/////////////////////');
    writeln('Ingrese Fecha a buscar');
    write('Dia: ');readln(fecha.dia);
    write('Mes: ');readln(fecha.mes);
    write('Anio: ');readln(fecha.anio);
    writeln();writeln('//////////////////');
    writeln('Cantidad de productos vendidos en la fecha ingresada: ', CantidadEnFecha(a_i,fecha));
end.