CREATE DATABASE labs_3
USE labs_3


ALTER FUNCTION operaciones(@num1 INT, @num2 INT, @evento VARCHAR(20))
RETURNS INT AS
BEGIN
DECLARE @resp INT = 0
IF (@evento = 'suma')
BEGIN 
SET @resp = @num1 + @num2;
END

IF (@evento = 'resta')
BEGIN 
SET @resp = @num1 - @num2;
END

IF (@evento = 'multiplicacion')
BEGIN 
SET @resp = @num1 * @num2;
END

IF (@evento = 'division')
BEGIN 
SET @resp = @num1 / @num2;
END
RETURN @resp
END;

SELECT dbo.operaciones(6,2, 'suma')as sumas
SELECT dbo.operaciones(6,2, 'resta')as resta
SELECT dbo.operaciones(6,2, 'multiplicacion')as smultiplicacion
SELECT dbo.operaciones(6,2, 'division')as division




--METODO 2 AUN MAS OPTIMO

CREATE FUNCTION operaciones_V2(@num1 INT, @num2 INT, @evento VARCHAR(20))
RETURNS INT AS
BEGIN
DECLARE @resp INT = 0
IF (@evento = 'suma')

RETURN @num1 + @num2;

IF (@evento = 'resta')

 RETURN @num1 - @num2;


IF (@evento = 'multiplicacion')

RETURN @num1 * @num2;


IF (@evento = 'division')

RETURN @num1 / @num2;

RETURN @resp
END;



SELECT dbo.operaciones_V2(6,2, 'suma')as sumas
SELECT dbo.operaciones_V2(6,2, 'resta')as resta
SELECT dbo.operaciones_V2(6,2, 'multiplicacion')as smultiplicacion
SELECT dbo.operaciones_V2(6,2, 'division')as division


--TERCERA FUNCION CON EL METODO CASE


USE semana_2
SELECT *FROM estudiantes

SELECT COUNT(*) from estudiantes WHERE edad > 25

--CREAR UNA FUNCION QUE PERMITA SABER LA CANTIDAD DE ESTUDIANTES MAYORES A CIERTA EDAD

CREATE FUNCTION mayores_a_cierta_edad(@edad INT)
RETURNS INT AS
BEGIN
DECLARE @response INT = 0;

SELECT @response = COUNT(est.id_est) FROM estudiantes AS est WHERE est.edad > @edad;

RETURN @response
END

SELECT dbo.mayores_a_cierta_edad(25)as estudiantes_mayores_a_25;

--DETERMINAR EDAD DE ESTUDIANTES FEMENINOS MEYORES A 20 Y QUE ESTEN EN LA ESCUELA ANDRES BELLO

ALTER FUNCTION CANTIDAD(@edad INT, @genero VARCHAR(29))
RETURNS INT AS
BEGIN
DECLARE @response INT = 0;

SELECT @response = COUNT(est.id_esc) 
FROM estudiantes AS est 
INNER JOIN escuela as esc on esc.id_esc = est.id_esc
WHERE est.genero = 'femenino' AND est.edad > 20 AND esc.nombre_escuela = 'Andres bello'


RETURN @response
END

SELECT dbo.CANTIDAD(20,'femenino')as estudiantes_mayores_a_20;

SELECT * FROM escuela
SELECT * FROM estudiantes


SELECT est.id_est, est.nombre, est.apellidos, est.edad, est.fono, est.email, est.direccion,est.genero,est.id_esc,est.licencia_conducir
FROM estudiantes as est WHERE est.nombre = 'Pepito'


ALTER FUNCTION ultimo()
RETURNS INT AS
BEGIN

DECLARE @response INT = 0;
SELECT @response = max(id_est)
FROM estudiantes AS est 
RETURN @response;

END


SELECT est.*
FROM estudiantes as est WHERE est.id_est = dbo.ultimo()
































	
