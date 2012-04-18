PROGRAM tp1_7;
{Practica Estructura de Datos 2012. Practica 1, Ejercicio 7}
USES pila_chr,Crt;

VAR
   b: Boolean;

function esBalanceada(s:String):Boolean;
const
     OPEN_CHR = ['(','{','['];
     CLOSE_CHR = [')','}',']'];
var
   auxP: tipo_pila_chr;
   i: integer;
   c: char;
begin

   esBalanceada:=false;

   Pchr_Crear(auxP);
   {i:=1;}
   {el while no es lo mas eficiente pero luego me permite el uso de i para
   asegurar que se recorrio todo el string sin usar el Break
   Al final use un for y un exit para salir del procedure, lamento no tener
   un return..}
   {while (i <= Length(s)) do}
   for i:=1 to Length(s) do
       begin
       if s[i] in OPEN_CHR
          {agrego un elemento de apertura a una lista auxiliar para
          luego comparar}
          then Pchr_Agregar(auxP, s[i]);
       if s[i] in CLOSE_CHR
          {se encontro un elemento de cierre, debo ver
          si ya se ingreso uno de apertura correspondiente}
          then begin
          if PChr_Vacia(auxP)
             {si quiero cerrar un elemento y no abri ninguno
             antes entonces no es balanceada
             TODO: usar excepciones?}
             then Exit{Break}
             else begin
             PChr_Sacar(auxP,c);
             {compara cada caso
             TODO: tiene que haber otra forma..}

             if (c = '(') and NOT(s[i] = ')') then Exit;{Break;}
             if (c = '{') and NOT(s[i] = '}') then Exit;{Break;}
             if (c = '[') and NOT(s[i] = ']') then Exit;{Break;}

             end;
          end;
       {i:= i+1;}
       end;
   {si i es igual al largo del string + 1 significa que se recorrio
   todo el string sin cortar la ejecucion del while.
   si auxP es vacia significa que no queda ningun elemento por cerrar}
   if {(i=Length(s)+1) AND} PChr_Vacia(auxP) then esBalanceada:=true;
end;

Begin
     clrscr;

     {test strings}
     b:= esBalanceada(''); {TRUE}
     writeln(b);

     b:= esBalanceada(')'); {FALSE}
     writeln(b);

     b:= esBalanceada('('); {FALSE}
     writeln(b);

     b:= esBalanceada('asdasdasd'); {TRUE}
     writeln(b);

     b:= esBalanceada('())'); {FALSE}
     writeln(b);

     b:= esBalanceada('(()'); {FALSE}
     writeln(b);

     b:= esBalanceada('({)}'); {FALSE}
     writeln(b);

     b:= esBalanceada('function b(asd,[b]){function a()[{b},{a}]}'); {TRUE}
     writeln(b);

     readln;

End.