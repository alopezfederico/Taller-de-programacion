{Descargar el programa ImperativoEjercicioClase3.pas de la clase anterior e incorporar lo
necesario para:

i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.

ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.

iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.

iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
leídos y retorne la cantidad solicitada.
}

Program Ejercicio2;

type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure GenerarArbol (var a: arbol);
 { Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
 nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
 aleatoriamente. }

    Procedure CargarSocio (var s: socio);
    var 
        vNombres:array [0..9] of string = ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
    begin
        s.numero:= random (51) * 100;
        If (s.numero <> 0)
        then begin
            s.nombre:= vNombres[random(10)];
            s.edad:= 12 + random (79);
            end;
    end;  
    
    Procedure InsertarElemento (var a: arbol; elem: socio);
    Begin
        if (a = nil) then
            begin
            new(a);
            a^.dato:= elem; 
            a^.HI:= nil; 
            a^.HD:= nil;
            end
        else 
            if (elem.numero < a^.dato.numero) then
                InsertarElemento(a^.HI, elem)
            else
                InsertarElemento(a^.HD, elem); 
    End;

    var 
        unSocio: socio;  
    Begin
    writeln; writeln ('----- Ingreso de socios y armado del arbol ----->');writeln;
    a:= nil;
    CargarSocio (unSocio);
    while (unSocio.numero <> 0)do
    begin
    InsertarElemento (a, unSocio);
    CargarSocio (unSocio);
    end;
    writeln;
    writeln ('//////////////////////////////////////////////////////////');
    writeln;
    end;

procedure InformarSociosOrdenDecreciente(a:arbol);

    procedure InformarDatosSociosOrdenDecreciente(a:arbol);
        begin
             if (a<>nil) and (a^.HD<>nil) then
                InformarDatosSociosOrdenDecreciente(a^.HD);
             writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
             if (a<>nil) and (a^.HI<>nil) then
                InformarDatosSociosOrdenDecreciente(a^.HI);
        end;

    begin
        writeln;
        writeln ('----- Socios en orden decreciente por numero de socio ----->');
        writeln;
        InformarDatosSociosOrdenDecreciente(a);
        writeln;
        writeln ('//////////////////////////////////////////////////////////');
        writeln; 
    end;


procedure InformarSociosOrdenCreciente (a: arbol);
 { Informar los datos de los socios en orden creciente. }
  
    procedure InformarDatosSociosOrdenCreciente (a: arbol);
    begin
        if ((a <> nil) and (a^.HI <> nil))then 
            InformarDatosSociosOrdenCreciente (a^.HI);
        writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
        if ((a <> nil) and (a^.HD <> nil)) then 
            InformarDatosSociosOrdenCreciente (a^.HD);
    end;

    Begin
    writeln;
    writeln ('----- Socios en orden creciente por numero de socio ----->');
    writeln;
    InformarDatosSociosOrdenCreciente (a);
    writeln;
    writeln ('//////////////////////////////////////////////////////////');
    writeln;
    end;


procedure InformarNumeroSocioConMasEdad (a: arbol);
 { Informar el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

        procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
        begin
        if (nuevoValor >= maxValor) then
        begin
            maxValor := nuevoValor;
            maxElem := nuevoElem;
        end;
        end;
        procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
        begin
        if (a <> nil) then
        begin
            actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
            numeroMasEdad(a^.hi, maxEdad,maxNum);
            numeroMasEdad(a^.hd, maxEdad,maxNum);
        end; 
        end;

    var maxEdad, maxNum: integer;
    begin
    writeln;
    writeln ('----- Informar Numero Socio Con Mas Edad ----->');
    writeln;
    maxEdad := -1;
    NumeroMasEdad (a, maxEdad, maxNum);
    if (maxEdad = -1) 
    then writeln ('Arbol sin elementos')
    else begin
            writeln;
            writeln ('Numero de socio con mas edad: ', maxNum);
            writeln;
        end;
    writeln;
    writeln ('//////////////////////////////////////////////////////////');
    writeln;
    end;

procedure AumentarEdadNumeroImpar (a: arbol);
    {Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad.}  


    
    function AumentarEdad (a: arbol): integer;
    var 
        resto: integer;
    begin
        if (a = nil) then
            AumentarEdad:= 0
        else
            begin
                resto:= a^.dato.edad mod 2;
                if (resto = 1) then
                    a^.dato.edad:= a^.dato.edad + 1;
                AumentarEdad:= resto + AumentarEdad (a^.HI) + AumentarEdad (a^.HD);
            end;  
    end;

    begin
    writeln;
    writeln ('----- Cantidad de socios con edad aumentada ----->');
    writeln;
    writeln ('Cantidad: ', AumentarEdad (a));
    writeln;
    writeln;
    writeln ('//////////////////////////////////////////////////////////');
    writeln;
    end;

procedure InformarExistenciaNombreSocio(a:arbol);
    {Leer un nombre e informar si existe o no existe un socio con ese nombre.
     Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.}

    function Existe(a:arbol; nombre: cadena15):boolean;

        begin
            if (a = nil)  then
                Existe:=false
            else
                if (a^.dato.nombre = nombre) then
                    Existe:=True
            else
                Existe:= Existe(a^.HI,nombre) or Existe(a^.HD,nombre);
        end;

    var 
        nombre:cadena15;
    begin
        write('Ingrese nombre: '); readln(nombre);
        if (Existe(a,nombre)) then
            writeln('El nombre se encuentra en el arbol')
        else 
            writeln('El nombre no se encuentra en el arbol');
    end;

procedure InformarCantidadSocios(a:arbol);
{Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.}
    function cantidad(a:arbol):integer;
        begin
            if (a=nil) then
                cantidad:=0
            else 
                cantidad:= 1 + cantidad(a^.HI) + cantidad(a^.HD);
        end;

    begin
        writeln();
        writeln('/////////////////////////////////////'); writeln();
        writeln('Cantidad de socios: ', cantidad(a));writeln();
        writeln('/////////////////////////////////////');writeln();
    end;

procedure InformarPromedioDeEdad(a:arbol);

    function cantidad(a:arbol):integer;
        begin
            if (a=nil) then
                cantidad:=0
            else 
                cantidad:= 1 + cantidad(a^.HI) + cantidad(a^.HD);
        end;

    function suma(a:arbol):integer;
        begin
            if (a=nil) then
                suma:=0
            else 
                suma:= a^.dato.edad + suma(a^.HI) + suma(a^.HD);
        end;

    begin
        writeln('Edad promedio de los socios: ', suma(a)/cantidad(a):3:2); writeln();
        writeln('/////////////////////////////////////');writeln();
    end;

// MODULOS Practica4
// i
 function NumSocio(a:arbol):integer;
  {i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
  retorne dicho valor.
  } 
    begin
        if (a=nil) then
            NumSocio:= -1
        else
            if (a^.HD<>nil) then
                NumSocio:=NumSocio(a^.HD)
            else 
                NumSocio:= a^.dato.numero;
    end;
// ii 
 procedure InformarSocioMasChico(a:arbol);
    begin
        if (a<>nil) then
            if (a^.HI<>nil) then
                InformarSocioMasChico(a^.HI)
            else
                begin
                    writeln('Nombre del socio: ', a^.dato.nombre);
                    writeln('Numero de socio: ', a^.dato.numero);
                    writeln('Edad del socio: ', a^.dato.edad);
                end;
    end;
// iii
 procedure InformarExistenciaNumeroSocio(a:arbol);
    {iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
 invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
 }
    function ExisteNumero(a:arbol; num:integer):boolean;
        begin   
            if (a=nil) then
                ExisteNumero:=False
            else
                if (a^.dato.numero > num) then
                    ExisteNumero:= ExisteNumero(a^.HI,num)
                else 
                    if(a^.dato.numero < num) then
                        ExisteNumero:= ExisteNumero(a^.HD,num)
                    else
                        if(a^.dato.numero = num)then
                            ExisteNumero:=True;            
        end;

    var
        num: integer;
    begin
        writeln();writeln();
        writeln('Ingrese numero de socio a buscar: '); readln(num);
        writeln();
        if (ExisteNumero(a,num)) then
            writeln('El numero de socio existe')
        else
            writeln('El numero de socio no existe');
    end;

// iv
 procedure InformarEntreValores(a:arbol);
    {Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
 entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
 leídos y retorne la cantidad solicitada.}
    function SociosDentro(a:arbol; n1,n2:integer):integer;
        begin
            if (a=nil) then
                SociosDentro:=0
            else
                if (a^.dato.numero>n1) and (a^.dato.numero<n2) then
                    SociosDentro:= 1 + SociosDentro(a^.HI,n1,n2) + SociosDentro(a^.HD,n1,n2)
                else
                    if not(a^.dato.numero>n1) then
                        SociosDentro:= 0 +SociosDentro(a^.HD,n1,n2)
                    else 
                        if not (a^.dato.numero<n2) then
                            SociosDentro:= 0 + SociosDentro(a^.HI,n1,n2);                
        end;

    var
        n1,n2:integer;
    begin
        writeln();
        writeln();
        writeln('___ SOCIOS ENTRE VALORES___');
        writeln('Ingrese valor 1: '); readln(n1);
        writeln('Ingrese valor 2: '); readln(n2);
        writeln('____________________________');
        writeln('Cantidad de socios entre los valores ingresados: ',SociosDentro(a,n1,n2));
    end;

var
     a: arbol; 

Begin
     randomize;
     GenerarArbol (a);
     InformarSociosOrdenCreciente (a);
     InformarSociosOrdenDecreciente (a);
     InformarNumeroSocioConMasEdad (a);
     AumentarEdadNumeroImpar (a);
     InformarExistenciaNombreSocio (a);  
     InformarCantidadSocios (a);  
     InformarPromedioDeEdad (a);  

//-----> Practica 4
// Inciso i
    writeln();writeln();
    writeln('El numero de socio mas grande es: ',NumSocio(a));
    writeln();writeln();
// Inciso ii
    writeln();writeln();
    InformarSocioMasChico(a);
// Inciso iii
    InformarExistenciaNumeroSocio(a);
// Inciso iv
    InformarEntreValores(a);
End.