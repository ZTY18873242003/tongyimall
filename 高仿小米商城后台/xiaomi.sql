-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: xiaomi
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--
DROP Database IF EXISTS 'xiaomi';

CREATE Database xiaomi;

use xiaomi;

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `receiverName` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `receiverMobile` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `receiverProvince` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `receiverCity` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `receiverAddress` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `receiverZip` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'60e7d760-1fa9-4391-a0e7-a302b0439ca1','ZTY','18873242002','广东省','东城区','OPPO移动终端部','523879'),(2,'60e7d760-1fa9-4391-a0e7-a302b0439ca1','ttt','11111111111','天津市','和平区','无','523879'),(4,'c8ad1c60-4718-476b-983d-d8eb07c12963','ZTY','18873242003','天津市','和平区','ddssfd','523879'),(5,'c8ad1c60-4718-476b-983d-d8eb07c12963','张之卓','15211011392','北京市','东城区','无','523879');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `pwd` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `admin_id_uindex` (`id`),
  UNIQUE KEY `admin_username_uindex` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','AHT7HHPpGpvLuSlocd0Sg60dv4vZnQ9-qemvb8kCGoy6WSqUu-GT6fddQ00b7PR77y7rirIEx7qs5CusTx7ipA','0f6b7ee9-7265-408e-8a34-980feeffd4c4');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `good_id` int(11) NOT NULL,
  `goods_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `pic_url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `add_time` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `update_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `subtitle` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `productSelected` tinyint(1) DEFAULT NULL,
  `productStock` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `productTotalPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (40,'c8ad1c60-4718-476b-983d-d8eb07c12963',3,'Redmi K20 Pro',1418,1,NULL,NULL,NULL,'高性能长续航 5G 手机',1,1000,1,1418),(41,'c8ad1c60-4718-476b-983d-d8eb07c12963',17,'Redmi G 游戏本',5299,1,NULL,NULL,NULL,'不受流行的掌控，每一种体验都为你带来娱乐无限',1,1000,1,5299);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_category_id_uindex` (`categoryId`),
  UNIQUE KEY `category_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'手机 电话卡'),(2,2,'电视 盒子'),(3,3,'笔记本 显示器'),(4,4,'家电 插线板'),(5,5,'出行 穿戴'),(6,6,'电源 配件'),(7,7,'耳机 音箱'),(8,8,'生活 箱包'),(9,9,'智能 路由器'),(10,10,'健康 儿童');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `subtitle` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT '1299',
  `oldPrice` int(11) NOT NULL DEFAULT '1999',
  `category_id` int(11) NOT NULL,
  `imageHost` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sellcount` int(11) NOT NULL DEFAULT '1',
  `icon` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `desc1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `desc2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `p1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `p2` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `productStock` int(11) NOT NULL DEFAULT '1000',
  `status` int(11) DEFAULT '1',
  `imageHead` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `imageFoot` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `pushtime` varchar(25) COLLATE utf8mb4_bin DEFAULT '2021-01-01 00:00:00',
  `newhot` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_good_id_uindex` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,1,'Readme 9A','3200万+4800万 前后双旗舰相机','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1587873615.05099760.jpg',1799,1999,1,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1db88cd66ff1a6a3e75116988b7f3e12.jpg?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7bd1b02e0329bd5c41d193f01349f991.jpg?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',1),(20,2,'小米8青春版','50倍潜望式变焦，轻薄5G手机','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1590372843.12185799.jpg',1509,1831,1,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7a98170e97ca5df8f5ad2470a8a2d01e.jpg?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b11742a0be47f9d97bb6a13ea580018d.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0099822e42b4428cb25c4cdebc6ca53d.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',0),(21,3,'Redmi K20 Pro','高性能长续航 5G 手机','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606288963.72951431.jpg',1418,1618,1,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/461bf013d08a7a91423cafcbc5ff9339.jpg?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a4a76ee684e51f0ee531ef3dc7f0aeaf.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3b19bf0e7e599c1bbbce510fb0dbc8bc.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',0),(22,4,'小米11','2021轻装上阵','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158754.96998301.jpg',4299,4599,1,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a51c1afa4db8e47e62fad1f6fa4a8970.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/963679eaf3937351e154600ab3448460.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',0),(23,9,'小米透明电视','一次对未来的想象与探索','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1597155788.15473323.jpg',49999,52999,2,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/37576cef378ef2805c20b9ab2a9d6d3d.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/932b583c6eccd8aabfa0771f8a854940.jpg?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1597155788.15473323.jpg','2021-01-01 00:00:00',1),(24,10,'小米电视大师','一次对未来的想象与探索','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1601453164.95842829.jpg',9999,11999,2,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b8f12c8d20878e88b66047ef32566e48.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/174a2f9256a44b98f9e08bbe30528329.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/7e2127506fd2209f3115828404269d45.jpg','2021-01-01 00:00:00',1),(25,11,'量子点电视','10.7亿原色显示 / 98.5%DCI-P3广色域 ','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1593671513.90269727.jpg',1999,2300,2,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/da1680fb62238cb5b01998d80fc34e25.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ea3390a20547c7298a258528e4aa69ad.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1593671513.90269727.jpg','2021-01-01 00:00:00',0),(26,14,'Redmi智能电视A55\r\n','量子点高端电视','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1572952295.07262734.jpg',1999,2199,2,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/93b55d27cd6e2100c25611eb828396ae.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/e513ac03d0ebb594bf42f7d6b1b44944.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1600242740.21454064.jpg','2021-01-01 00:00:00',0),(27,17,'Redmi G 游戏本','不受流行的掌控，每一种体验都为你带来娱乐无限','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1597309814.26328072.jpg',5299,5500,3,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/694e4b422f319e2c8cdd8fb1760f911c.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0bfdd3b985b4a9da58a1f5a861c5895f.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1597309814.26328072.jpg','2021-01-01 00:00:00',0),(28,18,'小米笔记本Air 13.3','第八代四核处理器，显卡再升级','http://i1.mifile.cn/f/i/18/mibookair/13/index_intro_shadow.png',5399,5600,3,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ea840f3f79798c9a29d9921b9edf50ac.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/682027c81244d5244d72990cc8b5341f.webp','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ea840f3f79798c9a29d9921b9edf50ac.png?thumb=1&w=40&h=40&f=webp&q=90','2021-01-01 00:00:00',0),(29,19,'Pro 15.6 2020款','IPS广角硬屏/7.3mm纤薄机身/低蓝光舒适护眼','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1590547529.11256588.png',6999,7366,3,'https://www.mi.com/',1,'/imgs/category/h3/h33.png','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/d712f71b3c4a3b562601c2b956a660ad.png?thumb=1&w=160&h=110','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d9695deb5efdbca6c21d89248dbf3a81.jpg','2021-01-01 00:00:00',0),(30,20,'RedmiBook 14 Ⅱ','全新十代酷睿处理器 / MX350独显 / 14英寸超窄边框高清屏','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1594121477.94796852.jpg',3299,3500,3,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e00ef74cd7162b290f0395c09d220719.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/682027c81244d5244d72990cc8b5341f.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/75026bffd4a6e1e6be58bbe5e0e00a99.jpg','2021-01-01 00:00:00',0),(32,25,'米家互联网开门冰箱','风冷无霜/环绕出风/纤薄箱体/电脑控温','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606296263.35415824.jpg',1299,1999,4,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/abeb200aaaee68d4635c6235d3ffb3f3.jpg?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/b7a4e3ff7919ca2407ad970b78abd09a.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1606296263.35415824.jpg','2021-01-01 00:00:00',0),(34,26,'小米新1级立式空调','智能互联 / 新一级能效 / 自清洁 / 抑菌滤网','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1572868360.8284015.jpg',1299,1999,4,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/96de94415b860f3de95b2d6294f0d0fd.png?thumb=1&w=40&h=40','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1572868360.8284015.jpg','2021-01-01 00:00:00',0),(35,27,'互联网洗烘一体机','安静洗涤│健康银离子│除菌微蒸空气洗│深度除螨洗','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1598841549.11714200.jpg',1299,1999,4,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/18723c3561252ce76c9a1b1eebc4c01c.png?thumb=1&w=40&h=40','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/11b8bca444aba2994fe852993eac9203.png','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/ec20453216dcd42f982cffe5fdbc3115.webp','2021-01-01 00:00:00',1),(36,32,'Redmi 手表','高清彩显大屏，100款潮流表盘/7种运动模式，NFC、小爱多项便携操作/睡眠、心','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606357020.90171867.jpg',1299,1999,5,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/69bd883c1fc06ce41ff0fa1423b77e4e.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/12cdacc6e4f343861d31345036cc3b46.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1606357036.66928543.jpg','2021-01-01 00:00:00',0),(37,33,'小米手环5 NFC版','多功能NFC/ 14天超长续航 / 磁吸式充电 / 11种运动模式','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591780204.23988738.jpg',1299,1999,5,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8e8c85f251ed8b5cd54651c4be13bc68.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/ec0ec7692ba005710d1887262559609c.webp','2021-01-01 00:00:00',0),(38,34,'小米手表','能打电话、独立上网 / 压力、睡眠、身体能量监测 / 36h超长续航 / 十大专','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595389518.61717267.jpg',1299,1999,5,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3cc76c2ce836255c1b2e3e1cf477cfef.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1581834069.19797450.jpg','2021-01-01 00:00:00',0),(39,58,'卡丁车兰博基尼版','与兰博基尼合作设计/全新风冷式轮毂电机/40km/h 极速/可变身为平衡车/大容','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1596609066.25445436.jpg',9999,11000,8,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5852aab5992fdb1db09cd89edcb802c0.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/609d0a457c7f8ac27d76f953c8acb7fc.webp','2021-01-01 00:00:00',0),(41,41,'亲肤保护壳玻璃版','简约原色 | 亲肤材质 | 周全保护','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609128612.79611003.jpg',1299,1999,6,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/5c6e60e48edf17219724faad95963b93.jpg?thumb=1&w=40&h=40','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1609128612.79611003.jpg','2021-01-01 00:00:00',0),(42,42,'小米USB-C数据线','标准USB-C接口 / 数据传输、充电二合一 / 充电迅速、传输稳定 / 严格测','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1562931178.58958259.jpg',1299,1999,6,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/45dd7a2c4fc3d17d5d261ed3eed7cd15.jpg?thumb=1&w=40&h=40','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1562931178.58958259.jpg','2021-01-01 00:00:00',0),(43,43,'小米立式风冷无线充','高效安全 / 理想视角 / 静音散热','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1597067683.40078353.jpg',1299,1999,6,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/27074367aa02371a3c3c417c41195346.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1597067683.40078353.jpg','2021-01-01 00:00:00',0),(44,48,'小米小爱音箱电池版','4850mAh大容量电池持久续航随身听 / 2.5英寸12W全频扬声器DTS专业','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1603769856.61877700.jpg',1299,1999,7,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/71d2ba249ae5d3f2d4517ddf9c0f881a.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/1ab7943ae5215e0faacb04f7270d9cfb.jpg','2021-01-01 00:00:00',0),(45,49,'小米小爱触屏音箱','真正的大屏旗舰智能音箱','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575882742.47577677.jpg',1299,1999,7,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/abe665fafbef94eb3626ae8baf1de97e.jpg?thumb=1&w=40&h=40','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/f6e585a4bf5c0f744ca60f19ecd6fadf.jpg','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1550719656.70567332.jpg','2021-01-01 00:00:00',0),(46,50,'Redmi小爱触屏音箱','超大屏，让智能更多可能','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1584930592.94895287.jpg',1299,1999,7,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7628d4253b1c1fccb5606095d0c5bbe3.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/9c6a5f44fd12afa182367ed8d1716421.webp',NULL,'2021-01-01 00:00:00',0),(47,51,'Redmi小爱音箱Play','听音乐、语音遥控家电的人工智能音箱','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575427252.04796744.jpg',1299,1999,7,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/dacef871b6af373b0212e28b028890b8.png?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/17c0c91317ec0def3ecc072fa9480192.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1575427252.04796744.jpg','2021-01-01 00:00:00',0),(48,54,'小米小背包','城市休闲 / 简约设计 / 多容量选择 / 防泼水','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1583488244.68831099.jpg',48,60,7,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f628feba0f2f8253f9cc41f9984194a7.jpg?thumb=1&w=40&h=40','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/12fe0ea5e8dafecce5ffa65108796683.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',0),(49,57,'小米极简都市双肩包','可容纳15.6英寸电脑/耐磨防水/方形简约造型','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1571835343.8744739.jpg',139,149,8,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f628feba0f2f8253f9cc41f9984194a7.jpg?thumb=1&w=40&h=40','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'/imgs/imgfoot/other/2.webp','2021-01-01 00:00:00',0),(50,35,'米家护颈记忆绵枕','仰卧侧卧皆可/舒缓护颈/内外抗菌/四季适用','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1558946216.36898736.jpg',1299,1999,5,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/744306b95df4d130bdfc346ff2b3c871.png?thumb=1&w=40&h=40','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1558946216.36898736.jpg','2021-01-01 00:00:00',0),(52,5,'Redmi K30S纪念版','144Hz 变速高刷，硬核旗舰','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1603708777.40827786.jpg',2599,2799,1,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/461bf013d08a7a91423cafcbc5ff9339.jpg?thumb=1&w=40&h=40&f=webp&q=90','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！',NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b11742a0be47f9d97bb6a13ea580018d.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7cf7a05df86a858a1f391a0378d8c27d.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',0),(53,6,'Redmi Note 8','千元4800万四摄','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b4534b9fd22f478314f3cbbf286b7338.png?thumb=1&w=40&h=40&f=webp&q=90',899,1000,1,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b4534b9fd22f478314f3cbbf286b7338.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/584add2c9cfdb9eefe7b642bf191773a.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/13f10e47913f9dc82e6c6a6199f413cd.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',0),(54,7,'腾讯黑鲨游戏手机','骁龙865处理器/双模5G/270Hz触控采样率','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595486329.61241316.jpg',2999,3199,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f382e29367ad5852fc1adfdae1332d5c.pn',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f382e29367ad5852fc1adfdae1332d5c.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b11742a0be47f9d97bb6a13ea580018d.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1595486329.61241316.jpg','2021-01-01 00:00:00',0),(55,8,'Redmi 8A','5000mAh 充电宝级大电量','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1574763049.66425763.jpg',699,799,1,'https://www.mi.com/',1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/77bfd346ad97807237beca297cfe2fba.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7bd1b02e0329bd5c41d193f01349f991.jpg?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c892a7640f58032489cbff8a948b50f9.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',0),(56,13,'全面屏电视Pro','全面屏设计搭配金属机身','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1569287811.46782023.jpg',3799,3688,2,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/8aeae36f5d088f22c84b8953bd0d08b4.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f0f2d1079c767a834f098dd824bb6fee.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1569287811.46782023.jpg','2021-01-01 00:00:00',0),(58,12,'米家空调','4K 分辨率画面 / 2000 ANSI 流明','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591343526.32329938.jpg',2399,2500,2,'https://www.mi.com/',1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/630b9e523bb2e1387ce6c7be1edaca18.png?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/03dc85cd792904ddc8027b2d781beed8.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/2b911be4c2f156bb6e4cf367c6080045.jpg','2021-01-01 00:00:00',0),(59,15,'Redmi MAX 98\"','超震撼！客厅里的巨幕影院','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1584958755.36428250.jpg',19999,21000,2,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6797917392e912577135d9eb8ad92f1f.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/0112cb7e2ea8489fbd36ce3a781d5232.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1584958755.36428250.jpg','2021-01-01 00:00:00',1),(60,24,'USB至HDMI转接器','多功能转接器','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e18c5807226399f5b24b340241fe8cc1.png?thumb=1&w=40&h=40&f=webp&q=90',1299,1999,3,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e18c5807226399f5b24b340241fe8cc1.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1597309923.84444452.jpg','2021-01-01 00:00:00',0),(61,22,'RedmiBook 16','全新十代酷睿处理器 / MX350独显 / 16英寸超窄边框高清屏','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1594113149.83176048.jpg',5299,5699,3,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/dae66d0f978b04b539aef092aee50f2f.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e6c9a677acbb3b0c75d4d0d83e8a695.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f34f58cf0235bfdd4e3bc34682382d7b.jpg','2021-01-01 00:00:00',0),(62,23,'小米无线键鼠套装','2.4G Hz无线传输 / 全尺寸104键 / 多功能快捷键 / 简洁轻薄','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1576481939.81337301.jpg',1299,1999,3,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0eb7e33b11443f6927e2035eca7c3d9e.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1576481939.81337301.jpg','2021-01-01 00:00:00',0),(63,21,'曲面显示器34英寸','超宽大环绕沉浸视界，爽快游戏娱乐体验','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1571279105.88953033.jpg',2399,2577,3,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b32e4db4b53b0c56c6040f094e96d945.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f0f2175b9a6d4fdb0f0eeb843398044.png?thumb=1&w=160&h=110&f=webp&q=90','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7a4cc78dcb3b77372c600aa28291ad3b.jpg','2021-01-01 00:00:00',0),(64,28,'米家空气净化器3','每分钟可输送6660升洁净空气 / 轻微污染也可灵敏感应 / 3层净化，层层高效','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1565074581.53061893.jpg',1599,1699,4,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/e997ed31cd5199ec0a24eeb48a37b1e7.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1565074581.53061893.jpg','2021-01-01 00:00:00',0),(65,29,'米家扫拖机器人1T','S-cross™3D避障 | 3D VSLAM视觉导航 | 3000Pa超大吸力','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/603beb09930e32addd1b362bf43c7ac2.jpg?thumb=1&w=40&h=40',899,999,4,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/603beb09930e32addd1b362bf43c7ac2.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,'https://cdn.cnbj0.fds.api.mi-img.com/b2c',1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/65df9e92c06dcd148de5f0eb13e16ea2.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/f9b7f04730f4f475b58c2762f195378a.webp','2021-01-01 00:00:00',1),(66,30,'米家电饭煲C1','3L、4L可选 / 650W大功率 / 支持20分钟热水快饭 / 一键调节加热时','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1574391572.30114650.jpg',1299,1999,4,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/390e15818dd103b2f96f4ac742d47379.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/899a862e88c1a554c6baa248853c1f73.webp','2021-01-01 00:00:00',0),(67,31,'米家滤水壶滤芯三支','高效过滤，享安心好水 / 有效滤除余氯，减少水垢、重金属等有害物质 / 360°','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1528791063.64331921.jpg',1299,1999,4,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/9ffcebcacca008ed2d92a692f7312ef6.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1528791063.64331921.jpg','2021-01-01 00:00:00',0),(68,36,'米家石英表','腕上的科技与美学','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1531448937.8625685.jpg',1299,1999,5,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f941386e72f745b02e8921b6c8055cd6.jpg?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1531448937.8625685.jpg','2021-01-01 00:00:00',0),(69,37,'小米记录仪2 2K版','2K超清/140°超广角/智能语音声控/3D降噪夜视',NULL,1299,1999,5,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/e2748064a9ac9969e53851479d55f1a9.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1590475517.02063328.jpg','2021-01-01 00:00:00',0),(70,38,'小米后视镜记录仪','语音控制 ／ 5英寸IPS大屏 ／ 停车监控 ／ 前后双录','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1586855094.03756665.jpg',1299,1999,5,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/971c8c01a246c7ac69a4c9be9e77e832.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1586855094.03756665.jpg','2021-01-01 00:00:00',0),(71,39,'米家电动滑板车1S','30km超长续航 / 25km/h最高时速 / 可视化交互仪表盘 / 双重刹车系','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1586937333.45342874.jpg',1299,1999,5,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/4e9da27ebbeeb38078910c97173c4671.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,NULL,'2021-01-01 00:00:00',0),(72,44,'黑鲨快充数字耳放','HIFI音质 / 支持快充 / 游戏不挡手 / 耳放快充二合一','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1573034570.24467227.jpg',1299,1999,6,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/9c3ead590f49767a4f562b7285215f5e.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1573034570.24467227.jpg','2021-01-01 00:00:00',0),(73,45,'小米支架式自拍杆','360°可旋转手机支架 / 独立式蓝牙遥控器 / 铝合金防滑拉杆','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1577951165.19164817.jpg',69,89,6,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/2725e04c955dc060ac142fabbf809c1e.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/896f5dc7627a5c810aa82787665ddb4f.jpg','2021-01-01 00:00:00',0),(74,46,'车载充电器快充版','QC3.0双口输出/智能温度控制/兼容iOS&Android','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591600822.31543126.jpg',1299,1999,6,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/397d8119508e8e3c895fc30ece88e799.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/01dba858b327eeeadf34ce8a1d794ed4.webp','2021-01-01 00:00:00',0),(75,47,'小米平板4Plus','10.1\"全高清大屏 / 8620mAh大容量电池，超长续航 / 支持AI人脸识','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1536653482.78091231.jpg',1299,1999,6,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/6ce8ff4bc1e6ded2d40c53b2aa83b98c.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/0a4ec59c13c176eb2a98aec04ee61e60.jpg','2021-01-01 00:00:00',0),(76,52,'红米 AirDots 2','疾速秒连，戴上耳机就能用 / 蓝牙5.0技术 / 12小时长续航 / 单双耳模式','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1594807763.78483029.jpg',1299,1999,7,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0329a34385235c41ec1807cf1cd86b75.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1594807763.78483029.jpg','2021-01-01 00:00:00',0),(77,53,'小米双动圈耳机','双动圈设计 / 低音增强 / 磁吸耳壳 / 多功能线控','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1590139389.87797748.png',1299,1999,7,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/8b3d235f4a5a5bf5c9d8d066d2166e6c.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1590139389.87797748.png','2021-01-01 00:00:00',0),(78,56,'小米小爱随身音箱','内置小爱同学,快速唤醒 / 立式造型,快捷操作','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1593339346.09992308.jpg',49,69,8,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/4df2fa022495e79f890a943a9d7e70a5.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/other/1.webp','2021-01-01 00:00:00',0),(79,55,'小米AI音箱','听音乐、语音遥控家电的','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1522666970.27937468.jpg',199,299,7,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/db89d422ef877cf7290616fef515e413.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e7c6e79433c883e1a022ec21402c1679.jpg?thumb=1&w=200&h=200&f=webp&q=90','2021-01-01 00:00:00',0),(80,59,'小米防蓝光眼镜','蓝光阻隔率＞80% / 超轻β钛镜腿 / 新型高清尼龙镜片 / 双面防污耐磨','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1601215716.46047205.jpg',179,199,8,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/d521bd58668f66c50562b8fa8949f67c.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1601215716.46047205.jpg','2021-01-01 00:00:00',0),(81,60,'米家驱蚊器 智能版','智能操控 / 一键循环定时 / 长效驱蚊 / 室内自由摆放 / 无加热设计','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1557977821.03156568.jpg',59,69,8,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/59d3a701ac0bbb78f1b1d0ea7ebc7505.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/other/6.webp','2021-01-01 00:00:00',0),(82,61,'米家保温杯弹盖版','保温杯弹盖版新品上架内胆316L不锈钢 | 超轻旋薄内胆 | 480ML大容量','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1601304253.78328490.jpg',99,119,8,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/813d173eff50a83abb8abd5abde5f5a6.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/other/7.webp','2021-01-01 00:00:00',0),(83,62,'巨能写多彩中性笔','醒目五色 | 4倍书写长度 | 8.5g磨砂笔身 | 颜料型油墨 | 0.5mm','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1607063604.46323457.jpg',10,12,8,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/c9279a17e9399958420af64e449e3214.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/57433a4b991b2a2ddc889f2d8d434655.webp','2021-01-01 00:00:00',0),(125,16,'小米全面屏电视',NULL,NULL,1299,1999,2,NULL,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/8aeae36f5d088f22c84b8953bd0d08b4.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/03a9e7e96a09d256ca1badeec186c859.webp','2021-02-24 19:20:49',0),(126,63,'米家博朗电动剃须刀',NULL,NULL,199,249,8,NULL,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/60d7bdf307ceaba08b3275246ad3ab53.jpg?thumb=1&w=40&h=40',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/9d4ee2fc25e93ef8630dd33dc5e461f3.webp','2021-02-24 19:43:03',0),(127,40,'平衡车',NULL,NULL,1799,1999,5,NULL,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/50180b158690a40f9cbc684c7646d297.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/7ded5de4be4d4b5c3b88d0b60fe94de1.png','2021-02-24 19:50:36',0),(128,64,'小米路由器AX6000',NULL,NULL,1299,1999,9,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4670a965ac5f0dd32689e06c27cea78f.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/2a759fa795d749f0538cfd2a15890027.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1609124079.46473455.jpg','2021-01-01 00:00:00',1),(129,65,'Redmi路由器 AX6',NULL,NULL,1299,1999,9,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4670a965ac5f0dd32689e06c27cea78f.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/54de949334c3d794a6ca55b76e4bb379.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1597046216.42447200.jpg','2021-02-25 17:15:08',0),(130,66,'Redmi路由器 AX5',NULL,NULL,1299,1999,9,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4670a965ac5f0dd32689e06c27cea78f.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/681a92d3e5f03a109558396c99f6a4df.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1591669005.22126176.jpg','2021-02-25 17:43:52',0),(131,67,'小米路由器 AX1800',NULL,NULL,1299,1999,9,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4670a965ac5f0dd32689e06c27cea78f.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/27da43294889d049a111e5ff2cdfafe7.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/4d5a01b6b8e2a73a2d6547f62e494413.jpg','2021-02-25 17:45:18',0),(132,68,'小米AIoT路由器',NULL,NULL,1299,1999,9,NULL,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4670a965ac5f0dd32689e06c27cea78f.png?thumb=1&w=40&h=40&f=webp&q=90',NULL,NULL,NULL,NULL,1000,1,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/359d3c63cc159949d8fe147a11b4bc40.webp','https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/pms_1581411766.33688586.jpg','2021-02-25 17:47:37',0);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsuggebig`
--

DROP TABLE IF EXISTS `goodsuggebig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodsuggebig` (
  `name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `category_id` int(11) NOT NULL,
  UNIQUE KEY `goodsuggeBig_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsuggebig`
--

LOCK TABLES `goodsuggebig` WRITE;
/*!40000 ALTER TABLE `goodsuggebig` DISABLE KEYS */;
INSERT INTO `goodsuggebig` VALUES ('Readme 9A',1),('Redmi 8A',1),('Redmi G 游戏本',3),('Redmi K20 Pro',1),('Redmi K30S纪念版',1),('Redmi MAX 98\"',2),('Redmi Note 8',1),('Redmi智能电视A55\r\n',2),('互联网洗烘一体机',4),('卡丁车兰博基尼版',8),('小米11',1),('小米8青春版',1),('小米AIoT路由器',9),('小米AI音箱',7),('小米USB-C数据线',6),('小米双动圈耳机',7),('小米小爱触屏音箱',7),('小米小爱音箱电池版',7),('小米手环5 NFC版',5),('小米手表',5),('小米电视大师',2),('小米立式风冷无线充',6),('小米路由器 AX1800',9),('小米路由器AX6000',9),('小米防蓝光眼镜',8),('平衡车',5),('米家互联网开门冰箱',4),('米家博朗电动剃须刀',8),('米家扫拖机器人1T',4),('米家电饭煲C1',4),('腾讯黑鲨游戏手机',1),('车载充电器快充版',6),('黑鲨快充数字耳放',6);
/*!40000 ALTER TABLE `goodsuggebig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsuggefoot`
--

DROP TABLE IF EXISTS `goodsuggefoot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodsuggefoot` (
  `imgUrl` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsuggefoot`
--

LOCK TABLES `goodsuggefoot` WRITE;
/*!40000 ALTER TABLE `goodsuggefoot` DISABLE KEYS */;
INSERT INTO `goodsuggefoot` VALUES ('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/%E4%BC%98%E9%9B%85%E7%9A%84%E4%BD%BF%E7%94%A8%E5%9B%BE%E5%BA%8A/b4e466aa01025459b086e98f3c4d8eb3.webp','全面屏电视Pro',1799),('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/0e432f9a5a70d36a4a47315c2a212e5f.webp','Redmi智能电视A55\r\n',1999),('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/99c5e5ef421647a065691b36121bf786.webp','米家空气净化器3',1599),('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/f9b7f04730f4f475b58c2762f195378a.webp','米家扫拖机器人1T',899),('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/899a862e88c1a554c6baa248853c1f73.webp','米家电饭煲C1',1299),('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/dde48c7082e24d70d2cff0335a53de39.webp','米家护颈记忆绵枕',99),('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/7ded5de4be4d4b5c3b88d0b60fe94de1.png','平衡车',1299),('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/c71af618288a23c03873a86fca2edaac.png','小米支架式自拍杆',69),('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/03d94ee6059481a6adcb6c4c5c572fb4.webp','米家保温杯弹盖版',99);
/*!40000 ALTER TABLE `goodsuggefoot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orde`
--

DROP TABLE IF EXISTS `orde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orde` (
  `orderNo` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `paymentType` int(11) NOT NULL DEFAULT '1',
  `paymentTypeDesc` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT '在线支付',
  `postage` int(11) DEFAULT '6',
  `status` int(11) NOT NULL DEFAULT '0',
  `statusDesc` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT '未支付',
  `paymentTime` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `endTime` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `createTime` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `imageHost` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `shippingId` int(11) DEFAULT NULL,
  `receiverName` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `receiverMobile` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `receiverAddress` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `receiverCity` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `receiverProvince` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `receiverZip` varchar(7) COLLATE utf8mb4_bin DEFAULT NULL,
  `orderitems` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orde`
--

LOCK TABLES `orde` WRITE;
/*!40000 ALTER TABLE `orde` DISABLE KEYS */;
INSERT INTO `orde` VALUES (507661289,8226,1,'在线支付',0,10,'未支付','','','2021-03-05 15:51:30','www.mi.com',4,'ZTY','18873242003','ddssfd','和平区','天津市','523879',NULL),(1959498519,8226,1,'在线支付',0,10,'未支付','','','2021-03-05 15:52:59','www.mi.com',4,'ZTY','18873242003','ddssfd','和平区','天津市','523879',NULL),(1685982517,8226,1,'在线支付',0,10,'未支付','','','2021-03-05 15:57:13','www.mi.com',4,'ZTY','18873242003','ddssfd','和平区','天津市','523879',NULL),(501119072,8226,1,'在线支付',0,10,'未支付','','','2021-03-10 10:52:33','www.mi.com',4,'ZTY','18873242003','ddssfd','和平区','天津市','523879',NULL),(655875211,6717,1,'在线支付',0,10,'未支付','','','2021-03-10 14:20:39','www.mi.com',4,'ZTY','18873242003','ddssfd','和平区','天津市','523879',NULL),(1847471648,6717,1,'在线支付',0,10,'未支付','','','2021-03-10 14:34:56','www.mi.com',4,'ZTY','18873242003','ddssfd','和平区','天津市','523879',NULL),(861826396,6717,1,'在线支付',0,10,'未支付','','','2021-03-10 14:37:59','www.mi.com',4,'ZTY','18873242003','ddssfd','和平区','天津市','523879',NULL),(389578494,6717,1,'在线支付',0,10,'未支付','','','2021-03-10 14:38:05','www.mi.com',5,'张之卓','15211011392','无','东城区','北京市','523879',NULL);
/*!40000 ALTER TABLE `orde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordergood`
--

DROP TABLE IF EXISTS `ordergood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordergood` (
  `orderNo` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `productImage` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `currentUnitPrice` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `createTime` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordergood`
--

LOCK TABLES `ordergood` WRITE;
/*!40000 ALTER TABLE `ordergood` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordergood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `userid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `pwd` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `privatekey` varchar(500) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('c8ad1c60-4718-476b-983d-d8eb07c12963','ZTY','zty1119094861@sina.com','VKmfzfw4hbjIrqxeX15yPx_-67yG52EtEGLTHTvKU6rJPqS49aiJXOL71DBfHACFcCYl7lQN8jbo7QssCe9y4Q','18873242003','可用','2021/01/01 19:03:47','MIIBVQIBADANBgkqhkiG9w0BAQEFAASCAT8wggE7AgEAAkEA4fXACG9h1FM1XZMnThRfD1en5yHQjshwpvB2_6axZwhM0utXG10eHqLalN68tNRZnFs7UdFaSCIkA5GE4Qxl6QIDAQABAkAHxz3lDHCBrpuXrQkdVvYuwQW2nyNexueZ141BH6vbsAzkflKduoYPcscU7SRKuY5sJ5zWzKcMYvEArd0zmUgBAiEA9uQoFOgh0MYyYm0bNAjcxIkhT9FPGrK-ThMqya5XJ7kCIQDqS-bDjlYbMU8MKRmjA1w31M-YKhkwCHR47rbbtoLnsQIgFUIh_WLbfomCTx1L6VgWAko4dxHzuL3JSxm1ZnY_hOkCIQC9861yjFp5D2AD_upfBCFmzm1D85WaILC1PuwXc3_r8QIhAMH77H8eqvRojdyjzOGG0nPjitrFntD68YUfYn4mXrAG'),('80aa6498-d2b8-4f75-899b-e2dd9007a3bb','ZZZ','zty@qq.com','NoPOA8vXNbGE8qnDqxk86F5JD6oChBVZV95mTSGyU4JWCNyUcOXjqJ99dxT6rOk9KHxUTM_6R-nx3zruXCXSBQ','18873242003','可用','2021/01/01 19:09:54','MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAgB3riI3nN-mMDlnHfstvCKPlvjJaxAhUL1X3GQozA6SKC7agKdLlTzLzC_OP8wooMXeKkVU0OLk5nv4DuMcawwIDAQABAkAWyLtleo7_M4qT1sWSuA0UBUnLTFs196E5Fdmu21B9Ohl3YijlcrT4Rgeb6mYNKiLryvA8HdxibElyA9kFfrT5AiEA1oirOqxg19dSPxpjNigJdm85cTMKdnqpSKZ5VP5N3Z0CIQCY4UKFohdwRDdsL4xl1twOH1UjvAkkqdFjbD6XjEmb3wIhAIMYoQoJrGQ5QBkvltDRRncJIKD7_7jG3At5L0uw2wRBAiAu7zkU_aZkeQzq0c4wlb4JN-VTiy7jap81_s1YiWEv0QIgKZxp1xcrulvcmm_v5YIO-7_HocW_pnM7if6f0BwNR8o'),('ca861891-bf89-4c4d-b049-8cfeb4582e2e','ZP','zp@qq.com','l1WL8aMbI6fdPFmXiLqaZvIKW125O-60IfGNe_YOr_GKsoUSmvxcCJa4Y1c8zpqJ5ymxYbGj_rlmzZlrujSxyQ','18873242003','可用','2021/01/01 19:11:32','MIIBVgIBADANBgkqhkiG9w0BAQEFAASCAUAwggE8AgEAAkEAu6-tttYkwKc9wAriYZh3vQWxhbm076lcMbSO8HREpKbBKI9TCUumKyYBjVWFIImU9ExbGemnXqvAWGCOd65FGwIDAQABAkEAnQmiLNBCkhuc1DmHLye2UCcaYQyAMuMe68vqqZBu-t_Hy0rYvdCwQhv05c3qSNjPQXp1g94l76dujMsZjpMswQIhAO250t2zsiKtsjRgP_Ova3C7N46xG02JcSGYjhYoGJahAiEAyh0hroQwlm04AuTBWNicGAcB-GGGUhywU8yhLrQOzjsCIFuVW0dOEzKI-D51Vi3rRtkHR0ARuxMEADGRNCwVBmQBAiEAsWlG4oCIgdKXQvr3uPxScEject9wX21tXfGWXn-RK3cCIQCDoTavo8s7hBToXiXC1nv3eVxZmJgJKJMh40XGzl5HDQ');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-19 20:15:40
