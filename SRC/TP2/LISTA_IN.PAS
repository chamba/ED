UNIT LISTA_IN;

INTERFACE


TYPE
    lista = ^reg;
    reg = record
         d : integer;
         ant : lista;
         sig : lista;
         end;

VAR
   c :   Char;
   p : ^Integer;


{appends the element to the end of the list}
procedure L_ADD(var L:lista; e: integer);
{appends the element at given position}
procedure L_ADD_POS(var L:lista; i: integer; e: integer);
{return the element at the specified position in the list.}
function L_GET(var L: lista; pos: integer): integer;
{remove the element at the specified position}
procedure L_REMOVE(var L: lista; i: integer);
{remove all list values, and dispose from memory}
procedure L_REMOVE_ALL(var L: lista);
{removes the first occurrence of element}
function L_REMOVE_INT(var L: lista; e: integer): Boolean;
{return the index in this list of the first occurence, or -1 if list does not contain element}
function L_INDEXOF(var L: lista; e: integer): integer;
{return true if the list contains no elements.}
function L_ISEMPTY(var L: lista): Boolean;
{returns the index of the las ocurrence, or -1 if list does not contain element}
function L_LASTINDEXOF(var L: lista; e: integer): integer;
{return the number of elements}
function L_SIZE(var L: lista): integer;



IMPLEMENTATION

{add first element}
procedure L_NEW_ADD(var L: lista; e: integer);
var
   auxL: lista;
begin
   new(L);
   L^.d:= e;
   L^.sig:= NIL;
   L^.ant:= NIL;
end;


{remove all list values, and dispose from memory}
procedure L_REMOVE_ALL(var L: lista);
Begin
end;

{appends the element to the end of the list}
procedure L_ADD(var L:lista; e: integer);
var
   auxL : lista;
   tmpL : lista;
Begin
     {check if initialized}
     if L <> NIL
        then begin
        {prepare data and add to last pos}

        new(auxL);
        auxL:= L;
        while auxL^.sig <> NIL do auxL := auxL^.sig;

        new(tmpL);
        tmpL^.d:= e;
        tmpL^.sig:= NIL;
        tmpL^.ant:= auxL;
        auxL^.sig:= tmpL;
        end
        else L_NEW_ADD(L,e);
end;

{appends the element at given position}
procedure L_ADD_POS(var L:lista; i: integer; e: integer);
var
   auxL,tmpL: lista;
   auxi: integer;
Begin
   {check out of bounds}
   if ((i < 0) AND (i > L_SIZE(l))) then RunError(201);

   i:=i-1; {hack to scape for if pos = 0}
   new(tmpL);
   tmpL:= L;
   for auxi:=0 to i do tmpL:= tmpL^.sig;

   new(auxL);
   auxL^.d:= e;
   auxL^.sig:= tmpL;
   auxL^.ant:= tmpL^.ant;
   tmpL^.ant^.sig:= auxL;
   tmpL^.ant:= auxL;

end;

{return the element at the specified position in the list.}
function L_GET(var L: lista; pos: integer): integer;
var
   i: integer;
   tmpL: lista;
Begin
     pos:= pos - 1; {hack to scape for if pos = 0}
     new(tmpL);
     tmpL:= L;
     for i:=0 to pos do tmpL:= tmpL^.sig;
     L_GET:= tmpL^.d;
end;

{remove the element at the specified position}
procedure L_REMOVE(var L: lista; i: integer);
Begin
end;

{removes the first occurrence of element}
function L_REMOVE_INT(var L: lista; e: integer): Boolean;
Begin
end;

{return the index in this list of the first occurence, or -1 if list does not contain element}
function L_INDEXOF(var L: lista; e: integer): integer;
Begin
end;

{return true if the list contains no elements.}
function L_ISEMPTY(var L: lista): Boolean;
Begin
end;

{returns the index of the las ocurrence, or -1 if list does not contain element}
function L_LASTINDEXOF(var L: lista; e: integer): integer;
Begin
end;

{return the number of elements}
function L_SIZE(var L: lista): integer;
var
   auxL: lista;
   i: integer;
Begin
     if L <> NIL
        then begin
             new(auxL);
             auxL:= L;
             i:= 1;
             while auxL <> NIL
                   do begin
                   auxL := auxL^.sig;
                   inc(i);
                   end;

             dec(i);
             L_SIZE:= i;
             end
        else L_SIZE:= -1;
end;

END.



