CREATE DATABASE  IF NOT EXISTS `project3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project3`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: project3
-- ------------------------------------------------------
-- Server version	8.0.33

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

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `clubName` varchar(60) NOT NULL,
  `type_of_club` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('Northeastern Black Athlete Caucus','Cultural','NU BAC \nseeks to represent the voice of Northeastern\'s \nBlack student-athletes, while diversifying & \nimplementing change in Northeastern Athletics.'),('Northeastern Black Student Association','Cultural','NBSA \nserves as the umbrella organization for Black students on campus, \nacting as a medium between Black students at large and officials \nof higher authority at Northeastern University.'),('Northeastern Scout','Entrepreneurial','NU Scout \naims to be the best place on campus for students to learn about design.'),('Society of Hispanic Professional Engineers','Professional','NU SHPE \nis a professional organization whose goal \nis to enable Latinos in the New England area (\nincluding MA, ME, NH, VT and RI) \nto pursue, obtain and develop \nsuccessful careers with top \nresearch and development, \nhigh-tech, and communications companies, \nas well as other science- and engineering-based organizations.');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companycoop`
--

DROP TABLE IF EXISTS `companycoop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companycoop` (
  `companyName` varchar(80) NOT NULL,
  `typeOfCompany` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companycoop`
--

LOCK TABLES `companycoop` WRITE;
/*!40000 ALTER TABLE `companycoop` DISABLE KEYS */;
INSERT INTO `companycoop` VALUES ('Google','Search and Advertising Service'),('Spotify','Audio Streaming');
/*!40000 ALTER TABLE `companycoop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyinternship`
--

DROP TABLE IF EXISTS `companyinternship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyinternship` (
  `internshipName` varchar(80) NOT NULL,
  `typeOfCompanyInternship` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`internshipName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyinternship`
--

LOCK TABLES `companyinternship` WRITE;
/*!40000 ALTER TABLE `companyinternship` DISABLE KEYS */;
INSERT INTO `companyinternship` VALUES ('Liberty','Insurance'),('Moderna','Pharmaceutical');
/*!40000 ALTER TABLE `companyinternship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(12) DEFAULT NULL,
  `linkedin` varchar(90) DEFAULT NULL,
  `nuid` int NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `nuid` (`nuid`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('doe.j@northeastern.edu','112342134','https://www.linkedin.com/in/john-doe/',2901111),('doyle.c@northeastern.edu','2912324','https://www.linkedin.com/in/conor-doyle/',2912324),('feliciano.ch@northeastern.edu','9733090710','https://www.linkedin.com/in/christian-feliciano1/',2904463),('feliciano.s@northeastern.edu','123456789','https://www.linkedin.com/in/sebastian-feliciano1/',2900001),('olety.p@northeastern.edu','2900014','https://www.linkedin.com/in/pranav-olety/',2900014),('santos.j@northeastern.edu','2906166','https://www.linkedin.com/in/jayden-sanots/',2906166),('woods.h@northeastern.edu','2900010','https://www.linkedin.com/in/harold-woods/',2900010);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coop`
--

DROP TABLE IF EXISTS `coop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coop` (
  `companyName` varchar(80) NOT NULL,
  `yearStarted` int NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `roleTitle` varchar(60) DEFAULT NULL,
  `nuid` int DEFAULT NULL,
  PRIMARY KEY (`companyName`,`yearStarted`),
  KEY `nuid` (`nuid`),
  CONSTRAINT `coop_ibfk_1` FOREIGN KEY (`companyName`) REFERENCES `companycoop` (`companyName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coop_ibfk_2` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coop`
--

LOCK TABLES `coop` WRITE;
/*!40000 ALTER TABLE `coop` DISABLE KEYS */;
INSERT INTO `coop` VALUES ('Google',2019,'Worked on improvement of Google Suite','Product Design',2901111),('Spotify',2018,'Worked on improvement of the app-service','Product Design',2901111);
/*!40000 ALTER TABLE `coop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_name` varchar(100) NOT NULL,
  `dean` varchar(100) NOT NULL,
  `address_streetNumber` varchar(10) DEFAULT NULL,
  `address_streetName` varchar(100) DEFAULT NULL,
  `address_zipCode` varchar(10) DEFAULT NULL,
  `address_stateAbbr` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`department_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Bouve','Carmen Sceppa','360','Huntigton Ave','02115','MA'),('CAMD','Elizabeth Hudson','11','Leon St','02115','MA'),('DAmore McKim','Hugh Courtney','370','Huntington Ave','02115','MA'),('Khoury','Elizabeth Mynatt','440','Huntington Ave','02115','MA');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internship` (
  `internshipName` varchar(80) NOT NULL,
  `yearStarted` int NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `roleTitle` varchar(60) DEFAULT NULL,
  `nuid` int DEFAULT NULL,
  PRIMARY KEY (`internshipName`,`yearStarted`),
  KEY `nuid` (`nuid`),
  CONSTRAINT `internship_ibfk_1` FOREIGN KEY (`internshipName`) REFERENCES `companyinternship` (`internshipName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `internship_ibfk_2` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internship`
--

LOCK TABLES `internship` WRITE;
/*!40000 ALTER TABLE `internship` DISABLE KEYS */;
INSERT INTO `internship` VALUES ('Liberty',2023,'Part of the Software department','Software Engineer Intern',2900001),('Moderna',2023,'Part of the Digital Data Analytics Team','Digital Data Analytics Intern',NULL);
/*!40000 ALTER TABLE `internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL,
  `job_name` varchar(100) DEFAULT NULL,
  `on_off_campus` varchar(8) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `nuid` int DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `nuid` (`nuid`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'New Balance','Off','Sales Associate',2904463);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `majorcode` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `type_of_degree` varchar(6) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`majorcode`),
  KEY `major_constraint` (`department_name`),
  KEY `name` (`name`),
  CONSTRAINT `major_constraint` FOREIGN KEY (`department_name`) REFERENCES `department` (`department_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Computer Science','B.S','Khoury'),(2,'Comp Sci','B.S','Khoury'),(11,'Economics','B.S','DAmore McKim'),(12,'Business Admin.','B.A','DAmore McKim'),(101,'Design','B.F.A','CAMD'),(145,'Comp Sci','BS','khoury'),(301,'Cell and Molecular Biology','B.S','Bouve');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research`
--

DROP TABLE IF EXISTS `research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research` (
  `researchName` varchar(100) NOT NULL,
  `professorAssociated` varchar(100) DEFAULT NULL,
  `yearStarted` varchar(8) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `nuid` int DEFAULT NULL,
  PRIMARY KEY (`researchName`),
  KEY `nuid` (`nuid`),
  CONSTRAINT `research_ibfk_1` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research`
--

LOCK TABLES `research` WRITE;
/*!40000 ALTER TABLE `research` DISABLE KEYS */;
INSERT INTO `research` VALUES ('AlphaResearch','Joseph Marks','2022','Won competition in 2023',2913001);
/*!40000 ALTER TABLE `research` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scholarship`
--

DROP TABLE IF EXISTS `scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scholarship` (
  `scholarshipName` varchar(100) NOT NULL,
  `yearWon` int NOT NULL,
  `nuid` int DEFAULT NULL,
  PRIMARY KEY (`scholarshipName`,`yearWon`),
  KEY `nuid` (`nuid`),
  CONSTRAINT `scholarship_ibfk_1` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scholarship`
--

LOCK TABLES `scholarship` WRITE;
/*!40000 ALTER TABLE `scholarship` DISABLE KEYS */;
INSERT INTO `scholarship` VALUES ('Northeastern Athletic Scholarship',2023,2900010),('Northeastern Honors Scholarship',2016,2901111),('Northeastern Dean\'s Scholarship',2020,2912324);
/*!40000 ALTER TABLE `scholarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `nuid` int NOT NULL,
  `nu_password` varchar(100) NOT NULL,
  `student_fn` varchar(50) NOT NULL,
  `student_ln` varchar(50) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  PRIMARY KEY (`nuid`),
  UNIQUE KEY `contact_email` (`contact_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (123456,'password','Conor','Doyle','conor@nu.com'),(2900001,'hi','Sebastian','Feliciano','feliciano.s@northeastern.edu'),(2900010,'husky','Harold','Woods','woods.h@northeastern.edu'),(2900014,'databasedesign','Pranav','Olety','olety.p@northeastern.edu'),(2901111,'john123','John','Doe','doe.j@northeastern.edu'),(2904463,'abc123','Christian','Feliciano','feliciano.ch@northeastern.edu'),(2906166,'northeastern','Jayden','Santos','santos.j@northeastern.edu'),(2912324,'newyork121','Conor','Doyle','doyle.c@northeastern.edu'),(2913001,'nu_password','Alex','Dicarlo','Dicarlo.a@northeastern.edu');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_club`
--

DROP TABLE IF EXISTS `student_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_club` (
  `nuid` int NOT NULL,
  `clubName` varchar(60) NOT NULL,
  PRIMARY KEY (`nuid`,`clubName`),
  KEY `clubName` (`clubName`),
  CONSTRAINT `student_club_ibfk_1` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_club_ibfk_2` FOREIGN KEY (`clubName`) REFERENCES `club` (`clubName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_club`
--

LOCK TABLES `student_club` WRITE;
/*!40000 ALTER TABLE `student_club` DISABLE KEYS */;
INSERT INTO `student_club` VALUES (2900010,'Northeastern Black Athlete Caucus'),(2904463,'Northeastern Black Student Association'),(2906166,'Northeastern Black Student Association'),(2901111,'Northeastern Scout'),(2900001,'Society of Hispanic Professional Engineers'),(2904463,'Society of Hispanic Professional Engineers'),(2906166,'Society of Hispanic Professional Engineers');
/*!40000 ALTER TABLE `student_club` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_student_club` BEFORE INSERT ON `student_club` FOR EACH ROW BEGIN
    DECLARE club_count INT;
    
    SELECT COUNT(*) INTO club_count
    FROM student_club
    WHERE nuid = NEW.nuid
    AND clubName = NEW.clubName;
    
    IF club_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student is already a member of the club.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_major`
--

DROP TABLE IF EXISTS `student_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_major` (
  `nuid` int NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`nuid`,`name`),
  KEY `name` (`name`),
  CONSTRAINT `student_major_ibfk_1` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_major_ibfk_2` FOREIGN KEY (`name`) REFERENCES `major` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_major`
--

LOCK TABLES `student_major` WRITE;
/*!40000 ALTER TABLE `student_major` DISABLE KEYS */;
INSERT INTO `student_major` VALUES (2900010,'Business Admin.'),(2912324,'Cell and Molecular Biology'),(123456,'Comp Sci'),(2900014,'Comp Sci'),(2900001,'Computer Science'),(2904463,'Computer Science'),(2913001,'Computer Science'),(2901111,'Design'),(2906166,'Economics');
/*!40000 ALTER TABLE `student_major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_sport`
--

DROP TABLE IF EXISTS `student_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_sport` (
  `nuid` int NOT NULL,
  `sportName` varchar(60) NOT NULL,
  PRIMARY KEY (`nuid`,`sportName`),
  KEY `sportName` (`sportName`),
  CONSTRAINT `student_sport_ibfk_1` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_sport_ibfk_2` FOREIGN KEY (`sportName`) REFERENCES `varsitySport` (`sportName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_sport`
--

LOCK TABLES `student_sport` WRITE;
/*!40000 ALTER TABLE `student_sport` DISABLE KEYS */;
INSERT INTO `student_sport` VALUES (2900010,'Basketball');
/*!40000 ALTER TABLE `student_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varsitySport`
--

DROP TABLE IF EXISTS `varsitySport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varsitySport` (
  `sportName` varchar(60) NOT NULL,
  `position` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sportName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varsitySport`
--

LOCK TABLES `varsitySport` WRITE;
/*!40000 ALTER TABLE `varsitySport` DISABLE KEYS */;
INSERT INTO `varsitySport` VALUES ('Basketball','SF');
/*!40000 ALTER TABLE `varsitySport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project3'
--

--
-- Dumping routines for database 'project3'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddStudent`(
  IN input_nuid INT,
  IN input_password VARCHAR(100),
  IN input_first_name VARCHAR(50),
  IN input_last_name VARCHAR(50),
  IN input_email VARCHAR(100)
)
BEGIN
  INSERT INTO student (nuid, nu_password, student_fn, student_ln, contact_email)
  VALUES (input_nuid, input_password, input_first_name, input_last_name, input_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckLogin`(
  IN input_nuid INT,
  IN input_password VARCHAR(100)
)
BEGIN
  DECLARE login_success BOOLEAN;

  -- Verify the login credentials
  SET login_success = EXISTS (
    SELECT 1
    FROM student
    WHERE nuid = input_nuid AND nu_password = input_password
  );

  -- Return the login success result
  SELECT login_success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateContactData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateContactData`(
    IN p_email VARCHAR(100),
    IN p_phonenumber VARCHAR(12),
    IN p_linkedin VARCHAR(90),
    IN p_nuid INT
)
BEGIN
    -- Insert contact data into the contact table
    INSERT INTO contact (email, phonenumber, linkedin, nuid)
    VALUES (p_email, p_phonenumber, p_linkedin, p_nuid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateInternshipData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateInternshipData`(
    IN p_name VARCHAR(80),
    IN p_type VARCHAR(90),
    IN p_started INT,
    IN p_description VARCHAR(100),
    IN p_roleTitle VARCHAR(60),
    IN p_nuid INT
)
BEGIN
    DECLARE company_exists INT;

    -- Check if the company internship already exists
    SELECT COUNT(*) INTO company_exists
    FROM companyinternship
    WHERE internshipName = p_name;

    IF company_exists = 0 THEN
        -- Insert company internship data into the companyinternship table
        INSERT INTO companyinternship (internshipName, typeOfCompanyInternship)
        VALUES (p_name, p_type);
    END IF;

    -- Insert internship data into the internship table
    INSERT INTO internship (internshipName, yearStarted, description, roleTitle, nuid)
    VALUES (p_name, p_started, p_description, p_roleTitle, p_nuid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateJobData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateJobData`(
    IN p_job_id INT,
    IN p_job_name VARCHAR(100),
    IN p_on_off_campus VARCHAR(8),
    IN p_job_title VARCHAR(100),
    IN p_nuid INT
)
BEGIN
    -- Insert job data into the job table
    INSERT INTO job (job_id, job_name, on_off_campus, job_title, nuid)
    VALUES (p_job_id, p_job_name, p_on_off_campus, p_job_title, p_nuid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateResearchData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateResearchData`(
    IN p_researchName VARCHAR(100),
    IN p_professorAssociated VARCHAR(100),
    IN p_yearStarted VARCHAR(8),
    IN p_description VARCHAR(1000)
)
BEGIN
    -- Insert research data into the research table
    INSERT INTO research (researchName, professorAssociated, yearStarted, description)
    VALUES (p_researchName, p_professorAssociated, p_yearStarted, p_description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateStudentClubData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateStudentClubData`(
    IN p_nuid INT,
    IN p_club_name VARCHAR(60),
    IN p_club_type VARCHAR(20),
    IN p_club_description VARCHAR(500)
)
BEGIN
    DECLARE club_exists INT;

    -- Check if the club already exists
    SELECT COUNT(*) INTO club_exists
    FROM club
    WHERE clubName = p_club_name;

    IF club_exists = 0 THEN
        -- Insert club data into the club table
        INSERT INTO club (clubName, type_of_club, description)
        VALUES (p_club_name, p_club_type, p_club_description);
    END IF;

    -- Insert student club data into the student_club table
    INSERT INTO student_club (nuid, clubName)
    VALUES (p_nuid, p_club_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateStudentMajorData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateStudentMajorData`(
    IN p_nuid INT,
    IN p_department_name VARCHAR(100),
    IN p_department_dean VARCHAR(100),
    IN p_majorcode INT,
    IN p_major_name VARCHAR(100),
    IN p_degree_type VARCHAR(6)
)
BEGIN
    DECLARE department_exists INT;
    DECLARE major_exists INT;

    -- Check if the department already exists
    SELECT COUNT(*) INTO department_exists
    FROM department
    WHERE department_name = p_department_name;

    IF department_exists = 0 THEN
        -- Insert department data into the department table
        INSERT INTO department (department_name, dean)
        VALUES (p_department_name, p_department_dean);
    END IF;

    -- Check if the major already exists
    SELECT COUNT(*) INTO major_exists
    FROM major
    WHERE majorcode = p_majorcode;

    IF major_exists = 0 THEN
        -- Insert major data into the major table
        INSERT INTO major (majorcode, name, type_of_degree, department_name)
        VALUES (p_majorcode, p_major_name, p_degree_type, p_department_name);
    END IF;

    -- Insert student major data into the student_major table
    INSERT INTO student_major (nuid, name)
    VALUES (p_nuid, p_major_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateStudentSportData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateStudentSportData`(
    IN p_sport_name VARCHAR(60),
    IN p_position VARCHAR(20),
    IN p_nuid INT
)
BEGIN
    DECLARE sport_exists INT;

    -- Check if the sport already exists
    SELECT COUNT(*) INTO sport_exists
    FROM varsitySport
    WHERE sportName = p_sport_name;

    IF sport_exists = 0 THEN
        -- Insert sport data into the varsitySport table
        INSERT INTO varsitySport (sportName, position)
        VALUES (p_sport_name, p_position);
    END IF;

    -- Insert student sport data into the student_sport table
    INSERT INTO student_sport (nuid, sportName)
    VALUES (p_nuid, p_sport_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteDataByNUID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDataByNUID`(
    IN delete_table VARCHAR(100),
    IN nuid INT
)
BEGIN
    SET @delete_query = CONCAT('DELETE FROM ', delete_table, ' WHERE nuid = ', nuid);
    PREPARE stmt FROM @delete_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewData`(
IN table_name VARCHAR(100)
)
BEGIN
    SET @query = CONCAT('SELECT * FROM ', table_name);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewDataStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewDataStudent`()
BEGIN
    SELECT nuid, student_fn, student_ln, contact_email FROM student ;
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

-- Dump completed on 2025-01-06 22:00:05
