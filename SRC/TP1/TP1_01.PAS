PROGRAM tp1;
{Practica Estructura de Datos 2012. Practica 1, Ejercicio 1}
USES cola_int,Crt;

VAR
   ano : array[1..12] of real;
   i, aux : integer;
   total,prom: real;
   dprom, sprom: tipo_cola_int;

Begin
     {inicializo variables}
     total := 0;
     Cint_Crear(sprom);
     Cint_Crear(dprom);
     {leer info}
     ClrScr;

     for i:=1 to 12 do
         begin
         write('Mes ',i,': ');
         readln(ano[i]);
         total := total + Ano[i];
         end;
     ClrScr;

     {calcular prom y meses segun promedio}
     prom := total / 12;

     {separo los meses entre sup. al promedio y debajo del promedio}
     {podria ahorrame una pila imprimiendo directamente uno y dejando
      el otro para despues, pero por prolijidad uso una para cada una}
     for i:=1 to 12 do
         begin
         if (ano[i] > prom)
            then Cint_Agregar(sprom, i)
            else Cint_Agregar(dprom, i)
         end;

     {informo toda la fruta}
     writeln('promedio: ',prom:8:2);

     {desapilo las dos pilas e imprimo}
     write('meses mayores al promedio: ');
     for i:=1 to Cint_Cantidad(sprom) do
     begin
          Cint_Sacar(sprom,aux);
          write(aux);
          write(',');
     end;

     writeln('');

     write('meses menores al promedio: ');
     for i:=1 to Cint_Cantidad(dprom) do
     begin
          Cint_Sacar(dprom,aux);
          write(aux);
          write(',');
     end;

     writeln('');
     readln;
End.