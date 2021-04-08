-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ampache
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_list`
--

DROP TABLE IF EXISTS `access_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `start` varbinary(255) NOT NULL,
  `end` varbinary(255) NOT NULL,
  `level` smallint(3) unsigned NOT NULL DEFAULT '5',
  `type` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `start` (`start`),
  KEY `end` (`end`),
  KEY `level` (`level`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_list`
--

LOCK TABLES `access_list` WRITE;
/*!40000 ALTER TABLE `access_list` DISABLE KEYS */;
INSERT INTO `access_list` VALUES (1,'DEFAULTv4','\0\0\0\0','ÿÿÿÿ',75,'interface',-1,1),(2,'DEFAULTv4','\0\0\0\0','ÿÿÿÿ',75,'stream',-1,1),(3,'DEFAULTv4','\0\0\0\0','ÿÿÿÿ',75,'rpc',-1,1),(4,'DEFAULTv6','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','ÿÿÿÿÿÿÿÿ',75,'interface',-1,1),(5,'DEFAULTv6','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','ÿÿÿÿÿÿÿÿ',75,'stream',-1,1),(6,'DEFAULTv6','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','ÿÿÿÿÿÿÿÿ',75,'rpc',-1,1);
/*!40000 ALTER TABLE `access_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prefix` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(4) unsigned NOT NULL DEFAULT '1984',
  `disk` smallint(5) unsigned DEFAULT NULL,
  `mbid_group` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `release_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `album_artist` int(11) unsigned DEFAULT NULL,
  `original_year` int(4) DEFAULT NULL,
  `barcode` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `catalog_number` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `time` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `year` (`year`),
  KEY `disk` (`disk`),
  FULLTEXT KEY `name_2` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prefix` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(1369) CHARACTER SET utf8 DEFAULT NULL,
  `summary` text CHARACTER SET utf8,
  `placeformed` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `yearformed` int(4) DEFAULT NULL,
  `last_update` int(11) unsigned NOT NULL DEFAULT '0',
  `user` int(11) DEFAULT NULL,
  `manual_update` smallint(1) DEFAULT '0',
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  FULLTEXT KEY `name_2` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmark` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `object_type` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `creation_date` int(11) unsigned NOT NULL DEFAULT '0',
  `update_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broadcast`
--

DROP TABLE IF EXISTS `broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broadcast` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `is_private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `song` int(11) unsigned NOT NULL DEFAULT '0',
  `started` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listeners` int(11) unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast`
--

LOCK TABLES `broadcast` WRITE;
/*!40000 ALTER TABLE `broadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_object_count`
--

DROP TABLE IF EXISTS `cache_object_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_object_count` (
  `object_id` int(11) unsigned NOT NULL,
  `object_type` enum('album','artist','song','playlist','genre','catalog','live_stream','video','podcast_episode') CHARACTER SET utf8 NOT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `threshold` int(11) unsigned NOT NULL DEFAULT '0',
  `count_type` varchar(16) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`object_id`,`object_type`,`threshold`,`count_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_object_count`
--

LOCK TABLES `cache_object_count` WRITE;
/*!40000 ALTER TABLE `cache_object_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_object_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_object_count_run`
--

DROP TABLE IF EXISTS `cache_object_count_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_object_count_run` (
  `object_id` int(11) unsigned NOT NULL,
  `object_type` enum('album','artist','song','playlist','genre','catalog','live_stream','video','podcast_episode') CHARACTER SET utf8 NOT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `threshold` int(11) unsigned NOT NULL DEFAULT '0',
  `count_type` varchar(16) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`object_id`,`object_type`,`threshold`,`count_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_object_count_run`
--

LOCK TABLES `cache_object_count_run` WRITE;
/*!40000 ALTER TABLE `cache_object_count_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_object_count_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `catalog_type` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `last_update` int(11) unsigned NOT NULL DEFAULT '0',
  `last_clean` int(11) unsigned DEFAULT NULL,
  `last_add` int(11) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `rename_pattern` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_pattern` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gather_types` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'local_fs','local',0,NULL,1617902522,1,'%T - %t','%a/%A','music');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_local`
--

DROP TABLE IF EXISTS `catalog_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_local` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `catalog_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_local`
--

LOCK TABLES `catalog_local` WRITE;
/*!40000 ALTER TABLE `catalog_local` DISABLE KEYS */;
INSERT INTO `catalog_local` VALUES (1,'/ampache/music',1);
/*!40000 ALTER TABLE `catalog_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_remote`
--

DROP TABLE IF EXISTS `catalog_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_remote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `catalog_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_remote`
--

LOCK TABLES `catalog_remote` WRITE;
/*!40000 ALTER TABLE `catalog_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `interface` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `port` int(11) unsigned NOT NULL DEFAULT '0',
  `fixed_endpoint` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `is_private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `random` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `loop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_password` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `max_listeners` int(11) unsigned NOT NULL DEFAULT '0',
  `peak_listeners` int(11) unsigned NOT NULL DEFAULT '0',
  `listeners` int(11) unsigned NOT NULL DEFAULT '0',
  `connections` int(11) unsigned NOT NULL DEFAULT '0',
  `stream_type` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `bitrate` int(11) unsigned NOT NULL DEFAULT '128',
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clip`
--

DROP TABLE IF EXISTS `clip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clip` (
  `id` int(11) unsigned NOT NULL,
  `artist` int(11) DEFAULT NULL,
  `song` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clip`
--

LOCK TABLES `clip` WRITE;
/*!40000 ALTER TABLE `clip` DISABLE KEYS */;
/*!40000 ALTER TABLE `clip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daap_session`
--

DROP TABLE IF EXISTS `daap_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daap_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creationdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daap_session`
--

LOCK TABLES `daap_session` WRITE;
/*!40000 ALTER TABLE `daap_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `daap_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `democratic`
--

DROP TABLE IF EXISTS `democratic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `democratic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `cooldown` int(11) unsigned DEFAULT NULL,
  `level` tinyint(4) unsigned NOT NULL DEFAULT '25',
  `user` int(11) NOT NULL,
  `primary` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `base_playlist` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `primary_2` (`primary`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `democratic`
--

LOCK TABLES `democratic` WRITE;
/*!40000 ALTER TABLE `democratic` DISABLE KEYS */;
/*!40000 ALTER TABLE `democratic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` mediumblob,
  `width` int(4) unsigned DEFAULT '0',
  `height` int(4) unsigned DEFAULT '0',
  `mime` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `size` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `object_type` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `kind` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_type` (`object_type`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_history`
--

DROP TABLE IF EXISTS `ip_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `ip` varbinary(255) DEFAULT NULL,
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `agent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`user`),
  KEY `date` (`date`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_history`
--

LOCK TABLES `ip_history` WRITE;
/*!40000 ALTER TABLE `ip_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `summary` text CHARACTER SET utf8,
  `address` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) unsigned DEFAULT NULL,
  `creation_date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label_asso`
--

DROP TABLE IF EXISTS `label_asso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_asso` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` int(11) unsigned NOT NULL,
  `artist` int(11) unsigned NOT NULL,
  `creation_date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_asso`
--

LOCK TABLES `label_asso` WRITE;
/*!40000 ALTER TABLE `label_asso` DISABLE KEYS */;
/*!40000 ALTER TABLE `label_asso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `external_link` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES (1,'0 - default',NULL,''),(2,'CC BY',NULL,'https://creativecommons.org/licenses/by/3.0/'),(3,'CC BY NC',NULL,'https://creativecommons.org/licenses/by-nc/3.0/'),(4,'CC BY NC ND',NULL,'https://creativecommons.org/licenses/by-nc-nd/3.0/'),(5,'CC BY NC SA',NULL,'https://creativecommons.org/licenses/by-nc-sa/3.0/'),(6,'CC BY ND',NULL,'https://creativecommons.org/licenses/by-nd/3.0/'),(7,'CC BY SA',NULL,'https://creativecommons.org/licenses/by-sa/3.0/'),(8,'Licence Art Libre',NULL,'http://artlibre.org/licence/lal/'),(9,'Yellow OpenMusic',NULL,'http://openmusic.linuxtag.org/yellow.html'),(10,'Green OpenMusic',NULL,'http://openmusic.linuxtag.org/green.html'),(11,'Gnu GPL Art',NULL,'http://gnuart.org/english/gnugpl.html'),(12,'WTFPL',NULL,'https://en.wikipedia.org/wiki/WTFPL'),(13,'FMPL',NULL,'http://www.fmpl.org/fmpl.html'),(14,'C Reaction',NULL,'http://morne.free.fr/Necktar7/creaction.htm');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_stream`
--

DROP TABLE IF EXISTS `live_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_stream` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `site_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `genre` int(11) unsigned NOT NULL DEFAULT '0',
  `catalog` int(11) unsigned NOT NULL DEFAULT '0',
  `codec` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog` (`catalog`),
  KEY `genre` (`genre`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_stream`
--

LOCK TABLES `live_stream` WRITE;
/*!40000 ALTER TABLE `live_stream` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localplay_httpq`
--

DROP TABLE IF EXISTS `localplay_httpq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localplay_httpq` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `host` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `port` int(11) unsigned NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `access` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localplay_httpq`
--

LOCK TABLES `localplay_httpq` WRITE;
/*!40000 ALTER TABLE `localplay_httpq` DISABLE KEYS */;
/*!40000 ALTER TABLE `localplay_httpq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localplay_mpd`
--

DROP TABLE IF EXISTS `localplay_mpd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localplay_mpd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `host` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `port` int(11) unsigned NOT NULL DEFAULT '6600',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `access` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localplay_mpd`
--

LOCK TABLES `localplay_mpd` WRITE;
/*!40000 ALTER TABLE `localplay_mpd` DISABLE KEYS */;
/*!40000 ALTER TABLE `localplay_mpd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL,
  `field` int(11) unsigned NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field` (`field`),
  KEY `object_id` (`object_id`),
  KEY `type` (`type`),
  KEY `objecttype` (`object_id`,`type`),
  KEY `objectfield` (`object_id`,`field`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata`
--

LOCK TABLES `metadata` WRITE;
/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_field`
--

DROP TABLE IF EXISTS `metadata_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_field`
--

LOCK TABLES `metadata_field` WRITE;
/*!40000 ALTER TABLE `metadata_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) unsigned NOT NULL,
  `original_name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `summary` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(11) unsigned DEFAULT NULL,
  `prefix` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `now_playing`
--

DROP TABLE IF EXISTS `now_playing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `now_playing` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `object_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) NOT NULL,
  `expire` int(11) unsigned NOT NULL DEFAULT '0',
  `insertion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `now_playing`
--

LOCK TABLES `now_playing` WRITE;
/*!40000 ALTER TABLE `now_playing` DISABLE KEYS */;
/*!40000 ALTER TABLE `now_playing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_count`
--

DROP TABLE IF EXISTS `object_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_count` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_type` enum('album','artist','song','playlist','genre','catalog','live_stream','video','podcast_episode') CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `geo_latitude` decimal(10,6) DEFAULT NULL,
  `geo_longitude` decimal(10,6) DEFAULT NULL,
  `geo_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `count_type` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_type` (`object_type`),
  KEY `object_id` (`object_id`),
  KEY `userid` (`user`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_count`
--

LOCK TABLES `object_count` WRITE;
/*!40000 ALTER TABLE `object_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_video`
--

DROP TABLE IF EXISTS `personal_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_video` (
  `id` int(11) unsigned NOT NULL,
  `location` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `summary` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_video`
--

LOCK TABLES `personal_video` WRITE;
/*!40000 ALTER TABLE `personal_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_control`
--

DROP TABLE IF EXISTS `player_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_control` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned NOT NULL,
  `cmd` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `send_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_control`
--

LOCK TABLES `player_control` WRITE;
/*!40000 ALTER TABLE `player_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `type` enum('private','public') CHARACTER SET utf8 DEFAULT NULL,
  `date` int(11) unsigned NOT NULL,
  `last_update` int(11) unsigned NOT NULL DEFAULT '0',
  `last_duration` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_data`
--

DROP TABLE IF EXISTS `playlist_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `playlist` int(11) unsigned NOT NULL DEFAULT '0',
  `object_id` int(11) unsigned DEFAULT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `track` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `playlist` (`playlist`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_data`
--

LOCK TABLES `playlist_data` WRITE;
/*!40000 ALTER TABLE `playlist_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `podcast`
--

DROP TABLE IF EXISTS `podcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `podcast` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feed` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `catalog` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `language` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `generator` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `lastbuilddate` int(11) unsigned NOT NULL DEFAULT '0',
  `lastsync` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podcast`
--

LOCK TABLES `podcast` WRITE;
/*!40000 ALTER TABLE `podcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `podcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `podcast_episode`
--

DROP TABLE IF EXISTS `podcast_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `podcast_episode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `guid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `podcast` int(11) NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `file` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `source` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `played` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pubdate` int(11) unsigned NOT NULL,
  `addition_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podcast_episode`
--

LOCK TABLES `podcast_episode` WRITE;
/*!40000 ALTER TABLE `podcast_episode` DISABLE KEYS */;
/*!40000 ALTER TABLE `podcast_episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preference` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `level` int(11) unsigned NOT NULL DEFAULT '100',
  `type` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `catagory` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `subcatagory` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catagory` (`catagory`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference`
--

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
INSERT INTO `preference` VALUES (1,'download','1','Allow Downloads',100,'boolean','options','feature'),(4,'popular_threshold','10','Popular Threshold',25,'integer','interface','query'),(19,'transcode_bitrate','64','Transcode Bitrate',25,'string','streaming','transcoding'),(22,'site_title','Ampache :: For the Love of Music','Website Title',100,'string','interface','custom'),(23,'lock_songs','0','Lock Songs',100,'boolean','system',NULL),(24,'force_http_play','0','Force HTTP playback regardless of port',100,'boolean','system',NULL),(41,'localplay_controller','0','Localplay Type',100,'special','options','localplay'),(29,'play_type','web_player','Playback Type',25,'special','streaming',NULL),(31,'lang','en_US','Language',100,'special','interface',NULL),(32,'playlist_type','m3u','Playlist Type',100,'special','playlist',NULL),(33,'theme_name','reborn','Theme',0,'special','interface','theme'),(51,'offset_limit','50','Offset Limit',5,'integer','interface','query'),(40,'localplay_level','0','Localplay Access',100,'special','options','localplay'),(44,'allow_stream_playback','1','Allow Streaming',100,'boolean','options','feature'),(45,'allow_democratic_playback','0','Allow Democratic Play',100,'boolean','options','feature'),(46,'allow_localplay_playback','0','Allow Localplay Play',100,'boolean','options','localplay'),(47,'stats_threshold','7','Statistics Day Threshold',75,'integer','interface','query'),(52,'rate_limit','8192','Rate Limit',100,'integer','streaming','transcoding'),(53,'playlist_method','default','Playlist Method',5,'string','playlist',NULL),(55,'transcode','default','Allow Transcoding',25,'string','streaming','transcoding'),(69,'show_lyrics','0','Show lyrics',0,'boolean','interface','player'),(70,'mpd_active','0','MPD Active Instance',25,'integer','internal','mpd'),(71,'httpq_active','0','httpQ Active Instance',25,'integer','internal','httpq'),(77,'lastfm_grant_link','','Last.FM Grant URL',25,'string','internal','lastfm'),(78,'lastfm_challenge','','Last.FM Submit Challenge',25,'string','internal','lastfm'),(102,'share','0','Allow Share',100,'boolean','options','feature'),(123,'ajax_load','1','Ajax page load',25,'boolean','interface',NULL),(82,'now_playing_per_user','1','Now Playing filtered per user',50,'boolean','interface','home'),(83,'album_sort','0','Album - Default sort',25,'string','interface','library'),(84,'show_played_times','0','Show # played',25,'string','interface','library'),(85,'song_page_title','1','Show current song in Web Player page title',25,'boolean','interface','player'),(86,'subsonic_backend','1','Use Subsonic backend',100,'boolean','system','backend'),(88,'webplayer_flash','1','Authorize Flash Web Player',25,'boolean','streaming','player'),(89,'webplayer_html5','1','Authorize HTML5 Web Player',25,'boolean','streaming','player'),(90,'allow_personal_info_now','1','Share Now Playing information',25,'boolean','interface','privacy'),(91,'allow_personal_info_recent','1','Share Recently Played information',25,'boolean','interface','privacy'),(92,'allow_personal_info_time','1','Share Recently Played information - Allow access to streaming date/time',25,'boolean','interface','privacy'),(93,'allow_personal_info_agent','1','Share Recently Played information - Allow access to streaming agent',25,'boolean','interface','privacy'),(94,'ui_fixed','0','Fix header position on compatible themes',25,'boolean','interface','theme'),(95,'autoupdate','1','Check for Ampache updates automatically',25,'boolean','system','update'),(96,'autoupdate_lastcheck','','AutoUpdate last check time',25,'string','internal','update'),(97,'autoupdate_lastversion','','AutoUpdate last version from last check',25,'string','internal','update'),(98,'autoupdate_lastversion_new','','AutoUpdate last version from last check is newer',25,'boolean','internal','update'),(99,'webplayer_confirmclose','0','Confirmation when closing current playing window',25,'boolean','interface','player'),(100,'webplayer_pausetabs','1','Auto-pause between tabs',25,'boolean','interface','player'),(101,'stream_beautiful_url','1','Enable URL Rewriting',100,'boolean','streaming',NULL),(103,'share_expire','7','Share links default expiration days (0=never)',100,'integer','system','share'),(104,'slideshow_time','0','Artist slideshow inactivity time',25,'integer','interface','player'),(105,'broadcast_by_default','0','Broadcast web player by default',25,'boolean','streaming','player'),(108,'album_group','1','Album - Group multiple disks',25,'boolean','interface','library'),(109,'topmenu','0','Top menu',25,'boolean','interface','theme'),(110,'demo_clear_sessions','0','Democratic - Clear votes for expired user sessions',25,'boolean','playlist',NULL),(111,'show_donate','1','Show donate button in footer',25,'boolean','interface',NULL),(112,'upload_catalog','-1','Destination catalog',75,'integer','system','upload'),(113,'allow_upload','0','Allow user uploads',75,'boolean','system','upload'),(114,'upload_subdir','1','Create a subdirectory per user',75,'boolean','system','upload'),(154,'show_skipped_times','0','Show # skipped',25,'boolean','interface','library'),(116,'upload_script','','Post-upload script (current directory = upload target directory)',75,'string','system','upload'),(117,'upload_allow_edit','1','Allow users to edit uploaded songs',75,'boolean','system','upload'),(118,'daap_backend','0','Use DAAP backend',100,'boolean','system','backend'),(119,'daap_pass','','DAAP backend password',100,'string','system','backend'),(120,'upnp_backend','1','Use UPnP backend',100,'boolean','system','backend'),(121,'allow_video','0','Allow Video Features',75,'integer','options','feature'),(122,'album_release_type','1','Album - Group per release type',25,'boolean','interface','library'),(124,'direct_play_limit','0','Limit direct play to maximum media count',25,'integer','interface','player'),(125,'home_moment_albums','1','Show Albums of the Moment',25,'integer','interface','home'),(126,'home_moment_videos','0','Show Videos of the Moment',25,'integer','interface','home'),(127,'home_recently_played','1','Show Recently Played',25,'integer','interface','home'),(128,'home_now_playing','1','Show Now Playing',25,'integer','interface','home'),(129,'custom_logo','','Custom URL - Logo',25,'string','interface','custom'),(130,'album_release_type_sort','album,ep,live,single','Album - Group per release type sort',25,'string','interface','library'),(131,'browser_notify','1','Web Player browser notifications',25,'integer','interface','notification'),(132,'browser_notify_timeout','10','Web Player browser notifications timeout (seconds)',25,'integer','interface','notification'),(133,'geolocation','0','Allow Geolocation',25,'integer','options','feature'),(134,'webplayer_aurora','1','Authorize JavaScript decoder (Aurora.js) in Web Player',25,'boolean','streaming','player'),(135,'upload_allow_remove','1','Allow users to remove uploaded songs',75,'boolean','system','upload'),(136,'custom_login_logo','','Custom URL - Login page logo',75,'string','interface','custom'),(137,'custom_favicon','','Custom URL - Favicon',75,'string','interface','custom'),(138,'custom_text_footer','','Custom text footer',75,'string','interface','custom'),(139,'webdav_backend','0','Use WebDAV backend',100,'boolean','system','backend'),(140,'notify_email','0','Allow E-mail notifications',25,'boolean','options',NULL),(141,'theme_color','dark','Theme color',0,'special','interface','theme'),(142,'disabled_custom_metadata_fields','','Custom metadata - Disable these fields',100,'string','system','metadata'),(143,'disabled_custom_metadata_fields_input','','Custom metadata - Define field list',100,'string','system','metadata'),(144,'podcast_keep','0','# latest episodes to keep',100,'integer','system','podcast'),(145,'podcast_new_download','0','# episodes to download when new episodes are available',100,'integer','system','podcast'),(146,'libitem_contextmenu','1','Library item context menu',0,'boolean','interface','library'),(147,'upload_catalog_pattern','0','Rename uploaded file according to catalog pattern',100,'boolean','system','upload'),(148,'catalog_check_duplicate','0','Check library item at import time and don\'t import duplicates',100,'boolean','system','catalog'),(149,'browse_filter','0','Show filter box on browse',25,'boolean','interface','library'),(150,'sidebar_light','0','Light sidebar by default',25,'boolean','interface','theme'),(151,'custom_blankalbum','','Custom blank album default image',75,'string','interface','custom'),(152,'custom_blankmovie','','Custom blank video default image',75,'string','interface','custom'),(153,'libitem_browse_alpha','','Alphabet browsing by default for following library items (album,artist,...)',75,'string','interface','library'),(155,'custom_datetime','','Custom datetime',25,'string','interface','custom'),(156,'cron_cache','0','Cache computed SQL data (eg. media hits stats) using a cron',25,'boolean','system','catalog'),(157,'unique_playlist','0','Only add unique items to playlists',25,'boolean','playlist',NULL),(158,'of_the_moment','6','Set the amount of items Album/Video of the Moment will display',25,'integer','interface','home'),(159,'custom_login_background','','Custom URL - Login page background',75,'string','interface','custom');
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `object_type` enum('artist','album','song','stream','video','playlist','tvshow','tvshow_season','podcast','podcast_episode') CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `rating` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_rating` (`user`,`object_type`,`object_id`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation`
--

DROP TABLE IF EXISTS `recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `last_update` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation`
--

LOCK TABLES `recommendation` WRITE;
/*!40000 ALTER TABLE `recommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation_item`
--

DROP TABLE IF EXISTS `recommendation_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendation_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recommendation` int(11) unsigned NOT NULL,
  `recommendation_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `rel` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(1369) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation_item`
--

LOCK TABLES `recommendation_item` WRITE;
/*!40000 ALTER TABLE `recommendation_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendation_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `type` enum('private','public') CHARACTER SET utf8 DEFAULT NULL,
  `rules` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `logic_operator` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `random` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `limit` int(11) unsigned NOT NULL DEFAULT '0',
  `last_count` int(11) DEFAULT NULL,
  `last_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES (5,-1,'public','[[\"artistrating\",\"equal\",\"5\",null]]','Artist 5*','AND',0,0,NULL,NULL),(6,-1,'public','[[\"artistrating\",\"equal\",\"4\",null]]','Artist 4*','AND',0,0,NULL,NULL),(7,-1,'public','[[\"artistrating\",\"equal\",\"3\",null]]','Artist 3*','AND',0,0,NULL,NULL),(8,-1,'public','[[\"artistrating\",\"equal\",\"2\",null]]','Artist 2*','AND',0,0,NULL,NULL),(9,-1,'public','[[\"artistrating\",\"equal\",\"1\",null]]','Artist 1*','AND',0,0,NULL,NULL),(10,-1,'public','[[\"albumrating\",\"equal\",\"5\",null]]','Album 5*','AND',0,0,NULL,NULL),(11,-1,'public','[[\"albumrating\",\"equal\",\"4\",null]]','Album 4*','AND',0,0,NULL,NULL),(12,-1,'public','[[\"albumrating\",\"equal\",\"3\",null]]','Album 3*','AND',0,0,NULL,NULL),(13,-1,'public','[[\"albumrating\",\"equal\",\"2\",null]]','Album 2*','AND',0,0,NULL,NULL),(14,-1,'public','[[\"albumrating\",\"equal\",\"1\",null]]','Album 1*','AND',0,0,NULL,NULL),(15,-1,'public','[[\"myrating\",\"equal\",\"5\",null]]','Song 5*','AND',0,0,NULL,NULL),(16,-1,'public','[[\"myrating\",\"equal\",\"4\",null]]','Song 4*','AND',0,0,NULL,NULL),(17,-1,'public','[[\"myrating\",\"equal\",\"3\",null]]','Song 3*','AND',0,0,NULL,NULL),(18,-1,'public','[[\"myrating\",\"equal\",\"2\",null]]','Song 2*','AND',0,0,NULL,NULL),(19,-1,'public','[[\"myrating\",\"equal\",\"1\",null]]','Song 1*','AND',0,0,NULL,NULL);
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` varchar(256) CHARACTER SET utf8 NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `expire` int(11) unsigned NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(255) DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `geo_latitude` decimal(10,6) DEFAULT NULL,
  `geo_longitude` decimal(10,6) DEFAULT NULL,
  `geo_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expire` (`expire`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('loqcd2phvnpevlfjchufm4ns0e','admin',1617906213,'userdata|a:5:{s:7:\"success\";b:1;s:4:\"type\";s:5:\"mysql\";s:8:\"username\";s:5:\"admin\";s:11:\"preferences\";a:101:{s:8:\"download\";s:1:\"1\";s:17:\"popular_threshold\";s:2:\"10\";s:17:\"transcode_bitrate\";s:2:\"32\";s:10:\"site_title\";s:32:\"Ampache :: For the Love of Music\";s:10:\"lock_songs\";N;s:15:\"force_http_play\";N;s:20:\"localplay_controller\";s:3:\"mpd\";s:9:\"play_type\";s:10:\"web_player\";s:4:\"lang\";s:5:\"en_US\";s:13:\"playlist_type\";s:3:\"m3u\";s:10:\"theme_name\";s:6:\"reborn\";s:12:\"offset_limit\";s:2:\"50\";s:15:\"localplay_level\";s:3:\"100\";s:21:\"allow_stream_playback\";s:1:\"1\";s:25:\"allow_democratic_playback\";s:1:\"1\";s:24:\"allow_localplay_playback\";s:1:\"1\";s:15:\"stats_threshold\";s:1:\"7\";s:10:\"rate_limit\";s:4:\"8192\";s:15:\"playlist_method\";s:7:\"default\";s:9:\"transcode\";s:7:\"default\";s:11:\"show_lyrics\";s:1:\"0\";s:10:\"mpd_active\";s:1:\"0\";s:12:\"httpq_active\";s:1:\"0\";s:17:\"lastfm_grant_link\";s:0:\"\";s:16:\"lastfm_challenge\";s:0:\"\";s:5:\"share\";s:1:\"0\";s:9:\"ajax_load\";s:1:\"1\";s:20:\"now_playing_per_user\";s:1:\"1\";s:10:\"album_sort\";s:1:\"0\";s:17:\"show_played_times\";s:1:\"0\";s:15:\"song_page_title\";s:1:\"1\";s:16:\"subsonic_backend\";s:1:\"1\";s:15:\"webplayer_flash\";s:1:\"1\";s:15:\"webplayer_html5\";s:1:\"1\";s:23:\"allow_personal_info_now\";s:1:\"1\";s:26:\"allow_personal_info_recent\";s:1:\"1\";s:24:\"allow_personal_info_time\";s:1:\"1\";s:25:\"allow_personal_info_agent\";s:1:\"1\";s:8:\"ui_fixed\";s:1:\"0\";s:10:\"autoupdate\";s:1:\"1\";s:20:\"autoupdate_lastcheck\";s:10:\"1617902366\";s:22:\"autoupdate_lastversion\";s:5:\"4.4.1\";s:26:\"autoupdate_lastversion_new\";s:0:\"\";s:22:\"webplayer_confirmclose\";s:1:\"0\";s:19:\"webplayer_pausetabs\";s:1:\"1\";s:20:\"stream_beautiful_url\";s:1:\"1\";s:12:\"share_expire\";s:1:\"7\";s:14:\"slideshow_time\";s:1:\"0\";s:20:\"broadcast_by_default\";s:1:\"0\";s:11:\"album_group\";s:1:\"1\";s:7:\"topmenu\";s:1:\"0\";s:19:\"demo_clear_sessions\";s:1:\"0\";s:11:\"show_donate\";s:1:\"1\";s:14:\"upload_catalog\";s:2:\"-1\";s:12:\"allow_upload\";N;s:13:\"upload_subdir\";s:1:\"1\";s:18:\"show_skipped_times\";s:1:\"0\";s:13:\"upload_script\";N;s:17:\"upload_allow_edit\";s:1:\"1\";s:12:\"daap_backend\";N;s:9:\"daap_pass\";N;s:12:\"upnp_backend\";s:1:\"1\";s:11:\"allow_video\";s:1:\"0\";s:18:\"album_release_type\";s:1:\"1\";s:17:\"direct_play_limit\";s:1:\"0\";s:18:\"home_moment_albums\";s:1:\"1\";s:18:\"home_moment_videos\";s:1:\"1\";s:20:\"home_recently_played\";s:1:\"1\";s:16:\"home_now_playing\";s:1:\"1\";s:11:\"custom_logo\";s:0:\"\";s:23:\"album_release_type_sort\";s:20:\"album,ep,live,single\";s:14:\"browser_notify\";s:1:\"1\";s:22:\"browser_notify_timeout\";s:2:\"10\";s:11:\"geolocation\";s:1:\"0\";s:16:\"webplayer_aurora\";s:1:\"1\";s:19:\"upload_allow_remove\";s:1:\"1\";s:17:\"custom_login_logo\";N;s:14:\"custom_favicon\";s:0:\"\";s:18:\"custom_text_footer\";s:0:\"\";s:14:\"webdav_backend\";N;s:12:\"notify_email\";s:1:\"0\";s:11:\"theme_color\";s:4:\"dark\";s:31:\"disabled_custom_metadata_fields\";N;s:37:\"disabled_custom_metadata_fields_input\";N;s:12:\"podcast_keep\";N;s:20:\"podcast_new_download\";N;s:19:\"libitem_contextmenu\";s:1:\"1\";s:22:\"upload_catalog_pattern\";N;s:23:\"catalog_check_duplicate\";N;s:13:\"browse_filter\";s:1:\"0\";s:13:\"sidebar_light\";s:1:\"0\";s:17:\"custom_blankalbum\";s:0:\"\";s:17:\"custom_blankmovie\";s:0:\"\";s:20:\"libitem_browse_alpha\";s:0:\"\";s:15:\"custom_datetime\";s:0:\"\";s:10:\"cron_cache\";N;s:15:\"unique_playlist\";s:0:\"\";s:13:\"of_the_moment\";s:0:\"\";s:23:\"custom_login_background\";N;s:10:\"theme_path\";s:14:\"/themes/reborn\";s:14:\"theme_css_base\";a:1:{i:0;a:2:{i:0;s:11:\"default.css\";i:1;s:6:\"screen\";}}}s:3:\"uid\";i:1;}login|b:0;art_enabled|b:1;mobile|b:0;state|a:1:{s:11:\"sidebar_tab\";s:4:\"home\";}catalog|i:0;forms|a:1:{s:32:\"a137f19505046e49bb5e78470331a36f\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1617906121;}}','172.25.0.1','mysql','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36',NULL,NULL,NULL),('042453e2f613070943fe640cc9518273','',1617909567,' ','172.25.0.1','stream','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36',NULL,NULL,NULL),('2938b86e8190e06bbd8e99fa80181b3c','',1617909575,' ','172.25.0.1','stream','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36',NULL,NULL,NULL),('faf004de711933b1bed2dc39f431ce5b','',1617909721,' ','172.25.0.1','stream','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36',NULL,NULL,NULL),('61fe008bbf2a5b44c714ea2345a51d2c','',1617909723,' ','172.25.0.1','stream','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36',NULL,NULL,NULL);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_remember`
--

DROP TABLE IF EXISTS `session_remember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_remember` (
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `token` varchar(32) CHARACTER SET utf8 NOT NULL,
  `expire` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`,`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_remember`
--

LOCK TABLES `session_remember` WRITE;
/*!40000 ALTER TABLE `session_remember` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_remember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_stream`
--

DROP TABLE IF EXISTS `session_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_stream` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `user` int(11) unsigned NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `expire` int(11) unsigned NOT NULL,
  `ip` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_stream`
--

LOCK TABLES `session_stream` WRITE;
/*!40000 ALTER TABLE `session_stream` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share`
--

DROP TABLE IF EXISTS `share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `allow_stream` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_download` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `expire_days` int(4) unsigned NOT NULL DEFAULT '0',
  `max_counter` int(4) unsigned NOT NULL DEFAULT '0',
  `secret` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `counter` int(4) unsigned NOT NULL DEFAULT '0',
  `creation_date` int(11) unsigned NOT NULL DEFAULT '0',
  `lastvisit_date` int(11) unsigned NOT NULL DEFAULT '0',
  `public_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share`
--

LOCK TABLES `share` WRITE;
/*!40000 ALTER TABLE `share` DISABLE KEYS */;
/*!40000 ALTER TABLE `share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `catalog` int(11) unsigned NOT NULL DEFAULT '0',
  `album` int(11) unsigned NOT NULL DEFAULT '0',
  `year` mediumint(4) unsigned NOT NULL DEFAULT '0',
  `artist` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bitrate` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rate` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mode` enum('abr','vbr','cbr') CHARACTER SET utf8 DEFAULT NULL,
  `size` int(11) unsigned NOT NULL DEFAULT '0',
  `time` smallint(5) unsigned NOT NULL DEFAULT '0',
  `track` smallint(6) DEFAULT NULL,
  `mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `played` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `update_time` int(11) unsigned DEFAULT '0',
  `addition_time` int(11) unsigned DEFAULT '0',
  `user_upload` int(11) DEFAULT NULL,
  `license` int(11) DEFAULT NULL,
  `composer` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `channels` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `album` (`album`),
  KEY `artist` (`artist`),
  KEY `file` (`file`(333)),
  KEY `update_time` (`update_time`),
  KEY `addition_time` (`addition_time`),
  KEY `catalog` (`catalog`),
  KEY `played` (`played`),
  KEY `enabled` (`enabled`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_data`
--

DROP TABLE IF EXISTS `song_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_data` (
  `song_id` int(11) unsigned NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `lyrics` text COLLATE utf8_unicode_ci,
  `label` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `language` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `waveform` mediumblob,
  `replaygain_track_gain` decimal(10,6) DEFAULT NULL,
  `replaygain_track_peak` decimal(10,6) DEFAULT NULL,
  `replaygain_album_gain` decimal(10,6) DEFAULT NULL,
  `replaygain_album_peak` decimal(10,6) DEFAULT NULL,
  `r128_track_gain` smallint(5) DEFAULT NULL,
  `r128_album_gain` smallint(5) DEFAULT NULL,
  UNIQUE KEY `song_id` (`song_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_data`
--

LOCK TABLES `song_data` WRITE;
/*!40000 ALTER TABLE `song_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_preview`
--

DROP TABLE IF EXISTS `song_preview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_preview` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `artist` int(11) DEFAULT NULL,
  `artist_mbid` varchar(1369) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `album_mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `disk` int(11) DEFAULT NULL,
  `track` int(11) DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_preview`
--

LOCK TABLES `song_preview` WRITE;
/*!40000 ALTER TABLE `song_preview` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_preview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_playlist`
--

DROP TABLE IF EXISTS `stream_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream_playlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `info_url` text COLLATE utf8_unicode_ci,
  `image_url` text COLLATE utf8_unicode_ci,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `album` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `time` smallint(5) DEFAULT NULL,
  `codec` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `track_num` smallint(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_playlist`
--

LOCK TABLES `stream_playlist` WRITE;
/*!40000 ALTER TABLE `stream_playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `name` (`name`),
  KEY `map_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_map`
--

DROP TABLE IF EXISTS `tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_map` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `object_type` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tag_map` (`object_id`,`object_type`,`user`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_map`
--

LOCK TABLES `tag_map` WRITE;
/*!40000 ALTER TABLE `tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_merge`
--

DROP TABLE IF EXISTS `tag_merge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_merge` (
  `tag_id` int(11) NOT NULL,
  `merged_to` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`merged_to`),
  KEY `merged_to` (`merged_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_merge`
--

LOCK TABLES `tag_merge` WRITE;
/*!40000 ALTER TABLE `tag_merge` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_merge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_browse`
--

DROP TABLE IF EXISTS `tmp_browse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_browse` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `sid` varchar(128) CHARACTER SET utf8 NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `object_data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`sid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_browse`
--

LOCK TABLES `tmp_browse` WRITE;
/*!40000 ALTER TABLE `tmp_browse` DISABLE KEYS */;
INSERT INTO `tmp_browse` VALUES (1,'loqcd2phvnpevlfjchufm4ns0e','{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}','[\"1\"]');
/*!40000 ALTER TABLE `tmp_browse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_playlist`
--

DROP TABLE IF EXISTS `tmp_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_playlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session` (`session`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_playlist`
--

LOCK TABLES `tmp_playlist` WRITE;
/*!40000 ALTER TABLE `tmp_playlist` DISABLE KEYS */;
INSERT INTO `tmp_playlist` VALUES (1,'loqcd2phvnpevlfjchufm4ns0e','user','song');
/*!40000 ALTER TABLE `tmp_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_playlist_data`
--

DROP TABLE IF EXISTS `tmp_playlist_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_playlist_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tmp_playlist` int(11) unsigned NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `track` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tmp_playlist` (`tmp_playlist`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_playlist_data`
--

LOCK TABLES `tmp_playlist_data` WRITE;
/*!40000 ALTER TABLE `tmp_playlist_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_playlist_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow`
--

DROP TABLE IF EXISTS `tvshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvshow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `summary` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(11) unsigned DEFAULT NULL,
  `prefix` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow`
--

LOCK TABLES `tvshow` WRITE;
/*!40000 ALTER TABLE `tvshow` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_episode`
--

DROP TABLE IF EXISTS `tvshow_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvshow_episode` (
  `id` int(11) unsigned NOT NULL,
  `original_name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `season` int(11) unsigned NOT NULL,
  `episode_number` int(11) unsigned NOT NULL,
  `summary` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_episode`
--

LOCK TABLES `tvshow_episode` WRITE;
/*!40000 ALTER TABLE `tvshow_episode` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvshow_episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_season`
--

DROP TABLE IF EXISTS `tvshow_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvshow_season` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `season_number` int(11) unsigned NOT NULL,
  `tvshow` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_season`
--

LOCK TABLES `tvshow_season` WRITE;
/*!40000 ALTER TABLE `tvshow_season` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvshow_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_info`
--

DROP TABLE IF EXISTS `update_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_info` (
  `key` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_info`
--

LOCK TABLES `update_info` WRITE;
/*!40000 ALTER TABLE `update_info` DISABLE KEYS */;
INSERT INTO `update_info` VALUES ('db_version','400023'),('Plugin_Last.FM','000005');
/*!40000 ALTER TABLE `update_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `apikey` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `access` tinyint(4) unsigned NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_seen` int(11) unsigned NOT NULL DEFAULT '0',
  `create_date` int(11) unsigned DEFAULT NULL,
  `validation` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `state` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `fullname_public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rsstoken` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','Administrator','',NULL,NULL,'598f658e488b0fffded89f11adaf923b71e6b51ccd8152db30911a4be0983a5e',100,0,1617902613,1617901942,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned NOT NULL,
  `action` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `activity_date` int(11) unsigned NOT NULL,
  `name_track` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name_artist` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name_album` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mbid_track` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mbid_artist` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mbid_album` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity`
--

LOCK TABLES `user_activity` WRITE;
/*!40000 ALTER TABLE `user_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_catalog`
--

DROP TABLE IF EXISTS `user_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_catalog` (
  `user` int(11) unsigned NOT NULL,
  `catalog` int(11) unsigned NOT NULL,
  `level` smallint(4) unsigned NOT NULL DEFAULT '5',
  KEY `user` (`user`),
  KEY `catalog` (`catalog`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_catalog`
--

LOCK TABLES `user_catalog` WRITE;
/*!40000 ALTER TABLE `user_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_flag`
--

DROP TABLE IF EXISTS `user_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_flag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_userflag` (`user`,`object_type`,`object_id`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_flag`
--

LOCK TABLES `user_flag` WRITE;
/*!40000 ALTER TABLE `user_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follower`
--

DROP TABLE IF EXISTS `user_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_follower` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned NOT NULL,
  `follow_user` int(11) unsigned NOT NULL,
  `follow_date` int(11) unsigned DEFAULT NULL,
  `creation_date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follower`
--

LOCK TABLES `user_follower` WRITE;
/*!40000 ALTER TABLE `user_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preference`
--

DROP TABLE IF EXISTS `user_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preference` (
  `user` int(11) NOT NULL,
  `preference` int(11) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  KEY `user` (`user`),
  KEY `preference` (`preference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preference`
--

LOCK TABLES `user_preference` WRITE;
/*!40000 ALTER TABLE `user_preference` DISABLE KEYS */;
INSERT INTO `user_preference` VALUES (-1,1,'1'),(-1,4,'10'),(-1,19,'32'),(-1,22,'Ampache :: For the Love of Music'),(-1,23,'0'),(-1,24,'0'),(-1,25,'80'),(-1,41,'mpd'),(-1,29,'web_player'),(-1,31,'en_US'),(-1,32,'m3u'),(-1,33,'reborn'),(-1,34,'27'),(-1,35,'27'),(-1,36,'27'),(-1,51,'50'),(-1,40,'100'),(-1,44,'1'),(-1,45,'1'),(-1,46,'1'),(-1,47,'7'),(-1,49,'1'),(-1,52,'8192'),(-1,53,'default'),(-1,55,'default'),(-1,57,''),(-1,69,'0'),(-1,70,'0'),(-1,71,'0'),(-1,72,'0'),(-1,77,''),(-1,78,''),(-1,114,'1'),(-1,113,'0'),(-1,112,'-1'),(-1,111,'1'),(-1,110,'0'),(-1,109,'0'),(-1,108,'1'),(-1,105,'0'),(-1,104,'0'),(-1,103,'7'),(-1,102,'0'),(-1,101,'1'),(-1,100,'1'),(-1,99,'0'),(-1,95,'1'),(-1,94,'0'),(-1,93,'1'),(-1,92,'1'),(-1,91,'1'),(-1,90,'1'),(-1,89,'1'),(-1,88,'1'),(-1,87,'0'),(-1,86,'1'),(-1,85,'1'),(-1,84,'0'),(-1,83,'0'),(-1,79,'50'),(-1,80,'50'),(-1,82,'1'),(-1,81,'1'),(-1,154,'0'),(-1,116,''),(-1,117,'1'),(-1,118,'0'),(-1,119,''),(-1,120,'1'),(-1,121,'0'),(-1,122,'1'),(-1,123,'1'),(-1,124,'0'),(-1,125,'1'),(-1,126,'1'),(-1,127,'1'),(-1,128,'1'),(-1,129,''),(-1,130,'album,ep,live,single'),(-1,131,'1'),(-1,132,'10'),(-1,133,'0'),(-1,134,'1'),(-1,135,'1'),(-1,136,''),(-1,137,''),(-1,138,''),(-1,139,'0'),(-1,140,'0'),(-1,141,'dark'),(-1,142,''),(-1,143,''),(-1,96,''),(-1,97,''),(-1,98,''),(-1,144,'0'),(-1,145,'0'),(-1,146,'1'),(-1,147,'0'),(-1,148,'0'),(-1,149,'0'),(-1,150,'0'),(-1,151,''),(-1,152,''),(-1,153,''),(-1,155,''),(-1,156,'0'),(-1,157,''),(-1,158,''),(-1,159,''),(1,1,'1'),(1,4,'10'),(1,19,'32'),(1,22,'Ampache :: For the Love of Music'),(1,41,'mpd'),(1,29,'web_player'),(1,31,'en_US'),(1,32,'m3u'),(1,33,'reborn'),(1,51,'50'),(1,40,'100'),(1,44,'1'),(1,45,'1'),(1,46,'1'),(1,47,'7'),(1,52,'8192'),(1,53,'default'),(1,55,'default'),(1,69,'0'),(1,70,'0'),(1,71,'0'),(1,77,''),(1,78,''),(1,102,'0'),(1,123,'1'),(1,82,'1'),(1,83,'0'),(1,84,'0'),(1,85,'1'),(1,88,'1'),(1,89,'1'),(1,90,'1'),(1,91,'1'),(1,92,'1'),(1,93,'1'),(1,94,'0'),(1,96,'1617902366'),(1,97,'4.4.1'),(1,98,''),(1,99,'0'),(1,100,'1'),(1,101,'1'),(1,104,'0'),(1,105,'0'),(1,108,'1'),(1,109,'0'),(1,110,'0'),(1,111,'1'),(1,154,'0'),(1,121,'0'),(1,122,'1'),(1,124,'0'),(1,125,'1'),(1,126,'1'),(1,127,'1'),(1,128,'1'),(1,129,''),(1,130,'album,ep,live,single'),(1,131,'1'),(1,132,'10'),(1,133,'0'),(1,134,'1'),(1,137,''),(1,138,''),(1,140,'0'),(1,141,'dark'),(1,146,'1'),(1,149,'0'),(1,150,'0'),(1,151,''),(1,152,''),(1,153,''),(1,155,''),(1,157,''),(1,158,'');
/*!40000 ALTER TABLE `user_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pvmsg`
--

DROP TABLE IF EXISTS `user_pvmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_pvmsg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `message` text CHARACTER SET utf8,
  `from_user` int(11) unsigned NOT NULL,
  `to_user` int(11) unsigned NOT NULL,
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `creation_date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pvmsg`
--

LOCK TABLES `user_pvmsg` WRITE;
/*!40000 ALTER TABLE `user_pvmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_pvmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_shout`
--

DROP TABLE IF EXISTS `user_shout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_shout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) unsigned NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `object_id` int(11) unsigned NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `data` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sticky` (`sticky`),
  KEY `date` (`date`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_shout`
--

LOCK TABLES `user_shout` WRITE;
/*!40000 ALTER TABLE `user_shout` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_shout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vote`
--

DROP TABLE IF EXISTS `user_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vote` (
  `user` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  `sid` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  KEY `user` (`user`),
  KEY `object_id` (`object_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vote`
--

LOCK TABLES `user_vote` WRITE;
/*!40000 ALTER TABLE `user_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `catalog` int(11) unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_codec` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `audio_codec` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `resolution_x` mediumint(8) unsigned NOT NULL,
  `resolution_y` mediumint(8) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `mime` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addition_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `played` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `release_date` int(11) DEFAULT NULL,
  `channels` mediumint(9) DEFAULT NULL,
  `bitrate` mediumint(8) DEFAULT NULL,
  `video_bitrate` int(11) unsigned DEFAULT NULL,
  `display_x` mediumint(8) DEFAULT NULL,
  `display_y` mediumint(8) DEFAULT NULL,
  `frame_rate` float DEFAULT NULL,
  `mode` enum('abr','vbr','cbr') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file` (`file`(333)),
  KEY `enabled` (`enabled`),
  KEY `title` (`title`),
  KEY `addition_time` (`addition_time`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wanted`
--

DROP TABLE IF EXISTS `wanted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wanted` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `artist` int(11) DEFAULT NULL,
  `artist_mbid` varchar(1369) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_wanted` (`user`,`artist`,`mbid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wanted`
--

LOCK TABLES `wanted` WRITE;
/*!40000 ALTER TABLE `wanted` DISABLE KEYS */;
/*!40000 ALTER TABLE `wanted` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-08 17:23:55
