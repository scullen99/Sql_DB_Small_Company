-- BBDD Pequeña Empresa - Sergio Esteban Tarrero --
-- Versión 0.2 --
-- Cambios:   --

/* Comando entrada para XAMPP MySQL

   mysql -u root
   DROP DATABASE IF EXISTS SMALLCOMPANY;
   CREATE DATABASE SMALLCOMPANY;
   USE SMALLCOMPANY;

*/

DROP DATABASE IF EXISTS SMALLCOMPANY;
CREATE DATABASE SMALLCOMPANY;
USE SMALLCOMPANY;


CREATE TABLE Competencias (

    ID_Competencia int(15) not null,
    Tipo varchar(50) not null,
    Competencia varchar(50) not null,
    AreaProfesional varchar(50) not null,
    
    PRIMARY KEY (ID_Competencia)
);

CREATE TABLE Departamentos (

    ID_Departamento int(11) not null,
    Departamento varchar(100) not null,
    subDivision varchar(100) not null,

    PRIMARY KEY (ID_Departamento)
);

CREATE TABLE Edificio (

    ID int(11) not null auto_increment,
    Planta int(10) unsigned not null,
    Sala int(10) unsigned not null,
    Puesto int(10) unsigned not null,
    Asignado enum('si','no') not null default 'no',

    PRIMARY KEY (ID)
);

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

CREATE TABLE Idiomas (

    ID_Idioma int(11) not null,
    Idioma varchar(50) not null,

    PRIMARY KEY (ID_Idioma)
);

CREATE TABLE Proyectos (

    ID_Proyecto int(11) not null,
    Nombre varchar(30) not null,
    Fecha_Inicio date not null,
    Fecha_Inicio_Real date default null,
    Fecha_Fin date not null,
    Fecha_Fin_Real date default null,
    ID_Empleado_Responsable int(11) not null,
    Presupuesto double not null,

    PRIMARY KEY (ID_Proyecto)
);

CREATE TABLE MaterialesOficina (

    Id_Materiales_Oficina int(11) not null,
    Material varchar(100) not null,
    Cantidad int(11) not null,
    Usable enum('si', 'no') not null default 'si',
    Fecha_Compra date not null,

    PRIMARY KEY (Id_Materiales_Oficina)
);

CREATE TABLE Empleados (


    PRIMARY KEY ()
);

-- Revisar nombre y tabla --
CREATE TABLE Educacion (


    PRIMARY KEY ()
);

CREATE TABLE AsignacionEquiposMateriales (


    PRIMARY KEY ()
);

CREATE TABLE CompetenciasEmpleados (


    PRIMARY KEY ()
);


CREATE TABLE Cursos (

    ID_Curso int(11) not null,
    Titulo varchar(100) not null,
    ID_Competencia int(11) not null,
    Profesor varchar(50) not null,
    Coste double not null,
    Cupos int(11) unsigned not null,

    PRIMARY KEY (ID_Curso)
);

CREATE TABLE Reuniones (

    PRIMARY KEY ()
);

CREATE TABLE AsignacionEdificiosTemporalesRazon (


    PRIMARY KEY ()
);

CREATE TABLE AsignacionEdificiosTemporales (


    PRIMARY KEY ()
);

CREATE TABLE EdificioEmpleados (


    PRIMARY KEY ()
);

CREATE TABLE Hijos (

    ID_Hijo int(11) not null,
    ID_Empleado int(11) not null,
    Nombre varchar(50) not null,
    Fecha_Nacimiento date not null,
    Condicion_Especial varchar(50) default null,
    Sexo varchar(100) default null,

    PRIMARY KEY (ID_Hijo)
);

CREATE TABLE IdiomasEmpleados (

    ID_Idioma_Empleado int(11) not null,
    ID_Empleado int(11) not null,
    ID_Idioma int(11) not null,
    Nivel_Alcanzado enum('Básico', 'Intermedio', 'Avanzado') default 'Básico',
    
    PRIMARY KEY (ID_Idioma_Empleado)
);

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

CREATE TABLE ProyectosEmpleados (

    ID_Proyecto_Empleado int(11) not null,
    ID_Proyecto int(11) not null,
    ID_Empleado int(11) not null,
    Fecha_Incorporacion date not null,
    Fecha_Desincorporacion date not null,


    PRIMARY KEY (ID_Proyecto_Empleado)
);

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