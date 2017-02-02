-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: hspc_1_smartdstu2
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `HFJ_FORCED_ID`
--

DROP TABLE IF EXISTS `HFJ_FORCED_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_FORCED_ID` (
  `PID` bigint(20) NOT NULL,
  `FORCED_ID` varchar(100) NOT NULL,
  `RESOURCE_PID` bigint(20) NOT NULL,
  `RESOURCE_TYPE` varchar(100) DEFAULT '',
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_FORCEDID_RESID` (`RESOURCE_PID`),
  UNIQUE KEY `IDX_FORCEDID_TYPE_RESID` (`RESOURCE_TYPE`,`RESOURCE_PID`),
  KEY `IDX_FORCEDID_TYPE_FORCEDID` (`RESOURCE_TYPE`,`FORCED_ID`),
  CONSTRAINT `FK1saewbugq02dh94ybn9xhklfa` FOREIGN KEY (`RESOURCE_PID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_FORCED_ID`
--

LOCK TABLES `HFJ_FORCED_ID` WRITE;
/*!40000 ALTER TABLE `HFJ_FORCED_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_FORCED_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_HISTORY_TAG`
--

DROP TABLE IF EXISTS `HFJ_HISTORY_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_HISTORY_TAG` (
  `PID` bigint(20) NOT NULL,
  `TAG_ID` bigint(20) DEFAULT NULL,
  `RES_ID` bigint(20) NOT NULL,
  `RES_TYPE` varchar(30) NOT NULL,
  `RES_VER_PID` bigint(20) NOT NULL,
  PRIMARY KEY (`PID`),
  KEY `FKtderym7awj6q8iq5c51xv4ndw` (`TAG_ID`),
  KEY `FKpx7wj9hmu5tw5ky1rgscivceh` (`RES_VER_PID`),
  CONSTRAINT `FKpx7wj9hmu5tw5ky1rgscivceh` FOREIGN KEY (`RES_VER_PID`) REFERENCES `HFJ_RES_VER` (`PID`),
  CONSTRAINT `FKtderym7awj6q8iq5c51xv4ndw` FOREIGN KEY (`TAG_ID`) REFERENCES `HFJ_TAG_DEF` (`TAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_HISTORY_TAG`
--

LOCK TABLES `HFJ_HISTORY_TAG` WRITE;
/*!40000 ALTER TABLE `HFJ_HISTORY_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_HISTORY_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_RESOURCE`
--

DROP TABLE IF EXISTS `HFJ_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_RESOURCE` (
  `RES_ID` bigint(20) NOT NULL,
  `RES_DELETED_AT` datetime DEFAULT NULL,
  `RES_ENCODING` varchar(5) NOT NULL,
  `RES_VERSION` varchar(7) DEFAULT NULL,
  `HAS_TAGS` bit(1) NOT NULL,
  `RES_PUBLISHED` datetime NOT NULL,
  `RES_TEXT` longblob NOT NULL,
  `RES_TITLE` varchar(100) DEFAULT NULL,
  `RES_UPDATED` datetime NOT NULL,
  `SP_HAS_LINKS` bit(1) DEFAULT NULL,
  `SP_INDEX_STATUS` bigint(20) DEFAULT NULL,
  `IS_CONTAINED` bit(1) DEFAULT NULL,
  `RES_LANGUAGE` varchar(20) DEFAULT NULL,
  `SP_COORDS_PRESENT` bit(1) DEFAULT NULL,
  `SP_DATE_PRESENT` bit(1) DEFAULT NULL,
  `SP_NUMBER_PRESENT` bit(1) DEFAULT NULL,
  `SP_QUANTITY_PRESENT` bit(1) DEFAULT NULL,
  `SP_STRING_PRESENT` bit(1) DEFAULT NULL,
  `SP_TOKEN_PRESENT` bit(1) DEFAULT NULL,
  `SP_URI_PRESENT` bit(1) DEFAULT NULL,
  `RES_PROFILE` varchar(200) DEFAULT NULL,
  `RES_TYPE` varchar(30) DEFAULT NULL,
  `RES_VER` bigint(20) DEFAULT NULL,
  `FORCED_ID_PID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RES_ID`),
  KEY `IDX_RES_DATE` (`RES_UPDATED`),
  KEY `IDX_RES_LANG` (`RES_TYPE`,`RES_LANGUAGE`),
  KEY `IDX_RES_PROFILE` (`RES_PROFILE`),
  KEY `IDX_INDEXSTATUS` (`SP_INDEX_STATUS`),
  KEY `FKhjgj8cp879gfxko25cx5o692r` (`FORCED_ID_PID`),
  CONSTRAINT `FKhjgj8cp879gfxko25cx5o692r` FOREIGN KEY (`FORCED_ID_PID`) REFERENCES `HFJ_FORCED_ID` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_RESOURCE`
--

LOCK TABLES `HFJ_RESOURCE` WRITE;
/*!40000 ALTER TABLE `HFJ_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_RES_LINK`
--

DROP TABLE IF EXISTS `HFJ_RES_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_RES_LINK` (
  `PID` bigint(20) NOT NULL,
  `SRC_PATH` varchar(100) NOT NULL,
  `SRC_RESOURCE_ID` bigint(20) NOT NULL,
  `SOURCE_RESOURCE_TYPE` varchar(30) NOT NULL DEFAULT '',
  `TARGET_RESOURCE_ID` bigint(20) DEFAULT NULL,
  `TARGET_RESOURCE_TYPE` varchar(30) NOT NULL DEFAULT '',
  `TARGET_RESOURCE_URL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `IDX_RL_TPATHRES` (`SRC_PATH`,`TARGET_RESOURCE_ID`),
  KEY `IDX_RL_SRC` (`SRC_RESOURCE_ID`),
  KEY `IDX_RL_DEST` (`TARGET_RESOURCE_ID`),
  CONSTRAINT `FKlj7n25tu55w1mflw41agllgpl` FOREIGN KEY (`SRC_RESOURCE_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`),
  CONSTRAINT `FKo2qdks5l1hc8ls9glb9m8qyd3` FOREIGN KEY (`TARGET_RESOURCE_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_RES_LINK`
--

LOCK TABLES `HFJ_RES_LINK` WRITE;
/*!40000 ALTER TABLE `HFJ_RES_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_RES_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_RES_TAG`
--

DROP TABLE IF EXISTS `HFJ_RES_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_RES_TAG` (
  `PID` bigint(20) NOT NULL,
  `TAG_ID` bigint(20) DEFAULT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(30) NOT NULL,
  PRIMARY KEY (`PID`),
  KEY `FKbfcjbaftmiwr3rxkwsy23vneo` (`TAG_ID`),
  KEY `FKj082d2j6aslx7exyefotb3adq` (`RES_ID`),
  CONSTRAINT `FKbfcjbaftmiwr3rxkwsy23vneo` FOREIGN KEY (`TAG_ID`) REFERENCES `HFJ_TAG_DEF` (`TAG_ID`),
  CONSTRAINT `FKj082d2j6aslx7exyefotb3adq` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_RES_TAG`
--

LOCK TABLES `HFJ_RES_TAG` WRITE;
/*!40000 ALTER TABLE `HFJ_RES_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_RES_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_RES_VER`
--

DROP TABLE IF EXISTS `HFJ_RES_VER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_RES_VER` (
  `PID` bigint(20) NOT NULL,
  `RES_DELETED_AT` datetime DEFAULT NULL,
  `RES_ENCODING` varchar(5) NOT NULL,
  `RES_VERSION` varchar(7) DEFAULT NULL,
  `HAS_TAGS` bit(1) NOT NULL,
  `RES_PUBLISHED` datetime NOT NULL,
  `RES_TEXT` longblob NOT NULL,
  `RES_TITLE` varchar(100) DEFAULT NULL,
  `RES_UPDATED` datetime NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(30) NOT NULL,
  `RES_VER` bigint(20) NOT NULL,
  `FORCED_ID_PID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_RESVER_ID_VER` (`RES_ID`,`RES_VER`),
  KEY `IDX_RESVER_TYPE_DATE` (`RES_TYPE`,`RES_UPDATED`),
  KEY `IDX_RESVER_ID_DATE` (`RES_ID`,`RES_UPDATED`),
  KEY `IDX_RESVER_DATE` (`RES_UPDATED`),
  KEY `FKh20i7lcbchkaxekvwg9ix4hc5` (`FORCED_ID_PID`),
  CONSTRAINT `FKh20i7lcbchkaxekvwg9ix4hc5` FOREIGN KEY (`FORCED_ID_PID`) REFERENCES `HFJ_FORCED_ID` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_RES_VER`
--

LOCK TABLES `HFJ_RES_VER` WRITE;
/*!40000 ALTER TABLE `HFJ_RES_VER` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_RES_VER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SEARCH`
--

DROP TABLE IF EXISTS `HFJ_SEARCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SEARCH` (
  `PID` bigint(20) NOT NULL,
  `CREATED` datetime NOT NULL,
  `LAST_UPDATED_HIGH` datetime DEFAULT NULL,
  `LAST_UPDATED_LOW` datetime DEFAULT NULL,
  `PREFERRED_PAGE_SIZE` int(11) DEFAULT NULL,
  `RESOURCE_ID` bigint(20) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(200) DEFAULT NULL,
  `SEARCH_TYPE` int(11) NOT NULL,
  `TOTAL_COUNT` int(11) NOT NULL,
  `SEARCH_UUID` varchar(40) NOT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_SEARCH_UUID` (`SEARCH_UUID`),
  KEY `JDX_SEARCH_CREATED` (`CREATED`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SEARCH`
--

LOCK TABLES `HFJ_SEARCH` WRITE;
/*!40000 ALTER TABLE `HFJ_SEARCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SEARCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SEARCH_INCLUDE`
--

DROP TABLE IF EXISTS `HFJ_SEARCH_INCLUDE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SEARCH_INCLUDE` (
  `PID` bigint(20) NOT NULL,
  `SEARCH_INCLUDE` varchar(200) NOT NULL,
  `INC_RECURSE` bit(1) NOT NULL,
  `REVINCLUDE` bit(1) NOT NULL,
  `SEARCH_PID` bigint(20) NOT NULL,
  PRIMARY KEY (`PID`),
  KEY `FK_SEARCHINC_SEARCH` (`SEARCH_PID`),
  CONSTRAINT `FK_SEARCHINC_SEARCH` FOREIGN KEY (`SEARCH_PID`) REFERENCES `HFJ_SEARCH` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SEARCH_INCLUDE`
--

LOCK TABLES `HFJ_SEARCH_INCLUDE` WRITE;
/*!40000 ALTER TABLE `HFJ_SEARCH_INCLUDE` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SEARCH_INCLUDE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SEARCH_RESULT`
--

DROP TABLE IF EXISTS `HFJ_SEARCH_RESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SEARCH_RESULT` (
  `PID` bigint(20) NOT NULL,
  `SEARCH_ORDER` int(11) NOT NULL,
  `RESOURCE_PID` bigint(20) NOT NULL,
  `SEARCH_PID` bigint(20) NOT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_SEARCHRES_ORDER` (`SEARCH_PID`,`SEARCH_ORDER`),
  KEY `FK_SEARCHRES_RES` (`RESOURCE_PID`),
  CONSTRAINT `FK_SEARCHRES_RES` FOREIGN KEY (`RESOURCE_PID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`),
  CONSTRAINT `FK_SEARCHRES_SEARCH` FOREIGN KEY (`SEARCH_PID`) REFERENCES `HFJ_SEARCH` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SEARCH_RESULT`
--

LOCK TABLES `HFJ_SEARCH_RESULT` WRITE;
/*!40000 ALTER TABLE `HFJ_SEARCH_RESULT` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SEARCH_RESULT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SPIDX_COORDS`
--

DROP TABLE IF EXISTS `HFJ_SPIDX_COORDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SPIDX_COORDS` (
  `SP_ID` bigint(20) NOT NULL,
  `SP_NAME` varchar(100) NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(255) NOT NULL,
  `SP_LATITUDE` double DEFAULT NULL,
  `SP_LONGITUDE` double DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  KEY `IDX_SP_COORDS` (`RES_TYPE`,`SP_NAME`,`SP_LATITUDE`,`SP_LONGITUDE`),
  KEY `IDX_SP_COORDS_RESID` (`RES_ID`),
  CONSTRAINT `FKc97mpk37okwu8qvtceg2nh9vn` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SPIDX_COORDS`
--

LOCK TABLES `HFJ_SPIDX_COORDS` WRITE;
/*!40000 ALTER TABLE `HFJ_SPIDX_COORDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SPIDX_COORDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SPIDX_DATE`
--

DROP TABLE IF EXISTS `HFJ_SPIDX_DATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SPIDX_DATE` (
  `SP_ID` bigint(20) NOT NULL,
  `SP_NAME` varchar(100) NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(255) NOT NULL,
  `SP_VALUE_HIGH` datetime DEFAULT NULL,
  `SP_VALUE_LOW` datetime DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  KEY `IDX_SP_DATE` (`RES_TYPE`,`SP_NAME`,`SP_VALUE_LOW`,`SP_VALUE_HIGH`),
  KEY `IDX_SP_DATE_RESID` (`RES_ID`),
  CONSTRAINT `FK17s70oa59rm9n61k9thjqrsqm` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SPIDX_DATE`
--

LOCK TABLES `HFJ_SPIDX_DATE` WRITE;
/*!40000 ALTER TABLE `HFJ_SPIDX_DATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SPIDX_DATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SPIDX_NUMBER`
--

DROP TABLE IF EXISTS `HFJ_SPIDX_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SPIDX_NUMBER` (
  `SP_ID` bigint(20) NOT NULL,
  `SP_NAME` varchar(100) NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(255) NOT NULL,
  `SP_VALUE` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  KEY `IDX_SP_NUMBER` (`RES_TYPE`,`SP_NAME`,`SP_VALUE`),
  KEY `IDX_SP_NUMBER_RESID` (`RES_ID`),
  CONSTRAINT `FKcltihnc5tgprj9bhpt7xi5otb` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SPIDX_NUMBER`
--

LOCK TABLES `HFJ_SPIDX_NUMBER` WRITE;
/*!40000 ALTER TABLE `HFJ_SPIDX_NUMBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SPIDX_NUMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SPIDX_QUANTITY`
--

DROP TABLE IF EXISTS `HFJ_SPIDX_QUANTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SPIDX_QUANTITY` (
  `SP_ID` bigint(20) NOT NULL,
  `SP_NAME` varchar(100) NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(255) NOT NULL,
  `SP_SYSTEM` varchar(200) DEFAULT NULL,
  `SP_UNITS` varchar(200) DEFAULT NULL,
  `SP_VALUE` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  KEY `IDX_SP_QUANTITY` (`RES_TYPE`,`SP_NAME`,`SP_SYSTEM`,`SP_UNITS`,`SP_VALUE`),
  KEY `IDX_SP_QUANTITY_RESID` (`RES_ID`),
  CONSTRAINT `FKn603wjjoi1a6asewxbbd78bi5` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SPIDX_QUANTITY`
--

LOCK TABLES `HFJ_SPIDX_QUANTITY` WRITE;
/*!40000 ALTER TABLE `HFJ_SPIDX_QUANTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SPIDX_QUANTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SPIDX_STRING`
--

DROP TABLE IF EXISTS `HFJ_SPIDX_STRING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SPIDX_STRING` (
  `SP_ID` bigint(20) NOT NULL,
  `SP_NAME` varchar(100) NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(255) NOT NULL,
  `SP_VALUE_EXACT` varchar(200) DEFAULT NULL,
  `SP_VALUE_NORMALIZED` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  KEY `IDX_SP_STRING` (`RES_TYPE`,`SP_NAME`,`SP_VALUE_NORMALIZED`),
  KEY `IDX_SP_STRING_RESID` (`RES_ID`),
  CONSTRAINT `FKsv6pu15m5yo9qqv2ne5c7cack` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SPIDX_STRING`
--

LOCK TABLES `HFJ_SPIDX_STRING` WRITE;
/*!40000 ALTER TABLE `HFJ_SPIDX_STRING` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SPIDX_STRING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SPIDX_TOKEN`
--

DROP TABLE IF EXISTS `HFJ_SPIDX_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SPIDX_TOKEN` (
  `SP_ID` bigint(20) NOT NULL,
  `SP_NAME` varchar(100) NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(255) NOT NULL,
  `SP_SYSTEM` varchar(200) DEFAULT NULL,
  `SP_VALUE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  KEY `IDX_SP_TOKEN` (`RES_TYPE`,`SP_NAME`,`SP_SYSTEM`,`SP_VALUE`),
  KEY `IDX_SP_TOKEN_UNQUAL` (`RES_TYPE`,`SP_NAME`,`SP_VALUE`),
  KEY `IDX_SP_TOKEN_RESID` (`RES_ID`),
  CONSTRAINT `FK7ulx3j1gg3v7maqrejgc7ybc4` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SPIDX_TOKEN`
--

LOCK TABLES `HFJ_SPIDX_TOKEN` WRITE;
/*!40000 ALTER TABLE `HFJ_SPIDX_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SPIDX_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SPIDX_URI`
--

DROP TABLE IF EXISTS `HFJ_SPIDX_URI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SPIDX_URI` (
  `SP_ID` bigint(20) NOT NULL,
  `SP_NAME` varchar(100) NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `RES_TYPE` varchar(255) NOT NULL,
  `SP_URI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  KEY `IDX_SP_URI` (`RES_TYPE`,`SP_NAME`,`SP_URI`),
  KEY `IDX_SP_URI_RESTYPE_NAME` (`RES_TYPE`,`SP_NAME`),
  KEY `IDX_SP_URI_COORDS` (`RES_ID`),
  CONSTRAINT `FKgxsreutymmfjuwdswv3y887do` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SPIDX_URI`
--

LOCK TABLES `HFJ_SPIDX_URI` WRITE;
/*!40000 ALTER TABLE `HFJ_SPIDX_URI` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SPIDX_URI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `HFJ_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SUBSCRIPTION` (
  `PID` bigint(20) NOT NULL,
  `CHECK_INTERVAL` bigint(20) NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `LAST_CLIENT_POLL` datetime DEFAULT NULL,
  `MOST_RECENT_MATCH` datetime NOT NULL,
  `NEXT_CHECK` datetime NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `SUBSCRIPTION_STATUS` varchar(20) NOT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_SUBS_NEXTCHECK` (`SUBSCRIPTION_STATUS`,`NEXT_CHECK`),
  UNIQUE KEY `IDX_SUBS_RESID` (`RES_ID`),
  CONSTRAINT `FK_SUBSCRIPTION_RESOURCE_ID` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SUBSCRIPTION`
--

LOCK TABLES `HFJ_SUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `HFJ_SUBSCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_SUBSCRIPTION_FLAG_RES`
--

DROP TABLE IF EXISTS `HFJ_SUBSCRIPTION_FLAG_RES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SUBSCRIPTION_FLAG_RES` (
  `PID` bigint(20) NOT NULL,
  `RES_VERSION` bigint(20) NOT NULL,
  `RES_ID` bigint(20) NOT NULL,
  `SUBSCRIPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `FKmj5n34rhfrkjrlvgrwkp6h25q` (`RES_ID`),
  KEY `FK_SUBSFLAG_SUBS` (`SUBSCRIPTION_ID`),
  CONSTRAINT `FK_SUBSFLAG_SUBS` FOREIGN KEY (`SUBSCRIPTION_ID`) REFERENCES `HFJ_SUBSCRIPTION` (`PID`),
  CONSTRAINT `FKmj5n34rhfrkjrlvgrwkp6h25q` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_SUBSCRIPTION_FLAG_RES`
--

LOCK TABLES `HFJ_SUBSCRIPTION_FLAG_RES` WRITE;
/*!40000 ALTER TABLE `HFJ_SUBSCRIPTION_FLAG_RES` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_SUBSCRIPTION_FLAG_RES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HFJ_TAG_DEF`
--

DROP TABLE IF EXISTS `HFJ_TAG_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_TAG_DEF` (
  `TAG_ID` bigint(20) NOT NULL,
  `TAG_CODE` varchar(200) DEFAULT NULL,
  `TAG_DISPLAY` varchar(200) DEFAULT NULL,
  `TAG_SYSTEM` varchar(200) DEFAULT NULL,
  `TAG_TYPE` int(11) NOT NULL,
  PRIMARY KEY (`TAG_ID`),
  UNIQUE KEY `UK7rtv56frrjtafhumaceutboxd` (`TAG_TYPE`,`TAG_SYSTEM`,`TAG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HFJ_TAG_DEF`
--

LOCK TABLES `HFJ_TAG_DEF` WRITE;
/*!40000 ALTER TABLE `HFJ_TAG_DEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `HFJ_TAG_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_CODESYSTEMVER_PID`
--

DROP TABLE IF EXISTS `SEQ_CODESYSTEMVER_PID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_CODESYSTEMVER_PID` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_CODESYSTEMVER_PID`
--

LOCK TABLES `SEQ_CODESYSTEMVER_PID` WRITE;
/*!40000 ALTER TABLE `SEQ_CODESYSTEMVER_PID` DISABLE KEYS */;
INSERT INTO `SEQ_CODESYSTEMVER_PID` VALUES (1);
/*!40000 ALTER TABLE `SEQ_CODESYSTEMVER_PID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_CODESYSTEM_PID`
--

DROP TABLE IF EXISTS `SEQ_CODESYSTEM_PID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_CODESYSTEM_PID` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_CODESYSTEM_PID`
--

LOCK TABLES `SEQ_CODESYSTEM_PID` WRITE;
/*!40000 ALTER TABLE `SEQ_CODESYSTEM_PID` DISABLE KEYS */;
INSERT INTO `SEQ_CODESYSTEM_PID` VALUES (1);
/*!40000 ALTER TABLE `SEQ_CODESYSTEM_PID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_CONCEPT_PC_PID`
--

DROP TABLE IF EXISTS `SEQ_CONCEPT_PC_PID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_CONCEPT_PC_PID` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_CONCEPT_PC_PID`
--

LOCK TABLES `SEQ_CONCEPT_PC_PID` WRITE;
/*!40000 ALTER TABLE `SEQ_CONCEPT_PC_PID` DISABLE KEYS */;
INSERT INTO `SEQ_CONCEPT_PC_PID` VALUES (1);
/*!40000 ALTER TABLE `SEQ_CONCEPT_PC_PID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_CONCEPT_PID`
--

DROP TABLE IF EXISTS `SEQ_CONCEPT_PID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_CONCEPT_PID` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_CONCEPT_PID`
--

LOCK TABLES `SEQ_CONCEPT_PID` WRITE;
/*!40000 ALTER TABLE `SEQ_CONCEPT_PID` DISABLE KEYS */;
INSERT INTO `SEQ_CONCEPT_PID` VALUES (1);
/*!40000 ALTER TABLE `SEQ_CONCEPT_PID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_RESOURCE_HISTORY_ID`
--

DROP TABLE IF EXISTS `SEQ_RESOURCE_HISTORY_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_RESOURCE_HISTORY_ID` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_RESOURCE_HISTORY_ID`
--

LOCK TABLES `SEQ_RESOURCE_HISTORY_ID` WRITE;
/*!40000 ALTER TABLE `SEQ_RESOURCE_HISTORY_ID` DISABLE KEYS */;
INSERT INTO `SEQ_RESOURCE_HISTORY_ID` VALUES (1);
/*!40000 ALTER TABLE `SEQ_RESOURCE_HISTORY_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_RESOURCE_ID`
--

DROP TABLE IF EXISTS `SEQ_RESOURCE_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_RESOURCE_ID` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_RESOURCE_ID`
--

LOCK TABLES `SEQ_RESOURCE_ID` WRITE;
/*!40000 ALTER TABLE `SEQ_RESOURCE_ID` DISABLE KEYS */;
INSERT INTO `SEQ_RESOURCE_ID` VALUES (1);
/*!40000 ALTER TABLE `SEQ_RESOURCE_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SEARCH`
--

DROP TABLE IF EXISTS `SEQ_SEARCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SEARCH` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SEARCH`
--

LOCK TABLES `SEQ_SEARCH` WRITE;
/*!40000 ALTER TABLE `SEQ_SEARCH` DISABLE KEYS */;
INSERT INTO `SEQ_SEARCH` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SEARCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SEARCH_INC`
--

DROP TABLE IF EXISTS `SEQ_SEARCH_INC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SEARCH_INC` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SEARCH_INC`
--

LOCK TABLES `SEQ_SEARCH_INC` WRITE;
/*!40000 ALTER TABLE `SEQ_SEARCH_INC` DISABLE KEYS */;
INSERT INTO `SEQ_SEARCH_INC` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SEARCH_INC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SEARCH_RES`
--

DROP TABLE IF EXISTS `SEQ_SEARCH_RES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SEARCH_RES` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SEARCH_RES`
--

LOCK TABLES `SEQ_SEARCH_RES` WRITE;
/*!40000 ALTER TABLE `SEQ_SEARCH_RES` DISABLE KEYS */;
INSERT INTO `SEQ_SEARCH_RES` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SEARCH_RES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SPIDX_COORDS`
--

DROP TABLE IF EXISTS `SEQ_SPIDX_COORDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SPIDX_COORDS` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SPIDX_COORDS`
--

LOCK TABLES `SEQ_SPIDX_COORDS` WRITE;
/*!40000 ALTER TABLE `SEQ_SPIDX_COORDS` DISABLE KEYS */;
INSERT INTO `SEQ_SPIDX_COORDS` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SPIDX_COORDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SPIDX_DATE`
--

DROP TABLE IF EXISTS `SEQ_SPIDX_DATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SPIDX_DATE` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SPIDX_DATE`
--

LOCK TABLES `SEQ_SPIDX_DATE` WRITE;
/*!40000 ALTER TABLE `SEQ_SPIDX_DATE` DISABLE KEYS */;
INSERT INTO `SEQ_SPIDX_DATE` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SPIDX_DATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SPIDX_NUMBER`
--

DROP TABLE IF EXISTS `SEQ_SPIDX_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SPIDX_NUMBER` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SPIDX_NUMBER`
--

LOCK TABLES `SEQ_SPIDX_NUMBER` WRITE;
/*!40000 ALTER TABLE `SEQ_SPIDX_NUMBER` DISABLE KEYS */;
INSERT INTO `SEQ_SPIDX_NUMBER` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SPIDX_NUMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SPIDX_QUANTITY`
--

DROP TABLE IF EXISTS `SEQ_SPIDX_QUANTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SPIDX_QUANTITY` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SPIDX_QUANTITY`
--

LOCK TABLES `SEQ_SPIDX_QUANTITY` WRITE;
/*!40000 ALTER TABLE `SEQ_SPIDX_QUANTITY` DISABLE KEYS */;
INSERT INTO `SEQ_SPIDX_QUANTITY` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SPIDX_QUANTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SPIDX_STRING`
--

DROP TABLE IF EXISTS `SEQ_SPIDX_STRING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SPIDX_STRING` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SPIDX_STRING`
--

LOCK TABLES `SEQ_SPIDX_STRING` WRITE;
/*!40000 ALTER TABLE `SEQ_SPIDX_STRING` DISABLE KEYS */;
INSERT INTO `SEQ_SPIDX_STRING` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SPIDX_STRING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SPIDX_TOKEN`
--

DROP TABLE IF EXISTS `SEQ_SPIDX_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SPIDX_TOKEN` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SPIDX_TOKEN`
--

LOCK TABLES `SEQ_SPIDX_TOKEN` WRITE;
/*!40000 ALTER TABLE `SEQ_SPIDX_TOKEN` DISABLE KEYS */;
INSERT INTO `SEQ_SPIDX_TOKEN` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SPIDX_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQ_SPIDX_URI`
--

DROP TABLE IF EXISTS `SEQ_SPIDX_URI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_SPIDX_URI` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQ_SPIDX_URI`
--

LOCK TABLES `SEQ_SPIDX_URI` WRITE;
/*!40000 ALTER TABLE `SEQ_SPIDX_URI` DISABLE KEYS */;
INSERT INTO `SEQ_SPIDX_URI` VALUES (1);
/*!40000 ALTER TABLE `SEQ_SPIDX_URI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRM_CODESYSTEM`
--

DROP TABLE IF EXISTS `TRM_CODESYSTEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRM_CODESYSTEM` (
  `PID` bigint(20) NOT NULL,
  `CODE_SYSTEM_URI` varchar(255) NOT NULL,
  `RES_ID` bigint(20) DEFAULT NULL,
  `CURRENT_VERSION_PID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_CS_CODESYSTEM` (`CODE_SYSTEM_URI`),
  KEY `FKqod2rr40icfwrdjccl0pl0dn4` (`CURRENT_VERSION_PID`),
  KEY `FKlhtq2eln4v1sx81xhj50xhdb1` (`RES_ID`),
  CONSTRAINT `FKlhtq2eln4v1sx81xhj50xhdb1` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`),
  CONSTRAINT `FKqod2rr40icfwrdjccl0pl0dn4` FOREIGN KEY (`CURRENT_VERSION_PID`) REFERENCES `TRM_CODESYSTEM_VER` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRM_CODESYSTEM`
--

LOCK TABLES `TRM_CODESYSTEM` WRITE;
/*!40000 ALTER TABLE `TRM_CODESYSTEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRM_CODESYSTEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRM_CODESYSTEM_VER`
--

DROP TABLE IF EXISTS `TRM_CODESYSTEM_VER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRM_CODESYSTEM_VER` (
  `PID` bigint(20) NOT NULL,
  `RES_VERSION_ID` bigint(20) NOT NULL,
  `RES_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_CSV_RESOURCEPID_AND_VER` (`RES_ID`,`RES_VERSION_ID`),
  CONSTRAINT `FK_CODESYSVER_RES_ID` FOREIGN KEY (`RES_ID`) REFERENCES `HFJ_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRM_CODESYSTEM_VER`
--

LOCK TABLES `TRM_CODESYSTEM_VER` WRITE;
/*!40000 ALTER TABLE `TRM_CODESYSTEM_VER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRM_CODESYSTEM_VER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRM_CONCEPT`
--

DROP TABLE IF EXISTS `TRM_CONCEPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRM_CONCEPT` (
  `PID` bigint(20) NOT NULL,
  `CODE` varchar(100) NOT NULL,
  `CODESYSTEM_PID` bigint(20) DEFAULT NULL,
  `DISPLAY` varchar(400) DEFAULT NULL,
  `INDEX_STATUS` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_CONCEPT_CS_CODE` (`CODESYSTEM_PID`,`CODE`),
  KEY `IDX_CONCEPT_INDEXSTATUS` (`INDEX_STATUS`),
  CONSTRAINT `FK_CONCEPT_PID_CS_PID` FOREIGN KEY (`CODESYSTEM_PID`) REFERENCES `TRM_CODESYSTEM_VER` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRM_CONCEPT`
--

LOCK TABLES `TRM_CONCEPT` WRITE;
/*!40000 ALTER TABLE `TRM_CONCEPT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRM_CONCEPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRM_CONCEPT_PC_LINK`
--

DROP TABLE IF EXISTS `TRM_CONCEPT_PC_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRM_CONCEPT_PC_LINK` (
  `PID` bigint(20) NOT NULL,
  `REL_TYPE` int(11) DEFAULT NULL,
  `CHILD_PID` bigint(20) NOT NULL,
  `CODESYSTEM_PID` bigint(20) NOT NULL,
  `PARENT_PID` bigint(20) NOT NULL,
  PRIMARY KEY (`PID`),
  KEY `FK_TERM_CONCEPTPC_CHILD` (`CHILD_PID`),
  KEY `FK_TERM_CONCEPTPC_CS` (`CODESYSTEM_PID`),
  KEY `FK_TERM_CONCEPTPC_PARENT` (`PARENT_PID`),
  CONSTRAINT `FK_TERM_CONCEPTPC_CHILD` FOREIGN KEY (`CHILD_PID`) REFERENCES `TRM_CONCEPT` (`PID`),
  CONSTRAINT `FK_TERM_CONCEPTPC_CS` FOREIGN KEY (`CODESYSTEM_PID`) REFERENCES `TRM_CODESYSTEM_VER` (`PID`),
  CONSTRAINT `FK_TERM_CONCEPTPC_PARENT` FOREIGN KEY (`PARENT_PID`) REFERENCES `TRM_CONCEPT` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRM_CONCEPT_PC_LINK`
--

LOCK TABLES `TRM_CONCEPT_PC_LINK` WRITE;
/*!40000 ALTER TABLE `TRM_CONCEPT_PC_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRM_CONCEPT_PC_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1),(1),(1),(1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-24 23:21:49
