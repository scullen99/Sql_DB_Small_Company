-- BBDD Pequeña Empresa - Sergio Esteban Tarrero --
-- https://github.com/scullen99/bbdd_small_company.git --
-- Versión 0.5 --

/* Comando entrada para XAMPP MySQL

   mysql -u root
   DROP DATABASE IF EXISTS SMALLCOMPANY;
   CREATE DATABASE SMALLCOMPANY;
   USE SMALLCOMPANY;

*/

CREATE SCHEMA SMALLCOMPANY;

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

-- Creación Tabla Edificio --
CREATE TABLE Edificio (

    ID_Edificio int(11) not null auto_increment,
    Planta int(11) unsigned not null,
    Sala int(11) unsigned not null,
    Puesto int(11) unsigned not null,
    Asignado enum('si','no') not null default 'no',

    PRIMARY KEY (ID_Edificio),

    UNIQUE KEY (Puesto),

    KEY Sala (Sala)

);

-- Añadir Datos a la Tabla Edificio --

-- Creación Tabla EquiposElectronicos --
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

-- Añadir Datos a la Tabla EquiposElectronicos --

-- Creación Tabla Idiomas --
CREATE TABLE Idiomas (

    ID_Idioma int(11) not null,
    Idioma varchar(100) not null,

    PRIMARY KEY (ID_Idioma)
);

-- Añadir Datos a la Tabla Idiomas --
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

-- Creación Tabla Proyectos --
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

-- Añadir Datos a la Tabla Proyectos --

-- Creación Tabla MaterialesOficina --
CREATE TABLE MaterialesOficina (

    Id_Materiales_Oficina int(11) not null,
    Material varchar(100) not null,
    Cantidad int(11) not null,
    Usable enum('si', 'no') not null default 'si',
    Fecha_Compra date not null,

    PRIMARY KEY (Id_Materiales_Oficina)

);

-- Añadir Datos a la Tabla MaterialesOficina --

-- Creación Tabla Empleados Empleados --
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

    PRIMARY KEY (ID_Empleado),

    UNIQUE KEY (Dni),

    KEY FK_Empleados_1 (ID_Departamento),

    CONSTRAINT FK_Empleados_1 FOREIGN KEY (ID_Departamento) REFERENCES Departamentos (ID_Departamento) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla Empleados Empleados --

-- Creación Tabla Educacion --
CREATE TABLE Educacion (

    ID_Educacion int (11) not null,
    ID_Empleado int (11) not null,
    Titulo varchar(100) not null,
    Institucion varchar(100) not null,
    Nivel varchar(100) not null,
    Fecha_Graduacion date not null,

    PRIMARY KEY (ID_Educacion),

    KEY FK_Educacion_1 (ID_Empleado),

    CONSTRAINT FK_Educacion_1 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla Educacion --

-- Creación Tabla AsignacionEquiposMateriales --
CREATE TABLE AsignacionEquiposMateriales (

    ID_Asignacion_Equipos_Materiales int(11) not null auto_increment,
    Tipo enum('Equipo', 'Material') not null default 'Equipo',
    ID_Equipo int(11) default null,
    ID_Material int(11) default null,
    Asignado enum('Empleado', 'Proyecto', 'Sala') not null default 'Empleado',
    ID_Empleado int(11) default null,
    ID_Proyecto int(11) default null,
    Sala int(11) unsigned default null,
    Fecha_Inicio date not null,
    Fecha_Fin date not null,

    PRIMARY KEY (ID_Asignacion_Equipos_Materiales),

    KEY FK_AsignacionEquiposMateriales_1 (ID_Proyecto),
    KEY FK_AsignacionEquiposMateriales_2 (ID_Empleado),
    KEY FK_AsignacionEquiposMateriales_3 (Sala),

    CONSTRAINT FK_AsignacionEquiposMateriales_1 FOREIGN KEY (ID_Proyecto) REFERENCES Proyectos (ID_Proyecto) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_AsignacionEquiposMateriales_2 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_AsignacionEquiposMateriales_3 FOREIGN KEY (Sala) REFERENCES Edificio (Sala) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla AsignacionEquiposMateriales --

-- Creación Tabla  --
CREATE TABLE CompetenciasEmpleados (

    ID_Compenecia_Empleado int(11) not null,
    ID_Competencia int(11) not null,
    ID_Empleado int(11) not null,
    Nivel_Requerido int(11) unsigned not null,
    Nivel_Alcanzado int(11) unsigned not null,
    Fecha_Evaluacion date not null,

    PRIMARY KEY (ID_Compenecia_Empleado),

    KEY FK_CompetenciasEmpleados_1 (ID_Competencia),
    KEY FK_CompetenciasEmpleados_2 (ID_Empleado),

    CONSTRAINT FK_CompetenciasEmpleados_1 FOREIGN KEY (ID_Competencia) REFERENCES Competencias (ID_Competencia) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_CompetenciasEmpleados_2 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Cursos (

    ID_Curso int(11) not null,
    Titulo varchar(100) not null,
    ID_Competencia int(11) not null,
    Profesor varchar(100) not null,
    Coste double not null,
    Cupos int(11) unsigned not null,

    PRIMARY KEY (ID_Curso),

    KEY FK_Cursos_1 (ID_Competencia),

    CONSTRAINT FK_Cursos_1 FOREIGN KEY (ID_Competencia) REFERENCES Competencias (ID_Competencia) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE Reuniones (

    ID_Reunion int(11) not null auto_increment,
    Titulo varchar(100) not null default 'Reunion Semanal',
    Fecha_Hora_Inicio datetime not null,
    Fecha_Hora_Fin datetime not null,
    ID_Responsable int(11) not null,

    PRIMARY KEY (ID_Reunion),

    KEY FK_Reuniones_1 (ID_Responsable),

    CONSTRAINT FK_Reuniones_1 FOREIGN KEY (ID_Responsable) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION

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

    PRIMARY KEY (ID_Asignacion_Edificio_Temporal_Razon),

    KEY FK_AsignacionEdificiosTemporalesRazon_1 (ID_Reunion),
    KEY FK_AsignacionEdificiosTemporalesRazon_2 (ID_Curso),
    KEY FK_AsignacionEdificiosTemporalesRazon_3 (ID_Empleado_Responsable),

    CONSTRAINT FK_AsignacionEdificiosTemporalesRazon_1 FOREIGN KEY (ID_Reunion) REFERENCES Reuniones (ID_Reunion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_AsignacionEdificiosTemporalesRazon_2 FOREIGN KEY (ID_Curso) REFERENCES Cursos (ID_Curso) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_AsignacionEdificiosTemporalesRazon_3 FOREIGN KEY (ID_Empleado_Responsable) REFERENCES Empleados (ID_Empleado_Responsable) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE AsignacionEdificiosTemporales (

    ID_Asignacion_Edificio_Temporal int(11) not null auto_increment,
    Puesto int(11) unsigned not null,
    ID_Empleado int(11) not null,
    ID_Razon int(11) not null,

    PRIMARY KEY (ID_Asignacion_Edificio_Temporal),

    KEY
    KEY
    KEY

    CONSTRAINT
    CONSTRAINT
    CONSTRAINT

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE EdificioEmpleados (

    ID_Edificio_Empleado int(11) not null auto_increment,
    Puesto int(11) unsigned not null,
    ID_Empleado int(11) not null,
    Fecha_Asignacion date not null,
    Fecha_Entrega date not null,

    PRIMARY KEY (ID_Edificio_Empleado),

    KEY

    CONSTRAINT

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

    PRIMARY KEY (ID_Hijo),

    KEY

    CONSTRAINT

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE IdiomasEmpleados (

    ID_Idioma_Empleado int(11) not null,
    ID_Empleado int(11) not null,
    ID_Idioma int(11) not null,
    Nivel_Alcanzado enum('Básico', 'Intermedio', 'Avanzado') default 'Básico',
    
    PRIMARY KEY (ID_Idioma_Empleado),

    KEY
    KEY

    CONSTRAINT
    CONSTRAINT

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

    PRIMARY KEY (ID_Nomina),

    KEY

    CONSTRAINT

);

-- Añadir Datos a la Tabla  --

-- Creación Tabla  --
CREATE TABLE ProyectosEmpleados (

    ID_Proyecto_Empleado int(11) not null,
    ID_Proyecto int(11) not null,
    ID_Empleado int(11) not null,
    Fecha_Incorporacion date not null,
    Fecha_Desincorporacion date not null,


    PRIMARY KEY (ID_Proyecto_Empleado),

    KEY
    KEY
    
    CONSTRAINT
    CONSTRAINT

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
