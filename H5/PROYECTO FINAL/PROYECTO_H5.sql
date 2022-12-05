CREATE DATABASE PROYECTO_FINAL_H5;
USE PROYECTO_FINAL_H5;


--CREACION DE LAS TABLAS //AREA DE LAS TABLAS

CREATE TABLE usuarios(
id_usuario INTEGER IDENTITY  PRIMARY KEY,
nombre VARCHAR(50)NOT NULL,
apellidos VARCHAR(50)NOT NULL,
CI INTEGER,
celular INTEGER,
correo_Gmail VARCHAR(100) NOT NULL,
username VARCHAR(50)NOT NULL,
user_password VARCHAR(50)NOT NULL,
)

CREATE TABLE empleados(
id_empleado INTEGER IDENTITY  PRIMARY KEY NOT NULL,
nombre_emp VARCHAR(50)NOT NULL,
apellidos_emp VARCHAR(50)NOT NULL,
CI_emp INTEGER NOT NULL,
celular_emp INTEGER NOT NULL,
emp_name VARCHAR(50)NOT NULL,
emp_password VARCHAR(50)NOT NULL,
)

CREATE TABLE produc_electronica(
id_producto_ELC INTEGER IDENTITY PRIMARY KEY,
resistencias VARCHAR(50),
capacitadores VARCHAR(50),
leds VARCHAR(50),
leds_rgb VARCHAR(50),
protoboard VARCHAR(50),
potenciometro VARCHAR(50),
cables VARCHAR(50),
LAN VARCHAR(50),
arduino VARCHAR(50),
motorreductores VARCHAR(50),
ruedas_goma VARCHAR(50),
sensor_ultrasonico VARCHAR(50),
sonometro VARCHAR(50),
)

CREATE TABLE product_informatica(
id_producto_INF INTEGER IDENTITY PRIMARY KEY,
procesador VARCHAR(50),
motherboard VARCHAR(50),
gabinete VARCHAR(50),
gabinete_combo VARCHAR(50),
taclado VARCHAR(50),
mouse VARCHAR(50),
monitores VARCHAR(50),
RAM VARCHAR(50),
graphics_cards VARCHAR(50),
refrigeracion_cooler VARCHAR(50),
refrigeracion_liquida VARCHAR(50),
cooler VARCHAR(50),
cable_sata VARCHAR(50),
disco_duro VARCHAR(50),
SSD_kingstom VARCHAR(50),
SSD_M2 VARCHAR(50),
router_wifi VARCHAR(50),
sistema_operativo VARCHAR(50),
programas VARCHAR(50),

id_producto_ELC INTEGER,
FOREIGN KEY (id_producto_ELC) REFERENCES produc_electronica(id_producto_ELC)
)

CREATE TABLE servicio_tecnico(
id_servicio INTEGER IDENTITY PRIMARY KEY NOT NULL,
fecha_servicio VARCHAR(50) NOT NULL,
nombre_emp VARCHAR(50)NOT NULL,
ubicacion VARCHAR(100)NOT NULL,
descripcion_problema VARCHAR(200)NOT NULL,

id_empleado INTEGER,
FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado) 
)

--FIN DE LAS TABLAS

--AREA DATOS INSERTADOS

INSERT INTO usuarios(nombre,apellidos,CI,celular,correo_Gmail,username,user_password)
VALUES ('Sergio','Mendoza Alvarado','9908488','78872413','sergioandresmendozaalvarado@gmail.com','sergio7843','!sergius7843')
INSERT INTO usuarios(nombre,apellidos,CI,celular,correo_Gmail,username,user_password)
VALUES ('Kevin','Sanga Ortiz','0000001','','kevin_pan@gmail.com','kevin_404','chibolo_meppo')
SELECT *FROM usuarios

INSERT INTO empleados(nombre_emp,apellidos_emp,CI_emp,celular_emp,emp_name,emp_password)
VALUES('Sergio Andres','Mendoza Alvarado','9908488','78872413','sergio_emp','!sergius_emp'),
('Marcos','Paz Apaza','1000000','74177764','LIO64203','paz_2004')
SELECT * FROM empleados
SELECT *FROM usuarios

INSERT INTO produc_electronica(resistencias,capacitadores,leds,leds_rgb,protoboard,potenciometro,cables,LAN,arduino,motorreductores,ruedas_goma,sensor_ultrasonico,sonometro)
VALUES ('120 U. de 30 Om','En Stock ARD3','330 Rojos','50 Disponibles','En STOCK','En Stock','En Stock','En Stock','ARD 3 En stock','Sin Stock','Stock Limitado','4 unidades','En stock'),
('20 U. de 220 Om','En Stock ARD 2.0','550 balncos',' Disponibles','SIN STOCK','Modelo 2.0','En Stock','Limitado V.5GHZ','ARD 3 En stock','Sin Stock','Stock Limitado','4 unidades','En stock')
SELECT * FROM produc_electronica

SELECT user_password FROM usuarios WHERE correo_Gmail = 'sergioandresmendozaalvarado@gmail.com' --"'+ +'"
SELECT nombre FROM usuarios WHERE nombre = 'sergio'

SELECT * FROM usuarios
SELECT * FROM empleados
SELECT * FROM produc_electronica
SELECT * FROM product_informatica
SELECT * FROM servicio_tecnico

SELECT max(id_usuario) FROM usuarios

SELECT COUNT(usu.nombre)
FROM usuarios as usu
INNER JOIN empleados as emp On usu.id_usuario = id_empleado

SELECT MIN(emp.apellidos_emp)
FROM usuarios as usu
INNER JOIN empleados as emp On usu.id_usuario = id_empleado

SELECT MAX(usu.celular)
FROM usuarios as usu
INNER JOIN empleados as emp On usu.id_usuario = id_empleado

SELECT COUNT(emp.CI_emp)
FROM usuarios as usu
INNER JOIN empleados as emp On usu.id_usuario = id_empleado

CREATE FUNCTION join1()
RETURNS INTEGER AS 
BEGIN

DECLARE @promedio INT
SELECT @promedio  = COUNT(emp.CI_emp)
FROM usuarios as usu
INNER JOIN empleados as emp On usu.id_usuario = id_empleado
RETURN @promedio
END

SELECT dbo.join1()


CREATE FUNCTION join2()
RETURNS INTEGER AS 
BEGIN

DECLARE @promedio INT
SELECT @promedio  = MAX(usu.celular)
FROM usuarios as usu
INNER JOIN empleados as emp On usu.id_usuario = id_empleado
RETURN @promedio
END

SELECT dbo.join2()

ALTER FUNCTION join3()
RETURNS INTEGER AS 
BEGIN

DECLARE @promedio INT
SELECT @promedio  =  COUNT(emp.emp_name)
FROM usuarios as usu
INNER JOIN empleados as emp On usu.id_usuario = id_empleado
RETURN @promedio
END

SELECT dbo.join3()

CREATE FUNCTION join4()
RETURNS INTEGER AS 
BEGIN

DECLARE @promedio INT
SELECT @promedio  =  COUNT(usu.nombre)
FROM usuarios as usu
INNER JOIN empleados as emp On usu.id_usuario = id_empleado
RETURN @promedio
END

SELECT dbo.join4()

