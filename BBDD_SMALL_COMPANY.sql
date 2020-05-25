-- BBDD Pequeña Empresa - Sergio Esteban Tarrero --
-- Versión 0.1 --
-- Cambios:   --

DROP DATABASE IF EXISTS SMALLCOMPANY;
CREATE DATABASE SMALLCOMPANY;

CREATE TABLE Competencias (
    ID_Competencia int(15) not null,
    Tipo varchar(50) not null,
    Competencia varchar(50) not null,
    AreaProfesional varchar(50) not null,
    
    PRIMARY KEY (ID_Competencia)
);

CREATE TABLE Departamentos (


    PRIMARY KEY ()
);

CREATE TABLE Edificio (



    PRIMARY KEY ()
);

CREATE TABLE EquiposElectronicos (


    
    PRIMARY KEY ()
);

CREATE TABLE Idiomas (


    PRIMARY KEY ()
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