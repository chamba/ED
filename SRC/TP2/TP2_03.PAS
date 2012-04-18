PROGRAM TP2_3;

USES
    CRT,LS_INT;

VAR
   l: lista;
   n,c: integer;
BEGIN
     ClrScr;

     {initialize variables}
     l:= nil;
     n:= 99;
     c:= 0;

     while (n<>0) do
           begin
           write('n: ');
           readln(n);
           L_ADD(l,n);
           {
           actually we added the 0 in last place,
           but it does not modify
           the results due that "n+0 = 0"
           }
           end;


     writeln('TOTAL number added: ',L_SIZE(l));
     writeln;
     write('find occurrences of: ');
     readln(c);
     {find occurrences}
     writeln('element ',c,' was found: ',L_OCCURRENCES(l,c));
     readln;
END.