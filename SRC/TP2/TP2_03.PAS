PROGRAM TP2_3;

USES
    CRT,LS_INT;

VAR
   l,laux: lista;
   n,c: integer;
BEGIN
     ClrScr;

     {initialize variables}
     l:= nil;
     laux:= nil;
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


     writeln;
     writeln('TOTAL number added: ',L_SIZE(l));

     writeln;
     write('find occurrences of: ');
     readln(c);
     {find occurrences}
     writeln('element ',c,' was found: ',L_OCCURRENCES(l,c));

     {print reversed}
     writeln;
     writeln('reversed order: ');
     L_REVERSE(l,laux);
     for c:=1 to L_SIZE(laux) do writeln(L_GET(laux,c));

     {print subrange from index 3 to 6}
     writeln;
     writeln('sub list: ');
     L_SUB(l,laux,3,6);
     for c:=1 to L_SIZE(laux) do writeln(L_GET(laux,c));

     readln;
END.