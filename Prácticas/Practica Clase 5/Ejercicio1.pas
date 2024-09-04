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

// INCISO A
 procedure GenerarEstructura(var v:vector; var dimL:integer);

    procedure InicializarVector(var v:vector);
        var
            x:integer;
        begin
            for x:= 1 to dimF do
                begin
                    v[x].codigo:=-1;
                    v[x].dni:=-1;
                    v[x].expensa:=-1;
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

// INCISO B
 procedure InformarB(var v:vector; dimL:integer);

    procedure Ordenar_Vector_INSERCION(var v:vector; dimL:integer);
        var 
            i,j:integer;
            actual:oficina;
        begin
            for i:= 2 to dimL do
                begin
                    actual:= v[i];
                    j:= i-1;
                    while (j>0) and (v[j].codigo>actual.codigo) do
                        begin
                            v[j+1]:=v[j];
                            j:=j-1;
                        end;
                    v[j+1]:=actual;
                end;
        end;
        
    procedure Ordenar_Vector_SELECCION(var v:vector; dimL:integer);
        var 
            i,j,p:integer;
            item:oficina;
        begin
            for i:= 1 to dimL-1 do
                begin
                    p:=i;
                    for j:= i+1 to dimL do
                        if(v[j].codigo<v[p].codigo) then
                            p:=j;
                    item:=v[p];
                    v[p]:=v[i];
                    v[i]:= item;
                end;
        end;
    var
        x:integer;
    begin
        writeln('----------------------------');
        writeln('---ORDENAMIENTO  VECTORES---');
        Writeln('----------------------------');
        Writeln();
        writeln('Ingrese 1 para elegir metodo INSERCION');
        writeln('Ingrese 2 para elegir metodo SELECCION');
        write('Opcion: ');readln(x);
        while (x<>1)and(x<>2) do
            begin
                write('Valor incorrecto. Ingrese de nuevo: '); 
                readln(x);
            end;

        if (x=1) then
            Ordenar_Vector_INSERCION(v,dimL)
        else 
            Ordenar_Vector_SELECCION(v,dimL);
    end;

// INCISO C
 procedure InformarC(v:vector; dimL:integer);
    {c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
 generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
 retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
 Luego el programa debe informar el DNI del propietario o un cartel indicando que no
 se encontró la oficina.}
    
    function Buscar_en_vector(v:vector; var medio,ini,fin:integer; cod:integer);
        var
        begin
            if (dimL>dimF) then
                Buscar_en_vector:=0
            else
                

        end;


    var 
        cod:integer;
    begin
        writeln('-------INCISO B--------');
        Writeln('Ingrese codigo de identificacion de oficina: '); readln(cod);
        writeln('\\\\\ Buscando codigo de identificacion en el vector /////');
        if (Buscar_en_vector(v,dimL,cod)=0) then
            writeln('La oficina con codigo "',cod,'" NO EXISTE')
            else 
                writeln('La oficina se encuentra en la posicion: ', Buscar_en_vector(v,dimL,cod));
    end;

procedure ImprimirVector(v:vector; dimL:integer);
    var 
        x:integer;
    begin
        writeln('-------IMPRIMIENDO VECTOR--------');
        for x:= 1 to dimL do
            begin   
                writeln();
                writeln('Codigo de identificacion: ',v[x].codigo);
                writeln('DNI del propietario: ',v[x].dni);
                writeln('Monto de expensa: ', v[x].expensa:6:2);
                writeln('______________________________|');
            end;
    end;



var 
    v:vector;
    dimL:integer;
begin
//--- Inciso A
    GenerarEstructura(v,dimL);
    ImprimirVector(v,dimL);
//--- Inciso B
    InformarB(v,dimL);
    ImprimirVector(v,dimL);
//--- Inciso C


end.