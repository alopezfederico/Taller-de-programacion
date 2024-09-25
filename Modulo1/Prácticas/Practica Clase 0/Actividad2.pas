program ProgramaVectores;
const
    dimF=50;
type
    vector = Array [1..dimF] of integer;

procedure CargarVector (var v:vector; min,max:integer; var dimL:integer);
    var
        num:integer;
    begin
        num:= random(max-min)+min;
        while (dimL<dimF) and (num<>0) do
            begin
                dimL:= dimL + 1;
                v[dimL]:= num;
                num:= random(max-min+1)+min;
            end;
    end;

procedure ImprimirVector(v:vector ; dimL:integer);
    var
        x:integer;
    begin
        for x:= dimL downto 1 do
            writeln(v[x]);
    end;

var
    v:vector;
    min, max, dimL:integer;
begin
    randomize;
    write('Ingrese minimo: '); readln(min);
    write('Ingrese maximo: '); readln(max);
    dimL:=0;
    CargarVector(v,min,max,dimL);
    ImprimirVector(v,dimL);
end.