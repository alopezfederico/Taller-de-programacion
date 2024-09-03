{4.Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:

a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).

b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.

f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

program Ejercicio4;
const
    corte = 0;
    anio_ = 2021;
type
    rango_dia = 1..31;
    rango_mes = 1..12;
    
// Arbol i
   {i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos insertarlos a la derecha.}

    prestamo = record
        isbn:integer;
        num_socio:integer;
        dia:rango_dia;
        mes:rango_mes;
        cant_dias:integer;
        end;

    arbol_i = ^NodoArbol_i;
    NodoArbol_i = record
        dato:prestamo;
        HI:arbol_i;
        HD:arbol_i;
        end;

// Arbol ii
 {ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.}

    usuario = record
        num_socio:integer;
        dia:rango_dia;
        mes:rango_mes;
        cant_dias:integer;
        end;

    Lista = ^NodoLista;
    NodoLista = record
        dato:usuario;
        sig:Lista;
        end;

    reg_arbol_ii = record  // El nodo del arbol va a contener el numero del ISBN y el listado de usuarios que tomaron prestado ese libro
        isbn:integer;
        L:Lista;
        end;

    arbol_ii = ^NodoArbol_ii;
    NodoArbol_ii = record
        dato:reg_arbol_ii;
        HI:arbol_ii;
        HD:arbol_ii;
        end;

// Arbol_f
    reg_f = record
        isbn:integer;
        cant:integer;
        end;

    arbol_f = ^Nodo_f;
    Nodo_f = record 
        dato:reg_f;
        HI:arbol_f;
        HD:arbol_f;
        end;

// Arbol_g
    // Para la estructura a generar del inciso G, puedo reutilizar la estructura del Arbol_f


// INCISO A
 procedure GenerarEstructuras(var a_i:arbol_i; var a_ii: arbol_ii);

    procedure LeerPrestamo(var p:prestamo);
        begin
            write('Ingrese ISBN del libro: '); p.isbn:= random(100); writeln(p.isbn);
            if (p.isbn <> corte) then
                begin
                  write('Ingrese numero de socio: '); p.num_socio:= random(100); writeln(p.num_socio);
                  write('Ingrese el dia del prestamo: '); p.dia:= random(31)+1; writeln(p.dia);
                  write('Ingrese el mes del prestamo: '); p.mes:= random(12)+1; writeln(p.mes);
                  write('Ingrese cantidad de dias prestados: '); p.cant_dias:= random(300); writeln(p.cant_dias);
                end;
        end;

    procedure CargarAlArbol_i(var a:arbol_i; p:prestamo);
        begin
            if (a=nil) then
                begin
                    New(a);
                    a^.dato:=p;
                    a^.HI:=nil;
                    a^.HD:=nil;
                end
            else
                if (a^.dato.isbn>p.isbn) then
                    CargarAlArbol_i(a^.HI,p)
                else
                    CargarAlArbol_i(a^.HD,p);
        end;

    procedure PasarDatos( var user:usuario; p:prestamo);
        begin
            user.num_socio:= p.num_socio; 
            user.dia:= p.dia;
            user.mes:= p.mes;
            user.cant_dias:= p.cant_dias;
        end;

    procedure AgregarALista(var L:Lista; user:usuario);
        var 
            nue:Lista;
        begin
            New(nue);
            nue^.dato:=user;
            nue^.sig:=L;
            L:=nue;
        end;

    procedure CargarAlArbol_ii(var a:arbol_ii; isbn:integer; user:usuario);
        begin
            if (a=nil) then
                begin
                    New(a);
                    a^.dato.isbn:= isbn;
                    a^.dato.L:=Nil;
                    AgregarALista(a^.dato.L,user);
                    a^.HI:=nil;
                    a^.HD:=nil;
                end
            else
                if (a^.dato.isbn>isbn) then
                    CargarAlArbol_ii(a^.HI,isbn,user)
                else
                    if(a^.dato.isbn<isbn)then
                        CargarAlArbol_ii(a^.HD,isbn,user)
                    else
                        AgregarALista(a^.dato.L,user);
        end;

    var 
        p:prestamo;
        u:usuario;
    begin
        writeln('GENERANDO ESTRUCTURA');
        writeln('/////////////////////');
        writeln('Carga de informacion'); writeln();
        LeerPrestamo(p);
        while (p.isbn <> corte) do
            begin
                CargarAlArbol_i(a_i,p);
                PasarDatos(u,p);
                CargarAlArbol_ii(a_ii,p.isbn,u);
                LeerPrestamo(p);
                writeln(':::::::::::::::::');
            end;
    end;

// INCISO B
 procedure InformarB(a:arbol_i);

    function ISBN_mas_grande(a:arbol_i):integer;
        begin
            if (a=nil) then
                ISBN_mas_grande:=-1
            else
                if (a^.HD<>nil) then
                    ISBN_mas_grande:=ISBN_mas_grande(a^.HD)
                else
                    ISBN_mas_grande:= a^.dato.isbn;
        end;
    
    begin
        writeln();writeln();
        writeln('TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT');
        writeln('Numero ISBN mas grande encotnrdao: ', ISBN_mas_grande(a));
        writeln('......................................');
    end;

// INCISO C
 procedure InformarC(a:arbol_ii);
    {c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
    pequeño. }
        function ISBN_mas_chico(a:arbol_ii):integer;
            begin
                if(a=nil)then
                    ISBN_mas_chico:=9999
                else
                    if (a^.HI<>nil) then
                        ISBN_mas_chico:=ISBN_mas_chico(a^.HI)
                    else
                        ISBN_mas_chico:= a^.dato.isbn;
            end;

        begin
        writeln();writeln();
        writeln('TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT');
        writeln('Numero ISBN mas chico encotnrdao: ', ISBN_mas_chico(a));
        writeln('......................................');           
        end;

// INCISO D
 procedure InformarD(a:arbol_i);

    function Cant_prestamos_a_usuario(a:arbol_i;num:integer):integer;
        begin
            if (a=nil) then
                Cant_prestamos_a_usuario:=0
            else 
                if (a^.dato.num_socio=num) then
                    Cant_prestamos_a_usuario:= 1 + Cant_prestamos_a_usuario(a^.HD,num) + Cant_prestamos_a_usuario(a^.HI,num)
                else
                    Cant_prestamos_a_usuario:= Cant_prestamos_a_usuario(a^.HD,num) + Cant_prestamos_a_usuario(a^.HI,num);
        end;
    var 
        num:integer;
    begin
        writeln();
        writeln();
        writeln('|||||||||| Usando Arbol_i ||||||||||||');
        writeln('---------------------------------------');
        write('Ingrese un numero de socio: '); readln(num); 
        writeln('......................................');  
        writeln('Cantidad de prestamos que se le brindo al socio ', num,': ',Cant_prestamos_a_usuario(a,num));
    end;


// INCISO E

 procedure InformarE(a:arbol_ii);

    function Prestamos_usuario_lista(L:Lista; num:integer):integer;
        begin
            if (L=nil) then
                Prestamos_usuario_lista:=0
            else
                if (L^.dato.num_socio = num) then
                    Prestamos_usuario_lista:= 1 + Prestamos_usuario_lista(L^.sig,num)
                else 
                    Prestamos_usuario_lista:= Prestamos_usuario_lista(L^.sig,num);
        end;

    function Prestamos_usuario_arbol(a:arbol_ii;num:integer): integer;
        begin
            if(a=nil)then
                Prestamos_usuario_arbol:=0
            else
                Prestamos_usuario_arbol:= Prestamos_usuario_lista(a^.dato.L,num) + Prestamos_usuario_arbol(a^.HI,num) + Prestamos_usuario_arbol(a^.HD,num);
        end;
    var 
        num:integer;
    begin
        writeln();
        writeln();
        writeln('|||||||||| Usando Arbol_ii ||||||||||||');
        writeln('---------------------------------------');
        write('Ingrese un numero de socio: '); readln(num); 
        writeln('......................................');  
        writeln('Cantidad de prestamos que se le brindo al socio ', num,': ',Prestamos_usuario_arbol(a,num));
    end;


// INCISO F

 procedure InformarF (a_i:arbol_i; var a_f:arbol_f);

    procedure Generar_Estru_F(var a:arbol_f; p:prestamo);
        begin
            if (a=nil) then
                begin
                    New(a);
                    a^.dato.isbn:= p.isbn;
                    a^.dato.cant:= 1;
                    a^.HI:=nil;
                    a^.HD:=nil;
                end
            else
                if (a^.dato.isbn>p.isbn) then
                    Generar_Estru_F(a^.HI,p)
                else
                    if (a^.dato.isbn<p.isbn) then
                        Generar_Estru_F(a^.HD,p)
                    else
                        a^.dato.cant:= a^.dato.cant + 1;
        end;

    procedure RecorrerArbol(a_i:arbol_i; var a_f:arbol_f);
        begin
            if (a_i<>nil) then
                begin
                    RecorrerArbol(a_i^.HI,a_f);
                    Generar_Estru_F(a_f, a_i^.dato);
                    RecorrerArbol(a_i^.HD,a_f);
                end;
        end;

    procedure ImprimirEstructuraF(a:arbol_f);
        begin
            if (a<>nil) then
                begin
                    ImprimirEstructuraF(a^.HI);
                    writeln('ISBN: ',a^.dato.isbn,' | Cantidad de prestamos realizados: ', a^.dato.cant);
                    writeln('_____________________________________________________________________|');
                    ImprimirEstructuraF(a^.HD);
                end;
        end;

    begin
        RecorrerArbol(a_i,a_f);
        writeln();
        writeln();
        writeln('/////////// Estructura realizada en INCISO F ///////////');
        ImprimirEstructuraF(a_f);
    end;


// INCISO G 
    
 procedure InformarG(a_ii:arbol_ii; var a_g:arbol_f);

    function ContarPrestamosEnLista(L:Lista):integer;
        begin
            if (L=Nil) then
                ContarPrestamosEnLista:=0
            else
                ContarPrestamosEnLista:= 1 + ContarPrestamosEnLista(L^.sig);
        end;

    procedure Generar_Estru_G(var a:arbol_f; reg:reg_arbol_ii);
        begin
            if (a=nil) then
                begin
                    New(a);
                    a^.dato.isbn:=reg.isbn;
                    a^.dato.cant:=ContarPrestamosEnLista(reg.L);
                    a^.HI:=nil;
                    a^.HD:=nil;
                end
            else
                if (a^.dato.isbn>reg.isbn) then
                    Generar_Estru_G(a^.HI,reg)
                else
                    Generar_Estru_G(a^.HD,reg);
        end;

    procedure RecorrerAbol_G (a_ii:arbol_ii;var a_g:arbol_f);
        begin
            if (a_ii<>nil) then
                begin
                    RecorrerAbol_G(a_ii^.HI,a_g);
                    Generar_Estru_G(a_g,a_ii^.dato);
                    RecorrerAbol_G(a_ii^.HD,a_g);
                end;
        end;
 {h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.}
    procedure ImprimirEstructuraG(a:arbol_f);
        begin
            if (a<>nil) then
                begin
                    ImprimirEstructuraG(a^.HI);
                    writeln('ISBN: ',a^.dato.isbn,' | Cantidad de prestamos realizados: ', a^.dato.cant);
                    writeln('_____________________________________________________________________|');
                    ImprimirEstructuraG(a^.HD);
                end;
        end;

    begin
        RecorrerAbol_G(a_ii,a_g);
        writeln();
        writeln();
        writeln('/////////// Estructura realizada en INCISO G ///////////');
        ImprimirEstructuraG(a_g);
    end;

// INCISO I

 procedure InformarI(a:arbol_i);

    function TotalEntreDosValores_I(a:arbol_i; n1,n2:integer):integer;
        begin
            if(a=nil)then
                TotalEntreDosValores_I:=0
            else
                if (a^.dato.isbn = n1) then
                    TotalEntreDosValores_I:= 1 + TotalEntreDosValores_I(a^.HD,n1,n2)
                else
                    if(a^.dato.isbn = n2) then
                        TotalEntreDosValores_I:= 1 + TotalEntreDosValores_I(a^.HI,n1,n2)
                    else
                        if not (a^.dato.isbn > n1) then
                            TotalEntreDosValores_I:= TotalEntreDosValores_I(a^.HD,n1,n2)
                        else 
                            if not (a^.dato.isbn < n2) then
                                TotalEntreDosValores_I:= TotalEntreDosValores_I(a^.HI,n1,n2)
                        else
                            TotalEntreDosValores_I:= 1 + TotalEntreDosValores_I(a^.HI,n1,n2) + TotalEntreDosValores_I(a^.HD,n1,n2);
        end;

    var
        n1,n2:integer;
    begin
        writeln();
        writeln();
        writeln('---------Ingrese dos numeros---------');
        write('Numero 1: '); readln(n1);
        write('Numero 2: '); readln(n2);
        writeln('----- CANTIDAD DE VALORES ENTRE -----');
        writeln(n1,'...............................',n2);
        writeln('                 ',TotalEntreDosValores_I(a,n1,n2),'                 ');
    end;

// INCISO J
 procedure InformarJ(a:arbol_ii);
 {j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
 comprendidos entre los dos valores recibidos (incluidos).}

    function ContarEnLista_J(L:Lista):integer;
        begin
            if(L=nil)then
              ContarEnLista_J:=0
            else
                ContarEnLista_J:= 1 + ContarEnLista_J(L^.sig);
        end;

    function TotalEntreDosValores_J(a:arbol_ii; n1,n2:integer):integer;
        begin
            if(a=nil)then
                TotalEntreDosValores_J:=0
            else
                if (a^.dato.isbn=n1) then
                    TotalEntreDosValores_J:= ContarEnLista_J(a^.dato.L) + TotalEntreDosValores_J(a^.HD,n1,n2)
                else 
                    if (a^.dato.isbn=n2) then
                        TotalEntreDosValores_J:= ContarEnLista_J(a^.dato.L) + TotalEntreDosValores_J(a^.HI,n1,n2)
                    else
                        if not (a^.dato.isbn > n1) then
                            TotalEntreDosValores_J:= TotalEntreDosValores_J(a^.HD,n1,n2)
                        else
                            if not (a^.dato.isbn < n2) then
                                TotalEntreDosValores_J:= TotalEntreDosValores_J(a^.HI,n1,n2)
                            else
                                TotalEntreDosValores_J:= ContarEnLista_J(a^.dato.L) + TotalEntreDosValores_J(a^.HI,n1,n2)+ TotalEntreDosValores_J(a^.HD,n1,n2);
        end;

    var 
        n1,n2:integer;
    begin
        writeln();
        writeln();
        writeln('---------Ingrese dos numeros---------');
        write('Numero 1: '); readln(n1);
        write('Numero 2: '); readln(n2);
        writeln('----- CANTIDAD DE VALORES ENTRE -----');
        writeln(n1,'...............................',n2);
        writeln('                 ',TotalEntreDosValores_J(a,n1,n2),'                 ');
    end;


var 
    a_i:arbol_i;
    a_ii: arbol_ii;
    a_g,a_f: arbol_f;
begin
    randomize;
// --- Inciso A
    GenerarEstructuras(a_i,a_ii);readln();

// --- Inciso B
    InformarB(a_i);readln();

// --- Inciso C
    InformarC(a_ii);readln();

// --- Inciso D
    InformarD(a_i);readln();

// --- Inciso E
    InformarE(a_ii);readln();

// --- Inciso F
    InformarF(a_i,a_f);readln();

// --- Inciso G
    InformarG(a_ii,a_g);readln();

// --- Inciso I
    InformarI(a_i);readln();

// --- Inciso J
    InformarJ(a_ii);
    writeln('Presione enter para finalizar');
    readln();
    writeln('////////////////////////////');
    writeln('////Prorgama  finalizado////');
    writeln('////////////////////////////');
end.