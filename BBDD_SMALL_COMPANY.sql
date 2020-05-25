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


);

CREATE TABLE Edificio (


);

CREATE TABLE EquiposElectronicos (


);

CREATE TABLE Idiomas (


);

CREATE TABLE Proyectos (


);

CREATE TABLE MaterialesOficina (


);

CREATE TABLE Empleados (


);

-- Revisar nombre y tabla --
CREATE TABLE Educacion (


);

CREATE TABLE AsignacionEquiposMateriales (


);

CREATE TABLE CompetenciasEmpleados (


);


CREATE TABLE Cursos (


);

CREATE TABLE Reuniones (


);

CREATE TABLE AsignacionEdificiosTemporalesRazon (


);

CREATE TABLE AsignacionEdificiosTemporales (


);

CREATE TABLE EdificioEmpleados (


);

CREATE TABLE Hijos (


);

CREATE TABLE IdiomasEmpleados (


);

CREATE TABLE Nomina (


);

CREATE TABLE ProyectosEmpleados (


);