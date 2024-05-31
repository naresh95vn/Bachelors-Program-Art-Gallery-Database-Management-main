CREATE DATABASE  IF NOT EXISTS `artgallery` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `artgallery`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: artgallery
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `Artist_ID` varchar(9) NOT NULL,
  `Artist_Name` varchar(20) DEFAULT NULL,
  `BirthPlace` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Artist_PhNo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Artist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES ('Artist001','Leonardo da Vinci','Italy','1452-04-15',123456789),('Artist002','Kazimir Malevich','Ukraine','1878-02-23',369258147),('Artist003','Raphael','Italy','1483-10-19',132465798),('Artist004','Robert Cook','Paris','1948-02-12',789456123);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artwork` (
  `Art_ID` varchar(6) NOT NULL,
  `Artist_ID` varchar(9) DEFAULT NULL,
  `Artwork_Name` varchar(40) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Category_ID` varchar(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Gallery_ID` varchar(10) DEFAULT NULL,
  `Exhibition_ID` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`Art_ID`),
  KEY `Artist_ID` (`Artist_ID`),
  KEY `Category_ID` (`Category_ID`),
  KEY `Gallery_ID` (`Gallery_ID`),
  KEY `Exhibition_ID` (`Exhibition_ID`),
  CONSTRAINT `artwork_ibfk_1` FOREIGN KEY (`Artist_ID`) REFERENCES `artist` (`Artist_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artwork_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artwork_ibfk_3` FOREIGN KEY (`Gallery_ID`) REFERENCES `gallery` (`Gallery_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artwork_ibfk_4` FOREIGN KEY (`Exhibition_ID`) REFERENCES `exhibitions` (`Exhibition_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
INSERT INTO `artwork` VALUES ('Art001','Artist001','Monalisa',1503,'Category002',10000000,'Gallery001','Exhibition001'),('Art002','Artist001','Last Supper',1498,'Category001',2330000,'Gallery001','Exhibition001'),('Art003','Artist001','Annunciation',1472,'Category001',2500000,'Gallery001','Exhibition001'),('Art004','Artist001','Salvator Mundi',1490,'Category002',45030000,'Gallery001','Exhibition001'),('Art005','Artist002','Black Square',1915,'Category003',4600000,'Gallery001','Exhibition002'),('Art006','Artist002','Suprematist Composition',1916,'Category003',8600000,NULL,NULL),('Art007','Artist002','White on White',1918,'Category003',2600000,NULL,NULL),('Art008','Artist003','The School of Athens',1509,'Category001',7900000,'Gallery001','Exhibition001'),('Art009','Artist003','Transfiguration',1520,'Category001',4900000,'Gallery001','Exhibition001'),('Art010','Artist004','Amber Fields',1956,'Category004',490000,'Gallery001','Exhibition002'),('Art011','Artist004','Moment in Time',1968,'Category004',560000,NULL,NULL),('Art030','Artist001','mona',2015,'Category001',50000,NULL,NULL);
/*!40000 ALTER TABLE `artwork` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger NoOfArt
After update on Artwork
for each row
update Exhibitions
set NoOfArtworks=NoOfArtworks+0.5
where Exhibition_ID=new.Exhibition_ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger NoOfArts
After delete on Artwork
for each row
update Exhibitions
set NoOfArtworks= NoOfArtworks-1
where Exhibition_ID=old.Exhibition_ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Category_ID` varchar(11) NOT NULL,
  `Cat_Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Category001','OilPainting'),('Category002','Portrait Painting'),('Category003','Abstract Painting'),('Category004','Acrylic Painting'),('Category005','Watercolour Painting');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_ID` varchar(11) NOT NULL,
  `Customer_Name` varchar(20) DEFAULT NULL,
  `Customer_Address` varchar(20) DEFAULT NULL,
  `Email_ID` varchar(20) DEFAULT NULL,
  `Customer_PhNo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Customer001','blah','b','f',21);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibitions`
--

DROP TABLE IF EXISTS `exhibitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibitions` (
  `Exhibition_ID` varchar(13) NOT NULL,
  `Date` date DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `Day` varchar(10) DEFAULT NULL,
  `RegistrationFee` int(11) DEFAULT NULL,
  `NoOfArtworks` int(11) DEFAULT '0',
  PRIMARY KEY (`Exhibition_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibitions`
--

LOCK TABLES `exhibitions` WRITE;
/*!40000 ALTER TABLE `exhibitions` DISABLE KEYS */;
INSERT INTO `exhibitions` VALUES ('Exhibition000','2017-11-30','Paris','08:00 pm','Thursday',200,0),('Exhibition001','2018-01-09','Paris','05:00pm','Tuesday',200,6),('Exhibition002','2018-01-31','Paris','09:00 am','Sunday',300,2),('Exhibition003','2018-02-14','Paris','06:30 pm','Wednesday',250,0),('Exhibition004','2018-01-14','Paris','04:30 pm','Saturday',200,0);
/*!40000 ALTER TABLE `exhibitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery` (
  `Gallery_ID` varchar(10) NOT NULL,
  `Gallery_Name` varchar(40) DEFAULT NULL,
  `Gallery_Location` varchar(20) DEFAULT NULL,
  `Gallery_PhNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Gallery_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES ('','','',''),('Gallery001','Musee d\' Orsey','Paris','+33 1 40 49 48 14'),('Gallery002','The Louvre Museum','Paris','+33 1 40 20 50 50'),('Gallery003','National Gallery Of Art','Washington DC','+1 202-737-4215'),('Gallery004','Tate Modern','London','+44 20 7887 8888'),('Gallery005','Paula Cooper','New York','+1 212-255-1105'),('Gallery006','Museum of Modern Art','New York','+1 212-708-9400'),('Gallery007','Yvon Lambert','Paris','+33 1 45 66 55 84'),('Gallery008','The Broad','Los Angeles','+1 213-232-6200'),('Gallery009','Louisiana Museum of Modern Art','Humlebæk','+45 49 19 07 19'),('Gallery010','Crimson Art Gallery','Bangalore','080 6537 9223');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemspurchased`
--

DROP TABLE IF EXISTS `itemspurchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemspurchased` (
  `Art_ID` varchar(6) NOT NULL,
  `Artist_ID` varchar(9) DEFAULT NULL,
  `Artwork_Name` varchar(20) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Category_ID` varchar(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `CustomerID` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Art_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemspurchased`
--

LOCK TABLES `itemspurchased` WRITE;
/*!40000 ALTER TABLE `itemspurchased` DISABLE KEYS */;
INSERT INTO `itemspurchased` VALUES ('Art012','Artist004','Horizon6',1982,'Category004',500000,'Customer001'),('Art013','Artist002','Black Circle',1923,'Category003',6300000,'Customer001');
/*!40000 ALTER TABLE `itemspurchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `Manager_ID` varchar(10) NOT NULL,
  `Manager_Name` varchar(20) DEFAULT NULL,
  `Manager_PhNo` bigint(20) DEFAULT NULL,
  `Startdate` date DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Category_ID` varchar(11) DEFAULT NULL,
  `Gallery_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Manager_ID`),
  KEY `Category_ID` (`Category_ID`),
  KEY `Gallery_ID` (`Gallery_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`Gallery_ID`) REFERENCES `gallery` (`Gallery_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('Manager001','Mark',123456789,'2015-06-09',25000,'Male','Category001','Gallery001'),('Manager002','Lucas',987654321,'2016-08-01',24300,'Male','Category002','Gallery001'),('Manager003','Camila',963852741,'2015-02-14',30000,'Female','Category003','Gallery001'),('Manager004','Jack',147258369,'2017-05-08',28000,'Male','Category004','Gallery001'),('Manager005','Ella',951738624,'2014-04-08',35000,'Female','Category005','Gallery001');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'artgallery'
--

--
-- Dumping routines for database 'artgallery'
--
/*!50003 DROP PROCEDURE IF EXISTS `refreshArtwork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `refreshArtwork`(IN msg varchar(20) )
BEGIN
select * from ARTWORK where Artist_ID=msg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-01 22:44:03
