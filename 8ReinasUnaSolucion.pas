PROGRAM EIGHTQUEEN1(OUTPUT);
VAR I: INTEGER; Q: BOOLEAN;
A: ARRAY[1..8] OF BOOLEAN;
B: ARRAY[2..16] OF BOOLEAN;
C: ARRAY[-7..7] OF BOOLEAN;
X: ARRAY[1..8] OF INTEGER;
PROCEDURE PRINT;
VAR I,J: INTEGER;
BEGIN
FOR I:=1 TO 8 DO  WRITE(X[I]:4)
WRITELN;
FOR I:=1 TO 8 DO
BEGIN
FOR J:=1 TO 8 DO
BEGIN
IF X[J]=I THEN WRITE ('*')
ELSE WRITE ('-');
WRITE (' ')
END;
WRITELN
END;
WRITELN
END; (* PRINT *)
PROCEDURE TRY(I: INTEGER ; VAR Q: BOOLEAN);
VAR J: INTEGER;
BEGIN J:= 0 ;
REPEAT J:=J+1; Q := FALSE;
IF A[J] AND B[I+J] AND C[I-J] THEN
BEGIN X[I] := J;
A[J] := FALSE ; B[I+J] := FALSE; C[I-J] := FALSE;
IF I<8 THEN
BEGIN TRY(I+1,Q);
IF NOT Q THEN
BEGIN A[J] := TRUE; B[I+J] := TRUE; C[I-J] := TRUE END
END
ELSE Q:= TRUE
END
UNTIL Q OR (J=8)
END (* TRY *) ;
BEGIN (* MAINPGM *)
FOR I := 1 TO 8 DO A[I]:= TRUE;
FOR I := 2 TO 16 DO B[I] := TRUE;
FOR I := -7 TO 7 DO C[I] := TRUE;
TRY (1,Q);
{PAGE;}
IF Q THEN PRINT;
END.
