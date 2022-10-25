CREATE DATABASE universidad__1;

USE	 universidad__1;

DROP TABLE IF EXISTS kardex;
DROP TABLE IF EXISTS estudiantes;
DROP TABLE IF EXISTS kardex;

CREATE TABLE estudiantes
(
	id_est_cedula integer identity primary key,
	nombres varchar (100) not null,
	apellidos varchar (100)not null,
	sexo varchar (10) not null,
	direccion varchar (200) not null,
	telefono integer not null,
	email varchar(50) not null,
	edad integer not null,
	id_esc integer not null,
	foreign key (id_esc) references escuela(id_esc)
);

CREATE TABLE materias
(
	id_mat integer identity primary key not null,
	nombre_mat varchar(100) not null,
	cod_mat varchar (100) not null
);

CREATE TABLE escuela
(
	id_esc integer identity primary key not null,
	nombre varchar (100) not null,
	direccion varchar (100) not null,
);

CREATE TABLE periodo
(
	id_per integer identity primary key not null,
	ano_gestion integer not null,
	semestre varchar (100)
);

CREATE TABLE kardex
(
	id_Kar integer identity primary key not null,
	nota_num integer not null,
	nota_alfabe varchar(100) not null,
	estado varchar (10) not null,
	id_mat integer,
	id_est_cedula integer,
	id_per integer,
	foreign key (id_mat) references materias(id_mat),
	foreign key (id_est_cedula) references estudiantes(id_est_cedula),
	foreign key (id_per) references periodo(id_per)
);

select * from kardex;

insert into escuela(nombre,direccion)
	values('san pedro','av 6 demarzo');

select * from escuela;

INSERT INTO estudiantes ( nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc)VALUES
  ('Ximena', 'Arias Ballesteros', 'femenino', 'Av. 6 de Agosto', 79617575, 'xime@gmail.com', 25, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Saul', 'Montes Valenzuela', 'masculino', 'Av. 6 de Agosto', 79617576, 'saul@gmail.com', 24, 1);
INSERT INTO estudiantes ( nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Carla', 'Mavir Uria', 'femenino', 'Av. 6 de Agosto', 79617577, 'carla@gmail.com', 28, 1);
INSERT INTO estudiantes ( nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Joel', 'Castillo Fuentes', 'masculino', 'Av. 6 de Agosto', 79617578, 'joel@gmail.com', 21, 1);
INSERT INTO estudiantes (nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc) VALUES
  ('Augusto', 'Copar Copar', 'femenino', 'Av. 6 de Agosto', 79617579, 'augusto@gmail.com', 20, 1);

INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Introduccion a la Arquitectura','ARQ-101');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Urbanismo y Diseno','ARQ-102');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Dibujo y Pintura Arquitectonico','ARQ-103');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Matematica discreta','ARQ-104');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Fisica Basica','ARQ-105');


INSERT INTO periodo (ano_gestion, semestre) VALUES (2016, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2016, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2017, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2017, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2018, 'Semestre 1');


select * from estudiantes;

insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
	values(51,'cincuenta y uno','aprobado',1,1,1); 
insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
	values(31,'treinta y uno','reprobado',2,2,2);
insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
	values(61,'sesenta y uno','aprobado',3,3,3);  
insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
	values(41 ,'cuarenta y uno','reprobado',4,4,4);
insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
	values(81,'ochenta y uno','aprobado',5,4,5);  

truncate table kardex;

select * from kardex;


select nombres,apellidos 
from estudiantes
where edad>=24 and sexo = 'masculino' or edad>=24 and sexo = 'femenino';


select nombres,apellidos 
from estudiantes
where edad>=24 and sexo = 'femenino';


select nombres,apellidos 
from estudiantes
where edad>=24 and sexo = 'masculino';

--Mostrar los nombres y apellidos de todos los estudiantes aprobados.
-- ESTUDIANTES 
-- KARDEX

SELECT est.nombres, est.apellidos, kar.nota_num
FROM estudiantes AS est INNER JOIN kardex AS kar ON	kar.id_est_cedula = est.id_est_cedula 	
WHERE kar.nota_num >= 51;

SELECT est.nombres, est.apellidos, est.edad
FROM estudiantes AS est INNER JOIN kardex AS kar ON	kar.id_est_cedula = est.id_est_cedula 	
WHERE kar.nota_num < 51 and est.sexo = 'masculino';
-----------------


select est.nombres, est.apellidos,esc.direccion
from escuela as esc
INNER JOIN estudiantes as est on est.id_esc = est.id_esc 
where esc.nombre = 'san pedro';
--MOSTRAR TODOS LO ESTUDIANTES DEL MISMO COLEGIO MAYORES A 22 Y DE SEXO MASCULINO

select est.nombres, est.apellidos,esc.direccion
from escuela as esc
INNER JOIN estudiantes as est on est.id_esc = est.id_esc 
where est.edad >= 22 AND est.sexo = 'masculino' AND esc.nombre = 'san pedro';

--MOSTRAR LOS NOMBRES DE LOS ESTUDIANTES APROBADOS EN FISICA BASICA       nota_num    materias nombre_mat

SELECT est.nombres, est.apellidos, kar.nota_num, mat.nombre_mat
FROM kardex as kar
INNER JOIN estudiantes as est on kar.id_est_cedula = est.id_est_cedula
INNER JOIN materias as mat on kar.id_mat = mat.id_mat
WHERE kar.nota_num >= 51 and mat.nombre_mat = 'Fisica Basica'

--mostrar nombres y apellidos de los estudiantes aprobados y que tengan 25 años

SELECT est.nombres, est.apellidos, kar.nota_num, mat.nombre_mat
FROM kardex as kar
INNER JOIN estudiantes as est on kar.id_est_cedula = est.id_est_cedula
INNER JOIN materias as mat on kar.id_mat = mat.id_mat
WHERE kar.nota_num >= 51 AND est.edad <= 25 AND mat.nombre_mat = 'Fisica Basica'

-- MOTRAR SEMESTRE Y EL AÑO DEL ESTUDIANTES QUE TENGA CEDULA IGUAL A "6775688"

SELECT per.semestre, per.ano_gestion
FROM kardex as kar
INNER JOIN estudiantes as est on kar.id_est_cedula = est.id_est_cedula
INNER JOIN periodo as per on kar.id_per = per.id_per

WHERE est.id_est_cedula = 6775688;