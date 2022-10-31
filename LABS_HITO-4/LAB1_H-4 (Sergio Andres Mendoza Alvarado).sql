CREATE DATABASE HITO_4;

USE HITO_4;


--MANEJO DE FUNCIONES
--UNA FUNCION SIEMPRE SE EJECUTA EN LA CLAUSULA SELECT
--ADEMAS SIEMPRE RETORNA UN UNICO VALOR (una fila)
--ES APLICADO EN UN GRUPO DE REGISTROS (a una columna de la tabla)

CREATE TABLE estudiantes(
id_est INTEGER IDENTITY PRIMARY KEY NOT NULL,
nombre VARCHAR(30)NOT NULL,
apellidos VARCHAR(30)NOT NULL,
edad INTEGER NOT NULL,
fono INTEGER NOT NULL,
email VARCHAR (50) NOT NULL,
direccion VARCHAR (50) NOT NULL,
genero VARCHAR(50) NOT NULL,
--id_esc INTEGER IDENTITY NOT NULL  --verificar
)
drop table estudiantes
INSERT INTO estudiantes (nombre, apellidos, edad, fono, email, direccion, genero)
  VALUES 
('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino'),
('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino'),
('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino'),
('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino'),
('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino')

  SELECT * FROM estudiantes --primera forma de llamar una tabla 

  SELECT est.*             --segunda forma de llamar una tabla
  FROM estudiantes as est

  --DETERMINAR CUANTOS ESTUDIANTES REGISTRADOS HAY

  SELECT COUNT(*) 
  FROM estudiantes

  SELECT COUNT(est.id_est)
  FROM estudiantes as est

  SELECT COUNT(est.id_est) 
  FROM estudiantes as est

  --determinar la edad minima de los estudiantes
 SELECT MIN(est.edad)
 FROM estudiantes as est
 --determinar cunatas persona del genero femenino hay
 SELECT count(est.id_est)
 FROM estudiantes as est WHERE genero = 'femenino'

 --AÑADIENDO NUEVA COLUMNA
 
 ALTER TABLE estudiantes ADD licencia_conducir BIT
 INSERT INTO estudiantes(nombre, apellidos, edad, fono, email, direccion, genero, licencia_conducir)
  VALUES 
('Ana' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'Femenino',1),
('pepito' ,'Gonzales Veliz', 20, 2832115, 'pep@gmail.com', 'Av. 6 de Agosto', 'Femenino',0)
Select * from estudiantes

 --DETERMINAR que estudiants tienen licencia de conducir
 SELECT COUNT(est.licencia_conducir)
 FROM estudiantes as est

 SELECT COUNT(est.id_est)
 FROM estudiantes as est

 --EDAD MAXIMA DE LOS GENEROS MASCULINO Y FEMENINO
 
 SELECT MAX(est.edad)
 FROM estudiantes as est WHERE est.genero = 'femenino' or est.genero = 'masculino'

 SELECT AVG(est.edad)
 FROM estudiantes as est

 SELECT * from estudiantes

 select nombre from estudiantes where nombre  LIKE 'el%'
 --DETERMINAR CUANTOS ESTUDIANTES HAY DONDE SU APELLIDO CONTENGA LA PALABRA "EL" Y SEA MASCULINO
 
 SELECT COUNT(est.id_est) FROM estudiantes as est WHERE est.apellidos LIKE '%el%' AND est.genero = 'masculino'

 SELECT nombre from estudiantes WHERE nombre LIKE 'Miguel%'

 --DEWTERMINAR CAUNTOS ESTUDIANTES HAY CON LICENCIA DE CONDUCIR MAYOR A 20 Y MENOR A 30

 SELECT COUNT(est.id_est)
 from estudiantes as est WHERE est.edad >20 AND est.edad <30 AND est.licencia_conducir = 1

 --USANDO BETWEEN
  SELECT COUNT(est.id_est)
 from estudiantes as est WHERE est.edad BETWEEN 21 AND 29 AND est.licencia_conducir = 1

 --AGREGAR LA TABLA "ESCUELA" TODO ESTUDIANTE FORMA PARTE DE UNA ESCUELA

 CREATE TABLE escuela(
 id_esc INTEGER IDENTITY PRIMARY KEY NOT NULL,
 nombre_escuela VARCHAR(50),
 direccion VARCHAR(50),
 turno VARCHAR(50),
 )
 SELECT * FROM escuela
 drop table escuela
 INSERT INTO escuela(nombre_escuela,direccion,turno)
 VALUES ('San antonio','AV. 6 MARZO','Mañana'),
 ('San Jose','AV. 6 MARZO','Tarde'),
 ('Don bosco','AV. Bolivia','Tarde'),
 ('Don bosco','AV. Bolivia','Noche'),
 ('Don bosco','AV. Bolivia','Mañana'),
 ('San antonio','AV. 6 MARZO','Tarde'),
 ('Don bosco','AV. Bolivia','Noche'),
 ('San antonio','AV. 6 MARZO','Mañana')

  SELECT * FROM escuela
  SELECT * FROM estudiantes

 SELECT est.id_est, esc.id_esc, est.nombre,est.apellidos, esc.turno, esc.nombre_escuela
 FROM estudiantes as est
 INNER JOIN escuela as esc on esc.id_esc = est.id_est
   
















