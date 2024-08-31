{Implementar un programa que contenga:

a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. 
La información que se lee es
 legajo, 
 código de materia, 
 fecha 
 nota. 

La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.

b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.

c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).

d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program Ejercicio3;
const
    corte = 0;
type
//----Lista------
    fecha_ = record
        dia:integer;
        mes:integer;
        anio:integer;
        end;

    final_=record
        legajo:integer;
        codigo:integer;
        fecha:fecha_;
        nota:integer;
        end;        

    Lista_ = ^NodoLista;

    NodoLista = record
        dato:final_;
        sig:Lista_;
        end;

//----Arbol------
    reg_arbol = record
        legajo:integer;
        L:Lista_;
        end;

    arbol = ^NodoArbol;
    NodoArbol = record
        dato:reg_arbol;
        HI:arbol;
        HD:arbol;
    end;
        

procedure GenerarEstructura(var a:arbol);

    procedure CargarFinal(var final:final_);
        begin
            write('Ingrese numero de legajo: '); final.legajo:= random(1000); writeln(final.legajo); //readln(final.legajo)
            if(final.legajo<>corte)then
                begin
                    write('| Ingrese codigo de materia: '); final.codigo:= random(50); writeln(final.codigo); //readln(final.codigo)
                    writeln('|                                  |');
                    writeln('| --Ingrese fecha del final--');
                    write('| Dia: '); final.fecha.dia:=random(31)+1; writeln(final.fecha.dia); //readln(final.fecha.dia)
                    write('| Mes: '); final.fecha.mes:=random(12)+1; writeln(final.fecha.mes); //readln(final.fecha.mes)
                    write('| Anio: '); final.fecha.anio:=random(50)+1974; writeln(final.fecha.anio); //readln(final.fecha.anio)
                    writeln('|                                  |');
                    write('| Ingrese nota del final: '); final.nota:= random(10)+1; writeln(final.nota); //readln(final.nota)
                    writeln('|__________________________________|');
                end;
        end;

    procedure CargarALista(var L:Lista_; final:final_);
        var 
            nue:Lista_;
        begin
            New(nue);
            nue^.dato:=final;
            nue^.sig:=L;
            L:=nue;
        end;
    
    procedure CargarAlArbol(var a:arbol; final:final_);
        begin
            if (a=nil) then
                begin
                    new(a);
                    a^.dato.legajo:=final.legajo;
                    a^.dato.L:=nil;
                    CargarALista(a^.dato.L,final);
                    a^.HI:=nil;
                    a^.HD:=nil;
                end
            else
                if (final.legajo<a^.dato.legajo) then
                    CargarAlArbol(a^.HI,final)
                else
                    if(final.legajo>a^.dato.legajo) then
                        CargarAlArbol(a^.HD,final)
                    else
                        CargarALista(a^.dato.L,final);
        end;

    var 
        final:final_;
    begin
        CargarFinal(final);
        while (final.legajo<>corte) do
            begin
                CargarAlArbol(a,final);
                CargarFinal(final);
            end;
    end;

function CantAlumnosImpar(a:Arbol):integer;
    {b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
    legajo impar.}
    var 
        resto:integer;
    begin
        if (a=nil) then
            CantAlumnosImpar:=0
        else
            begin
                resto:= a^.dato.legajo mod 2;
                CantAlumnosImpar:= resto + CantAlumnosImpar(a^.HI) + CantAlumnosImpar(a^.HD);
            end;
    end;

procedure InformarAlumnos(a:arbol);
    {c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
    su cantidad de finales aprobados (nota mayor o igual a 4).}
    function Aprobados(L:Lista_):integer;
        var
            suma:integer;
        begin
            if (L=nil) then
                Aprobados:=0
            else
                begin      
                    if (L^.dato.nota >= 4) then
                        suma:=1
                    else 
                        suma:=0;
                    Aprobados:= suma + Aprobados(L^.sig);
                end;
                  
        end;

    begin
        if (a<>nil) then
            begin
                InformarAlumnos(a^.HI);
                writeln('______________________');
                writeln('LEGAJO DE ALUMNO: ',a^.dato.legajo);
                writeln('Cantidad de finales aprobados: ',Aprobados(a^.dato.L));
                InformarAlumnos(a^.HD);                
            end;
    end;

procedure InformarPromedios(a:arbol; num:real);
    {d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
    retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}
    function Promedio(L:Lista_; var cant:real):real;
        begin
            if (L=nil) then
                begin
                  Promedio:=0;
                  cant:=0;
                end
            else
                begin
                    Promedio:=Promedio(L^.sig,cant);                   
                    cant:=cant+1;
                    Promedio:= Promedio + L^.dato.nota;  // PPrincipal: if promedio/cant > cant)
                end;
        end;

    var 
        cant:real;
        prom:real;
    begin
        if (a<>nil)then
            begin
                InformarPromedios(a^.HI,num);
                prom:= Promedio(a^.dato.L,cant) / cant;
                if (prom>num) then
                    begin
                        writeln('//////////');
                        writeln('Numero de legajo: ',a^.dato.legajo);
                        writeln('Promedio del alumno: ',prom:2:2);
                    end;
                InformarPromedios(a^.HD,num);
            end;
    end;

var 
    a:arbol;
    num:real;
begin
    randomize;
    a:=nil;
//--- Inciso A
    GenerarEstructura(a);
//--- Inciso B
    writeln('////////////////////');
    writeln('Cantidad de alumnos con legajo impar: ',CantAlumnosImpar(a));

//--- Inciso C
    InformarAlumnos(a);

//--- Inciso D
    write('Ingrese numero para comparar promedio: '); readln(num);
    InformarPromedios(a,num);
end.