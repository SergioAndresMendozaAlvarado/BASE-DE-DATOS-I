CREATE DATABASE semana_2;
USE semana_2;


--SEMANA 2 BASE DE DATOS I


   CREATE TABLE escuela(
 id_esc INTEGER IDENTITY PRIMARY KEY NOT NULL,
 nombre_escuela VARCHAR(50),
 direccion VARCHAR(50),
 turno VARCHAR(50),
 )
   SELECT * FROM escuela
INSERT INTO escuela(nombre_escuela,direccion,turno)
VALUES ('San simon','Cochabamba','Manaña')
INSERT INTO escuela(nombre_escuela,direccion,turno)
VALUES ('Andres bello','El alto','Manaña-Tarde')
INSERT INTO escuela(nombre_escuela,direccion,turno)
VALUES ('Amor de dios fe y alegria','El alto','Manaña-Tarde')
INSERT INTO escuela(nombre_escuela,direccion,turno)
VALUES ('Don bosco','La paz','Manaña-Tarde-Noche')


CREATE TABLE estudiantes(
id_est INTEGER IDENTITY PRIMARY KEY NOT NULL,
nombre VARCHAR(30)NOT NULL,
apellidos VARCHAR(30)NOT NULL,
edad INTEGER NOT NULL,
fono INTEGER NOT NULL,
email VARCHAR (50) NOT NULL,
direccion VARCHAR (50) NOT NULL,
genero VARCHAR(50) NOT NULL,
id_esc INTEGER NOT NULL
FOREIGN KEY (id_esc) REFERENCES escuela(id_esc),
licencia_conducir BIT NOT NULL,
)
INSERT INTO estudiantes (nombre, apellidos, edad, fono, email, direccion, genero,licencia_conducir,id_esc)
  VALUES ('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino',0,1),
('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino',0,2),
('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino',0,3),
('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino',0,4),
('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino',0,1)
SELECT * FROM estudiantes
SELECT * FROM escuela
INSERT INTO estudiantes (nombre, apellidos, edad, fono, email, direccion, genero,licencia_conducir,id_esc)
  VALUES ('Ana' ,'Gonzales Veliz', 20, 2832115, 'Ana_liz@gmail.com', 'Av. 6 de Agosto', 'femenino',1,2)

  INSERT INTO estudiantes (nombre, apellidos, edad, fono, email, direccion, genero,licencia_conducir,id_esc)
  VALUES ('Pepito' ,'Gonzales Veliz', 20, 2832115, 'pep@gmail.com', 'Av. 6 de Agosto', 'masculino',0,3)


 --DETERMINAR CUANTOS ESTUDIANTES TIENEN LICENCIA DE CONDUCIR

 SELECT COUNT(licencia_conducir) FROM estudiantes WHERE licencia_conducir = 1;

  --DETERMINAR menores a 20 no tienen lcencia de conducir

SELECT COUNT(licencia_conducir) FROM estudiantes WHERE licencia_conducir = 0 AND edad<20;

--

SELECT COUNT(*)
FROM estudiantes as est
INNER JOIN escuela as esc on esc.id_esc = est.id_est WHERE esc.nombre_escuela = 'Amor de dios fe y alegria' 

--DETERMINAR CUNATOS STUDIANTES FORMAN PARTE DE LAS ESCUELAS QUE TIENEN LOS horaios de mañana, tarde

SELECT COUNT(*)

FROM estudiantes as est

INNER JOIN escuela as esc on esc.id_esc = est.id_est WHERE esc.turno = 'manaña-tarde'

select * from escuela




--DETERMINAR CUANTOS ESTUDIANTES MAYORES A 25 AÑOS ESTAN EN ESCUELAS QUE TIENEN SOLO EL TURNO DE LA TARDE


SELECT COUNT(*)

FROM estudiantes as est

INNER JOIN escuela as esc on esc.id_esc = est.id_est WHERE esc.turno = 'tarde' AND est.edad > 25
select * from estudiantes



CREATE FUNCTION retorna_nombre_materia()
RETURNS VARCHAR(20) as 
begin
RETURN 'Base de datos I' 
end;


SELECT dbo.retorna_nombre_materia() AS BDA;


ALTER FUNCTION retorna_nombre_materia_V2()
RETURNS VARCHAR(25) as  
begin
DECLARE @nombre varchar(50);
SET @nombre = 'base de datos II'
RETURN @nombre
end

select dbo.retorna_nombre_materia_V2() AS bda;


CREATE FUNCTION retorna_nombre_materia_V3(@nombremateria VARCHAR(25))
RETURNS VARCHAR(25) as  
begin
DECLARE @nombre VARCHAR(25);
SET @nombre = @nombremateria;
RETURN @nombre;
end;

SELECT dbo.retorna_nombre_materia_V3('DBA I')

--CREAR UNA FUNCION QUE NO RECIBE PARAMETROS, LA FUNCION DEBE SUMAR 2 NUMEROS CUALQUIERA


ALTER FUNCTION retorna_nombre_materia_V4()
RETURNS VARCHAR(25) as  
begin
DECLARE @num1 integer = 2;
DECLARE @num2 integer = 2;
DECLARE @num3 integer;
SET @num3 = @num1 + @num2
RETURN @num3;
end;

SELECT dbo.retorna_nombre_materia_V4() 


CREATE FUNCTION retorna_nombre_materia_V5(@num1 INT, @num2 INT, @num3 INT)
RETURNS VARCHAR(25) as  
begin
DECLARE @num1 integer = 2;
DECLARE @num2 integer = 2;
DECLARE @num3 integer = 4;
DECLARE @num4 integer;
SET @num4 = @num1 + @num2 + @num3
RETURN @num4;
end;

SELECT dbo.retorna_nombre_materia_V5() 







