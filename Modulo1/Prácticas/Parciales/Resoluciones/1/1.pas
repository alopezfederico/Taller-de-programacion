{
Una casa de comidas para llevar necesita el procesamiento de los pedidos de combos
realizados por los clientes durante el mes de agosto de 2022. De cada pedido se conoce:
Numero de cliente
Dia
Canidad de combos
Monto pagado

a. Implementar un modulo que lea pedidos, genere y retorne una estructura adecuada
para la busqueda por numero de cliente, donde para cada numero de cliente se almacenen
juntos todos sus pedidos (dia, cant de combos y monto) que realizó.
La lectura finaliza con cliente=0. Se suguiere utulizar el modulo leerRegistro();

b. Implementar un modulo que reciba la estructura generada en a) y un nnumero de cliente,
y retorne todos los pedidos que realizó el cliente .

c. Relice un modulo recursivo que reciba la informacion en el inciso b) y retorne el
monto total abonado por el cliente
}

program Parcial;
const
	corte=0;
	
type
	rango_dia = 1..31;
	
	pedido = record
		num_cliente:integer;
		dia: rango_dia;
		cant_combos:integer;
		monto:real;
		end;
		
	reg_lista = record
		dia: rango_dia;
		cant_combos:integer;
		monto:real;
		end;
		 
	
	Lista = ^Nodo_lista;
	
	Nodo_Lista = record
		dato:reg_lista;
		sig:Lista;
		end;
	
	reg_arbol = record
		num_cliente:integer;
		L:lista;
		end;
	
	Arbol = ^Nodo_arbol;
	
	Nodo_arbol= record
		dato:reg_arbol;
		HI:arbol;
		HD:arbol;
		end;
	
procedure Generar_estructura (var a:Arbol);
	
	procedure Leer_pedido(var p:pedido);
		begin
			write('Ingrese numero de cliente: '); p.num_cliente:= random (30); writeln(p.num_cliente);
			if (p.num_cliente <> corte) then
				begin
					write('Ingrese dia: '); p.dia:= random(31)+1; writeln(p.dia);
					write('Ingrese cantidad de combos: '); p.cant_combos:= random (10)+1; writeln(p.cant_combos);
					write('Ingrese monto pagado: '); p.monto:= random(150) * random(15); writeln(p.monto:4:2);
				end;
		end;
		
	procedure Pasar_datos(var r:reg_lista; p:pedido);
		begin
			r.dia:=p.dia;
			r.cant_combos:=p.cant_combos;
			r.monto:=p.monto;
		end;
	
	procedure Agregar_a_lista(var L:Lista; r:reg_lista);
		var 
			nue:Lista;
		begin
			New(nue);
			nue^.dato:=r;
			nue^.sig:=L;
			L:=nue;
		end;
		
	procedure Agregar_al_arbol(var a:arbol; num:integer; r:reg_lista);
		begin
			if (a=nil) then
				begin
					New(a);
					a^.dato.num_cliente:=  num;
					a^.dato.L:=nil;
					Agregar_a_lista(a^.dato.L, r);
					a^.HI:=nil;
					a^.HD:=nil;
				end
			else
				if (a^.dato.num_cliente < num) then
					Agregar_al_arbol(a^.HD,num,r)
				else 
					if(a^.dato.num_cliente > num) then 
						Agregar_al_arbol(a^.HI,num,r)
					else
						Agregar_a_lista(a^.dato.L,r);
			end;
	var 
		p:pedido;
		r:reg_lista;
	begin
		writeln('--------INGRESO DE PEDIDOS--------');
		Leer_pedido(p);
		while(p.num_cliente <> corte)do
			begin
				writeln('__________________________________');
				Pasar_datos(r,p);
				Agregar_al_arbol(a,p.num_cliente,r);
				Leer_pedido(p);
			end;
		writeln('--------FIN DE INGRESO DE PEDIDOS--------');
	end;
	
//-------------------------------------------------------------------------------------------FIN Inciso A
//-------------------------------------------------------------------------------------------INICIO Inciso B
{b. Implementar un modulo que reciba la estructura generada en a) y un nnumero de cliente,
y retorne todos los pedidos que realizó el cliente .}

procedure InformarB(a:arbol);
	
	procedure Informar_pedidos(L:Lista);
		begin
			while (L<>nil) do
				begin
					writeln('_________________________________');
					writeln('Cantidad de combos: ',L^.dato.cant_combos,' | Dia: ',L^.dato.dia,' | Monto: $', L^.dato.monto:4:2);
					L:=L^.sig;
				end;
		end;
	
	procedure Pedidos_realizados(a:arbol; num:integer);
		begin
			if (a<>nil) then
				if (a^.dato.num_cliente = num) then
					begin
						writeln();writeln('.............Pedidos del cliente: ',num);
						Informar_pedidos(a^.dato.L);
					end
				else
					if (a^.dato.num_cliente < num) then 
						Pedidos_realizados(a^.HD,num)
					else 
						Pedidos_realizados(a^.HI,num);
		end;
	var
		num: integer;
	begin
		writeln('//////////////////////');writeln('---------INCISO B---------');writeln();
		write('Ingrese numero de cliente: '); readln(num);writeln();
		writeln('---------INFORME DE PEDIDOS---------');
		Pedidos_realizados(a,num);
		writeln();writeln('---------FIN INCISO B---------');		
	end;

//-------------------------------------------------------------------------------------------FIN Inciso B	

//-------------------------------------------------------------------------------------------INICIO Inciso C
{c. Relice un modulo recursivo que reciba la informacion en el inciso b) y retorne el
monto total abonado por el cliente}

procedure InformarC( a: arbol);
	
	function Calcular_total(L:Lista):real;
		begin
			if (L=nil) then
				calcular_total:=0
			else
				Calcular_total:= L^.dato.monto + Calcular_total(L^.sig);
		end;
	
	procedure Encontrar_cliente(a:arbol; num:integer);
		begin
			if(a<>nil)then
				if(a^.dato.num_cliente < num) then
					Encontrar_cliente(a^.HD,num)
				else 
					if(a^.dato.num_cliente > num) then
						Encontrar_cliente(a^.HI,num)
					else
						writeln('Monto total abonado por el cliente ',num,': $',Calcular_total(a^.dato.L):5:2);
		end;
	
	var
		num:integer;
	begin
		writeln('//////////////////////');writeln('---------INCISO C---------');writeln();
		write('Ingrese numero de cliente: '); readln(num);writeln();
		Encontrar_cliente(a,num);
	end;



//-------------------------------------------------------------------------------------------FIN Inciso C

var 
	a:arbol;
begin
	randomize;
// --- Inciso A
	Generar_estructura(a);
	
// --- Inciso B
	InformarB(a);
	
// --- Incoso C
	InformarC(a);

end.
