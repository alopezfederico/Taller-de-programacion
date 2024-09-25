{4. Una oficina requiere el procesamiento de los reclamos de las personas. 
* 
* De cada reclamo se ingresa 

* código, 
* DNI de la persona, 
* año y 
* tipo de reclamo. 

* El ingreso finaliza con el
código de igual a 0. Se pide:
* 
* 
* 
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
* 
* registro
* 
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido


}

program ejercicio4;
const 
	corte=0;
type

// ESTRUCTURA IncisoA
	reclamo_ingresado = record
		codigo:integer;
		dni:integer;
		anio:integer;
		tipo:string[20];
	end;
	
	reg_lista = record
		codigo:integer;
		anio:integer;
		tipo:string[20];
		end;
	
	Lista = ^Nodo_lista;
	Nodo_lista = record
		dato:reg_lista;
		sig:Lista;
		end;
		
		
	reg_arbol= record
		dni:integer;
		total:integer;
		L:Lista;
		end;
		
	arbol = ^Nodo_arbol;
	Nodo_arbol = record
		dato:reg_arbol;
		HI:arbol;
		HD:arbol;
		end;
		
//------------------------------------------------------------------------------------------------ INICIO inciso A
{a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.}

procedure GenerarEstructura(var a:arbol);
	
	
	procedure Leer_reclamo(var r:reclamo_ingresado);
		begin
			write('Ingrese codigo de reclamo: '); r.codigo:= random(1000); writeln(r.codigo); //readln(r.codigo);
			if(r.codigo <> corte) then
				begin
					write('Ingrese dni: '); r.dni:= (random(10)+1)* (random(7)+1); writeln(r.dni); //readln(r.dni);
					write('Ingrese anio: '); r.anio:= random(100)+1924; writeln(r.anio); //readln(r.anio);
					write('Ingrese tipo de reclamo: '); r.tipo:= 'ABC'; //readln(r.tipo);
					writeln('.............................../');writeln();
				end;
		end;
		
	procedure Pasar_datos(var r_l:reg_lista; r:reclamo_ingresado);
		begin
			r_l.codigo:= r.codigo;
			r_l.anio:= r.anio;
			r_l.tipo:= r.tipo;
		end;
		
	procedure Agregar_a_Lista(var L:Lista; r:reg_lista);
		var 
			nue:Lista;
		begin
			New(nue);
			nue^.dato:=r;
			nue^.sig:=L;
			L:=nue;
		end;
		
	procedure Agregar_al_Arbol(var a:arbol; r:reg_lista; dni:integer);
		begin
			if(a=nil)then
				begin
					New(a);
					a^.dato.dni:= dni;
					a^.dato.total:= 1;
					Agregar_a_Lista(a^.dato.L,r);
					a^.HI:=nil;
					a^.HD:=nil;
				end
			else
				if (a^.dato.dni > dni) then			// Si el elemento en el nodo del arbol es mas grande que el nuevo dni a ingresar
					Agregar_al_Arbol(a^.HI,r,dni)	// Recursion con nodo hijo izquierdo
				else
					if(a^.dato.dni<dni)then			// Si en cambio es mas chico
						Agregar_al_Arbol(a^.HD,r,dni)// Recursion con nodo hijo derecho
					else
						begin						// En caso de que DNI sea el mismo
							a^.dato.total:= a^.dato.total + 1; 		//Sumo cantidad de reclamos total
							Agregar_a_Lista(a^.dato.L,r);		//Agrego el reclamo a la lista
						end;
		end;
		
	var 
		r_i:reclamo_ingresado;
		r_l:reg_lista;
	begin
		writeln('--------------LECTURA DE RECLAMOS--------------');writeln();
		Leer_reclamo(r_i);
		while(r_i.codigo<>corte)do
			begin
				Pasar_datos(r_l,r_i);
				Agregar_al_arbol(a,r_l,r_i.dni);
				Leer_reclamo(r_i);
			end;
		writeln('--------------LECTURA DE RECLAMOS--------------');
		writeln('-------------------FINALIZADA------------------');
	end;
//------------------------------------------------------------------------------------------------ FIN inciso A


//------------------------------------------------------------------------------------------------ INICIO inciso B
{b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.}

procedure InformarB (a:arbol);
	
	function Cantidad_b(a:arbol; dni:integer):integer;
		begin
			if (a=nil) then
				Cantidad_b:=0
			else
				if (a^.dato.dni > dni) then
					Cantidad_b:= Cantidad_b(a^.HI,dni)
				else 
					if (a^.dato.dni< dni) then
						Cantidad_b:= Cantidad_b(a^.HD,dni)
					else
						Cantidad_b:= a^.dato.total;
		end;
	
	var
		dni:integer;
	begin
		writeln('------- CANTIDAD DE RECLAMOS REALIZADOS POR DNI -------'); writeln();
		writeln('  Ingrese DNI: '); readln(dni);
		writeln('  Cantidad:   -->   ', Cantidad_b(a,dni),'   <--');
		writeln('________________________________________________________');
	end;
		

//------------------------------------------------------------------------------------------------ FIN inciso B

//------------------------------------------------------------------------------------------------ INICIO inciso C
{c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.}

procedure InformarC (a:arbol);


	procedure Imprimir_entre_dos(a:arbol; d1,d2:integer);
		begin
			if (a<>nil) then
				begin
					if (a^.dato.dni < d1) then					//En caso de no incluir d1, se pone <=
						Imprimir_entre_dos(a^.HD,d1,d2)
					else
						if(a^.dato.dni > d2) then				//En caso de no incluir d2, se pone >=
							Imprimir_entre_dos(a^.HI,d1,d2)
						else 
							begin
								Imprimir_entre_dos(a^.HI,d1,d2);
								writeln('DNI: ',a^.dato.dni,' | Cantidad de reclamos: ', a^.dato.total);
								Imprimir_entre_dos(a^.HD,d1,d2);
							end;
				end;
		end;

	var 
		d1,d2:integer;
	begin
		writeln('------- CANTIDAD DE RECLAMOS ENTRE DOS DNI -------');
		write('Ingrese primer DNI (valor mas chico): '); readln(d1);
		write('Ingrese segundo DNI (valor mas grande): '); readln(d2);
		while not (d1<d2) do
			begin
				writeln('¡¡Valores Incorrectos. Ingrese nuevamente!!');
				write('Ingrese primer DNI (valor mas chico): '); readln(d1);
				write('Ingrese segundo DNI (valor mas grande: '); readln(d2);		
			end;
		writeln();
		Imprimir_entre_dos(a,d1,d2);
	end;
//------------------------------------------------------------------------------------------------ FIN inciso C

//------------------------------------------------------------------------------------------------ INICIO inciso D
{d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido}

procedure InformarD(a:arbol);
	
	procedure Buscar_en_Lista(L:Lista; anio:integer);
		begin
			if (L<>nil) then
				begin
					if(L^.dato.anio = anio)then
						begin
							writeln('Codigo: ', L^.dato.codigo);
							writeln('________________________');
						end;
					Buscar_en_Lista(L^.sig,anio);
				end;
		end;
	
	procedure Imprimir_en_anio(a:arbol; anio:integer);
		begin
			if(a<>nil)then
				begin
					Imprimir_en_anio(a^.HI,anio);
					Imprimir_en_anio(a^.HD,anio);
					Buscar_en_Lista(a^.dato.L,anio);
				end;
		end;
	
	
	var 
		anio:integer;
	begin
		writeln('------- RECLAMOS REALIZADOS EN EL ANIO -------');
		write('Ingrese anio (1924-2024): '); readln(anio);
		while(anio<1924) or (anio>2024) do
			begin
				writeln('ANIO INCORRECTO! Vuelva a ingresar.');
				write('Anio: '); readln(anio);
			end;
		Imprimir_en_anio(a,anio);
		writeln('________________________');
	end;

//------------------------------------------------------------------------------------------------ FIN inciso D
procedure Chequeo(a:arbol);
	
	procedure Valores_internos(L:Lista);
		begin
			if (L<>nil) then
				begin
					writeln('______________________________________');
					writeln('Codigo: ', L^.dato.codigo,' | Tipo: ', L^.dato.tipo,' | Anio: ',L^.dato.anio);
					Valores_internos(L^.sig);
				end;
		end;
	
	procedure ImprimirEstructura(a:arbol);
		begin
			if (a<>nil) then
				begin
					ImprimirEstructura(a^.HI);
					begin
						writeln();writeln(':::::::::::::::::::::::::::::::::');writeln();
						writeln('INFO DNI: ',a^.dato.dni);
						writeln('TOTAL de reclamos: ',a^.dato.total);
						Valores_internos(a^.dato.L);
					end;
					ImprimirEstructura(a^.HD);
				end;
		end;
		
	begin
		writeln('------------IMPRIMIENDO ESTRUCTURA------------');writeln();
		ImprimirEstructura(a);
	end;
var 
	a:arbol;
begin
//--- IncisoA
	GenerarEstructura(a);
	Chequeo(a); //CHEQUEO
	writeln();
//--- IncisoB
	InformarB(a);
	writeln();
//--- IncisoC
	InformarC(a);
	writeln();
	
//--- IncisoD
	InformarD(a);
	writeln();
end.
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
