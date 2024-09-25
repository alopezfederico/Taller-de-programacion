{Una clinica necesita un sistema para el procesamiento de las atenciones realizadas
a los pacientes durante el año 2023

a) implementar un modulo que lea las atenciones y retorne un vector donde se almacenen
las atenciones agrupadas por mes. Las atenciones de cada mes deben quedar alacenadas en un 
arbol binario de busqueda ordenado por DNI del paciente y solo deben almacenarse dni
del paciente y codigo de diagnostico.

De cada atencion se lee: 
matricula del medico, 
dnio del paciente
mes
y diagnostico (valor enre L y P).


 La lectura finaliza con matricula 0


b) Implementar un modulo recursivo que reciba el vector generado en a y retorne el mes con mayor
cantidad de atenciones


c) IMplementar un modulo que reciba un vector generado en a y un DNI de paciente, y retorne si 
fue atendido o no, el paciente con el DNI ingresado}


program Parcial;
const
    corte = 0;

type
    rango_mes = 1..12;

    atencion = record
        matricula:integer;
        DNI:integer;
        mes:integer;
        cod_diagnostico:char;
        end;
    
    paciente = record   
        dni:integer;
        cod_diagnostico:char;
        end;

    Arbol = ^NodoArbol;    

    NodoArbol = record
        dato:paciente;
        HI:Arbol;
        HD:Arbol;
        end;

    Vector = Array [rango_mes] of Arbol;

procedure InicializarVector(var v:vector; dimL:integer);
    begin 
        if (dimL>0) then
            begin
                InicializarVector(v,dimL-1);
                v[dimL]:=nil;
            end;
    end;


procedure GenerarEstructura(var v:vector);

    procedure Lectura(var a:atencion);
        var 
            vec:array[1..5] of char = ('L','M','N','O','P');
        begin
            writeln('________________________');
            write('Ingrese el numero de matricula: '); a.matricula:= random(100); writeln(a.matricula);
            if (a.matricula <> corte) then
                begin 
                    write('ingrese numero de dni: '); a.dni:= random(100); writeln(a.dni);
                    write('ingrese mes: '); a.mes:= random(12)+1; writeln(a.mes);
                    write('ingrese codigo de diagnostico: '); A.cod_diagnostico:= vec[random(5)+1]; writeln(a.cod_diagnostico);
                end;
            writeln('________________________Salida');
        end;

    procedure PasarDatos(a:atencion; var p:paciente);
        begin
            p.dni:=a.dni;
            p.cod_diagnostico:=a.cod_diagnostico;
        end;

    procedure AgregarAlVector(var a:arbol; p:paciente);
        begin
            if (a=nil) then
                begin
                    New(a);
                    a^.dato:=p;
                    a^.HI:=nil;
                    a^.HD:=nil;
                end
            else 
                if (p.dni >a^.dato.dni) then
                    AgregarAlVector(a^.HD,p)
                else
                    AgregarAlVector(a^.HI,p);                
        end;

    var
        a:atencion; 
        p:paciente;
    begin
        Lectura(a);
        while (a.matricula<>corte) do
            begin
                PasarDatos(a,p);
                AgregarAlVector(v[a.mes],p);
                Lectura(a);
                Writeln('Segunda lectura'); 
            end;
        writeln('SALIDA');
    end;
//---------------------------------------  A


{b) Implementar un modulo recursivo que reciba el vector generado en a y retorne el mes con mayor
cantidad de atenciones}

procedure IncisoB(v:vector; var mes_max: integer);

    function CantidadAtenciones (a:arbol):integer;
        begin
            if(a=nil)then
                CantidadAtenciones:=0
            else
                CantidadAtenciones:= 1 + CantidadAtenciones(a^.HI)+ CantidadAtenciones(a^.HD);
        end;

    procedure ActualizarMax(var mes_max,cant_max:integer; mes,cant:integer );
        begin
            if (cant>cant_max) then
                begin
                    mes_max:=mes;
                    cant_max:=cant;
                end;
        end;

    var
        cant_max,cant:integer;
        x:integer;
    begin
        cant_max:=-1;
        for x:= 1 to 12 do
          begin
                cant:= CantidadAtenciones(v[x]);
                ActualizarMax(mes_max,cant_max,x,cant);
          end;
    end;




//------------------------------------------- B
{c) IMplementar un modulo que reciba un vector generado en a y un DNI de paciente, y retorne si 
fue atendido o no, el paciente con el DNI ingresado}

function IncisoC(v:vector;dni:integer):boolean;

    function Existe(a:arbol; dni:integer):boolean;
        begin
            if (a=nil) then
                Existe:=False
            else
                if (a^.dato.dni = dni) then
                    Existe := True
                else 
                    if (dni>a^.dato.dni ) then
                        Existe:= Existe(a^.HD,dni)
                    else
                        Existe:= Existe(a^.HI,dni)
        end;

{    function DNI_encontrado (v:vector;dimL,dni:integer): boolean;
        begin
            DNI_encontrado:=False;
            if (dimL>0)and(not DNI_encontrado) then
                begin
                    DNI_encontrado:=Existe(v[diml],dni);
                    DNI_encontrado(v,dimL-1,dni);
                end;
        end;}

    procedure DNI_encontrado (v:vector;dimL,dni:integer; var atendido:boolean);
        begin
            if (dimL>0)and(not atendido) then
                begin
                    atendido:=Existe(v[diml],dni);
                    DNI_encontrado(v,dimL-1,dni,atendido);
                end;
        end;

    var 
        atendido:boolean;
    begin
        atendido:=false;
        DNI_encontrado(v,12,dni,atendido);
        if (atendido) then
            IncisoC:=True
        else 
            IncisoC:=false;
    end;


var 
    v:vector;
    dni,dimL:integer;
    mes_max:integer;
begin
    randomize;
    dimL:=12;
    InicializarVector(v,dimL);
    GenerarEstructura(v);
    IncisoB(v,mes_max);
    writeln('Mes maximo: ',mes_max);
    writeln();
    writeln();
    writeln();
    writeln();
    write('Ingrese dni: '); readln(dni);
    if (IncisoC(v,dni)) then
        writeln('__________________DNI ENCONTRADO__________________')
    else 
        writeln('__________________DNI NO ENCOTNRADO__________________');
end.