CREATE DATABASE  IF NOT EXISTS `pivii` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pivii`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: pivii
-- ------------------------------------------------------
-- Server version	8.0.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion` (
  `idInstitucion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInstitucion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES (1,'UTEC');
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesion` (
  `idProfesion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProfesion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` VALUES (1,'Ingenieria en Sistemas');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'admin','Administrador'),(2,'user','Usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `idProvincia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Azuay'),(2,'Esmeraldas'),(3,'Los Rios'),(4,'Guayas'),(5,'Sucumbios'),(6,'Pichincha'),(7,'Manabi'),(8,'Galapagos'),(9,'Santa Elena'),(10,'Napo');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `Provincia_idProvincia` int NOT NULL,
  PRIMARY KEY (`idCiudad`),
  KEY `fk_Ciudad_Provincia1_idx` (`Provincia_idProvincia`),
  CONSTRAINT `fk_Ciudad_Provincia1` FOREIGN KEY (`Provincia_idProvincia`) REFERENCES `provincia` (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Cuenca',1);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `id_facultad` int NOT NULL AUTO_INCREMENT,
  `nombre_facultad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_facultad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Ciencias de la Ingeniería'),(2,'Ciencias Empresariales'),(3,'Agronomía');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `id_facultad` int NOT NULL,
  `nombre_carrera` varchar(100) NOT NULL,
  PRIMARY KEY (`id_carrera`),
  KEY `id_facultad` (`id_facultad`),
  CONSTRAINT `carrera_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `facultad` (`id_facultad`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,1,'Ingeniería en Sistemas'),(2,1,'Ingeniería Eléctrica'),(3,2,'Economía'),(4,1,'Ingeniería Mecánica'),(5,2,'Gestión Empresarial');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nickName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `nivelAcademico` varchar(45) DEFAULT NULL,
  `Ciudad_idCiudad` int NOT NULL,
  `Rol_idRol` int NOT NULL,
  `Profesion_idProfesion` int NOT NULL,
  `Institucion_idInstitucion` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_Ciudad1_idx` (`Ciudad_idCiudad`),
  KEY `fk_Usuario_Rol1_idx` (`Rol_idRol`),
  KEY `fk_Usuario_Profesion1_idx` (`Profesion_idProfesion`),
  KEY `fk_Usuario_Institucion1_idx` (`Institucion_idInstitucion`),
  CONSTRAINT `fk_Usuario_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`),
  CONSTRAINT `fk_Usuario_Institucion1` FOREIGN KEY (`Institucion_idInstitucion`) REFERENCES `institucion` (`idInstitucion`),
  CONSTRAINT `fk_Usuario_Profesion1` FOREIGN KEY (`Profesion_idProfesion`) REFERENCES `profesion` (`idProfesion`),
  CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'cris','1234','Cristhian','Briones','0803293653','1998-04-20 00:00:00','bcristhian5@gmail.com','Esmeraldas','tercer',1,1,1,1),(2,'sa','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Suanny Gabriela','Tigselema Egre','null','1998-10-21 00:00:00','suannytigselema@uteq.edu.ec','Valencia','3',1,1,1,1),(4,'suanny','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Gabriela','Egre','null','1998-12-12 00:00:00','suannytigselema@gmail.com','Valencia','1',1,1,1,1),(5,'suanny2','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Gabriela','Egre',NULL,'2010-12-10 00:00:00','suannytigselema@gmail.com','Valencia','2',1,1,1,1),(6,'suanny123','40bd001563085fc35165329ea1ff5c5ecbdbbeef','suanny','tigselema',NULL,'1998-12-20 00:00:00','suannytigselema@hotmail.com','Valencia-San Francisco 2','2',1,1,1,1),(7,'admin','40bd001563085fc35165329ea1ff5c5ecbdbbeef','suanny','tigselema',NULL,'1998-02-10 00:00:00','suannytigselema02@gmail.com','Valencia-San Francisco 2','1',1,1,1,1),(8,'gabriela','40bd001563085fc35165329ea1ff5c5ecbdbbeef','suanny','tigselema',NULL,'1998-10-20 00:00:00','suannytigselema02@gmail.com','Valencia-San Francisco 2','1',1,1,1,1),(9,'javier','40bd001563085fc35165329ea1ff5c5ecbdbbeef','javier','tigselema',NULL,'1999-07-12 00:00:00','suannytigselema02@gmail.com','Valencia-San Francisco 2','1',1,1,1,1),(10,'cata','40bd001563085fc35165329ea1ff5c5ecbdbbeef','catalin','cedeÃ±o',NULL,'1996-02-19 00:00:00','suannytigselema@hotmail.com','Valencia-San Francisco 2','1',1,1,1,1),(11,'Cristhian','7b52009b64fd0a2a49e6d8a939753077792b0554','Cristhian','Briones','null','1998-04-20 00:00:00','bcristhian@gmail.com','Quevedo','2',1,1,1,1),(12,'dan98','356a192b7913b04c54574d18c28d46e6395428ab','Cristhian','Briones Montalvo',NULL,'2010-12-02 00:00:00','briones@gmail.com','Esmeraldas','3',1,2,1,1),(13,'leo97','356a192b7913b04c54574d18c28d46e6395428ab','Leonardo','Briones',NULL,'2010-12-01 00:00:00','leo@gmail.com','Quevedo','3',1,2,1,1),(14,'daniela','40bd001563085fc35165329ea1ff5c5ecbdbbeef','suanny','tigelema',NULL,'1998-02-14 00:00:00','suannytigselema@gmail.com','valencia','1',1,1,1,1),(15,'joseGarcia','40bd001563085fc35165329ea1ff5c5ecbdbbeef','suanny','tigselema',NULL,'1998-01-12 00:00:00','suannytigselema02@gmail.com','valencia','2',1,1,1,1),(16,'qwerty','qwerty','Cristhian','Burbano','1207334184','1997-07-25 00:00:00','cristhian.burbano2016@uteq.edu.ec','20 de febrero','3',1,2,1,1),(17,'juanito','8cb2237d0679ca88db6464eac60da96345513964','Juanito Jose','Piguave Lopez','5020140358','2000-12-20 00:00:00','janitopiguave@hotmail.com','Pimocha alta','3',1,2,1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `id_carrera` int NOT NULL,
  `identificacion` varchar(15) NOT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_autor`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `autor_ibfk_2` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (5,1,'1203500201','1999-02-14 00:00:00','jose gerardo','garcia lopez','jose.garcia2016@gmail.com'),(6,1,'2031400145','1997-07-04 00:00:00','miguel angel','suarez litardo','miguel.suarez2016@gmail.com'),(7,1,'0300145321','2015-06-09 00:00:00','Aisha','Moreira','aisha.aline@gmail.com');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `customdata`
--

DROP TABLE IF EXISTS `customdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customdata` (
  `idCustomData` int NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` int NOT NULL,
  PRIMARY KEY (`idCustomData`),
  KEY `fk_CustomData_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_CustomData_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customdata`
--

LOCK TABLES `customdata` WRITE;
/*!40000 ALTER TABLE `customdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `customdata` ENABLE KEYS */;
UNLOCK TABLES;

--




-- Table structure for table `descargas`
--

DROP TABLE IF EXISTS `descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descargas` (
  `idDescargas` int NOT NULL AUTO_INCREMENT,
  `fechaHora` datetime DEFAULT NULL,
  `Usuario_idUsuario` int NOT NULL,
  PRIMARY KEY (`idDescargas`),
  KEY `fk_Descargas_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Descargas_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descargas`
--

LOCK TABLES `descargas` WRITE;
/*!40000 ALTER TABLE `descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `descargas` ENABLE KEYS */;
UNLOCK TABLES;

--





-- Table structure for table `donaciones`
--

DROP TABLE IF EXISTS `donaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donaciones` (
  `idDonaciones` int NOT NULL AUTO_INCREMENT,
  `nombreConjuntoDatos` varchar(45) DEFAULT NULL,
  `abstracto` varchar(300) DEFAULT NULL,
  `fuente` varchar(200) DEFAULT NULL,
  `tipoDatos` varchar(45) DEFAULT NULL,
  `tarea` varchar(45) DEFAULT NULL,
  `tipoAtributo` varchar(45) DEFAULT NULL,
  `zona` varchar(45) DEFAULT NULL,
  `tipoFormato` varchar(45) DEFAULT NULL,
  `valoresFaltantes` varchar(45) DEFAULT NULL,
  `numeroInstancia` varchar(45) DEFAULT NULL,
  `numeroAtributos` varchar(45) DEFAULT NULL,
  `infoRelevante` varchar(500) DEFAULT NULL,
  `infoAtributo` varchar(500) DEFAULT NULL,
  `documentoRelevantes` varchar(500) DEFAULT NULL,
  `solicitudesCitacion` varchar(500) DEFAULT NULL,
  `archivoDatos` varchar(45) DEFAULT NULL,
  `archivoGraficos` varchar(45) DEFAULT NULL,
  `validacion` varchar(45) DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `Usuario_idUsuario` int NOT NULL,
  `numeroVisitas` varchar(45) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idDonaciones`),
  KEY `fk_Donaciones_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Donaciones_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donaciones`
--

LOCK TABLES `donaciones` WRITE;
/*!40000 ALTER TABLE `donaciones` DISABLE KEYS */;
INSERT INTO `donaciones` VALUES (1,'Iris','predice la edad del abulón a partir de mediciones físicas','Warwick J Nash, Tracy L Sellers, Simon R Talbot, Andrew J Cawthorn y Wes B Ford (1994)','Multivariate, Sequential','Regresion','Categorico','Informática','csv','si','56554','7','Predecir la edad del abulón a partir de mediciones físicas. La edad del abulón se determina cortando el caparazón a través del cono, manchándolo y contando el número de anillos a través de un microscopio, una tarea aburrida y que consume mucho tiempo. Otras mediciones, que son más fáciles de obtener, se utilizan para predecir la edad.','Se proporciona el nombre del atributo, el tipo de atributo, la unidad de medida y una breve descripción. El número de anillos es el valor a predecir: ya sea como un valor continuo o como un problema de clasificación.','Sam Waugh (1995) \"Ampliación y evaluación comparativa de Cascade-Correlation\", tesis doctoral, Departamento de Informática, Universidad de Tasmania.','5','archivos/iris.csv','4','Aprobado',2010,1,'7','Bueno'),(2,'basketball','no hay el texto','Sam Waugh ( Sam.Waugh \'@\' cs.utas.edu.au )','Multivariate','Clasificación','Mixto','Computación, Informática','csv','si','4543','4','Es posible que se requiera más información, como los patrones climáticos y la ubicación (de ahí la disponibilidad de alimentos) para resolver el problema.','Se proporciona el nombre del atributo, el tipo de atributo, la unidad de medida y una breve descripción. El número de anillos es el valor a predecir: ya sea como un valor continuo o como un problema de clasificación.','David Clark, Zoltan Schreter, Anthony Adams \"Una comparación cuantitativa de Dystal y Backpropagation\", presentada a la Conferencia Australiana sobre Redes Neuronales (ACNN\'96).','3','archivos/basketball.csv','3','',2015,1,'6','dassdxnhgfngdbdfb'),(3,'Abalone','predice la edad del abulón a partir de mediciones físicas','Sam Waugh ( Sam.Waugh \'@\' cs.utas.edu.au )','Multivariate','Clasificación','Numérico, Categórico','Computación, Informática','csv','si','44','6','Es posible que se requiera más información, como los patrones climáticos y la ubicación (de ahí la disponibilidad de alimentos) para resolver el problema.','Se proporciona el nombre del atributo, el tipo de atributo, la unidad de medida y una breve descripción. El número de anillos es el valor a predecir: ya sea como un valor continuo o como un problema de clasificación.','David Clark, Zoltan Schreter, Anthony Adams \"Una comparación cuantitativa de Dystal y Backpropagation\", presentada a la Conferencia Australiana sobre Redes Neuronales (ACNN\'96).','3','archivos/abalone.csv','3','Aprobado',1998,4,'5','Bueno'),(4,'Automobile ','del anuario automotriz de Ward de 1985','1) Especificaciones del modelo de importación de automóviles y camiones de 1985, 1985 Year\'s Automotive Yearbook.','Multivariante','Regresión','Categórico, Entero, Real','N / A','csv','si','205','26','Este conjunto de datos consta de tres tipos de entidades: (a) la especificación de un automóvil en términos de varias características, (b) su calificación de riesgo de seguro asignada, (c) sus pérdidas de uso normalizadas en comparación con otros automóviles','Atributo: Rango de atributo 1. símbolo: -3, -2, -1, 0, 1, 2, 3. 2. pérdidas normalizadas: continuas de 65 a 256. 3. marca:alfa-romero, audi, bmw, chevrolet , esquivar, honda,isuzu, jaguar, mazda, mercedes-benz, mercurio ','Kibler, D., Aha, DW y Albert, M. (1989) Predicción basada en instancias de atributos con valor real. Inteligencia computacional, vol. 5, 51-57.',NULL,'archivos/auto.csv',NULL,'Aprobado',1985,4,'4','Bueno'),(5,'3D Road Network','Red de carreteras en 3D con información de elevación de alta precisión (+ -20 cm) de Dinamarca utilizada en algoritmos de enrutamiento ecológico y enrutamiento de combustible / estimación de Co2.','Manohar Kaul, Departamento de Informática, Universidad de Aarhus, Dinamarca ( mkaul \'@\' cs.au.dk )','Secuencial, texto','Regresión, agrupamiento','Real','Computación','csv','N / A','434874','44','Este conjunto de datos se construyó agregando información de elevación a una red de carreteras 2D en el norte de Jutlandia, Dinamarca (cubriendo una región de 185 x 135 km ^ 2). Los valores de elevación se extrajeron de una nube de puntos de escaneo láser masiva disponible públicamente para Dinamarca','1. OSM_ID: ID de OpenStreetMap para cada segmento de carretera o borde en el gráfico.','[1] Chenjuan Guo, Yu Ma, Bin Yang, Christian S. Jensen, Manohar Kaul: EcoMark: evaluación de modelos de impacto ambiental vehicular. SIGSPATIAL / GIS 2012: 269-278',NULL,'archivos/3D_spatial_network.csv',NULL,'No Aprobado',1998,4,NULL,'Bueno'),(6,'Enfermedad del corazón','Red de carreteras en 3D con información de elevación de alta precisión (+ -20 cm) de Dinamarca utilizada en algoritmos de enrutamiento ecológico y enrutamiento de combustible / estimación de Co2.','Manohar Kaul, Departamento de Informática, Universidad de Aarhus, Dinamarca ( mkaul \'@\' cs.au.dk )','Secuencial, texto','Regresión, agrupamiento','Real','Computación','csv','N / A','303','75','Este conjunto de datos se construyó agregando información de elevación a una red de carreteras 2D en el norte de Jutlandia, Dinamarca (cubriendo una región de 185 x 135 km ^ 2). Los valores de elevación se extrajeron de una nube de puntos de escaneo láser masiva disponible públicamente para Dinamarca','1. OSM_ID: ID de OpenStreetMap para cada segmento de carretera o borde en el gráfico.','[1] Chenjuan Guo, Yu Ma, Bin Yang, Christian S. Jensen, Manohar Kaul: EcoMark: evaluación de modelos de impacto ambiental vehicular. SIGSPATIAL / GIS 2012: 269-278',NULL,'archivos/cleveland.csv',NULL,'Aprobado',1978,1,'1','Bueno'),(7,'Calidad del vino','Se incluyen dos conjuntos de datos, relacionados con muestras de vino tinto y blanco de vinho verde, del norte de Portugal.','Manohar Kaul, Departamento de Informática, Universidad de Aarhus, Dinamarca ( mkaul \'@\' cs.au.dk )','Secuencial, texto','Clasificación, regresión','Real','Computación','csv','N / A','4898','12','Este conjunto de datos se construyó agregando información de elevación a una red de carreteras 2D en el norte de Jutlandia, Dinamarca (cubriendo una región de 185 x 135 km ^ 2). Los valores de elevación se extrajeron de una nube de puntos de escaneo láser masiva disponible públicamente para Dinamarca','1. OSM_ID: ID de OpenStreetMap para cada segmento de carretera o borde en el gráfico.','[1] Chenjuan Guo, Yu Ma, Bin Yang, Christian S. Jensen, Manohar Kaul: EcoMark: evaluación de modelos de impacto ambiental vehicular. SIGSPATIAL / GIS 2012: 269-278',NULL,'archivos/winequality-red.csv',NULL,'Aprobado',2012,4,'7','Bueno'),(8,'Evaluación de autos','Se incluyen dos conjuntos de datos, relacionados con muestras de vino tinto y blanco de vinho verde, del norte de Portugal.','Manohar Kaul, Departamento de Informática, Universidad de Aarhus, Dinamarca ( mkaul \'@\' cs.au.dk )','Secuencial, texto','Clasificación','Categórico','Computación','csv','N / A','1728','66','Este conjunto de datos se construyó agregando información de elevación a una red de carreteras 2D en el norte de Jutlandia, Dinamarca (cubriendo una región de 185 x 135 km ^ 2). Los valores de elevación se extrajeron de una nube de puntos de escaneo láser masiva disponible públicamente para Dinamarca','1. OSM_ID: ID de OpenStreetMap para cada segmento de carretera o borde en el gráfico.','[1] Chenjuan Guo, Yu Ma, Bin Yang, Christian S. Jensen, Manohar Kaul: EcoMark: evaluación de modelos de impacto ambiental vehicular. SIGSPATIAL / GIS 2012: 269-278',NULL,'archivos/car.csv',NULL,'Aprobado',1998,1,NULL,'Bueno'),(9,'Comercialización bancaria','Se incluyen dos conjuntos de datos, relacionados con muestras de vino tinto y blanco de vinho verde, del norte de Portugal.','Manohar Kaul, Departamento de Informática, Universidad de Aarhus, Dinamarca ( mkaul \'@\' cs.au.dk )','Secuencial, texto','Clasificación, Regresión','Categórico','Computación','csv','N / A','728','26','Este conjunto de datos se construyó agregando información de elevación a una red de carreteras 2D en el norte de Jutlandia, Dinamarca (cubriendo una región de 185 x 135 km ^ 2). Los valores de elevación se extrajeron de una nube de puntos de escaneo láser masiva disponible públicamente para Dinamarca','1. OSM_ID: ID de OpenStreetMap para cada segmento de carretera o borde en el gráfico.','[1] Chenjuan Guo, Yu Ma, Bin Yang, Christian S. Jensen, Manohar Kaul: EcoMark: evaluación de modelos de impacto ambiental vehicular. SIGSPATIAL / GIS 2012: 269-278',NULL,'archivos/car.csv',NULL,'Aprobado',2001,1,NULL,'Bueno'),(10,'Incendios forestales','Se incluyen dos conjuntos de datos, relacionados con muestras de vino tinto y blanco de vinho verde, del norte de Portugal.','Manohar Kaul, Departamento de Informática, Universidad de Aarhus, Dinamarca ( mkaul \'@\' cs.au.dk )','Secuencial, texto',' Regresión','Categórico','Computación','csv','N / A','517','13','Este conjunto de datos se construyó agregando información de elevación a una red de carreteras 2D en el norte de Jutlandia, Dinamarca (cubriendo una región de 185 x 135 km ^ 2). Los valores de elevación se extrajeron de una nube de puntos de escaneo láser masiva disponible públicamente para Dinamarca','1. OSM_ID: ID de OpenStreetMap para cada segmento de carretera o borde en el gráfico.','[1] Chenjuan Guo, Yu Ma, Bin Yang, Christian S. Jensen, Manohar Kaul: EcoMark: evaluación de modelos de impacto ambiental vehicular. SIGSPATIAL / GIS 2012: 269-278',NULL,'archivos/car.csv',NULL,'Aprobado',2013,1,NULL,'Bueno'),(11,'sf','efs','sef',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(12,'sf','efs','sefdfd',NULL,'Clasificación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(13,'sf','efs','sefdfd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(14,'null','null','null',NULL,'Clasificación',NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(15,'null','null','null',NULL,NULL,'Numérico','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(16,'null','null','null',NULL,NULL,'Mixto','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(17,'null','null','null',NULL,NULL,'Categorico','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(18,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(19,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(20,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(21,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(22,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(23,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(24,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(25,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(26,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(27,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(28,'fdf','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(29,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(30,'null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(31,'fdf','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(32,'fdf','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(33,'fdf','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL),(34,'null','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(35,'null','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(36,'null','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(37,'null','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(38,'DDD','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(39,'fdsf','ddx','xfgf',NULL,NULL,NULL,'option3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(40,'fdsf','ddx','xfgf',NULL,NULL,NULL,'option3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(41,'GES','ddx','xfgf',NULL,NULL,NULL,'option5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(42,'dcc','ds','dcd',NULL,NULL,NULL,'CS / IngenierÃ­a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(43,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,2,NULL,NULL),(44,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(45,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(46,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(47,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(48,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(49,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(50,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(51,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(52,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(53,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(54,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(55,'null','null','null',NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(56,'ccx','zc','zxv',NULL,NULL,NULL,'CS / IngenierÃ­a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(57,'ccx','zc','zxv',NULL,NULL,NULL,'Ciencias Sociales',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(58,'vvfvds','dfd','ffrrrrrr',' - Multivariante - Secuencial - Texto','Clasificación','Real','Negocio','csv',NULL,'34','13',NULL,NULL,NULL,NULL,NULL,NULL,'Aprobado',NULL,2,NULL,NULL),(59,'null','null','null','',NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(60,'null','null','null','',NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(61,'null','null','null','',NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(62,'prueba1','asd','sdasdsad','',NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(63,'prueab3','sdasda','sdasdas','','Agrupación',NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(64,'Mal','predice la edad del abulón a partir de mediciones físicas','Warwick J Nash, Tracy L Sellers, Simon R Talbot, Andrew J Cawthorn y Wes B Ford (1994)','Multivariate, Sequential','Regresión','Regresion S','Informática','csv','si','56554','7','Predecir la edad del abulón a partir de mediciones físicas. La edad del abulón se determina cortando el caparazón a través del cono, manchándolo y contando el número de anillos a través de un microscopio, una tarea aburrida y que consume mucho ti...','Se proporciona el nombre del atributo, el tipo de atributo, la unidad de medida y una breve descripción. El número de anillos es el valor a predecir: ya sea como un valor continuo o como un problema de clasificación.','Sam Waugh (1995) \"Ampliación y evaluación comparativa de Cascade-Correlation\", tesis doctoral, Departamento de Informática, Universidad de Tasmania.','5','3','4','3',2010,1,'2',NULL),(65,'Hercules','predice la edad del abulón a partir de mediciones físicas','Warwick J Nash, Tracy L Sellers, Simon R Talbot, Andrew J Cawthorn y Wes B Ford (1994)','Multivariate, Sequential','Regresion, Clasificación','Regresion','Informática','csv','si','56554','9','Predecir la edad del abulón a partir de mediciones físicas. La edad del abulón se determina cortando el caparazón a través del cono, manchándolo y contando el número de anillos a través de un microscopio, una tarea aburrida y que consume mucho ti...','Se proporciona el nombre del atributo, el tipo de atributo, la unidad de medida y una breve descripción. El número de anillos es el valor a predecir: ya sea como un valor continuo o como un problema de clasificación.','Sam Waugh (1995) \"Ampliación y evaluación comparativa de Cascade-Correlation\", tesis doctoral, Departamento de Informática, Universidad de Tasmania.','5','3','4','3',2010,1,'2',NULL),(66,'Marte','predice la edad del abulón a partir de mediciones físicas','Warwick J Nash, Tracy L Sellers, Simon R Talbot, Andrew J Cawthorn y Wes B Ford (1994)','Multivariate, Sequential','Regresion','Regresion','Informática','csv','si','56554','17','Predecir la edad del abulón a partir de mediciones físicas. La edad del abulón se determina cortando el caparazón a través del cono, manchándolo y contando el número de anillos a través de un microscopio, una tarea aburrida y que consume mucho ti...','Se proporciona el nombre del atributo, el tipo de atributo, la unidad de medida y una breve descripción. El número de anillos es el valor a predecir: ya sea como un valor continuo o como un problema de clasificación.','Sam Waugh (1995) \"Ampliación y evaluación comparativa de Cascade-Correlation\", tesis doctoral, Departamento de Informática, Universidad de Tasmania.','5','3','4','3',2010,1,'2',NULL),(67,'pulsar','adfdsf','dfsdfs','',NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(68,'pulsar Star','adfdsf','dfsdfs','',NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(69,'USArest','predice la edad del abulón a partir de mediciones físicas','Warwick J Nash, Tracy L Sellers, Simon R Talbot, Andrew J Cawthorn y Wes B Ford (1994)','Serie Temporal, Texto, Teoria del Dominio','Otros','Numérico, Categorico','Negocios','Matriz','si','45','6','',NULL,NULL,NULL,'archivos/USArrests.csv',NULL,'Aprobado',NULL,2,NULL,'Bueno'),(70,'mano de póker','Se incluyen dos conjuntos de datos, relacionados con muestras de vino tinto y blanco de vinho verde, del norte de Portugal.','Manohar Kaul, Departamento de Informática, Universidad de Aarhus, Dinamarca ( mkaul \'@\' cs.au.dk )','Secuencial, texto',' Regresión','Categórico','Computación','csv','N / A','517','13','Este conjunto de datos se construyó agregando información de elevación a una red de carreteras 2D en el norte de Jutlandia, Dinamarca (cubriendo una región de 185 x 135 km ^ 2). Los valores de elevación se extrajeron de una nube de puntos de escaneo láser masiva disponible públicamente para Dinamarca','1. OSM_ID: ID de OpenStreetMap para cada segmento de carretera o borde en el gráfico.','[1] Chenjuan Guo, Yu Ma, Bin Yang, Christian S. Jensen, Manohar Kaul: EcoMark: evaluación de modelos de impacto ambiental vehicular. SIGSPATIAL / GIS 2012: 269-278',NULL,'archivos/abalone.csv',NULL,'Aprobado',NULL,2,NULL,'Bueno'),(71,'ALgo','sef','sdffs','',NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,NULL,2,NULL,NULL),(72,'ALgoDDD','sef','sdffs','',NULL,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,NULL,2,NULL,NULL),(73,'UsaR','sdgh','fggfgf','Multivariante - Secuencial - ','Clasificación - Agrupamiento - ','Categórico - ','Ciencias fisicas - ','Ciencias de la vida - ','Si - ','78','3','677','rg','bbfb','cbcbcvxcxcx','null',NULL,NULL,NULL,2,NULL,NULL),(74,'UsaR','sdgh','fggfgf','Multivariante - Secuencial - ','Clasificación - Agrupamiento - ','Categórico - ','Ciencias fisicas - ','Ciencias de la vida - ','Si - ','78','3','677','rg','bbfb','cbcbcvxcxcx','null',NULL,NULL,NULL,2,NULL,NULL),(75,'UsaRdf','sdgh','fggfgf','Multivariante - Secuencial - ','Clasificación - Agrupamiento - ','Categórico - ','Ciencias fisicas - ','Ciencias de la vida - ','Si - ','78','3','677','rg','bbfb','cbcbcvxcxcx','null',NULL,'No aprobado',NULL,2,NULL,'esta mal igual q neyser'),(76,'UsaRdf','sdgh','fggfgf','Multivariante - Secuencial - ','Clasificación - Agrupamiento - ','Categórico - ','Ciencias fisicas - ','Ciencias de la vida - ','Si - ','78','3','677','rg','bbfb','cbcbcvxcxcx','null',NULL,'Aprobado',NULL,2,NULL,NULL),(77,'fdfgfgd','dfg','fgdf','Series de tiempo - ','Descubrimiento - ','Real - ','CS / Ingeniería - ','Ciencias fisicas - ','Si - ','7','674','dsf','sdf','sdf','dsf','dsf',NULL,NULL,NULL,2,NULL,NULL),(78,'sdfgh','sdfg','vb','Secuencial - ','Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','dfgh','sdfgh','dfg','xfg','sdfg','sdfgh','sdfgh',NULL,NULL,NULL,2,NULL,NULL),(79,'sdfghcdfff','xcv','xc','Secuencial - ','Agrupamiento - ','Real - ','Ciencias de la vida - ','Ciencias de la vida - ','Si - ','dfgv','fgh','dfg','dfgh','dfg','dfgh','null',NULL,NULL,NULL,2,NULL,NULL),(80,'sdfghcdfff','xcv','xc','Secuencial - ','Agrupamiento - ','Real - ','Ciencias de la vida - ','Ciencias de la vida - ','Si - ','dfgv','fgh','dfg','dfgh','dfg','dfgh','null',NULL,NULL,NULL,2,NULL,NULL),(81,'quess','xcv','xc','Secuencial - ','Agrupamiento - ','Real - ','Ciencias de la vida - ','Ciencias de la vida - ','Si - ','dfgv','fgh','dfg','dfgh','dfg','dfgh','null',NULL,NULL,NULL,2,NULL,NULL),(82,'vvcxvx','xcv','cxvb','Univariante - Secuencial - ','Regresión - Agrupamiento - ','Real - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','45','45','xdsgfa','fzgdf','zfdgbdf','fgdsfga',NULL,NULL,'',NULL,2,NULL,NULL),(83,'QWERTY','sgsr','','Univariante - Secuencial - ','Regresión - Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','54','5','fg','fg','xf','s',NULL,NULL,NULL,NULL,2,NULL,NULL),(84,'QWERT','sgsr','','Univariante - Secuencial - ','Regresión - Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','54','5','fg','fg','xf','s',NULL,NULL,NULL,NULL,2,NULL,NULL),(85,'QWERTYU','sgsr','','Univariante - Secuencial - ','Regresión - Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','54','5','fg','fg','xf','s','pulsar_stars.csv','','Aprobado',1985,2,NULL,'Bueno'),(86,'QWERTYUT','sgsr','','Univariante - Secuencial - ','Regresión - Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','54','5','fg','fg','xf','s','pulsar_stars.csv','','Aprobado',1985,2,NULL,'Bueno'),(87,'QWERTYUTT','sgsr','','Univariante - Secuencial - ','Regresión - Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','54','5','fg','fg','xf','s','archivos/pulsar_stars.csv','','Aprobado',1985,2,NULL,'Bueno'),(88,'qwertyuiop','vbn','dfghj','Univariante - Secuencial - ','Regresión - Agrupamiento - ','Real - ','Ciencias fisicas - ','Ciencias fisicas - ','No - ','54','54','asdf','sxcv','sdf','sdf','archivos/datos.csv','','Aprobado',1985,2,NULL,'Bueno'),(89,'Cristhian','sdfgb','xcvb','Univariante - ','Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','45','12','sfdghg','sdfg','sdfg','sdfg','archivos/USArrests.csv','','Aprobado',1985,2,NULL,'Bueno'),(90,'QWERTYUIO','qwertyuiop','ADFSFG','Univariante - Secuencial - ','Regresión - Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','4','4','SDFGHJ','SADFG','SDFG','ASGHJK','archivos/datos.csv','','Aprobado',1985,2,NULL,'Bueno'),(91,'asdfghjk','asdfg','sdfg','Secuencial - ','Agrupamiento - ','Entero - ','Ciencias fisicas - ','Ciencias fisicas - ','Si - ','45','23','sd','d','xfb','cg','archivos/USArrests.csv','','Aprobado',1985,2,NULL,'Bueno'),(92,'sdfgghm','xfb','vb','Univariante - ','Regresión - ','Categórico - ','Ciencias de la vida - ','Matriz - ','No - ','43','34','xfg','fdshg','zf','dshg','archivos/basketball.csv','','Aprobado',1985,2,NULL,'Bueno'),(93,'fdf','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(94,'fdf','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(95,'fdf','gfgd','bdfbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(96,'wer','sdfs','sfgdf','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','5645','34','dsfsg','sdfhgdh','afdadf','adfh','archivos/basketball.csv',NULL,NULL,NULL,2,NULL,NULL),(97,'wer','sdfs','sfgdf','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','5645','34','dsfsg','sdfhgdh','afdadf','adfh','archivos/basketball.csv',NULL,NULL,NULL,2,NULL,NULL),(98,'qqwertdafasdas','sd','asdsa','Univariante - ','Regresión - ','Entero - ','CS / Ingeniería - ','No Matriz - ','Si - ','34','435','frg','fdgdfs','dfg','afga','archivos/infoEmpOriginal.csv',NULL,NULL,NULL,2,NULL,NULL),(99,'qqwertdafasdas','sd','asdsa','Univariante - ','Regresión - ','Entero - ','CS / Ingeniería - ','No Matriz - ','Si - ','34','435','frg','fdgdfs','dfg','afga','archivos/infoEmpOriginal.csv',NULL,NULL,NULL,4,NULL,NULL),(100,'ewqerqwrfas','fsdf','fsagf','Multivariante - ','Regresión - ','Categórico - ','Ciencias de la vida - ','No Matriz - ','Si - ','34','3','fdf','dv','vxc','cv','archivos/basketball.csv',NULL,NULL,NULL,4,NULL,NULL),(101,'ewqerqwrfas','fsdf','fsagf','Multivariante - ','Regresión - ','Categórico - ','Ciencias de la vida - ','No Matriz - ','Si - ','34','3','fdf','dv','vxc','cv','archivos/basketball.csv',NULL,NULL,NULL,4,NULL,NULL),(102,'fagdfsg','fg','fgsafg','Series de tiempo - ','Agrupamiento - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','45','44','rtr','gfdg','gdsf','dfg','archivos/basketball.csv',NULL,NULL,2323,4,NULL,NULL),(103,'qwere','dfgsh','gsh','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','45','56','fdg','dfgsh','null','fg','archivos/basketball.csv',NULL,NULL,46,4,NULL,NULL),(104,'qwere','dfgsh','gsh','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','45','56','fdg','dfgsh','null','fg','archivos/basketball.csv',NULL,NULL,46,4,NULL,NULL),(105,'qwere','dfgsh','gsh','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','45','56','fdg','dfgsh','null','fg','archivos/basketball.csv',NULL,NULL,46,4,NULL,NULL),(106,'sdfds','sd','saf','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','43','352','et','sf','null','dzg','archivos/USArrests (1).csv',NULL,NULL,3455,4,NULL,NULL),(107,'sdth','dg','sdrth','Multivariante - ','Clasificación - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','54','213','rdfb','FBngnzvb','null','dfhdabfs','archivos/USArrests (1).csv',NULL,NULL,1234,4,NULL,NULL),(108,'sdth','dg','sdrth','Multivariante - ','Clasificación - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','54','213','rdfb','FBngnzvb','null','dfhdabfs','archivos/USArrests (1).csv',NULL,NULL,1234,4,NULL,NULL),(109,'sefsgf','df','zcgh','Univariante - ','Regresión - ','Entero - ','CS / Ingeniería - ','Matriz - ','Si - ','88','7','afgdfag','fagsd','null','zfdbdgb','archivos/basketball.csv',NULL,NULL,4565,4,NULL,NULL),(110,'fgdf','sdfgd','fsdgsfd','Univariante - ','Regresión - ','Entero - ','Ciencias de la vida - ','No Matriz - ','Si - ','55','4','fgd','asgdsf','null','sgadgdf','archivos/basketball.csv',NULL,NULL,4,4,NULL,NULL),(111,'asgfndhmgfj','zfxgnhcg','dfghjg','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','55','6','gtdghf','dfhg','null','stfh','archivos/basketball.csv',NULL,NULL,4556,4,NULL,NULL),(112,'qwertyuksdsf','assdf','xfg','Multivariante - ','Regresión - ','Categórico - ','Ciencias fisicas - ','No Matriz - ','No - ','4456','56','sgfd','setsr','null','dfhg','archivos/USArrests (1).csv',NULL,NULL,4989,11,NULL,NULL),(113,'qwertyuksdsf','assdf','xfg','Multivariante - ','Regresión - ','Categórico - ','Ciencias fisicas - ','No Matriz - ','No - ','4456','56','sgfd','setsr','null','dfhg','archivos/USArrests (1).csv',NULL,NULL,4989,11,NULL,NULL),(114,'qwertyuksdsf','assdf','xfg','Multivariante - ','Regresión - ','Categórico - ','Ciencias fisicas - ','No Matriz - ','No - ','4456','56','sgfd','setsr','null','dfhg','archivos/USArrests (1).csv',NULL,NULL,4989,11,NULL,NULL),(115,'ascar','wersgdf','dffzdf','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','234','234','23','44','null','eg','archivos/20200212115.csv',NULL,'Aprobado',34,4,NULL,NULL),(116,'ascar','wersgdf','dffzdf','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','234','234','23','44','null','eg','archivos/20200212116.csv',NULL,NULL,34,4,NULL,NULL),(117,'ascar','wersgdf','dffzdf','Univariante - ','Regresión - ','Entero - ','Ciencias fisicas - ','No Matriz - ','No - ','234','234','23','44','null','eg','archivos/20200212117.csv',NULL,NULL,34,4,NULL,NULL),(118,'WERT','Resumen','Fuente','Multivariante - Univariante - ','Regresión - ','Categórico - ','Ciencias de la vida - ','No Matriz - ','No - ','123','4','Info','Info','null','Info','archivos/20200213118.csv',NULL,'Aprobado',2010,4,NULL,NULL),(119,'PruebaConjuntoDatos','es un resumen de prueba de datos donados','es una fuente de prueba','','','','','','','1','1','Prueba','Prueba','null','Prueba','archivos/20200213119.csv',NULL,NULL,2020,4,'2',NULL),(120,'Basketball','Resumen','FUente','Multivariante - Univariante - ','Clasificación - Regresión - ','Categórico - ','Ciencias de la vida - ','Matriz - ','No - ','123','5','Info','info','null','info','archivos/20200213120.csv',NULL,'Aprobado',2010,4,'2',NULL);
/*!40000 ALTER TABLE `donaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

--
-- Table structure for table `historialnav`
--

DROP TABLE IF EXISTS `historialnav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialnav` (
  `idHistorial` int NOT NULL AUTO_INCREMENT,
  `fechaHora` datetime DEFAULT NULL,
  `Historialcol` varchar(45) DEFAULT NULL,
  `Usuario_idUsuario` int NOT NULL,
  PRIMARY KEY (`idHistorial`),
  KEY `fk_HistorialNav_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_HistorialNav_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialnav`
--

LOCK TABLES `historialnav` WRITE;
/*!40000 ALTER TABLE `historialnav` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialnav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--


DROP TABLE IF EXISTS `proyecto_integrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto_integrador` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL,
  `titulo` text NOT NULL,
  `modulo` int NOT NULL,
  `periodo_lectivo` varchar(15) NOT NULL,
  `objetivo` text NOT NULL,
  `resumen` text NOT NULL,
  `url_proyecto` text NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `proyecto_integrador_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_integrador`
--

LOCK TABLES `proyecto_integrador` WRITE;
/*!40000 ALTER TABLE `proyecto_integrador` DISABLE KEYS */;
INSERT INTO `proyecto_integrador` VALUES (5,'2020-09-08 00:03:31','Tema para prueba de proyecto',5,'SPA 2020','Objetivo para verificar proyecto','Resumen sobre este proyecto','/archivos/khhfddfsfdgdfdfgdfgd.txt',12),(6,'2020-09-08 00:11:18','Prueba de un titulo de proyecto',3,'SPA 2020','Prueba para verificar si inserta objetivo','Prueba de registro del resumen','/archivos/suuqytuteytewqytwey.txt',12),(8,'2020-09-08 00:30:18','Proyecto de prueba 2',7,'SPA 2020','Objetivo de prueba version dos','Resumen de prueba version 2','/PII/archivos/Proyecto_de_prueba_2.txt',13);
/*!40000 ALTER TABLE `proyecto_integrador` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `proyecto_autor`
--

DROP TABLE IF EXISTS `proyecto_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto_autor` (
  `id_proyecto_autor` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `id_autor` int NOT NULL,
  PRIMARY KEY (`id_proyecto_autor`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `proyecto_autor_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto_integrador` (`id_proyecto`),
  CONSTRAINT `proyecto_autor_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_autor`
--

LOCK TABLES `proyecto_autor` WRITE;
/*!40000 ALTER TABLE `proyecto_autor` DISABLE KEYS */;
INSERT INTO `proyecto_autor` VALUES (8,6,6),(9,5,6),(10,6,7),(11,5,7),(12,8,7);
/*!40000 ALTER TABLE `proyecto_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_integrador`
--

--
-- Table structure for table `rol`
--

--
-- Table structure for table `usuario`
--



--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variable` (
  `id_variable` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `tipo` char(1) NOT NULL,
  `variable` varchar(100) NOT NULL,
  PRIMARY KEY (`id_variable`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `variable_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto_integrador` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` VALUES (4,6,'I','variable prueba dos'),(6,8,'I','variable prueba tres');
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-12 20:54:18
