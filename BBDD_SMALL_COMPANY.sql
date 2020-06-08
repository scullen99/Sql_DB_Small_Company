-- BBDD Pequeña Empresa - Sergio Esteban Tarrero --
-- https://github.com/scullen99/bbdd_small_company.git --
-- BBDD Terminada --

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

INSERT INTO competencias (ID_Competencia,Tipo,Competencia,AreaProfesional) VALUES 
(1,'Habilidad','Trabajo en equipo','General')
,(2,'Habilidad','Organizacion','Gestores')
,(3,'Habilidad','Analisis de datos','Analistas')
,(4,'Habilidad','Toma de decisiones','Jefatura')
,(5,'Habilidad','Orientacion','General')
,(6,'Habilidad','Creatividad','Diseño')
;

-- Creación Tabla Departamentos --
CREATE TABLE Departamentos (

    ID_Departamento int(11) not null,
    Departamento varchar(100) not null,
    subDivision varchar(100) not null,

    PRIMARY KEY (ID_Departamento)

);

-- Añadir Datos a la Tabla Departamentos --

INSERT INTO competencias (ID_Competencia,Tipo,Competencia,AreaProfesional) VALUES 
(1,'Habilidad','Trabajo en equipo','General')
,(2,'Habilidad','Organizacion','Gestores')
,(3,'Habilidad','Analisis de datos','Analistas')
,(4,'Habilidad','Toma de decisiones','Jefatura')
,(5,'Habilidad','Orientacion','General')
,(6,'Habilidad','Creatividad','Diseño')
;

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

INSERT INTO edificio (ID_Edificio,Planta,Sala,Puesto,Asignado) VALUES 
(1,1,101,10,'si')
,(2,1,102,11,'si')
,(3,2,201,20,'no')
,(4,2,202,21,'no')
,(5,3,301,30,'si')
,(6,3,302,31,'no')
;

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

INSERT INTO equiposelectronicos (ID_Equipo_Electronico,Tipo,Nombre,Precio,Marca,Fecha_Compra,Usable,Codigo) VALUES 
(1,'Portatil','PortatilSala1',600.0,'Samsung','2017-06-28','si','9K5W4ZCV')
,(2,'Portatil','PortatilPresentaciones',700.0,'Lenovo','2017-08-11','si','RS4E2DVB')
,(3,'Tablet','TabletPresentaciones',250.0,'Samsung','2017-09-26','si','XAVWKV4Q')
,(4,'Movil','MovilJefe',600.0,'Xiaomi','2018-06-21','si','5J74BM99')
,(5,'Proyector','ProyectorPresentaciones',2000.0,'LG','2018-07-10','no','T8WWAPGP')
,(6,'Impresora','ImpresoraGeneral',1000.0,'HP','2018-08-30','si','LHMLWWQE')
;

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

INSERT INTO proyectos (ID_Proyecto,Nombre,Fecha_Inicio,Fecha_Inicio_Real,Fecha_Fin,Fecha_Fin_Real,ID_Empleado_Responsable,Presupuesto) VALUES 
(1,'Alpha','2019-01-01',NULL,'2019-03-18',NULL,1,1000.0)
,(2,'Beta','2019-01-03',NULL,'2019-03-19',NULL,2,5300.0)
,(3,'Gamma','2019-01-07',NULL,'2019-03-21',NULL,3,2800.0)
,(4,'Delta','2019-01-08',NULL,'2019-04-10',NULL,4,9800.0)
,(5,'Epsilon','2019-01-28',NULL,'2019-05-27',NULL,5,2300.0)
,(6,'Dseta','2019-02-25',NULL,'2019-07-01',NULL,6,4300.0)
;

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

INSERT INTO materialesoficina (Id_Materiales_Oficina,Material,Cantidad,Usable,Fecha_Compra) VALUES 
(1,'Boli Azul',300,'si','2018-01-01')
,(2,'Boli Negro',300,'si','2018-01-01')
,(3,'Grapadora',20,'si','2018-01-01')
,(4,'Folios Blancos',10000,'si','2018-01-01')
,(5,'Archivador',100,'si','2018-01-01')
,(6,'Tijeras',50,'si','2018-01-01')
;

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

INSERT INTO empleados (ID_Empleado,Dni,Nombre,Telefono,Numero_Seguridad_Social,Categoria_Profesional,Situacion_Familiar,Sueldo,Numero_Cuenta_Bancaria,Fecha_Ingreso,Fecha_Nacimiento,ID_Departamento) VALUES 
(1,'80410815D','Juan','667047493',707314539,'Jefe','Casado',60000.0,'ES6420803535534242776985','2002-10-31','1961-04-10',1)
,(2,'66718919J','Sara','799145543',577204052,'Jefa','Casado',75000.0,'ES1504872971388834914765','2004-07-01','1966-06-28',2)
,(3,'98273537B','Manuel','767329400',291905102,'Empleado','Casado',35000.0,'ES4421003894431294787898','2004-11-15','1969-07-15',3)
,(4,'67009271J','Ana','671502324',328362889,'Empleada','Divorciado',20000.0,'ES0721009884829572568615','2006-05-24','1972-06-22',4)
,(5,'31509505B','Sergio','765502135',970295775,'Empleado','Casado',45000.0,'ES0421004196174295151729','2008-03-14','1974-10-21',5)
,(6,'59419832E','Daniel','785873068',53063945,'Empleado','Soltero',50000.0,'ES8220958527685837736956','2008-04-25','1982-10-06',6)
;

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

INSERT INTO educacion (ID_Educacion,ID_Empleado,Titulo,Institucion,Nivel,Fecha_Graduacion) VALUES 
(1,1,'Doctor','RRHH','10','1983-06-05')
,(2,2,'Doctora','Analisis','10','1988-06-05')
,(3,3,'Graduado','RRHH','8','1991-06-05')
,(4,4,'Graduada','Marketing','7','1994-06-05')
,(5,5,'Graduado','Gestion','8','1996-06-05')
,(6,6,'Graduado','Logistica','9','2004-06-05')
;

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

INSERT INTO asignacionequiposmateriales (ID_Asignacion_Equipos_Materiales,Tipo,ID_Equipo,ID_Material,Asignado,ID_Empleado,ID_Proyecto,Sala,Fecha_Inicio,Fecha_Fin) VALUES 
(1,'Equipo',1,1,'Empleado',1,1,101,'2020-01-02','2020-01-03')
,(2,'Equipo',2,2,'Proyecto',2,2,102,'2020-01-06','2020-01-08')
,(3,'Equipo',3,3,'Proyecto',3,3,201,'2020-01-09','2020-01-10')
,(4,'Equipo',4,4,'Proyecto',4,4,202,'2020-01-14','2020-01-16')
,(5,'Material',5,5,'Empleado',5,5,301,'2020-01-16','2020-01-17')
,(6,'Material',6,6,'Sala',6,6,302,'2020-01-28','2020-01-29')
;

-- Creación Tabla CompetenciasEmpleados --
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

-- Añadir Datos a la Tabla CompetenciasEmpleados --

INSERT INTO competenciasempleados (ID_Compenecia_Empleado,ID_Competencia,ID_Empleado,Nivel_Requerido,Nivel_Alcanzado,Fecha_Evaluacion) VALUES 
(1,1,1,1,10,'2020-03-05')
,(2,2,2,1,10,'2020-03-06')
,(3,3,3,1,10,'2020-03-09')
,(4,4,4,1,10,'2020-03-10')
,(5,5,5,1,10,'2020-03-11')
,(6,6,6,1,10,'2020-03-12')
;

-- Creación Tabla Cursos --
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

-- Añadir Datos a la Tabla Cursos --

INSERT INTO cursos (ID_Curso,Titulo,ID_Competencia,Profesor,Coste,Cupos) VALUES 
(1,'Introduccion',1,'Jose Antonio',1000.0,10)
,(2,'Parte 1',2,'Eva',2000.0,5)
,(3,'Parte 2',3,'Jose Antonio',1000.0,10)
,(4,'Parte 3',4,'Alvaro',500.0,5)
,(5,'Parte 4',5,'Javier',700.0,6)
,(6,'Resumen',6,'Marta',900.0,5)
;

-- Creación Tabla Reuniones --
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

-- Añadir Datos a la Tabla Reuniones --

INSERT INTO reuniones (ID_Reunion,Titulo,Fecha_Hora_Inicio,Fecha_Hora_Fin,ID_Responsable) VALUES 
(1,'Reunion 1','2020-03-09 09:25:00.000','2020-03-09 10:00:00.000',1)
,(2,'Reunion 2','2020-03-09 11:15:00.000','2020-03-09 12:00:00.000',2)
,(3,'Reunion 3','2020-03-09 11:40:00.000','2020-03-09 13:00:00.000',3)
,(4,'Reunion 4','2020-03-09 12:30:00.000','2020-03-09 13:30:00.000',4)
,(5,'Reunion 5','2020-03-09 14:15:00.000','2020-03-09 15:00:00.000',5)
,(6,'Reunion 6','2020-03-09 15:00:00.000','2020-03-09 18:00:00.000',6)
;

-- Creación Tabla AsignacionEdificiosTemporalesRazon --
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

    CONSTRAINT FK_AsignacionEdificiosTemporalesRazon_1 FOREIGN KEY (ID_Reunion) REFERENCES Reuniones (ID_Reunion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_AsignacionEdificiosTemporalesRazon_2 FOREIGN KEY (ID_Curso) REFERENCES Cursos (ID_Curso) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla AsignacionEdificiosTemporalesRazon --

INSERT INTO asignacionedificiostemporalesrazon (ID_Asignacion_Edificio_Temporal_Razon,Razon,Fecha_Hora_Inicio,Fecha_Hora_Fin,ID_Curso,ID_Reunion,ID_Empleado_Responsable) VALUES 
(1,'Curso','2020-03-12 11:00:00.000','2020-03-12 12:00:00.000',1,1,1)
,(2,'Reunion','2020-03-12 12:00:00.000','2020-03-12 13:00:00.000',2,2,2)
,(3,'Reunion','2020-03-12 13:00:00.000','2020-03-12 14:00:00.000',3,3,3)
,(4,'Curso','2020-03-12 14:00:00.000','2020-03-12 15:00:00.000',4,4,4)
,(5,'Reunion','2020-03-12 15:00:00.000','2020-03-12 16:00:00.000',5,5,5)
,(6,'Curso','2020-03-12 16:00:00.000','2020-03-12 17:00:00.000',6,6,6)
;

-- Creación Tabla AsignacionEdificiosTemporales --
CREATE TABLE AsignacionEdificiosTemporales (

    ID_Asignacion_Edificio_Temporal int(11) not null auto_increment,
    Puesto int(11) unsigned not null,
    ID_Empleado int(11) not null,
    ID_Razon int(11) not null,

    PRIMARY KEY (ID_Asignacion_Edificio_Temporal),

    KEY FK_AsignacionEdificiosTemporales_1 (ID_Empleado),
    KEY FK_AsignacionEdificiosTemporales_2 (Puesto),
    KEY FK_AsignacionEdificiosTemporales_3 (ID_Razon),

    CONSTRAINT FK_AsignacionEdificiosTemporales_1 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_AsignacionEdificiosTemporales_2 FOREIGN KEY (ID_Razon) REFERENCES AsignacionEdificiosTemporalesRazon (ID_Asignacion_Edificio_Temporal_Razon) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_AsignacionEdificiosTemporales_3 FOREIGN KEY (Puesto) REFERENCES Edificio (Puesto) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla AsignacionEdificiosTemporales --

INSERT INTO asignacionedificiostemporales (ID_Asignacion_Edificio_Temporal,Puesto,ID_Empleado,ID_Razon) VALUES 
(1,10,1,1)
,(2,11,2,2)
,(3,20,3,3)
,(4,21,4,4)
,(5,30,5,5)
,(6,31,6,6)
;

-- Creación Tabla EdificioEmpleados --
CREATE TABLE EdificioEmpleados (

    ID_Edificio_Empleado int(11) not null auto_increment,
    Puesto int(11) unsigned not null,
    ID_Empleado int(11) not null,
    Fecha_Asignacion date not null,
    Fecha_Entrega date not null,

    PRIMARY KEY (ID_Edificio_Empleado),

    KEY FK_EdificioEmpleados_1 (ID_Empleado),

    CONSTRAINT FK_EdificioEmpleados_1 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla EdificioEmpleados --

INSERT INTO edificioempleados (ID_Edificio_Empleado,Puesto,ID_Empleado,Fecha_Asignacion,Fecha_Entrega) VALUES 
(1,1,1,'2020-05-01','2020-06-01')
,(2,2,2,'2020-05-01','2020-06-01')
,(3,3,3,'2020-05-01','2020-06-01')
,(4,4,4,'2020-05-01','2020-06-01')
,(5,5,5,'2020-05-01','2020-06-01')
,(6,6,6,'2020-05-01','2020-06-01')
;

-- Creación Tabla Hijos --
CREATE TABLE Hijos (

    ID_Hijo int(11) not null,
    ID_Empleado int(11) not null,
    Nombre varchar(50) not null,
    Fecha_Nacimiento date not null,
    Condicion_Especial varchar(50) default null,
    Sexo varchar(100) default null,

    PRIMARY KEY (ID_Hijo),

    KEY FK_Hijos_1 (ID_Empleado),

    CONSTRAINT FK_Hijos_1 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla Hijos --

INSERT INTO hijos (ID_Hijo,ID_Empleado,Nombre,Fecha_Nacimiento,Condicion_Especial,Sexo) VALUES 
(1,1,'Mateo','1991-01-01','no','V')
,(2,2,'Pablo','1996-02-01','no','V')
,(3,3,'Adrian','1999-04-07','no','V')
,(4,4,'Sara','2002-05-09','no','M')
,(5,5,'Ana','2004-07-08','no','M')
,(6,6,'Jorge','2012-04-01','no','V')
;

-- Creación Tabla IdiomasEmpleados --
CREATE TABLE IdiomasEmpleados (

    ID_Idioma_Empleado int(11) not null,
    ID_Empleado int(11) not null,
    ID_Idioma int(11) not null,
    Nivel_Alcanzado enum('Básico', 'Intermedio', 'Avanzado') default 'Básico',
    
    PRIMARY KEY (ID_Idioma_Empleado),

    KEY FK_IdiomasEmpleados_1 (ID_Idioma),
    KEY FK_IdiomasEmpleados_2 (ID_Empleado),

    CONSTRAINT FK_IdiomasEmpleados_1 FOREIGN KEY (ID_Idioma) REFERENCES Idiomas (ID_Idioma) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_IdiomasEmpleados_2 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla IdiomasEmpleados --

INSERT INTO idiomasempleados (ID_Idioma_Empleado,ID_Empleado,ID_Idioma,Nivel_Alcanzado) VALUES 
(1,1,1,'Avanzado')
,(2,2,2,'Intermedio')
,(3,3,3,'Avanzado')
,(4,4,4,'Avanzado')
,(5,5,5,'Avanzado')
,(6,6,6,'Intermedio')
;

-- Creación Tabla Nomina --
CREATE TABLE Nomina (

    ID_Nomina int(11) not null,
    ID_Empleado int(11) not null,
    Sueldo_Base double not null,
    Dieta_Transporte double not null,
    Dieta_Comida double not null,
    Dieta_Horas_Extra double not null,
    Fecha_Nomina date not null,

    PRIMARY KEY (ID_Nomina),

    KEY FK_Nomina_1 (ID_Empleado),

    CONSTRAINT FK_Nomina_1 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla Nomina --

INSERT INTO nomina (ID_Nomina,ID_Empleado,Sueldo_Base,Dieta_Transporte,Dieta_Comida,Dieta_Horas_Extra,Fecha_Nomina) VALUES 
(1,1,80000.0,100.0,50.0,30.0,'2020-01-01')
,(2,2,90000.0,100.0,50.0,30.0,'2020-01-01')
,(3,3,50000.0,100.0,50.0,30.0,'2020-01-02')
,(4,4,60000.0,100.0,50.0,30.0,'2020-01-02')
,(5,5,55000.0,100.0,50.0,30.0,'2020-01-02')
,(6,6,40000.0,100.0,50.0,30.0,'2020-01-03')
;

-- Creación Tabla ProyectosEmpleados --
CREATE TABLE ProyectosEmpleados (

    ID_Proyecto_Empleado int(11) not null,
    ID_Proyecto int(11) not null,
    ID_Empleado int(11) not null,
    Fecha_Incorporacion date not null,
    Fecha_Desincorporacion date not null,

    PRIMARY KEY (ID_Proyecto_Empleado),

    KEY FK_ProyectosEmpleados_1 (ID_Proyecto),
    KEY FK_ProyectosEmpleados_2 (ID_Empleado),
    
    CONSTRAINT FK_ProyectosEmpleados_1 FOREIGN KEY (ID_Proyecto) REFERENCES Proyectos (ID_Proyecto) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_ProyectosEmpleados_2 FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado) ON DELETE NO ACTION ON UPDATE NO ACTION

);

-- Añadir Datos a la Tabla ProyectosEmpleados --

INSERT INTO proyectosempleados (ID_Proyecto_Empleado,ID_Proyecto,ID_Empleado,Fecha_Incorporacion,Fecha_Desincorporacion) VALUES 
(1,1,1,'2018-02-02','2019-02-02')
,(2,2,2,'2018-08-13','2019-08-13')
,(3,3,3,'2018-09-04','2019-09-04')
,(4,4,4,'2018-09-27','2019-09-27')
,(5,5,5,'2018-10-10','2019-10-10')
,(6,6,6,'2019-01-24','2020-01-24')
;