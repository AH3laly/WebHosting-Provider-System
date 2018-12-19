-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: WebHostingDaemon
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `actionLog`
--

DROP TABLE IF EXISTS `actionLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actionLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `getParams` text NOT NULL,
  `postParams` text NOT NULL,
  `serverParams` text NOT NULL,
  `ip` varchar(20) NOT NULL,
  `sPort` varchar(10) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `params` text,
  `creationDate` datetime DEFAULT NULL,
  `line` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `cartLog`
--

DROP TABLE IF EXISTS `cartLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `setupFee` decimal(10,2) DEFAULT '0.00',
  `request` text NOT NULL,
  `content` text NOT NULL,
  `creationDate` datetime NOT NULL,
  `token` varchar(255) NOT NULL,
  `paymentMethod` varchar(20) DEFAULT NULL,
  `isEnabled` tinyint(4) NOT NULL DEFAULT '0',
  `isPaid` tinyint(4) NOT NULL DEFAULT '0',
  `isApproved` tinyint(4) NOT NULL DEFAULT '0',
  `isProcessed` tinyint(4) DEFAULT '0',
  `operation` varchar(255) NOT NULL DEFAULT 'purchase',
  `recurringAmount` decimal(10,2) DEFAULT '0.00',
  `recurringTerm` int(11) DEFAULT '0',
  `isSandBox` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `isProcessed` (`isProcessed`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cpAccounts`
--

DROP TABLE IF EXISTS `cpAccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpAccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `customerId` int(11) DEFAULT '0',
  `isActive` tinyint(4) DEFAULT '0',
  `creationDate` datetime DEFAULT NULL,
  `packageId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customerPackage`
--

DROP TABLE IF EXISTS `customerPackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerPackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `price` varchar(10) NOT NULL DEFAULT '0',
  `firstTermAmount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `creationDate` datetime DEFAULT NULL,
  `startDate` date NOT NULL,
  `expireDate` date NOT NULL,
  `dueDate` date NOT NULL,
  `notifyDate` date NOT NULL,
  `isExpired` tinyint(4) NOT NULL,
  `isAutoRenew` tinyint(4) NOT NULL,
  `transactionId` int(11) NOT NULL,
  `packageId` int(11) DEFAULT '0',
  `termPrice` decimal(10,2) DEFAULT '0.00',
  `autoRenewAgreement` text,
  `autoRenewMethod` varchar(20) DEFAULT NULL,
  `autoRenewTerm` int(11) DEFAULT NULL,
  `ispId` int(11) NOT NULL DEFAULT '0',
  `autoRenewError` tinyint(4) NOT NULL DEFAULT '0',
  `cost` decimal(10,2) DEFAULT NULL,
  `cpanelBillingItemId` int(11) NOT NULL DEFAULT '0',
  `recurringAmount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `subTotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customerShadow`
--

DROP TABLE IF EXISTS `customerShadow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerShadow` (
  `userId` int(11) NOT NULL,
  `dat` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `failedLogins` int(11) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  UNIQUE KEY `userId` (`userId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domainTransferShadow`
--

DROP TABLE IF EXISTS `domainTransferShadow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domainTransferShadow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) NOT NULL,
  `sld` varchar(255) NOT NULL,
  `tld` varchar(255) NOT NULL,
  `customerId` int(11) DEFAULT '0',
  `creationDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `chargeAmount` decimal(10,2) NOT NULL,
  `orderType` varchar(100) NOT NULL,
  `authInfo` varchar(25) NOT NULL,
  `statusCode` varchar(20) NOT NULL,
  `statusDescription` varchar(255) NOT NULL,
  `orderId` int(11) NOT NULL DEFAULT '0',
  `orderDetailsId` int(11) NOT NULL DEFAULT '0',
  `transactionId` int(11) NOT NULL,
  `isDead` tinyint(4) NOT NULL DEFAULT '0',
  `cost` decimal(10,2) DEFAULT NULL,
  `isProcessed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `statusCode` (`statusCode`),
  KEY `isProcessed` (`isProcessed`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `header` text,
  `content` text NOT NULL,
  `isSent` tinyint(4) DEFAULT '0',
  `isDead` tinyint(4) DEFAULT '0',
  `isRetry` int(11) NOT NULL DEFAULT '0',
  `creationDate` datetime DEFAULT NULL,
  `sentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isSent` (`isSent`),
  KEY `isDead` (`isDead`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frontUpdate`
--

DROP TABLE IF EXISTS `frontUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frontUpdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` text NOT NULL,
  `isProcessed` tinyint(4) DEFAULT '0',
  `isSuccess` tinyint(4) DEFAULT '0',
  `status` text,
  `creationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isProcessed` (`isProcessed`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `creationDate` datetime NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT '1',
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isRead` (`isRead`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packageShadow`
--

DROP TABLE IF EXISTS `packageShadow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packageShadow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageId` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `datacenter` varchar(255) NOT NULL,
  `startCpus` varchar(10) NOT NULL,
  `maxMemory` varchar(10) NOT NULL,
  `operatingSystemReferenceCode` varchar(255) NOT NULL,
  `disk1` varchar(20) NOT NULL,
  `disk2` varchar(20) NOT NULL,
  `networkMaxSpeed` varchar(20) NOT NULL,
  `maxIpAddress` varchar(10) NOT NULL,
  `fixedConfigurationPreset` varchar(255) NOT NULL,
  `fixedConfigurationId` int(11) NOT NULL DEFAULT '0',
  `firstTermPrice` decimal(10,2) NOT NULL,
  `recurringPrice` decimal(10,2) NOT NULL,
  `cpPrice` decimal(10,2) NOT NULL,
  `cpPlan` varchar(255) DEFAULT NULL,
  `cpIsReseller` tinyint(4) NOT NULL DEFAULT '0',
  `cpAcl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packageId` (`packageId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packageShadow`
--

LOCK TABLES `packageShadow` WRITE;
/*!40000 ALTER TABLE `packageShadow` DISABLE KEYS */;
INSERT INTO `packageShadow` VALUES (1,1,'shared','','0','0','','0','0','0','0','0',0,1.95,4.95,0.00,'_shared1',0,NULL),(2,2,'shared','','0','0','','0','0','0','0','0',0,2.95,5.95,0.00,'_shared2',0,NULL),(3,3,'shared','','0','0','','0','0','0','0','0',0,6.95,10.95,0.00,'_shared3',0,NULL),(4,4,'shared','','0','0','','0','0','0','0','0',0,10.95,14.95,0.00,'_shared4',0,NULL),(5,5,'reseller','','0','0','','0','0','0','0','0',0,19.95,25.95,0.00,'_reseller1',1,'acl1'),(6,6,'reseller','','0','0','','0','0','0','0','0',0,29.95,35.95,0.00,'_reseller2',1,'acl1'),(7,7,'reseller','','0','0','','0','0','0','0','0',0,39.95,45.95,0.00,'_reseller3',1,'acl1'),(8,8,'reseller','','0','0','','0','0','0','0','0',0,49.95,55.95,0.00,'_reseller4',1,'acl1'),(9,9,'vps','ams01','1','1','CENTOS_LATEST','25','100','0','1','',0,10.00,15.00,16.00,NULL,0,NULL),(10,10,'vps','ams01','1','2','CENTOS_LATEST','25','150','0','1','',0,20.00,25.00,16.00,NULL,0,NULL),(11,11,'vps','ams01','2','4','CENTOS_LATEST','100','150','0','1','',0,40.00,50.00,16.00,NULL,0,NULL),(12,12,'vps','ams01','4','8','CENTOS_LATEST','100','300','0','1','',0,90.00,100.00,16.00,NULL,0,NULL),(13,13,'dedicated','ams01','4','4','CENTOS_LATEST','500','0','1000','1','0',0,149.00,169.00,20.00,NULL,0,NULL),(14,14,'dedicated','ams01','2','8','CENTOS_LATEST','500','0','1000','1','0',0,179.00,199.00,20.00,NULL,0,NULL),(15,15,'dedicated','ams01','4','16','CENTOS_LATEST','500','0','1000','1','0',0,199.00,219.00,20.00,NULL,0,NULL),(16,16,'dedicated','ams01','8','32','CENTOS_LATEST','500','0','1000','1','0',0,395.00,415.00,20.00,NULL,0,NULL);
/*!40000 ALTER TABLE `packageShadow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwordRecover`
--

DROP TABLE IF EXISTS `passwordRecover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwordRecover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '0',
  `lastSend` int(11) NOT NULL DEFAULT '0',
  `sendTimes` int(11) NOT NULL DEFAULT '0',
  `resetToken` varchar(255) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `lockTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `customerId` (`customerId`),
  KEY `creationDate` (`creationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `paypalAgreement`
--

DROP TABLE IF EXISTS `paypalAgreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypalAgreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planId` varchar(255) NOT NULL,
  `agreementId` varchar(255) DEFAULT NULL,
  `ecToken` varchar(255) NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `creationDate` datetime NOT NULL,
  `startDate` datetime NOT NULL,
  `status` varchar(100) NOT NULL,
  `planToken` varchar(255) NOT NULL,
  `customerId` int(11) NOT NULL DEFAULT '0',
  `packageId` int(11) NOT NULL DEFAULT '0',
  `frequency_interval` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `planId` (`planId`),
  KEY `ecToken` (`ecToken`),
  KEY `planToken` (`planToken`),
  KEY `agreementId` (`agreementId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypalCall`
--

DROP TABLE IF EXISTS `paypalCall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypalCall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `headerParams` text NOT NULL,
  `content` text NOT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypalPlan`
--

DROP TABLE IF EXISTS `paypalPlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypalPlan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `planId` varchar(255) NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `frequency` varchar(100) NOT NULL,
  `frequency_interval` int(11) NOT NULL,
  `creationDate` datetime NOT NULL,
  `status` varchar(100) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `planId` (`planId`),
  KEY `accessToken` (`accessToken`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypalSale`
--

DROP TABLE IF EXISTS `paypalSale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypalSale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessToken` varchar(255) NOT NULL,
  `customerId` int(11) NOT NULL,
  `paymentId` varchar(255) NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `creationDate` datetime NOT NULL,
  `status` varchar(100) NOT NULL,
  `ecToken` varchar(255) NOT NULL,
  `cartId` int(11) NOT NULL DEFAULT '0',
  `cartToken` varchar(255) NOT NULL,
  `isEnabled` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `paymentId` (`paymentId`),
  KEY `customerId` (`customerId`),
  KEY `cartToken` (`cartToken`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pendingSetupServer`
--

DROP TABLE IF EXISTS `pendingSetupServer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendingSetupServer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverId` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `isDone` tinyint(4) NOT NULL DEFAULT '0',
  `isRetry` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL,
  `setupCpanel` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `isDone` (`isDone`),
  KEY `isRetry` (`isRetry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcoCall`
--

DROP TABLE IF EXISTS `tcoCall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcoCall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `headerParams` text NOT NULL,
  `content` text NOT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tld`
--

DROP TABLE IF EXISTS `tld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tld` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tld` varchar(10) NOT NULL,
  `title` varchar(10) NOT NULL,
  `registerPrice` decimal(10,2) NOT NULL,
  `renewPrice` decimal(10,2) NOT NULL,
  `transferPrice` decimal(10,2) NOT NULL,
  `whoisPrice` decimal(10,2) NOT NULL,
  `enabled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tld` (`tld`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tld`
--

LOCK TABLES `tld` WRITE;
/*!40000 ALTER TABLE `tld` DISABLE KEYS */;
INSERT INTO `tld` VALUES (1,'com','.COM',15.00,15.00,15.00,15.00,1),(2,'net','.NET',19.00,19.00,19.00,19.00,1),(3,'org','.ORG',18.00,18.00,18.00,18.00,1),(4,'info','.INFO',16.00,16.00,16.00,16.00,1),(5,'me','.ME',21.00,21.00,21.00,21.00,1),(6,'mobi','.MOBI',19.00,19.00,19.00,19.00,1),(7,'live','.LIVE',18.00,18.00,18.00,18.00,1),(8,'co','.CO',27.00,27.00,27.00,27.00,1),(9,'wiki','.WIKI',36.00,36.00,36.00,36.00,1),(10,'it','.IT',16.00,16.00,0.00,16.00,1),(11,'tel','.TEL',11.00,11.00,11.00,11.00,1),(12,'city','.CITY',20.00,20.00,20.00,20.00,1),(13,'limo','.LIMO',45.00,45.00,45.00,45.00,1),(14,'taxi','.TAXI',45.00,45.00,45.00,45.00,1),(15,'blog','.BLOG',30.00,30.00,30.00,30.00,1);
/*!40000 ALTER TABLE `tld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

