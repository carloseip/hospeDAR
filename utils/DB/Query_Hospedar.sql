CREATE DATABASE HOSPEDAR_DB
GO

USE HOSPEDAR_DB
GO

CREATE TABLE comodidades (
  id_comodidades INT IDENTITY PRIMARY KEY,
  nombre varchar(15) NOT NULL
)
GO

INSERT INTO comodidades (nombre) VALUES
('cama'),
('comida'),
('sofa'),
('ducha'),
('tv'),
('terma'),
('Movilidad'),
('Silla');
GO

CREATE TABLE departamentos (
  id_departamentos INT IDENTITY PRIMARY KEY  NOT NULL,
  nombre varchar(20) NOT NULL
)
GO

INSERT INTO departamentos (nombre) VALUES
('Lima'),
('Ayacucho'),
('Huancavelica'),
('Cuzco'),
('Ica'),
('Arequipa'),
('Junin')
GO

CREATE TABLE usuario (
  id_usuario INT IDENTITY PRIMARY KEY NOT NULL,
  nombre varchar(100) NOT NULL,
  departamento varchar(20) NOT NULL,
  direccion varchar(200) NOT NULL,
  edad int NOT NULL,
  phone int NOT NULL,
  descripcion varchar(200) NOT NULL,
  fecha_i date NOT NULL,
  fecha_f date NOT NULL,
  porque varchar(300) NOT NULL,
  valides tinyint NOT NULL
)

INSERT INTO usuario (nombre, departamento, direccion, edad, phone, descripcion, fecha_i, fecha_f, porque, valides) VALUES
('Mariana Gomez', 'Ayacucho', 'Av. 2 de mayo Ica', 23, 976583453, 'Sufro de cancer al pancreas mi tratamiento es delicado y especializado.En Ayacucho no hay centros especializados.', '2019-06-23', '2019-06-28', 'Soy una persona de bajos recursos y mis gastos medicos son caros', 1),
('Leonel Morales Canahualpa', 'Huancavelica', 'Av. Las Camelidas Psje.3 Smp,Lima', 65, 4874576, 'Tengo poliomilitis en grado degenerativo mi enfermedad es rara y se da en pocos casos.', '2019-06-25', '2019-06-28', 'Soy de una zona de extrema pobreza que no cuenta con equipos medicos para tratar mi enfermedad.', 1);
GO

CREATE TABLE usuario_host (
  id_usuario_host INT IDENTITY PRIMARY KEY  NOT NULL,
  nombre varchar(50) NOT NULL,
  dni int NOT NULL,
  edad int NOT NULL,
  phone int NOT NULL,
  email varchar(200) NOT NULL,
  direccion varchar(200) NOT NULL,
  ayuda varchar(100) NOT NULL,
  tipo_hospedaje varchar(100) NOT NULL,
  usuario varchar(10) NOT NULL,
  Contrasenia varchar(8) NOT NULL
)

INSERT INTO usuario_host (nombre, dni, edad, phone, email, direccion, ayuda, tipo_hospedaje, usuario, Contrasenia) VALUES
('Mariana Gomez', 70675647, 37, 996754763, 'mari.gomez@gmail.com', 'Av, Marisoles345 Huamanga Ayacucho', 'Tengo hospedaje', 'habitacion', 'mari123', 'user'),
('Jesus Gomez', 876564387, 67, 995487341, 'jesus23.go@hotmail.com', 'Calle . Pedro Remuzgo 237  Huancavlica', 'Tengo un albergue', 'casa', 'jesus23go', 'jesu1aA@');
GO

CREATE TABLE hospedaje (
  id_hospedaje INT IDENTITY PRIMARY KEY  NOT NULL,
  id_usuario_host INT REFERENCES usuario_host(id_usuario_host),
  fecha_estadia DATE NOT NULL,
  id_usuario INT REFERENCES usuario(id_usuario),
  disponibilidad tinyint NOT NULL
)
GO

INSERT INTO hospedaje (id_usuario_host, fecha_estadia, id_usuario, disponibilidad) VALUES
(1, '2019-06-27', 1, 1),
(1, '2019-06-26', 1, 1);
GO

CREATE TABLE comodidades_hospedajes(
	id_comodidades INT REFERENCES comodidades(id_comodidades),
	id_hospedaje INT REFERENCES hospedaje(id_hospedaje),
	PRIMARY KEY (id_comodidades, id_hospedaje)
)
GO

INSERT INTO comodidades_hospedajes (id_comodidades, id_hospedaje) VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(2,2),
(5,2),
(6,2),
(7,2)
GO

CREATE PROC LISTAR_USUARIOS
AS
	BEGIN
		SELECT id_usuario, nombre,departamento,direccion,edad,phone,descripcion ,fecha_i,fecha_f,porque,valides FROM usuario
	END
GO

CREATE PROC AGREGAR_HUESPED
	@nombre	varchar,
	@departamento	varchar,
	@direccion		varchar,
	@edad			int,
	@phone			int,
	@descripcion	varchar,
	@fecha_i		date,
	@fecha_f		date,
	@porque			varchar,
	@valides		tinyint
AS
	BEGIN
		INSERT INTO usuario(nombre,departamento,direccion,edad,phone,descripcion,fecha_i,fecha_f,porque,valides) 
		VALUES(@nombre,@departamento,@direccion,@edad,@phone,@descripcion,@fecha_i,@fecha_f,@porque,@valides)
	END
GO



CREATE PROC LISTAR_COMODIDADES
AS
	BEGIN
		SELECT id_comodidades,nombre FROM comodidades
	END
GO

CREATE PROC AGREGAR_COMODIDADES
	@nombre VARCHAR
AS
	INSERT INTO comodidades (nombre) VALUES (@nombre)
GO



CREATE PROC LISTAR_DEPARTAMENTOS
AS
	BEGIN
		SELECT id_departamentos,nombre FROM departamentos
	END
GO

CREATE PROC AGREGAR_DEPARTAMENTOS
	@nombre VARCHAR
AS
	INSERT INTO departamentos(nombre) VALUES (@nombre)
GO




CREATE PROC LISTAR_USUARIO_HOST
AS
	BEGIN
		SELECT id_usuario_host,nombre,dni,edad,phone,email,direccion,ayuda,tipo_hospedaje,usuario,Contrasenia 
		FROM usuario_host
	END
GO

CREATE PROC AGREGAR_USUARIO_HOST
	@nombre	varchar,
	@dni	int,
	@edad	int,
	@phone	int,
	@email	varchar,
	@direccion	varchar,
	@ayuda	varchar,
	@tipo_hospedaje	varchar,
	@usuario	varchar,
	@Contrasenia	varchar
AS
	INSERT INTO usuario_host(nombre,dni,edad,phone,email,direccion,ayuda,tipo_hospedaje,usuario,Contrasenia) 
	VALUES (@nombre,@dni,@edad,@phone,@email,@direccion,@ayuda,@tipo_hospedaje,@usuario,@Contrasenia)
GO






CREATE PROC LISTAR_HOSPEDAJES
AS
	BEGIN
		SELECT id_hospedaje,id_usuario_host,fecha_estadia,id_usuario,disponibilidad FROM hospedaje
	END
GO

CREATE PROC AGREGAR_DEPARTAMENTOS
	@nombre VARCHAR
AS
	INSERT INTO departamentos(nombre) VALUES (@nombre)
GO


