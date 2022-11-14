CREATE DATABASE calculadora;
USE calculadora;



--FUNCION

CREATE FUNCTION SRMD(@n1 int, @n2 int, @evento varchar(10))
RETURNS INT AS
BEGIN
DECLARE @resp INT

-- EL IF VA ARRIBA PORQUE ES UN CONDICIONAL, ES COMO PYTHON TIENE UNA IDENTACION

IF @evento = 'suma'
   SET @resp = @n1 + @n2
IF @evento = 'resta'
   SET @resp = @n1 - @n2
IF @evento = 'division'
   SET @resp = @n1 / @n2
IF @evento = 'multiplicacion'
   SET @resp = @n1 * @n2
RETURN (@resp)
END

SELECT dbo.SRMD(2,2,'suma') AS Sumas
SELECT dbo.SRMD(2,2,'resta') AS Restas
SELECT dbo.SRMD(2,2,'division') AS Divisones
SELECT dbo.SRMD(0,2,'multiplicacion') AS Multiplicaciones



--AQUI OTRO DE OTRA FORMA (CON AYUDA DE TUTORIAL)
--USANDO DECIMALES
CREATE FUNCTION CALCULADORA_1 (@N1 decimal(18,5),@N2 decimal(18,5),@Operacion varchar(45))
RETURNS VARCHAR(200)
AS BEGIN
DECLARE @RESULTADO VARCHAR (200) 
SET @RESULTADO=(SELECT
CASE
WHEN @Operacion='SUMA'THEN 'La suma es '+CAST(@N1+@N2 AS varchar(120))
WHEN @Operacion='RESTA'THEN 'La resta es '+CAST (@N1-@N2 AS varchar(120))
WHEN @Operacion='MULTIPLICACION' THEN 'La multiplicacion es'+CAST(@N1*@N2 AS varchar(120)) 
WHEN @Operacion='DIVISION' AND @N2<>0 THEN 'La division es'+CAST(@N1/@N2 AS varchar(120)) 
WHEN @Operacion='DIVISION' AND @N2=0 THEN 'el resultado de la division no esta definida ' 
ELSE 'Operacion no reconocida'
END)
Return @RESULTADO 
END

SELECT dbo.CALCULADORA_1 (10,3,'SUMA')as SUMA
SELECT dbo.CALCULADORA_1 (10,3,'RESTA')AS RESTA
SELECT dbo.CALCULADORA_1 (10,3,'MULTIPLICACION') AS MULTIPLICACION
SELECT dbo.CALCULADORA_1 (10,3,'DIVISION')AS DIVISION
