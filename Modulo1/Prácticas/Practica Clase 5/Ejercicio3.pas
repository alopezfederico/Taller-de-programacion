{3. Un supermercado requiere el procesamiento de sus productos. 

De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados
}
program Ejercicio3;
const
	corte  = 0;
type
	rango_rubro = 1..10;
	
	producto = record
		codigo:integer;
		rubro:rango_rubro;
		stock:integer;
		precio:real;
		end;
	
	arbol = ^Nodoarbol;
	
	Nodoarbol = record
		dato:producto;
		HI:arbol;
		HD:arbol;
		end;
	
	vector = Array [rango_rubro] of arbol;
	
//--------------------------------------------------------------------------------INCIO IncisoA
{a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.}

procedure Generar_estructura(var v:vector);
	
	procedure Lectura(var p:producto);
		begin
			write('Ingrese codigo de producto: '); p.codigo:= random(1000); writeln(p.codigo);
			if (p.codigo <> corte) then
				begin
					write('Ingrese rubro del producto: '); p.rubro:=random(10)+1; writeln(p.rubro);
					write('Ingrese stock del producto: '); p.stock:=random(1000); writeln(p.stock);
					write('Ingrese precio del producto: '); p.precio:= random(25)*17; writeln(p.precio:4:2);
					writeln('____________________________________|');
				end;
		end;
	
	procedure Agregar_al_Arbol(var a:arbol; p:producto);
		begin
			if(a=nil)then
				begin
					New(a);
					a^.dato:=p;
					a^.HI:=nil;
					a^.HD:=nil;
				end
			else
				if(a^.dato.codigo>p.codigo) then
					Agregar_al_Arbol(a^.HI,p)
				else
					Agregar_al_Arbol(a^.HD,p);
		end;
	var 
		p:producto;
	begin
		Lectura(p);
		while(p.codigo <> corte) do
			begin 
				Agregar_al_Arbol(v[p.rubro],p);
				Lectura(p);
			end;
	end;
//--------------------------------------------------------------------------------FIN IncisoA


//--------------------------------------------------------------------------------INCIO IncisoB
{b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.}

procedure InformarB(v:vector);

	function Existe(a:arbol; codigo:integer):boolean;
		begin
			if (a=nil) then
				Existe:=false
			else
				if (a^.dato.codigo = codigo) then 
					Existe:= True
				else
					Existe:= Existe(a^.HI,codigo) or Existe(a^.HD,codigo);
		end;
	var
		codigo,rubro:integer;
	begin
		writeln('----------------------------');
		writeln('Busqueda de producto en rubro determinado');
		writeln('----------------------------');		
		write('Ingrese un numero de rubro(1-10): '); readln(rubro);
		while(rubro<1) or (rubro>10) do 
			readln(rubro);
		write('Ingrese codigo de producto: '); readln(codigo);
		if (Existe(v[rubro],codigo))then
			writeln('El codigo ingresado existe en el rubro ingresado')
		else 
			writeln('El codigo no existe en el rubro ingresado');
		
	end;
//--------------------------------------------------------------------------------FIN IncisoAB

//--------------------------------------------------------------------------------INCIO IncisoC
{c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.}

procedure InformarC(v:vector);

	procedure InformarMayorCodigo(a:arbol);
		begin
			if (a^.HD<>nil) then
				InformarMayorCodigo(a^.HD)
			else
				begin
					writeln('Codigo mas grande encontrado:    ',a^.dato.codigo);
					writeln('Stock del producto con el codigo ',a^.dato.codigo,': ', a^.dato.stock);
				end;
		end; 
				
	var
		x:integer;
	begin
		for x:= 1 to 10 do
			begin
				writeln();writeln('.....................RUBRO ',x,'.....................'); writeln();
				InformarMayorCodigo(v[x]);
			end;
	end;

//--------------------------------------------------------------------------------FIN IncisoC

//--------------------------------------------------------------------------------INCIO IncisoD
{d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados}

procedure InformarD(v:vector);

	function Informar_productos(a:arbol; c1,c2:integer):integer;
		begin
			if(a=nil)then
				Informar_productos:=0
			else
				if (a^.dato.codigo<=c1) then
					Informar_productos:= Informar_productos(a^.HD,c1,c2)
				else
					if (a^.dato.codigo>=c2) then
						Informar_productos:= Informar_productos(a^.HI,c1,c2)
					else
						Informar_productos:= 1 + Informar_productos(a^.HD,c1,c2) + Informar_productos(a^.HI,c1,c2);
		end;
	var 
		x,cod1,cod2:integer;
	begin
		writeln('Ingrese dos codigos para buscar cantidad de productos entre estos en cada rubro');
		write('Codigo 1 (el valor mas chico): ');readln(cod1);
		write('Codigo 2 (el valor mas grande): ');readln(cod2);
		while(cod1>cod2) do
			begin
				writeln('Codigos mal ingresados. Ingrese los valores nueveamente');
				write('Codigo 1 (el valor mas chico): ');readln(cod1);
				write('Codigo 2 (el valor mas grande): ');readln(cod2);
			end;
		for x:= 1 to 10 do
			begin
				writeln();
				writeln('.....................RUBRO ',x,'.....................');
				writeln('Cantidad de productos entre ',cod1,' y ',cod2);writeln();
				writeln('.......................>',Informar_productos(v[x],cod1,cod2),'<.......................')
				writeln();writeln();
			end;
	end;
	
//--------------------------------------------------------------------------------FIN IncisoD
var 
	v:vector;
begin

// IncisoA
	Generar_estructura(v);
	writeln();
	writeln('Para la siguiente tarea precione ENTER');readln();
	
// IncisoB
	InformarB(v);
	writeln();
	writeln('Para la siguiente tarea precione ENTER');readln();
	
// IncisoC
	InformarC(v);
	writeln();
	writeln('Para la siguiente tarea precione ENTER');readln();
	
// IncisoD
	InformarD(v);
	writeln();
end.
