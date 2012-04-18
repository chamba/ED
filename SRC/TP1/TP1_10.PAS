PROGRAM tp1_7;
{Practica Estructura de Datos 2012. Practica 1, Ejercicio 7}
USES pila_int,Crt;

VAR
   pila: tipo_pila_int;

procedure Pint_Multiplicar(var p:tipo_pila_int; m: integer);
var
   auxP: tipo_pila_int;
   auxI: integer;
begin
   {inicializo pila auxiliar}
   Pint_Crear(auxP);
   {recorro pila original y vuelco
   el resultado en una pila auxiliar}
   while NOT(Pint_Vacia(p)) do
         begin
         Pint_Sacar(p, auxI);
         auxI := auxI * m;
         Pint_Agregar(auxP, auxI);
         end;
   {la pila quedo en orden inverso en la
   estructura auxiliar, la vuelco en la pila original
   en el orden correcto}
   while NOT(Pint_Vacia(auxp)) do
         begin
         Pint_Sacar(auxP, auxI);
         Pint_Agregar(p, auxI);
         end;
end;

Begin
     {inicializo variables}


End.