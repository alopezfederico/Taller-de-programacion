{El administrador de un edificio de oficinas tiene la información del 
pago de las expensas de dichas oficinas. Implementar un programa con:

a) Un módulo que retorne un VECTOR, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar
para cada oficina:
código de identificación
DNI del propietario
valor de la expensa. 

La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}

program Ejercicio1;
const 
    dimF = 300;
    corte = 0;
type

    oficina = record
        codigo: integer;
        dni:integer;
        expensa:real;
        end;

    vector = Array[1..dimF] of oficina;

procedure GenerarEstructura(var v:vector);

    procedure InicializarVector(var v:vector);
        var
            dimL:integer;
        begin
            for dimL:= 1 to dimF do
                begin
                    v[dimL].codigo:=-1;
                    v[dimL].dni:=-1;
                    v[dimL].expensa:=-1;
                end;
        end;
    procedure LeerOficina(var o:oficina);
        begin
            write('Ingrese codigo de identificacion de la oficina: '); o.codigo:= random(1000); writeln(o.codigo);
            if (o.codigo <> corte) then
                begin
                    write('Ingrese DNI del propietario: '); o.dni:= random(10000); writeln(o.dni);
                    write('Ingrese monto de la expensa: $'); o.expensa:= random(30000)+10000; writeln(o.expensa:6:2);
                    writeln('_______________________________');writeln();
                end;
        end;

    var 
        o:oficina;
        dimL:integer;
    begin
        InicializarVector(v);
        LeerOficina(o);
        dimL:=0;
        while (o.codigo <> corte) and (dimL<>dimF) do
            begin
                dimL:=dimL+1;
                v[dimL]:=o;
                LeerOficina(o);
            end;
    end;


var 
    v:vector;
begin
    GenerarEstructura(v);
end.