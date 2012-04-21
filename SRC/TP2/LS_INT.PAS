UNIT LS_INT;
{Lista encadenado simple de enteros}
INTERFACE

TYPE
    lista = ^reg;
    reg = record
         d : integer;
         sig : lista;
         end;

{appends the element to the end of the list}
procedure L_ADD(var L:lista; e: integer);
{appends the element at given position}
procedure L_ADDPOS(var L:lista; i: integer; e: integer);
{return the element at the specified position in the list.}
function L_GET(var L: lista; pos: integer): integer;
{remove the element at the specified position}
procedure L_REMOVE(var L: lista; i: integer);
{remove all list values, and dispose from memory}
procedure L_REMOVE_ALL(var L: lista);
{return the index in this list of the first occurence, or -1 if list does not contain element}
function L_INDEXOF(var L: lista; e: integer): integer;
{return true if the list contains no elements.}
function L_ISEMPTY(var L: lista): Boolean;
{returns the index of the las ocurrence, or -1 if list does not contain element}
function L_LASTINDEXOF(var L: lista; e: integer): integer;
{return the number of elements}
function L_SIZE(var L: lista): integer;
{return number of occurrences of the given number, -1 if not found}
function L_OCCURRENCES(var L: lista; e:integer): integer;
{return a reverse list}
procedure L_REVERSE(var L,E: lista);
{return sub list from n1 to n2}
procedure L_SUB(var L,E: lista; n1,n2: integer);


IMPLEMENTATION

{add first element}
procedure L_NEW_ADD(var L: lista; e: integer);
var
   auxL: lista;
begin
   new(L);
   L^.d:= e;
   L^.sig:= NIL;
end;

procedure L_REMOVE_ALL(var L: lista);
var
   aux: lista;
   p: pointer;
Begin
     aux:= L;
     while (aux <> nil ) do
           begin
           p:= aux^.sig;
           dispose(aux);
           aux:= p;
           end;
     L:= nil;
end;

procedure L_ADD(var L:lista; e: integer);
var
   auxL : lista;
   tmpL : lista;
Begin
     {check if initialized}
     if NOT(L_ISEMPTY(L))
        then begin
        {prepare data and add to last pos}

        new(auxL);
        auxL:= L;
        while auxL^.sig <> NIL do auxL := auxL^.sig;

        new(tmpL);
        tmpL^.d:= e;
        tmpL^.sig:= NIL;
        auxL^.sig:= tmpL;
        end
        else L_NEW_ADD(L,e);
end;


procedure L_ADDPOS(var L:lista; i: integer; e: integer);
var
   aux00,tmp00, tmp01: lista;
   auxi: integer;
Begin

   {check out of bounds, if so exit}
   if ((i < 0) AND (i > L_SIZE(l))) then RunError(201);

   {
   at all time track next and prev pos, then it is easy
   to set the list
   }

   {new(tmp00);}
   {new(tmp01);}

   for auxi:=0 to i do
       begin
       tmp00:= tmp01;
       tmp01:= tmp01^.sig;
       end;

   new(aux00);
   {if (aux00<>nil) then}
   aux00^.d  := e;
   tmp00^.sig:= aux00;
   aux00^.sig:= tmp01;

end;

function L_GET(var L: lista; pos: integer): integer;
var
   i: integer;
   tmpL: lista;
   isError: Boolean;
Begin

     {check out of bounds, if so exit}
     if ((pos < 1) AND (pos > L_SIZE(l))) then RunError(201);


     {new(tmpL);}
     tmpL:= L;

     for i:=1 to pos-1 do tmpL:= tmpL^.sig;

     L_GET:= tmpL^.d;
end;

{return the list element at that pos}
{used to improve efficiency}
procedure L_GETN(var L,N: lista; pos: integer);
var
   tmpL: lista;
   i: integer;
begin
     {check out of bounds, if so exit}
     if ((pos < 1) AND (pos > L_SIZE(l))) then RunError(201);


     {new(tmpL);}
     tmpL:= L;

     for i:=1 to pos-1 do tmpL:= tmpL^.sig;

     N:= tmpL;
end;


procedure L_REMOVE(var L: lista; i: integer);
Begin
end;

function L_REMOVE_INT(var L: lista; e: integer): Boolean;
Begin
end;

function L_INDEXOF(var L: lista; e: integer): integer;
Var
   tmpL: lista;
   i: integer;
Begin
     {new(tmpL);}
     tmpL:= L;
     i:= 1;

     L_INDEXOF:= -1;

     repeat
           if tmpL^.d = e
              then begin
              L_INDEXOF:= i;
              break;
              end;
           tmpL:= tmpL^.sig;
           inc(i);

     until tmpL = nil;
end;

function L_ISEMPTY(var L: lista): Boolean;
Begin
     if L=nil
        then L_ISEMPTY:= true
        else L_ISEMPTY:= false;
end;

function L_LASTINDEXOF(var L: lista; e: integer): integer;
Begin
end;

function L_SIZE(var L: lista): integer;
Var
   i: integer;
   aux: lista;
Begin
     {i:= 1;}
     {new(aux);}
     aux:= L;

     if L <> NIL
        then begin
             i:= 1;
             while (aux^.sig<>nil) do
                   begin
                   inc(i);
                   aux:= aux^.sig;
                   end;
             L_SIZE:= i;
             end
        else L_SIZE:= -1;
end;

function L_OCCURRENCES(var L: lista; e:integer): integer;
var
  i,c: integer;
  aux: lista;
begin
     c:=0;
     {new(aux);}
     aux:= L;
     for i:=1 to L_SIZE(L) do
         begin
         if (aux^.d = e) then inc(c);
         aux:= aux^.sig;
         end;
     if (c = 0)
        then L_OCCURRENCES:= -1
        else L_OCCURRENCES:= c;

end;

procedure L_REVERSE(var L,E: lista);
var
   i: integer;
begin
     L_REMOVE_ALL(E);

     for i:=L_SIZE(L) downto 1 do
         L_ADD(E,L_GET(L,i));
end;

procedure L_SUB(var L,E: lista; n1,n2: integer);
var
   i: integer;
   tmpL: lista;
begin
     L_REMOVE_ALL(E);
     {go to n1 in first list}
     L_GETN(L,tmpL,n1);

     for i:=n1 to n2 do
         begin
         L_ADD(E,tmpl^.d);
         {
         I could use tmpL^.sig to improve speed
         but I choose L_GETN for range checking
         and modularity
         }
         {tmpL:= tmpL^.sig;}
         L_GETN(tmpL,tmpL, 1);
         end;
end;


END.