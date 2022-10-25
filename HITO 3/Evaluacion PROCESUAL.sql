CREATE DATABASE UNIFRANZITOS_2;

USE UNIFRANZITOS_2;

--CREACION DE NUESTRAS TABLAS

CREATE TABLE campeonato(  --el carchar nos aceptara valores de tipo numericos y letras
id_campeonato VARCHAR(12) NOT NULL PRIMARY KEY,
nombre_campeonato VARCHAR(30) NOT NULL,
sede VARCHAR(30) NOT NULL,
)

--llenar valores

INSERT campeonato(id_campeonato,nombre_campeonato,sede)
VALUES ('camp-111','CAMPEONATO UNIFRANZ','El alto')
INSERT campeonato(id_campeonato,nombre_campeonato,sede)
VALUES ('camp-222','CAMPEONATO UNIFRANZ','Cochabamba')

SELECT * FROM campeonato

CREATE TABLE equipo(
id_equipo VARCHAR(12) PRIMARY KEY NOT NULL,
nombre_equipo VARCHAR(30) NOT NULL,
categoria VARCHAR(10)NOT NULL,
id_campeonato VARCHAR(12) NOT NULL,
FOREIGN KEY (id_campeonato) REFERENCES campeonato (id_campeonato),
)

INSERT equipo(id_equipo, nombre_equipo, categoria, id_campeonato)
VALUES ('equ-111','Google','varones','camp-111')
INSERT equipo(id_equipo, nombre_equipo, categoria, id_campeonato)
VALUES ('equ-222','404 NOT FOUND','varones','camp-111')
INSERT equipo(id_equipo, nombre_equipo, categoria, id_campeonato)
VALUES ('equ-333','Girls Unifranz','mujeres','camp-111')


SELECT * FROM equipo WHERE id_equipo = 'equi-6' --clausula WHERE 

CREATE TABLE jugador(
id_jugador VARCHAR(12) PRIMARY KEY,
nombres VARCHAR(30) NOT NULL,
apellidos VARCHAR(30) NOT NULL,
CI VARCHAR(15) NOT NULL,
edad integer NOT NULL,
id_equipo VARCHAR(12)
FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo),
)

INSERT jugador(id_jugador,nombres,apellidos,CI,edad,id_equipo)
VALUES ('jug-111','CARLOS', 'VILLA','8997811LP','19','equ-222')
INSERT jugador(id_jugador,nombres,apellidos,CI,edad,id_equipo)
VALUES ('jug-222','PEDRO', 'SALAS','8997822LP','20','equ-222')
INSERT jugador(id_jugador,nombres,apellidos,CI,edad,id_equipo)
VALUES ('jug-333','SAUL', 'ARAJ','8997833LP','21','equ-222')
INSERT jugador(id_jugador,nombres,apellidos,CI,edad,id_equipo)
VALUES ('jug-444','SANDRA', 'SOLIS','8997844LP','20','equ-333')
INSERT jugador(id_jugador,nombres,apellidos,CI,edad,id_equipo)
VALUES ('jug-555','ANA', 'MICA','8997855LP','23','equ-333')

--clausula where	

SELECT * FROM jugador WHERE id_equipo = 'equ-222'


SELECT jug.nombres,jug.apellidos, equ.categoria
FROM jugador AS jug
INNER JOIN equipo AS equ ON jug.id_equipo = equ.id_equipo    
INNER JOIN campeonato AS cam ON cam.id_campeonato = equ.id_campeonato
WHERE jug.edad >= 21 AND equ.categoria = 'varones'

--LIKE

SELECT * FROM jugador WHERE apellidos LIKE 'S%'

--CATEGORIA MUJERES CAMP-111

SELECT id_campeonato, categoria FROM equipo WHERE categoria = 'mujeres'




 