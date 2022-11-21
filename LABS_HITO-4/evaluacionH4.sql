CREATE DATABASE defensa_hito4;
USE defensa_hito4;

CREATE TABLE campeonato(
id_campeonato VARCHAR(50) PRIMARY KEY NOT NULL,
nombre_campeonato VARCHAR(50) NOT NULL,
sede VARCHAR(50)NOT NULL,
)
CREATE TABLE equipo(
id_equipo VARCHAR(50)PRIMARY KEY NOT NULL,
nombre_equipo VARCHAR(50)NOT NULL,
categoria VARCHAR(50)NOT NULL,
id_campeonato VARCHAR(50) NOT NULL,
FOREIGN KEY (id_campeonato) REFERENCES campeonato (id_campeonato),
)
CREATE TABLE jugador(
id_jugador VARCHAR (50)PRIMARY KEY NOT NULL,
nombres VARCHAR(50)NOT NULL,
apellidos VARCHAR(50)NOT NULL,
ci VARCHAR(50)NOT NULL,
edad INTEGER NOT NULL,
id_equipo VARCHAR(50) NOT NULL,
FOREIGN KEY (id_equipo) REFERENCES equipo (id_equipo)
)



INSERT INTO campeonato (id_campeonato,nombre_campeonato,sede)
VALUES('camp-111','Campeonato Unifranz','El Alto'),('camp-222','Campeonato Unifranz','Cochabamba');


INSERT INTO equipo(id_equipo,nombre_equipo,categoria,id_campeonato)
VALUES('equ-111','Google','varones','camp-111'),('equ-222','404 Not found','varones','camp-111'),
('equ-333','girls unifranz','mujeres','camp-111');


INSERT INTO jugador(id_jugador,nombres,apellidos,ci,edad,id_equipo)
VALUES('jug-111','Carlos','Villa','8997811LP',19,'equ-222'),
('jug-222','Pedro','Salas','8997822LP',20,'equ-222'),
('jug-333','Saul','Araj','8997833LP',21,'equ-222'),
('jug-444','Sandra','Solis','8997844LP',20,'equ-333'),
('jug-555','Ana','Mica','8997855LP',23,'equ-333');

SELECT * FROM campeonato
SELECT * FROM equipo
SELECT * FROM jugador

--DETERMIANR CUANTOS JUGADORES EMPIEZAN CON LA LETRA S WHERE X LIKE 'S%'

SELECT jug.nombres, jug.apellidos, equ.categoria, camp.nombre_campeonato, camp.sede
FROM jugador as jug
INNER JOIN equipo as equ on equ.id_equipo = jug.id_equipo --WHERE equ.categoria = 'mujeres'
INNER JOIN campeonato as camp on camp.id_campeonato = equ.id_campeonato WHERE equ.categoria = 'mujeres' AND camp.sede= 'El Alto' 

SELECT COUNT (jug.id_jugador)
FROM jugador as jug
INNER JOIN equipo as equ on equ.id_equipo = jug.id_equipo WHERE equ.categoria = 'varones'  AND jug.apellidos LIKE 'M%' AND equ.nombre_equipo = 'Google'



ALTER FUNCTION type_client(@credit_number INT)
RETURNS VARCHAR(50) AS
BEGIN

DECLARE @cadena varchar(50);

IF (@credit_number > 50000)
  SET @CADENA = 'ES PLATINUM'

IF (@credit_number <= 10000)
  SET @CADENA = 'ES SILVER'

IF (@credit_number >= 10000 AND @credit_number <= 50000)
  SET @CADENA = 'ES GOLD'
RETURN @CADENA
END;

SELECT dbo.type_client(50123) as CATEGORIA
SELECT dbo.type_client(10123) as CATEGORIA
SELECT dbo.type_client(9123) as CATEGORIA
SELECT dbo.type_client(1000) as CATEGORIA

SELECT * FROM campeonato
SELECT * FROM equipo
SELECT * FROM jugador

 SELECT COUNT(jug.nombres), COUNT(jug.apellidos)
 FROM jugador as jug
 INNER JOIN campeonato as camp on camp.id_campeonato = camp.id_campeonato WHERE camp.sede = 'El Alto' AND jug.nombres LIKE 'S%' AND jug.apellidos LIKE 'M%'
 -----FUNCION

 ALTER FUNCTION jugadores_MS(@response VARCHAR(50))
RETURNS varchar(50) AS
BEGIN
SELECT @response = COUNT(jug.id_jugador)
 FROM jugador as jug
 INNER JOIN campeonato as camp on camp.id_campeonato = camp.id_campeonato WHERE camp.sede = 'El Alto' AND jug.nombres LIKE 'S%' AND jug.apellidos LIKE 'M%'

RETURN @response
END

SELECT dbo.jugadores_MS(1)



