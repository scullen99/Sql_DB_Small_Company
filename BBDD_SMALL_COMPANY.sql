-- BBDD Pequeña Empresa - Sergio Esteban Tarrero --
-- https://github.com/scullen99/bbdd_small_company.git --
-- Versión 0.5 --

/* Comando entrada para XAMPP MySQL

   mysql -u root
   DROP DATABASE IF EXISTS SMALLCOMPANY;
   CREATE DATABASE SMALLCOMPANY;
   USE SMALLCOMPANY;

*/

DROP DATABASE IF EXISTS SMALLCOMPANY;
CREATE DATABASE SMALLCOMPANY;
USE SMALLCOMPANY;

-- Creación Tabla Competencias --
CREATE TABLE Competencias (

    ID_Competencia int(11) not null,
    Tipo varchar(100) not null,
    Competencia varchar(100) not null,
    AreaProfesional varchar(100) not null,
    
    PRIMARY KEY (ID_Competencia)

);

-- Añadir Datos a la Tabla Competencias --

-- Creación Tabla Departamentos --
CREATE TABLE Departamentos (

    ID_Departamento int(11) not null,
    Departamento varchar(100) not null,
    subDivision varchar(100) not null,

    PRIMARY KEY (ID_Departamento)

);

-- Añadir Datos a la Tabla Departamentos --

-- Creación Tabla  --
CREATE TABLE Edificio (

    ID_Edificio int(11) not null auto_increment,
    Planta int(11) unsigned not null,
    Sala int(11) unsigned not null,
    Puesto int(11) unsigned not null,
    Asignado enum('si','no') not null default 'no',

    PRIMARY KEY (ID_Edificio)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE EquiposElectronicos (

    ID_Equipo_Electronico int(11) not null,
    Tipo varchar(100) not null,
    Nombre varchar(100) not null,
    Precio double not null,
    Marca varchar(100) not null,
    Fecha_Compra date not null,
    Usable enum('si', 'no') not null default 'no',
    Codigo varchar(100) not null,

    PRIMARY KEY (ID_Equipo_Electronico)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Idiomas (

    ID_Idioma int(11) not null,
    Idioma varchar(100) not null,

    PRIMARY KEY (ID_Idioma)
);

-- Añadir Datos a la Tabla  --
INSERT INTO idiomas (ID_Idioma,Idioma) VALUES 
(1,'Espanol')
,(2,'Ingles')
,(3,'Italiano')
,(4,'Chino')
,(5,'Frances')
,(6,'Panyabi')
,(7,'Japones')
,(8,'Bengali')
;

-- Creación Tabla  --
CREATE TABLE Proyectos (

    ID_Proyecto int(11) not null,
    Nombre varchar(100) not null,
    Fecha_Inicio date not null,
    Fecha_Inicio_Real date default null,
    Fecha_Fin date not null,
    Fecha_Fin_Real date default null,
    ID_Empleado_Responsable int(11) not null,
    Presupuesto double not null,

    PRIMARY KEY (ID_Proyecto)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE MaterialesOficina (

    Id_Materiales_Oficina int(11) not null,
    Material varchar(100) not null,
    Cantidad int(11) not null,
    Usable enum('si', 'no') not null default 'si',
    Fecha_Compra date not null,

    PRIMARY KEY (Id_Materiales_Oficina)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Empleados (

    ID_Empleado int (11) not null,
    Dni varchar(10) not null,
    Nombre varchar(100) not null,
    Telefono varchar(100) not null,
    Numero_Seguridad_Social int(11) not null,
    Categoria_Profesional varchar(100) not null,
    Situacion_Familiar enum("Soltero", "Casado", "Divorciado") not null default 'Casado',
    Sueldo double not null,
    Numero_Cuenta_Bancaria varchar(45) not null,
    Fecha_Ingreso date not null,
    Fecha_Nacimiento date not null,
    ID_Departamento int (11) not null,

    PRIMARY KEY (ID_Empleado)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Educacion (

    ID_Educacion int (11) not null,
    ID_Empleado int (11) not null,
    Titulo varchar(100) not null,
    Institucion varchar(100) not null,
    Nivel varchar(100) not null,
    Fecha_Graduacion date not null,

    PRIMARY KEY (ID_Educacion)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE AsignacionEquiposMateriales (

    ID_Asignacion_Equipos_Materiales int(11) not null auto_increment,
    Tipo enum('Equipo', 'Material') not null default 'Equipo',
    ID_Equipo int(11) default not null,
    ID_Material int(11) default not null,
    Asignado enum('Empleado', 'Proyecto', 'Sala') not null default 'Empleado',
    ID_Empleado int(11) default not null,
    ID_Proyecto int(11) default not null,
    Sala int(11) unsigned default not null,
    Fecha_Inicio date not null,
    Fecha_Fin date null,

    PRIMARY KEY (ID_Asignacion_Equipos_Materiales)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE CompetenciasEmpleados (

    ID_Compenecia_Empleado int(11) not null,
    ID_Competencia int(11) not null,
    ID_Empleado int(11) not null,
    Nivel_Requerido int(11) unsigned not null,
    Nivel_Alcanzado int(11) unsigned not null,
    Fecha_Evaluacion date not null,

    PRIMARY KEY (ID_Compenecia_Empleado)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Cursos (

    ID_Curso int(11) not null,
    Titulo varchar(100) not null,
    ID_Competencia int(11) not null,
    Profesor varchar(50) not null,
    Coste double not null,
    Cupos int(11) unsigned not null,

    PRIMARY KEY (ID_Curso)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Reuniones (

    ID_Reunion int(11) not null auto_increment,
    Titulo varchar(100) not null,
    Fecha_Hora_Inicio datetime not null,
    Fecha_Hora_Fin datetime not null,
    ID_Responsable int(11) not null,

    PRIMARY KEY (ID_Reunion)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE AsignacionEdificiosTemporalesRazon (

    ID_Asignacion_Edificio_Temporal_Razon int(11) not null,
    Razon enum("Reunion", "Curso") not null default 'Reunion',
    Fecha_Hora_Inicio datetime not null,
    Fecha_Hora_Fin datetime not null,
    ID_Curso int(11) default null,
    ID_Reunion int(11) default null,
    ID_Empleado_Responsable int(11) not null,

    PRIMARY KEY (ID_Asignacion_Edificio_Temporal_Razon)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE AsignacionEdificiosTemporales (

    ID_Asignacion_Edificio_Temporal int(11) not null auto_increment,
    Puesto int(11) unsigned not null,
    ID_Empleado int(11) not null,
    ID_Razon int(11) not null,

    PRIMARY KEY (ID_Asignacion_Edificio_Temporal)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE EdificioEmpleados (

    ID_Edificio_Empleado int(11) not null auto_increment,
    Puesto int(11) unsigned not null,
    ID_Empleado int(11) not null,
    Fecha_Asignacion date not null,
    Fecha_Entrega date not null,

    PRIMARY KEY (ID_Edificio_Empleado)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Hijos (

    ID_Hijo int(11) not null,
    ID_Empleado int(11) not null,
    Nombre varchar(50) not null,
    Fecha_Nacimiento date not null,
    Condicion_Especial varchar(50) default null,
    Sexo varchar(100) default null,

    PRIMARY KEY (ID_Hijo)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE IdiomasEmpleados (

    ID_Idioma_Empleado int(11) not null,
    ID_Empleado int(11) not null,
    ID_Idioma int(11) not null,
    Nivel_Alcanzado enum('Básico', 'Intermedio', 'Avanzado') default 'Básico',
    
    PRIMARY KEY (ID_Idioma_Empleado)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Nomina (

    ID_Nomina int(11) not null,
    ID_Empleado int(11) not null,
    Sueldo_Base double not null,
    Dieta_Transporte double not null,
    Dieta_Comida double not null,
    Dieta_Horas_Extra double not null,
    Fecha_Nomina date not null,

    PRIMARY KEY (ID_Nomina)

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE ProyectosEmpleados (

    ID_Proyecto_Empleado int(11) not null,
    ID_Proyecto int(11) not null,
    ID_Empleado int(11) not null,
    Fecha_Incorporacion date not null,
    Fecha_Desincorporacion date not null,


    PRIMARY KEY (ID_Proyecto_Empleado)

);

-- Añadir Datos a la Tabla  --

-----------------------------------------------------------------------

-- Tabla para pruebas con XAMPP y DBeaver --

CREATE TABLE prueba (

    ID_Prueba int(11) not null,
    Nombre_Prueba varchar(50) not null,

);

-- Comandos borrar tabla, crear tabla y añadir valores --

/*

DROP TABLE smallcompany.prueba CASCADE;

CREATE TABLE prueba (

	id_prueba varchar(100) NOT NULL,
	nombre_pruena varchar(100) NOT NULL,

    PRIMARY KEY (id_prueba)
);

INSERT INTO smallcompany.prueba (id_prueba,nombre_pruena)
	VALUES ('1','prueba 1');
INSERT INTO smallcompany.prueba (id_prueba,nombre_pruena)
	VALUES ('2','prueba 2');
INSERT INTO smallcompany.prueba (id_prueba,nombre_pruena)
	VALUES ('3','prueba 3');

*/
