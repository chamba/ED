UNIT LISTA_ABS;

INTERFACE


TYPE
    lista = ^reg;
    reg = record
         dato : integer;
         next : lista;
         end;

VAR
   c :   Char;
   p : ^Integer;


{remove all list values, and dispose from memory}
procedure L_DISPOSE(var L: lista);

{return the element at the specified position in the list.}
function L_GET(var L: lista; pos: integer): integer;
{remove the element at the specified position}
procedure L_REMOVE(var L: lista; i: integer);
{removes the first occurrence of element}
function L_REMOVE_INT(var L: lista; d: integer): Boolean;
{return the index in this list of the first occurence, or -1 if list does not contain element}
function L_INDEXOF(var L: lista; d: integer): integer;
{return true if the list contains no elements.}
function L_ISEMPTY(var L: lista): Boolean;
{returns the index of the las ocurrence, or -1 if list does not contain element}
function L_LASTINDEXOF(var L: lista; d: integer): integer;
{return the number of elements}
function L_SIZE(var L: lista): integer;



IMPLEMENTATION
{given a list pointer initialize list}
procedure L_NEW(var L: lista);
var
   auxL : lista;
begin
     new(auxL);
     L := auxL;
end;

{remove all list values, and dispose from memory}
procedure L_DISPOSE(var L: lista);
Begin
end;

{return the element at the specified position in the list.}
function L_GET(var L: lista; pos: integer): integer;
Begin
end;

{remove the element at the specified position}
procedure L_REMOVE(var L: lista; i: integer);
Begin
end;

{removes the first occurrence of element}
function L_REMOVE_INT(var L: lista; d: integer): Boolean;
Begin
end;

{return the index in this list of the first occurence, or -1 if list does not contain element}
function L_INDEXOF(var L: lista; d: integer): integer;
Begin
end;

{return true if the list contains no elements.}
function L_ISEMPTY(var L: lista): Boolean;
Begin
end;

{returns the index of the las ocurrence, or -1 if list does not contain element}
function L_LASTINDEXOF(var L: lista; d: integer): integer;
Begin
end;

{return the number of elements}
function L_SIZE(var L: lista): integer;
Begin
end;

END.



