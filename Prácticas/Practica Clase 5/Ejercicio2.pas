{Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:

a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:

i. Una estructura eficiente para la búsqueda por patente.

ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.

b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.

c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.

d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.

e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}


program Ejericio2;
uses
	sysutils;
	
const
	corte= 'MMM';
type

	rango_anio = 2010..2018;
// Estructura inciso A_i)

	auto = record
		patente:string[20];
		anio:rango_anio;
		marca:string[20];
		modelo:string[20];
		end;
		
	arbol_i = ^NodoArbol_i;
	NodoArbol_i =  record
		dato:auto;
		HI:arbol_i;
		HD:arbol_i;
		end;
		
// Estructura inciso A_ii)

	usuario = record		//Registro del nodo de la lista
		patente:string[20];
		anio:rango_anio;
		modelo:string[20];
		end;	

	Lista = ^NodoLista;		//Asignacion del puntero NodoLista

	NodoLista = record		//Contenido del nodo de la lista
		dato:usuario;
		sig:Lista;
		end;
		
	reg_arbol_ii = record	//Registro del nodo del Arbol_ii
		marca:string[20];
		L:Lista;
		end;

	arbol_ii = ^NodoArbol_ii;//Asignacion del puntero NodoArbol_ii
	
	NodoArbol_ii = record	 //Contenido del nodo del arbol_ii
		dato:reg_arbol_ii;
		HI:arbol_ii;
		HD:arbol_ii;
		end;


// ______________________________________________________________________________________________________________ Inciso A
{a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:

i. Una estructura eficiente para la búsqueda por patente.

ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.}

procedure GenerarEstructura(var a_i:arbol_i; var a_ii:arbol_ii);

	procedure Lectura(var a:auto);
		begin
			write('Ingrese marca del auto: '); readln(a.marca);
			if(a.marca <> corte) then
				begin
					write('Ingrese patente del auto: '); readln(a.patente);
					write('Ingrese anio del auto: '); readln(a.anio);
					write('Ingrese modelo del auto: '); readln(a.modelo);
				end;
		end;
	
	procedure Agregar_Al_Arbol_i(var a:arbol_i; reg_a:auto);
		begin
			if (a=nil) then
				begin
					New(a);
					a^.dato:= reg_a;
					a^.HI:=nil;
					a^.HD:=nil;
				end
			else
				if (a^.dato.patente > reg_a.patente) then
					Agregar_Al_Arbol_i(a^.HI,reg_a)
				else
					Agregar_Al_Arbol_i(a^.HD,reg_a);
		end;
	
	procedure Pasar_informacion(var user:usuario; reg_a:auto); //Guardon en el registro para la lista del arbol_ii la informacion necesaria
		begin
			user.patente:=reg_a.patente;
			user.anio:=reg_a.anio;
			user.modelo:=reg_a.modelo;
		end;
	
	procedure Agregar_a_Lista(var L:Lista; user:usuario);
		var
			nue:Lista;
		begin
			New(nue);
			nue^.dato:=user;
			nue^.sig:=L;
			L:=nue;
		end;
			
	procedure Agregar_Al_Arbol_ii(var a:arbol_ii; user:usuario; marca:string);
		begin
			if (a=nil) then
				begin
					New(a);
					a^.dato.marca:=marca;
					a^.dato.L:=nil;
					Agregar_a_Lista(a^.dato.L,user);
					a^.HI:=nil;
				end
			else
				if (a^.dato.marca>marca) then
					Agregar_Al_Arbol_ii(a^.HI,user,marca)
				else
					if(a^.dato.marca<marca)then
						Agregar_Al_Arbol_ii(a^.HD,user,marca)
					else
						Agregar_a_Lista(a^.dato.L,user);
		end;
		
	var
		a:auto;
		user:usuario;
	begin
		Lectura(a); // Leo el primer elemnto
		while(a.marca <> corte) do
			begin
				Agregar_Al_Arbol_i(a_i,a);
				Pasar_informacion(user,a);
				Agregar_Al_Arbol_ii(a_ii,user,a.marca);
				Lectura(a);
			end;
	end;
//  ______________________________________________________________________________________________________________FIN Inciso A	
		
//  ______________________________________________________________________________________________________________Inciso B

{b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.}
procedure InformarB(a:arbol_i);

	function Autos_de_marca (a: arbol_i; marca:string):integer;
		begin 
			if (a=nil) then
				Autos_de_marca:=0
			else 
				if (a^.dato.marca = marca) then 
					Autos_de_marca:= 1 + Autos_de_marca(a^.HI,marca) + Autos_de_marca(a^.HD,marca)
				else
					Autos_de_marca:= Autos_de_marca(a^.HI,marca) + Autos_de_marca(a^.HD,marca);
		end;
	
	var 
		marca:string[20];
	begin
		write('Inrgese Marca: '); readln(marca);
		writeln('______________');
		write('Cantidad de autos de la marca ingresada: ', Autos_de_marca(a,marca));
	end;
// ______________________________________________________________________________________________________________FIN Inciso B	

// ______________________________________________________________________________________________________________Inicio Inciso C

{c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.}

procedure InformarC(a:arbol_ii);
	
	function Contar_en_Lista(L:Lista):integer;
		begin
			if(L=nil)then
				Contar_en_Lista:=0
			else
				Contar_en_Lista:= 1 + Contar_en_Lista(L^.sig);
		end;
		
	function Contar_en_Arbol(a:arbol_ii; marca:string):integer;
		begin
			if (a=nil) then
				Contar_en_Arbol := 0
			else
				if (a^.dato.marca=marca) then
					Contar_en_Arbol:=  Contar_en_Lista(a^.dato.L)
				else
					begin
						if (a^.dato.marca<marca) then
							Contar_en_Arbol:= Contar_en_Arbol(a^.HD,marca)
						else
							Contar_en_Arbol:= Contar_en_Arbol(a^.HI,marca);
					end;
		end;
		
	var 
		marca:string[20];
	begin 
		write('Inrgese Marca: '); readln(marca);
		writeln('______________');
		writeln('Cantidad de autos en la marca ingresada: ',Contar_en_Arbol(a,marca));
	end;

//______________________________________________________________________________________________________________FIN inciso C
//______________________________________________________________________________________________________________Inicio Inciso D
{d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.}

procedure InformarD(a:arbol_i;var a_anios:arbol_i);
	
	procedure Agregar_Al_Arbol_anios(var a:arbol_i; reg_a:auto);
		begin
			if (a=nil) then
				begin
					New(a);
					a^.dato:= reg_a;
					a^.HI:=nil;
					a^.HD:=nil;
				end
			else
				if (a^.dato.anio > reg_a.anio) then
					Agregar_Al_Arbol_anios(a^.HI,reg_a)
				else
					Agregar_Al_Arbol_anios(a^.HD,reg_a);
		end;
	
	procedure Recorrer_Arbol_i(a:arbol_i; var a_anios:arbol_i);
		begin
			if (a<>nil) then
				begin
					Recorrer_Arbol_i(a^.HI,a_anios);
					Agregar_Al_Arbol_anios(a_anios,a^.dato);
					Recorrer_Arbol_i(a^.HD,a_anios);
				end;
		end;
	
	begin
		Recorrer_Arbol_i(a,a_anios);
	end;
	
	
//______________________________________________________________________________________________________________FIN Inciso D
//______________________________________________________________________________________________________________Inicio Inciso E
{e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.}
procedure InformarE(a:arbol_i);
	
	procedure Encontrar_modelo(a:arbol_i; var patente:string; var existe:boolean);
		begin
			if (a=nil) then
				existe:=false
			else 
				if(a^.dato.patente=patente)then
					begin
						existe:=true;
						patente:=a^.dato.modelo;
					end
				else
					begin
						if not(existe) then
							Encontrar_modelo(a^.HI,patente, existe);
						if not(existe) then
							Encontrar_modelo(a^.HD,patente, existe);
					end
		end;
	var 
		patente:string[20];
		existe:boolean;
	begin
		write('Ingrese patente a buscar: '); readln(patente);
		Encontrar_modelo(a,patente,existe);
		if (existe) then
			writeln('Modelo del auto con la patente ingresada: ',patente) //reutilizo la variable
		else
			writeln('No se encuentra la patente ingresada');
	end;
//______________________________________________________________________________________________________________FIN Inciso E
//______________________________________________________________________________________________________________Inicio Inciso F
{f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

procedure InformarF(a:arbol_ii);
	
	procedure Recorrer_Lista(L:Lista; patente: string; var modelo:string; var existe:boolean);
		begin
			if (L=nil) then
				existe:=false
			else
				if (L^.dato.patente=patente) then
					begin 
						existe:=true;
						modelo:=L^.dato.modelo;
					end
				else
					if not (existe) then
						Recorrer_Lista(L^.sig, patente,modelo,existe);
		end;
	
	procedure Recorrer_Arbol_ii(a:arbol_ii; patente:string; var modelo:string; var existe:boolean);
		begin
			if (a=nil) then
				existe:=false
			else
				begin
					Recorrer_Lista(a^.dato.L,patente,modelo,existe);
					if not (existe) then
						Recorrer_Arbol_ii(a^.HI,patente, modelo,existe);
					if not (existe) then
						Recorrer_Arbol_ii(a^.HD,patente, modelo,existe);
				end;
		end;
	var 
		modelo,patente:string[20];
		existe:boolean;
	begin
		write('Ingrese patente a buscar: '); readln(patente);
		existe:=false;
		Recorrer_Arbol_ii(a,patente,modelo,existe);
		if not existe then
			writeln('No se encuentra la patente ingresada')
		else 
			writeln('El modelo del auto con la patente ingresada es: ', modelo);
	end;

//______________________________________________________________________________________________________________FIN Inciso F
var
	a_i,a_anios:  arbol_i;
	a_ii: arbol_ii;
begin
// --- IncisoA
	GenerarEstructura(a_i,a_ii);
// --- IncisoB
	InformarB(a_i);
// --- IncisoC
	InformarC(a_ii);
// --- IncisoD
	InformarD(a_i,a_anios);
// --- IncisoE
	InformarE(a_i);
// --- IncisoF
	InformarF(a_ii);
end.
		




























