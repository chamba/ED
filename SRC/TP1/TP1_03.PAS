PROGRAM tp1_3;
{Practica Estructura de Datos 2012. Practica 1, Ejercicio 3}
USES Crt;
TYPE
    alum = record
         nombre: String;
         edad: integer;
         localidad: integer;
         end;
VAR
   alumnos: Array[0..49] of alum;
   j,i,len,min: integer;
   aux_alu: alum;
   nombre,index: String;
Begin

     {leer alumnos}
     for i:=0 to 4 do
         begin
         write('nombre: ');
         readln(alumnos[i].nombre);
         end;
     len:= i;

     {select}
     {
     for i:=0 to len-1 do
         begin
         min:= i;
         for j:=i+1 to len do
             begin
             if (alumnos[j].nombre < alumnos[min].nombre)
                then min:= j;
             end;
         aux_alu:= alumnos[i];
         alumnos[i]:= alumnos[min];
         alumnos[min]:= aux_alu;
         end;
     }

     {insercion}
     {
     for i:= 0 to len do
         begin
         alu_aux:= alumnos[i];
         j:= i-1;
         while ((j>=0) and (alumnos[j].nombre > alu_aux.nombre)) do
               begin
               alumnos[j+1] := alumnos[j];
               j:= j-1;
               end;
         alumnos[j+1]:= alu_aux;
         end;
     }

     {burbuja}
     {
     for i:=1 to len do
         begin
         for j:= 0 to len-1 do
             begin
             if alumnos[j].nombre > alumnos[j+1].nombre
                then begin
                aux_alu:= alumnos[j];
                alumnos[j]:= alumnos[j+1];
                alumnos[j+1]:= aux_alu;
                end;
             end;
         end;
     }

     {quicksort}

     {TODO}

     {print ordered}
     for i:=0 to 4 do
         begin
         writeln(alumnos[i].nombre);
         end;

     readln;
End.