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


    
    PRIMARY KEY ()
);

CREATE TABLE Idiomas (
    ID_Idioma int(11) not null,
    Idioma varchar(50) not null,

    PRIMARY KEY (ID_Idioma)
);

CREATE TABLE Proyectos (


    PRIMARY KEY ()
);

CREATE TABLE MaterialesOficina (


    PRIMARY KEY ()
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


    PRIMARY KEY ()
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


    PRIMARY KEY ()
);

CREATE TABLE IdiomasEmpleados (


    PRIMARY KEY ()
);

CREATE TABLE Nomina (



    PRIMARY KEY ()
);

CREATE TABLE ProyectosEmpleados (


    PRIMARY KEY ()
);