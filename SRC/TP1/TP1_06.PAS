PROGRAM tp1_6;
{Practica Estructura de Datos 2012. Practica 1, Ejercicio 6}
USES Crt;
CONST
     SEPARADOR : String = ' ';
VAR
   a,b,aux: String;

function simetrica(a,b: String):Boolean;
var
i : integer;
begin
simetrica:= true;
for i:=1 to Length(a) do
    begin
    {writeln(a[i],':',b[(Length(b)+1)-i]);}
    if (a[i]<>b[(Length(b)+1)-i]) then simetrica:= false;
    end;
end;



Begin
     {leer y separ el string}
     readln(aux);
     a:= Copy(aux, 0, Pos(SEPARADOR, aux)-1);
     b:= Copy(aux, Pos(SEPARADOR, aux)+1, Length(aux));
     writeln(simetrica(a,b));


     readln;
End.