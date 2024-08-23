program ProgramaNumAleatorio;

var 
    x, ale: integer;

begin
     randomize;
     for x:= 1 to 20 do
        begin
             ale := random (100); 
             writeln ('El numero ',x,' aleatorio generado es: ', ale);
        end;
	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.
