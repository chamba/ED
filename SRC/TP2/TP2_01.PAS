PROGRAM TP2_1;

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

     {calculate sum and print}
     for n:=1 to L_SIZE(l) do inc(c,L_GET(l,n));
     writeln('sum of terms is ', c);
     readln;
END.