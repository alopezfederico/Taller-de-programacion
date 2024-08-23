{2.- 

El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de 
las expensas de dichas oficinas.  Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se  ingresa  el  código  de  identificación,  DNI  del  propietario  y  valor  de  la  expensa.
La  lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa. 

b.  Ordene  el  vector,  aplicando  el  método  de  inserción,  por  código  de  identificación  de  la 
oficina. 

c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program Actividad2;

const
    dimF = 300;
    corte = -1;
type
    reg_oficina = record
        codigo:integer;
        dni:integer;
        expensa:real;
        end;

    vector = Array[1..dimF] of reg_oficina;

procedure GenerarVector(var v:vector; var dimL:integer);
    
    procedure Lectura(var reg:reg_oficina);
        begin
            write('Ingrese codigo de identificacion: '); reg.codigo:= random(50)-1; writeln(reg.codigo);//readln(reg.codigo);
            if (reg.codigo<>corte) then
                begin
                    write('Ingrese DNI del propietario: '); reg.dni:= random(100)-1; writeln(reg.dni); //readln(reg.dni);
                    write('Ingrese valor de la expensa: '); reg.expensa:= random(30000); writeln(reg.expensa:5:2);//readln(reg.expensa);
                end;
        end;

    var
        reg:reg_oficina;
    begin
        Lectura(reg);
        dimL:= 0;
        while (reg.codigo <> corte) and (dimL < dimF) do
            begin
                dimL:= dimL + 1;
                v[dimL]:= reg;
                Lectura(reg);
            end;
    end;

procedure OrdenarVectorINSERCION(var v:vector; dimL:integer); //INSERCION
    var
        i,j: integer;
        actual: reg_oficina;
    begin
        for i:= 2 to dimL do
            begin
                actual:= v[i];
                j:= i-1;
                while (j>0) and (v[j].codigo > actual.codigo) do
                    begin
                        v[j+1]:= v[j];
                        j:=j-1;
                    end;
                v[j+1]:=actual;
            end;
    end;

procedure OrdenarVectorSELECCION (var v:vector; dimL:integer); //SELECCION
    var
        i,j,p:integer;
        item:reg_oficina;
    begin
        for i:= 1 to dimL-1 do
            begin
                p:=i;
                for j:= i+1 to dimL do
                    if (v[j].codigo < v[p].codigo)then
                        p:=j;
                item:=v[p];
                v[p]:= v[i];
                v[i]:= item;
            end;
    end;


procedure ImprimirVector(v:vector; dimL:integer);
    var 
        x:integer;
    begin
        for x:= 1 to dimL do
            begin
                writeln('Codigo: ', v[x].codigo);
                writeln('DNI: ',v[x].dni);
                writeln('Expensa: ',v[x].expensa:5:2);
            end;
    end;

var 
    v:vector;
    dimL:integer;
begin
    randomize;
    GenerarVector(v,dimL);
    ImprimirVector(v,dimL);
    writeln('Vector Normal');
    writeln;
    writeln;
    OrdenarVectorINSERCION(v,dimL);
    ImprimirVector(v,dimL);
    writeln('Vector Ordenado Insercion');
    writeln;
    writeln;    
    OrdenarVectorSELECCION(v,dimL);
    writeln('Vector Ordenado Seleccion');
    writeln;
    writeln; 
    ImprimirVector(v,dimL);
end.