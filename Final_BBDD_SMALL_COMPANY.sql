-- BBDD Pequeña Empresa - Sergio Esteban Tarrero --
-- https://github.com/scullen99/bbdd_small_company.git --
-- BBDD Dumpeada y Terminada --

-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: smallcompany
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignacionedificiostemporales`
--

CREATE SCHEMA SMALLCOMPANY;

DROP DATABASE IF EXISTS SMALLCOMPANY;
CREATE DATABASE SMALLCOMPANY;
USE SMALLCOMPANY;

DROP TABLE IF EXISTS `asignacionedificiostemporales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacionedificiostemporales` (
  `ID_Asignacion_Edificio_Temporal` int(11) NOT NULL AUTO_INCREMENT,
  `Puesto` int(11) unsigned NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `ID_Razon` int(11) NOT NULL,
  PRIMARY KEY (`ID_Asignacion_Edificio_Temporal`),
  KEY `FK_AsignacionEdificiosTemporales_1` (`ID_Empleado`),
  KEY `FK_AsignacionEdificiosTemporales_2` (`Puesto`),
  KEY `FK_AsignacionEdificiosTemporales_3` (`ID_Razon`),
  CONSTRAINT `FK_AsignacionEdificiosTemporales_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AsignacionEdificiosTemporales_2` FOREIGN KEY (`ID_Razon`) REFERENCES `asignacionedificiostemporalesrazon` (`ID_Asignacion_Edificio_Temporal_Razon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AsignacionEdificiosTemporales_3` FOREIGN KEY (`Puesto`) REFERENCES `edificio` (`Puesto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionedificiostemporales`
--

LOCK TABLES `asignacionedificiostemporales` WRITE;
/*!40000 ALTER TABLE `asignacionedificiostemporales` DISABLE KEYS */;
INSERT INTO `asignacionedificiostemporales` VALUES (1,10,1,1),(2,11,2,2),(3,20,3,3),(4,21,4,4),(5,30,5,5),(6,31,6,6);
/*!40000 ALTER TABLE `asignacionedificiostemporales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacionedificiostemporalesrazon`
--

DROP TABLE IF EXISTS `asignacionedificiostemporalesrazon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacionedificiostemporalesrazon` (
  `ID_Asignacion_Edificio_Temporal_Razon` int(11) NOT NULL,
  `Razon` enum('Reunion','Curso') NOT NULL DEFAULT 'Reunion',
  `Fecha_Hora_Inicio` datetime NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  `ID_Curso` int(11) DEFAULT NULL,
  `ID_Reunion` int(11) DEFAULT NULL,
  `ID_Empleado_Responsable` int(11) NOT NULL,
  PRIMARY KEY (`ID_Asignacion_Edificio_Temporal_Razon`),
  KEY `FK_AsignacionEdificiosTemporalesRazon_1` (`ID_Reunion`),
  KEY `FK_AsignacionEdificiosTemporalesRazon_2` (`ID_Curso`),
  CONSTRAINT `FK_AsignacionEdificiosTemporalesRazon_1` FOREIGN KEY (`ID_Reunion`) REFERENCES `reuniones` (`ID_Reunion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AsignacionEdificiosTemporalesRazon_2` FOREIGN KEY (`ID_Curso`) REFERENCES `cursos` (`ID_Curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionedificiostemporalesrazon`
--

LOCK TABLES `asignacionedificiostemporalesrazon` WRITE;
/*!40000 ALTER TABLE `asignacionedificiostemporalesrazon` DISABLE KEYS */;
INSERT INTO `asignacionedificiostemporalesrazon` VALUES (1,'Curso','2020-03-12 11:00:00','2020-03-12 12:00:00',1,1,1),(2,'Reunion','2020-03-12 12:00:00','2020-03-12 13:00:00',2,2,2),(3,'Reunion','2020-03-12 13:00:00','2020-03-12 14:00:00',3,3,3),(4,'Curso','2020-03-12 14:00:00','2020-03-12 15:00:00',4,4,4),(5,'Reunion','2020-03-12 15:00:00','2020-03-12 16:00:00',5,5,5),(6,'Curso','2020-03-12 16:00:00','2020-03-12 17:00:00',6,6,6);
/*!40000 ALTER TABLE `asignacionedificiostemporalesrazon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacionequiposmateriales`
--

DROP TABLE IF EXISTS `asignacionequiposmateriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacionequiposmateriales` (
  `ID_Asignacion_Equipos_Materiales` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` enum('Equipo','Material') NOT NULL DEFAULT 'Equipo',
  `ID_Equipo` int(11) DEFAULT NULL,
  `ID_Material` int(11) DEFAULT NULL,
  `Asignado` enum('Empleado','Proyecto','Sala') NOT NULL DEFAULT 'Empleado',
  `ID_Empleado` int(11) DEFAULT NULL,
  `ID_Proyecto` int(11) DEFAULT NULL,
  `Sala` int(11) unsigned DEFAULT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  PRIMARY KEY (`ID_Asignacion_Equipos_Materiales`),
  KEY `FK_AsignacionEquiposMateriales_1` (`ID_Proyecto`),
  KEY `FK_AsignacionEquiposMateriales_2` (`ID_Empleado`),
  KEY `FK_AsignacionEquiposMateriales_3` (`Sala`),
  CONSTRAINT `FK_AsignacionEquiposMateriales_1` FOREIGN KEY (`ID_Proyecto`) REFERENCES `proyectos` (`ID_Proyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AsignacionEquiposMateriales_2` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AsignacionEquiposMateriales_3` FOREIGN KEY (`Sala`) REFERENCES `edificio` (`Sala`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionequiposmateriales`
--

LOCK TABLES `asignacionequiposmateriales` WRITE;
/*!40000 ALTER TABLE `asignacionequiposmateriales` DISABLE KEYS */;
INSERT INTO `asignacionequiposmateriales` VALUES (1,'Equipo',1,1,'Empleado',1,1,101,'2020-01-02','2020-01-03'),(2,'Equipo',2,2,'Proyecto',2,2,102,'2020-01-06','2020-01-08'),(3,'Equipo',3,3,'Proyecto',3,3,201,'2020-01-09','2020-01-10'),(4,'Equipo',4,4,'Proyecto',4,4,202,'2020-01-14','2020-01-16'),(5,'Material',5,5,'Empleado',5,5,301,'2020-01-16','2020-01-17'),(6,'Material',6,6,'Sala',6,6,302,'2020-01-28','2020-01-29');
/*!40000 ALTER TABLE `asignacionequiposmateriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencias`
--

DROP TABLE IF EXISTS `competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencias` (
  `ID_Competencia` int(11) NOT NULL,
  `Tipo` varchar(100) NOT NULL,
  `Competencia` varchar(100) NOT NULL,
  `AreaProfesional` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Competencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencias`
--

LOCK TABLES `competencias` WRITE;
/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
INSERT INTO `competencias` VALUES (1,'Habilidad','Trabajo en equipo','General'),(2,'Habilidad','Organizacion','Gestores'),(3,'Habilidad','Analisis de datos','Analistas'),(4,'Habilidad','Toma de decisiones','Jefatura'),(5,'Habilidad','Orientacion','General'),(6,'Habilidad','Creatividad','Diseño');
/*!40000 ALTER TABLE `competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competenciasempleados`
--

DROP TABLE IF EXISTS `competenciasempleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competenciasempleados` (
  `ID_Compenecia_Empleado` int(11) NOT NULL,
  `ID_Competencia` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Nivel_Requerido` int(11) unsigned NOT NULL,
  `Nivel_Alcanzado` int(11) unsigned NOT NULL,
  `Fecha_Evaluacion` date NOT NULL,
  PRIMARY KEY (`ID_Compenecia_Empleado`),
  KEY `FK_CompetenciasEmpleados_1` (`ID_Competencia`),
  KEY `FK_CompetenciasEmpleados_2` (`ID_Empleado`),
  CONSTRAINT `FK_CompetenciasEmpleados_1` FOREIGN KEY (`ID_Competencia`) REFERENCES `competencias` (`ID_Competencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CompetenciasEmpleados_2` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competenciasempleados`
--

LOCK TABLES `competenciasempleados` WRITE;
/*!40000 ALTER TABLE `competenciasempleados` DISABLE KEYS */;
INSERT INTO `competenciasempleados` VALUES (1,1,1,1,10,'2020-03-05'),(2,2,2,1,10,'2020-03-06'),(3,3,3,1,10,'2020-03-09'),(4,4,4,1,10,'2020-03-10'),(5,5,5,1,10,'2020-03-11'),(6,6,6,1,10,'2020-03-12');
/*!40000 ALTER TABLE `competenciasempleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `ID_Curso` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `ID_Competencia` int(11) NOT NULL,
  `Profesor` varchar(100) NOT NULL,
  `Coste` double NOT NULL,
  `Cupos` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ID_Curso`),
  KEY `FK_Cursos_1` (`ID_Competencia`),
  CONSTRAINT `FK_Cursos_1` FOREIGN KEY (`ID_Competencia`) REFERENCES `competencias` (`ID_Competencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Introduccion',1,'Jose Antonio',1000,10),(2,'Parte 1',2,'Eva',2000,5),(3,'Parte 2',3,'Jose Antonio',1000,10),(4,'Parte 3',4,'Alvaro',500,5),(5,'Parte 4',5,'Javier',700,6),(6,'Resumen',6,'Marta',900,5);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `ID_Departamento` int(11) NOT NULL,
  `Departamento` varchar(100) NOT NULL,
  `SubDivision` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Recursos Humanos','Rotacion'),(2,'Analitica','Funcionalidad'),(3,'Recursos Humanos','Auditoria'),(4,'Marketing','Ventas'),(5,'Gestion','Riesgos'),(6,'Logistica','Distribucion');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edificio` (
  `ID_Edificio` int(11) NOT NULL AUTO_INCREMENT,
  `Planta` int(11) unsigned NOT NULL,
  `Sala` int(11) unsigned NOT NULL,
  `Puesto` int(11) unsigned NOT NULL,
  `Asignado` enum('si','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`ID_Edificio`),
  UNIQUE KEY `Puesto` (`Puesto`),
  KEY `Sala` (`Sala`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES (1,1,101,10,'si'),(2,1,102,11,'si'),(3,2,201,20,'no'),(4,2,202,21,'no'),(5,3,301,30,'si'),(6,3,302,31,'no');
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificioempleados`
--

DROP TABLE IF EXISTS `edificioempleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edificioempleados` (
  `ID_Edificio_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Puesto` int(11) unsigned NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Fecha_Asignacion` date NOT NULL,
  `Fecha_Entrega` date NOT NULL,
  PRIMARY KEY (`ID_Edificio_Empleado`),
  KEY `FK_EdificioEmpleados_1` (`ID_Empleado`),
  CONSTRAINT `FK_EdificioEmpleados_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificioempleados`
--

LOCK TABLES `edificioempleados` WRITE;
/*!40000 ALTER TABLE `edificioempleados` DISABLE KEYS */;
INSERT INTO `edificioempleados` VALUES (1,1,1,'2020-05-01','2020-06-01'),(2,2,2,'2020-05-01','2020-06-01'),(3,3,3,'2020-05-01','2020-06-01'),(4,4,4,'2020-05-01','2020-06-01'),(5,5,5,'2020-05-01','2020-06-01'),(6,6,6,'2020-05-01','2020-06-01');
/*!40000 ALTER TABLE `edificioempleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educacion`
--

DROP TABLE IF EXISTS `educacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educacion` (
  `ID_Educacion` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Institucion` varchar(100) NOT NULL,
  `Nivel` varchar(100) NOT NULL,
  `Fecha_Graduacion` date NOT NULL,
  PRIMARY KEY (`ID_Educacion`),
  KEY `FK_Educacion_1` (`ID_Empleado`),
  CONSTRAINT `FK_Educacion_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educacion`
--

LOCK TABLES `educacion` WRITE;
/*!40000 ALTER TABLE `educacion` DISABLE KEYS */;
INSERT INTO `educacion` VALUES (1,1,'Doctor','RRHH','10','1983-06-05'),(2,2,'Doctora','Analisis','10','1988-06-05'),(3,3,'Graduado','RRHH','8','1991-06-05'),(4,4,'Graduada','Marketing','7','1994-06-05'),(5,5,'Graduado','Gestion','8','1996-06-05'),(6,6,'Graduado','Logistica','9','2004-06-05');
/*!40000 ALTER TABLE `educacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `ID_Empleado` int(11) NOT NULL,
  `Dni` varchar(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` varchar(100) NOT NULL,
  `Numero_Seguridad_Social` int(11) NOT NULL,
  `Categoria_Profesional` varchar(100) NOT NULL,
  `Situacion_Familiar` enum('Soltero','Casado','Divorciado') NOT NULL DEFAULT 'Casado',
  `Sueldo` double NOT NULL,
  `Numero_Cuenta_Bancaria` varchar(45) NOT NULL,
  `Fecha_Ingreso` date NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `ID_Departamento` int(11) NOT NULL,
  PRIMARY KEY (`ID_Empleado`),
  UNIQUE KEY `Dni` (`Dni`),
  KEY `FK_Empleados_1` (`ID_Departamento`),
  CONSTRAINT `FK_Empleados_1` FOREIGN KEY (`ID_Departamento`) REFERENCES `departamentos` (`ID_Departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'80410815D','Juan','667047493',707314539,'Jefe','Casado',60000,'ES6420803535534242776985','2002-10-31','1961-04-10',1),(2,'66718919J','Sara','799145543',577204052,'Jefa','Casado',75000,'ES1504872971388834914765','2004-07-01','1966-06-28',2),(3,'98273537B','Manuel','767329400',291905102,'Empleado','Casado',35000,'ES4421003894431294787898','2004-11-15','1969-07-15',3),(4,'67009271J','Ana','671502324',328362889,'Empleada','Divorciado',20000,'ES0721009884829572568615','2006-05-24','1972-06-22',4),(5,'31509505B','Sergio','765502135',970295775,'Empleado','Casado',45000,'ES0421004196174295151729','2008-03-14','1974-10-21',5),(6,'59419832E','Daniel','785873068',53063945,'Empleado','Soltero',50000,'ES8220958527685837736956','2008-04-25','1982-10-06',6);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equiposelectronicos`
--

DROP TABLE IF EXISTS `equiposelectronicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equiposelectronicos` (
  `ID_Equipo_Electronico` int(11) NOT NULL,
  `Tipo` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Precio` double NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Fecha_Compra` date NOT NULL,
  `Usable` enum('si','no') NOT NULL DEFAULT 'no',
  `Codigo` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Equipo_Electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equiposelectronicos`
--

LOCK TABLES `equiposelectronicos` WRITE;
/*!40000 ALTER TABLE `equiposelectronicos` DISABLE KEYS */;
INSERT INTO `equiposelectronicos` VALUES (1,'Portatil','PortatilSala1',600,'Samsung','2017-06-28','si','9K5W4ZCV'),(2,'Portatil','PortatilPresentaciones',700,'Lenovo','2017-08-11','si','RS4E2DVB'),(3,'Tablet','TabletPresentaciones',250,'Samsung','2017-09-26','si','XAVWKV4Q'),(4,'Movil','MovilJefe',600,'Xiaomi','2018-06-21','si','5J74BM99'),(5,'Proyector','ProyectorPresentaciones',2000,'LG','2018-07-10','no','T8WWAPGP'),(6,'Impresora','ImpresoraGeneral',1000,'HP','2018-08-30','si','LHMLWWQE');
/*!40000 ALTER TABLE `equiposelectronicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hijos`
--

DROP TABLE IF EXISTS `hijos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hijos` (
  `ID_Hijo` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Condicion_Especial` varchar(50) DEFAULT NULL,
  `Sexo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Hijo`),
  KEY `FK_Hijos_1` (`ID_Empleado`),
  CONSTRAINT `FK_Hijos_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hijos`
--

LOCK TABLES `hijos` WRITE;
/*!40000 ALTER TABLE `hijos` DISABLE KEYS */;
INSERT INTO `hijos` VALUES (1,1,'Mateo','1991-01-01','no','V'),(2,2,'Pablo','1996-02-01','no','V'),(3,3,'Adrian','1999-04-07','no','V'),(4,4,'Sara','2002-05-09','no','M'),(5,5,'Ana','2004-07-08','no','M'),(6,6,'Jorge','2012-04-01','no','V');
/*!40000 ALTER TABLE `hijos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idiomas` (
  `ID_Idioma` int(11) NOT NULL,
  `Idioma` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idiomas`
--

LOCK TABLES `idiomas` WRITE;
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
INSERT INTO `idiomas` VALUES (1,'Espanol'),(2,'Ingles'),(3,'Italiano'),(4,'Chino'),(5,'Frances'),(6,'Panyabi'),(7,'Japones'),(8,'Bengali');
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idiomasempleados`
--

DROP TABLE IF EXISTS `idiomasempleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idiomasempleados` (
  `ID_Idioma_Empleado` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `ID_Idioma` int(11) NOT NULL,
  `Nivel_Alcanzado` enum('B?sico','Intermedio','Avanzado') DEFAULT 'B?sico',
  PRIMARY KEY (`ID_Idioma_Empleado`),
  KEY `FK_IdiomasEmpleados_1` (`ID_Idioma`),
  KEY `FK_IdiomasEmpleados_2` (`ID_Empleado`),
  CONSTRAINT `FK_IdiomasEmpleados_1` FOREIGN KEY (`ID_Idioma`) REFERENCES `idiomas` (`ID_Idioma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_IdiomasEmpleados_2` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idiomasempleados`
--

LOCK TABLES `idiomasempleados` WRITE;
/*!40000 ALTER TABLE `idiomasempleados` DISABLE KEYS */;
INSERT INTO `idiomasempleados` VALUES (1,1,1,'Avanzado'),(2,2,2,'Intermedio'),(3,3,3,'Avanzado'),(4,4,4,'Avanzado'),(5,5,5,'Avanzado'),(6,6,6,'Intermedio');
/*!40000 ALTER TABLE `idiomasempleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialesoficina`
--

DROP TABLE IF EXISTS `materialesoficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialesoficina` (
  `Id_Materiales_Oficina` int(11) NOT NULL,
  `Material` varchar(100) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Usable` enum('si','no') NOT NULL DEFAULT 'si',
  `Fecha_Compra` date NOT NULL,
  PRIMARY KEY (`Id_Materiales_Oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialesoficina`
--

LOCK TABLES `materialesoficina` WRITE;
/*!40000 ALTER TABLE `materialesoficina` DISABLE KEYS */;
INSERT INTO `materialesoficina` VALUES (1,'Boli Azul',300,'si','2018-01-01'),(2,'Boli Negro',300,'si','2018-01-01'),(3,'Grapadora',20,'si','2018-01-01'),(4,'Folios Blancos',10000,'si','2018-01-01'),(5,'Archivador',100,'si','2018-01-01'),(6,'Tijeras',50,'si','2018-01-01');
/*!40000 ALTER TABLE `materialesoficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomina` (
  `ID_Nomina` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Sueldo_Base` double NOT NULL,
  `Dieta_Transporte` double NOT NULL,
  `Dieta_Comida` double NOT NULL,
  `Dieta_Horas_Extra` double NOT NULL,
  `Fecha_Nomina` date NOT NULL,
  PRIMARY KEY (`ID_Nomina`),
  KEY `FK_Nomina_1` (`ID_Empleado`),
  CONSTRAINT `FK_Nomina_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina`
--

LOCK TABLES `nomina` WRITE;
/*!40000 ALTER TABLE `nomina` DISABLE KEYS */;
INSERT INTO `nomina` VALUES (1,1,80000,100,50,30,'2020-01-01'),(2,2,90000,100,50,30,'2020-01-01'),(3,3,50000,100,50,30,'2020-01-02'),(4,4,60000,100,50,30,'2020-01-02'),(5,5,55000,100,50,30,'2020-01-02'),(6,6,40000,100,50,30,'2020-01-03');
/*!40000 ALTER TABLE `nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos` (
  `ID_Proyecto` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Inicio_Real` date DEFAULT NULL,
  `Fecha_Fin` date NOT NULL,
  `Fecha_Fin_Real` date DEFAULT NULL,
  `ID_Empleado_Responsable` int(11) NOT NULL,
  `Presupuesto` double NOT NULL,
  PRIMARY KEY (`ID_Proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'Alpha','2019-01-01',NULL,'2019-03-18',NULL,1,1000),(2,'Beta','2019-01-03',NULL,'2019-03-19',NULL,2,5300),(3,'Gamma','2019-01-07',NULL,'2019-03-21',NULL,3,2800),(4,'Delta','2019-01-08',NULL,'2019-04-10',NULL,4,9800),(5,'Epsilon','2019-01-28',NULL,'2019-05-27',NULL,5,2300),(6,'Dseta','2019-02-25',NULL,'2019-07-01',NULL,6,4300);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectosempleados`
--

DROP TABLE IF EXISTS `proyectosempleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectosempleados` (
  `ID_Proyecto_Empleado` int(11) NOT NULL,
  `ID_Proyecto` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Fecha_Incorporacion` date NOT NULL,
  `Fecha_Desincorporacion` date NOT NULL,
  PRIMARY KEY (`ID_Proyecto_Empleado`),
  KEY `FK_ProyectosEmpleados_1` (`ID_Proyecto`),
  KEY `FK_ProyectosEmpleados_2` (`ID_Empleado`),
  CONSTRAINT `FK_ProyectosEmpleados_1` FOREIGN KEY (`ID_Proyecto`) REFERENCES `proyectos` (`ID_Proyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProyectosEmpleados_2` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectosempleados`
--

LOCK TABLES `proyectosempleados` WRITE;
/*!40000 ALTER TABLE `proyectosempleados` DISABLE KEYS */;
INSERT INTO `proyectosempleados` VALUES (1,1,1,'2018-02-02','2019-02-02'),(2,2,2,'2018-08-13','2019-08-13'),(3,3,3,'2018-09-04','2019-09-04'),(4,4,4,'2018-09-27','2019-09-27'),(5,5,5,'2018-10-10','2019-10-10'),(6,6,6,'2019-01-24','2020-01-24');
/*!40000 ALTER TABLE `proyectosempleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reuniones`
--

DROP TABLE IF EXISTS `reuniones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reuniones` (
  `ID_Reunion` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL DEFAULT 'Reunion Semanal',
  `Fecha_Hora_Inicio` datetime NOT NULL,
  `Fecha_Hora_Fin` datetime NOT NULL,
  `ID_Responsable` int(11) NOT NULL,
  PRIMARY KEY (`ID_Reunion`),
  KEY `FK_Reuniones_1` (`ID_Responsable`),
  CONSTRAINT `FK_Reuniones_1` FOREIGN KEY (`ID_Responsable`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reuniones`
--

LOCK TABLES `reuniones` WRITE;
/*!40000 ALTER TABLE `reuniones` DISABLE KEYS */;
INSERT INTO `reuniones` VALUES (1,'Reunion 1','2020-03-09 09:25:00','2020-03-09 10:00:00',1),(2,'Reunion 2','2020-03-09 11:15:00','2020-03-09 12:00:00',2),(3,'Reunion 3','2020-03-09 11:40:00','2020-03-09 13:00:00',3),(4,'Reunion 4','2020-03-09 12:30:00','2020-03-09 13:30:00',4),(5,'Reunion 5','2020-03-09 14:15:00','2020-03-09 15:00:00',5),(6,'Reunion 6','2020-03-09 15:00:00','2020-03-09 18:00:00',6);
/*!40000 ALTER TABLE `reuniones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'smallcompany'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-08 17:30:42
