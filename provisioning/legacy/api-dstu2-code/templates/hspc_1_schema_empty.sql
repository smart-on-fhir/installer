-- MySQL dump 10.13  Distrib 5.6.25, for osx10.8 (x86_64)
--
-- Host: localhost    Database: hspc_1_hspc
-- ------------------------------------------------------
-- Server version	5.6.25

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
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_FORCEDID` (`FORCED_ID`),
  KEY `FK1saewbugq02dh94ybn9xhklfa` (`RESOURCE_PID`),
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
  `TARGET_RESOURCE_ID` bigint(20) NOT NULL,
  `TARGET_RESOURCE_TYPE` varchar(30) NOT NULL DEFAULT '',
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
  UNIQUE KEY `IDX_RES_VER_ALL` (`RES_ID`,`RES_TYPE`,`RES_VER`),
  KEY `IDX_RES_VER_DATE` (`RES_UPDATED`),
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
  `TOTAL_COUNT` int(11) DEFAULT NULL,
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
-- Table structure for table `HFJ_SEARCH_RESULT`
--

DROP TABLE IF EXISTS `HFJ_SEARCH_RESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HFJ_SEARCH_RESULT` (
  `PID` bigint(20) NOT NULL,
  `RESOURCE_PID` bigint(20) NOT NULL,
  `SEARCH_PID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `FK_SEARCHRES_RES` (`RESOURCE_PID`),
  KEY `FK_SEARCHRES_SEARCH` (`SEARCH_PID`),
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
  KEY `IDX_SP_COORDS` (`RES_TYPE`,`SP_NAME`,`SP_LATITUDE`),
  KEY `FKc97mpk37okwu8qvtceg2nh9vn` (`RES_ID`),
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
  KEY `FK17s70oa59rm9n61k9thjqrsqm` (`RES_ID`),
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
  KEY `FKcltihnc5tgprj9bhpt7xi5otb` (`RES_ID`),
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
  KEY `FKn603wjjoi1a6asewxbbd78bi5` (`RES_ID`),
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
  KEY `FKsv6pu15m5yo9qqv2ne5c7cack` (`RES_ID`),
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
  KEY `FK7ulx3j1gg3v7maqrejgc7ybc4` (`RES_ID`),
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
  KEY `FKgxsreutymmfjuwdswv3y887do` (`RES_ID`),
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
-- Table structure for table `TRM_VALUESET`
--

DROP TABLE IF EXISTS `TRM_VALUESET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRM_VALUESET` (
  `PID` bigint(20) NOT NULL,
  `VS_URI` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `IDX_VS_URI` (`VS_URI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRM_VALUESET`
--

LOCK TABLES `TRM_VALUESET` WRITE;
/*!40000 ALTER TABLE `TRM_VALUESET` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRM_VALUESET` ENABLE KEYS */;
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
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1);
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

-- Dump completed on 2016-11-15  0:19:55
