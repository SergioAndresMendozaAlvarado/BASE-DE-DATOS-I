CREATE DATABASE DEFENSA_HITO4_UNIFRANZITOS_1;
USE DEFENSA_HITO4_UNIFRANZITOS_1;


CREATE TABLE campeonato(
id_campeonato VARCHAR(12) PRIMARY KEY,
nombre_campeonato VARCHAR(30) NOT NULL,
sede VARCHAR(20) NOT NULL
)

CREATE TABLE equipo(
id_equipo VARCHAR(12) PRIMARY KEY,
nombre_equipo VARCHAR(30) NOT NULL,
categoria VARCHAR(50) NOT NULL,
id_campeonato VARCHAR(12),
FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO (id_campeonato)
)

CREATE TABLE jugador(
id_jugador VARCHAR(12) PRIMARY KEY,
nombres VARCHAR(30) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
CI VARCHAR(15) NOT NULL,
edad INTEGER,
id_equipo VARCHAR(12),
FOREIGN KEY (id_equipo) REFERENCES EQUIPO (id_equipo)
)

INSERT INTO campeonato(id_campeonato,nombre_campeonato,sede)
VALUES('camp-111','Campeonato Unifranz','El Alto')
,('camp-222','Campeonato Unifranz','Cochabamba')

INSERT INTO equipo(id_equipo,nombre_equipo,categoria,id_campeonato)
VALUES('equ-111','Google','varones','camp-111')
,('equ-222','404 Not found','varones','camp-111'),
('equ-333','girls unifranz','mujeres','camp-111')

INSERT INTO jugador (id_jugador,nombres,apellidos,CI,edad,id_equipo)
VALUES('jug-111','Carlos','Villa','8997811LP',19,'equ-222'),
('jug-222','Pedro','Salas','8997822LP',20,'equ-222'),
('jug-333','Saul','Araj','8997833LP',21,'equ-222'),
('jug-444','Sandra','Solis','8997844LP',20,'equ-333'),
('jug-555','Ana','Mica','8997855LP',23,'equ-333')


SELECT * FROM campeonato
SELECT * FROM equipo
SELECT * FROM jugador


--EJERCICIO 1

SELECT * FROM jugador WHERE id_equipo = 'equ-333'

SELECT jug.*
FROM jugador as jug WHERE jug.id_equipo = 'equ-333'



--EJERCICIO 2

ALTER FUNCTION F1_CantidadJugadores()
RETURNS INT AS 
BEGIN
DECLARE @resp INT
		SELECT @resp = COUNT(jug.id_jugador)
		FROM jugador AS jug
		RETURN @resp
END

SELECT dbo.F1_CantidadJugadores()


--EJERCICIO 3


ALTER FUNCTION F2_CantidadJugadoresParam(@VARON_MUJER VARCHAR(50))
RETURNS INTEGER AS 
BEGIN
DECLARE @resp INT

		SELECT @resp = COUNT(jug.id_JUGADOR)
		FROM jugador AS jug
		INNER JOIN equipo AS equ ON equ.id_equipo = jug.id_equipo
		WHERE equ.categoria = @VARON_MUJER
		RETURN @resp

END
SELECT dbo.F2_CantidadJugadoresParam('varones')


--EJERCICIO 4

ALTER FUNCTION F3_PromedioEdades(@años VARCHAR(50),@gen VARCHAR(50))
RETURNS INTEGER AS 
BEGIN
DECLARE @resp INTEGER
		SELECT @resp = AVG(jug.edad)
		FROM jugador AS jug
		INNER JOIN equipo AS equ ON equ.id_equipo = jug.id_equipo
		WHERE equ.categoria = @gen AND jug.edad >@años
		RETURN @resp
END


SELECT dbo.F3_PromedioEdades(19,'varones')


--EJERCICIO 5

ALTER FUNCTION F4_ConcatItems(@name varchar(50),@team varchar(50),@sede varchar(50))
RETURNS VARCHAR(200) AS 
BEGIN

DECLARE @respuesta varchar(200)
		SELECT @respuesta = jug.NOMBRES +' '+ eq.NOMBRE_EQUIPO +' ' + cam.SEDE
		FROM JUGADOR AS jug
		inner join EQUIPO AS eq ON eq.id_EQUIPO=jug.id_EQUIPO
		inner join CAMPEONATO AS cam ON  cam.id_CAMPEONATO=eq.id_CAMPEONATO
		WHERE jug.NOMBRES = @name AND eq.NOMBRE_EQUIPO = @team AND cam.sede=@sede
		RETURN @respuesta
END

SELECT dbo.F4_ConcatItems('Saul','404 Not found','El Alto') AS nom_concat
SELECT * FROM campeonato
SELECT * FROM equipo
SELECT * FROM jugador 




--EJERCICIO 6 SERIE FEBONACCI

ALTER FUNCTION fibo(@num1 int )
RETURNS INTEGER AS
BEGIN
		DECLARE @a int =3;
		DECLARE @b int = 1;
		DECLARE @c int = 1;
		WHILE @a <= @num1
		BEGIN 
		DECLARE @aux INTEGER = @b
		SET @b = @c + @b
		SET @c = @aux 
		SET @a = @a + 1
		END 
		RETURN @b
END


select dbo.fibo(20) as columna