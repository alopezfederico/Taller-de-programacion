{Desafío...
4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).

Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.
}

program Ejercicio4;
const 
    corte = 0;

procedure Conversion();

    procedure Binario(num:integer);
        begin
            if (num<>0) then
                begin
                    Binario(num div 2);
                    num:= num mod 2;
                    write(num,' ');
                end;
        end;
        
    var 
        num:integer;
    begin
        write('Ingrese numero: '); num:= random (1000); writeln(num);
        while (num<>corte) do
            begin
                write('Numero ',num,' en binario: ');
                Binario(num);
                writeln();
                write('Ingrese numero: '); num:= random (1000); writeln(num);
            end;
    end;

begin
    randomize;
    Conversion();
end.