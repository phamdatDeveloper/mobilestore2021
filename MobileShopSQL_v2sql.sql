-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: mobileshop
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `createby` varchar(45) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `modifyby` varchar(45) DEFAULT NULL,
  `modifydate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Iphone',1,NULL,NULL,NULL,NULL),(2,'Oppo',1,NULL,NULL,NULL,NULL),(3,'Samsung',1,NULL,NULL,NULL,NULL),(4,'Xiaomi',1,NULL,NULL,NULL,NULL),(5,'Huawei',1,NULL,NULL,NULL,NULL),(6,'Nokia ',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `shipaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderemail` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderphone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createby` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `modifyby` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifydate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderdetail_product_idx` (`productid`),
  KEY `fk_orderdetail_order_idx` (`orderid`),
  CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_orderdetail_product` FOREIGN KEY (`productid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pricesale` double DEFAULT NULL,
  `mainimage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondaryimage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `specification` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `createby` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `modifyby` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifydate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_idx` (`categoryid`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone 11 Pro Max',30000000,27000000,'/template/admin/assets/images/iphone11.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. \r <h3>Hi???u n??ng v?????t xa m???i gi???i h???n</h3>\r \r <p>Apple ??&atilde; trang b??? con chip m???i nh???t c???a h&atilde;ng (t&iacute;nh ?????n 11/2020) cho iPhone 12 ??&oacute; l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-a14-bionic-tren-iphone-12-va-ipad-1290695\" target=\"_blank\">A14 Bionic</a>, ???????c s???n xu???t tr&ecirc;n ti???n tr&igrave;nh 5 nm v???i hi???u su???t ???n ?????nh h??n so v???i chip A13 ???????c trang b??? tr&ecirc;n phi&ecirc;n b???n ti???n nhi???m&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-11\" target=\"_blank\">iPhone 11</a>.</p>\r \r <p><a href=\"https://www.thegioididong.com/images/42/213031/iphone-12-144220-044259.jpg\" onclick=\"return false;\"><img alt=\"Chip A14 Bionic m???nh m??? | iPhone 12\" src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-144220-044259.jpg\" /></a></p>\r \r <p>Xem th&ecirc;m:&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-a14-bionic-tren-iphone-12-va-ipad-1290695\" target=\"_blank\">T&igrave;m hi???u v??? chip Apple A14 Bionic tr&ecirc;n iPhone 12 v&agrave; iPad Air 2020</a></p>\r \r <p>V???i CPU Apple A14 Bionic, b???n c&oacute; th??? d??? d&agrave;ng tr???i nghi???m m???i t???a game v???i nh???ng pha chuy???n c???nh m?????t m&agrave; hay h&agrave;ng lo???t hi???u ???ng ????? h???a tuy???t ?????p ??? m???c ????? h???a cao m&agrave; kh&ocirc;ng lo t&igrave;nh tr???ng gi???t lag.</p>\r \r <p><a href=\"https://www.thegioididong.com/images/42/213031/iphone-12-18.jpg\" onclick=\"return false;\"><img alt=\"Chi???n game si??u m?????t, ????? h???a tuy???t ?????p | iPhone 12\" src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-18.jpg\" /></a></p>\r \r <p>Ch??a h???t, Apple c&ograve;n g&acirc;y b???t ng??? ?????n ng?????i d&ugrave;ng v???i h??? th???ng 5G l???n ?????u ti&ecirc;n ???????c trang b??? tr&ecirc;n nh???ng chi???c&nbsp;<a href=\"https://www.thegioididong.com/dtdd-apple-iphone\" target=\"_blank\">iPhone</a>, cho t???c ????? truy???n t???i d??? li???u nhanh h??n, ???n ?????nh h??n.</p>\r \r <p><a href=\"https://www.thegioididong.com/images/42/213031/iphone-12-20.jpg\" onclick=\"return false;\"><img alt=\"K???t n???i 5G truy???n t???i d??? li???u nhanh ch??ng | iPhone 12\" src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-20.jpg\" /></a></p>\r \r <p>iPhone 12 s??? ch???y tr&ecirc;n h??? ??i???u h&agrave;nh&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/ios-14-va-5-tinh-nang-moi-thu-vi-khong-the-bo-qua-tren-1268933\" target=\"_blank\">iOS 14</a>&nbsp;v???i nhi???u t&iacute;nh n??ng h???p d???n nh?? h??? tr??? Widget c??ng nh?? nh???ng n&acirc;ng c???p t???i ??u ph???n m???m ??&aacute;ng k??? mang l???i nh???ng tr???i nghi???m th&uacute; v??? m???i l??? ?????n ng?????i d&ugrave;ng.</p>\r \r <p><a href=\"https://www.thegioididong.com/images/42/213031/iphone-12-13.jpg\" onclick=\"return false;\"><img alt=\"Kh??m ph?? nh???ng t??nh n??ng m???i h???p d???n tr??n iOS 14 | iPhone 12\" src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-13.jpg\" /></a></p>\r \r <h3>C???m camera kh&ocirc;ng ng???ng c???i ti???n</h3>\r \r <p>iPhone 12 ???????c trang b??? h??? th???ng camera k&eacute;p bao g???m&nbsp;<a href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\">camera g&oacute;c r???ng</a>&nbsp;v&agrave; camera si&ecirc;u r???ng c&oacute; c&ugrave;ng ????? ph&acirc;n gi???i l&agrave; 12 MP, ch??? ????? ban ??&ecirc;m (<a href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-dem-night-mode-la-gi-907873\" target=\"_blank\">Night Mode</a>) tr&ecirc;n b??? ??&ocirc;i camera n&agrave;y c??ng ??&atilde; ???????c n&acirc;ng c???p v??? ph???n c???ng l???n thu???t to&aacute;n x??? l&yacute;, khi ch???p nh???ng b???c ???nh thi???u s&aacute;ng b???n s??? nh???n ???????c k???t qu??? ???n t?????ng v???i m&agrave;u s???c, ????? chi ti???t r&otilde; n&eacute;t ??&aacute;ng kinh ng???c.</p>\r ',NULL,20,1,'KHUYEN_MAI',1,NULL,'3921-10-12',NULL,'3921-10-12'),(2,'Iphone 11',3220000,2600000,'/template/admin/assets/images/xiaomi1.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. ',NULL,22,1,'KHUYEN_MAI',1,NULL,NULL,NULL,NULL),(7,'Iphone Xr',30000000,27000000,'/template/admin/assets/images/iphone.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. ',NULL,200,1,'KHUYEN_MAI',1,NULL,'3921-10-12',NULL,'3921-10-12'),(9,'Galaxy A50',3220000,1000000,'/template/admin/assets/images/galaxya50.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. ','??dasd',22,1,'MOI',1,'Ba Dat','2019-02-25','L?? Duy','2019-02-25'),(10,'Iphone Xr 512GB',8990000,0,'/template/admin/assets/images/iphonexr.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. ',NULL,22,2,'KHUYEN_MAI',1,'L?? Duy','2019-02-25','L?? Duy','2019-02-25'),(11,'Readmi 2',21000000,2000000,'/template/admin/assets/images/realme1.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. ',NULL,200,1,NULL,1,NULL,'3921-10-12',NULL,'3921-10-12'),(12,'Nokia 2',1200000,0,'/template/admin/assets/images/redmi.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. ',NULL,222,1,NULL,1,NULL,'3921-10-12',NULL,'3921-10-12'),(13,'Samsung m51',2000000,1100000,'/template/admin/assets/images/samsungm51.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. ',NULL,222,1,NULL,1,NULL,'3921-10-12',NULL,'3921-10-12'),(14,'Samsung S21',2500000,2100000,'/template/admin/assets/images/samsungs21.jpg','/template/admin/assets/images/1.jpg,/template/admin/assets/images/2.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/3.jpg,/template/admin/assets/images/4.jpg,/template/admin/assets/images/5.jpg,','Trong nh???ng th&aacute;ng cu???i n??m 2020&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>&nbsp;??&atilde; ch&iacute;nh th???c gi???i thi???u ?????n ng?????i d&ugrave;ng c??ng nh?? iFan th??? h??? iPhone&nbsp;12&nbsp;series&nbsp;m???i v???i h&agrave;ng lo???t t&iacute;nh n??ng b???c ph&aacute;, thi???t k??? ???????c l???t x&aacute;c ho&agrave;n to&agrave;n, hi???u n??ng ?????y m???nh m??? v&agrave; m???t trong s??? ??&oacute; ch&iacute;nh l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\">iPhone 12 64GB</a>. ',NULL,21,1,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createby` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `modifyby` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifydate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN',NULL,NULL,NULL,NULL),(2,'ROLE_USER',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `numberphone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `createby` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `modifyby` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifydate` date DEFAULT NULL,
  `confirmToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dat','Ph???m ?????t','0333666999','$2a$04$GYGsaJj9l6kH2GikK6QVzO0v3sOCxt3vdkiA2/tcoSw8erI85ZYDG','phamdat.photocopy@gmail.com','linh trung, th??? ?????c',1,NULL,NULL,NULL,NULL,NULL),(2,'duy','L?? Duy','0666333999','$2a$04$GYGsaJj9l6kH2GikK6QVzO0v3sOCxt3vdkiA2/tcoSw8erI85ZYDG','leduy@gmail.com','h??c m??n, h??? ch?? minh',1,NULL,NULL,NULL,NULL,NULL),(10,'admin','ph???m ?????t','??dasd','$2a$10$ifmRa9tcmPitCBkxssCP5e27wgfqkqBd3l2ew1xxYjEyP5qKOjXUu','phamdat.photocopy@gmail.com','linh trung, th??? ?????c,tp HCM',1,NULL,NULL,NULL,NULL,NULL),(11,'kai123','ph???m ?????t','0333969790','$2a$10$qqTjJY2RrmcwGMZ2Y2HjNeTDCFuLgOr/BgriMiZ.1ebodiZrX8Jh2','17130024@st.hcmuaf.edu.vn','linh trung, th??? ?????c,tp HCM',1,NULL,NULL,NULL,NULL,NULL),(12,'sena123','ph???m ?????t','0333969790','$2a$10$9d8DOW7csg3HqwVlGK1vzumeUq7aAE4Gu9J6Y9X.lwvBoygWx0dlm','phamdat.developer@gmail.com','linh trung, th??? ?????c,tp HCM',1,NULL,NULL,NULL,NULL,NULL),(13,'DM843122','ph???m ?????t','0333969790','$2a$10$s1nR5i8FO4qW10cV6xbpeuFtGm6NELOtM3muQhSIx2g9TKyfOKmI2','phamdat.developer@gmail.com','linh trung, th??? ?????c,tp HCM',0,NULL,NULL,NULL,NULL,'82a36a6f-f018-45a7-a789-12267aa96242');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`userid`),
  KEY `roleid_idx` (`roleid`),
  CONSTRAINT `fk_userrole_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_userrole_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1),(2,1,2),(11,11,2),(16,10,2),(20,12,2),(25,11,2),(26,11,2),(27,11,2),(28,12,2),(29,12,2),(30,12,2),(31,12,2),(32,11,2),(33,11,2),(34,11,2),(35,11,2),(36,11,2),(37,11,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-15 21:00:26
