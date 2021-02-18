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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'60e7d760-1fa9-4391-a0e7-a302b0439ca1','ZTY','18873242002','广东省','东莞市','OPPO移动终端部','523879'),(2,'60e7d760-1fa9-4391-a0e7-a302b0439ca1','ttt','11111111111','天津市','和平区','无','523879');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (23,'60e7d760-1fa9-4391-a0e7-a302b0439ca1',4,'小米11',4299,2,NULL,NULL,NULL,'2021轻装上阵',1,1000,1,8598),(25,'60e7d760-1fa9-4391-a0e7-a302b0439ca1',3,'Redmi K20 Pro',1418,1,NULL,NULL,NULL,'高性能长续航 5G 手机',1,1000,1,1418);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'手机 电话卡\r\n'),(2,2,'电视 盒子'),(3,3,'笔记本 显示器'),(4,4,'家电 插电板'),(5,5,'出行 穿戴'),(6,6,'电源 配件'),(7,7,'耳机 音箱'),(8,8,'生活 箱包');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_good_id_uindex` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,1,'小米CC9','3200万+4800万 前后双旗舰相机','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1587873615.05099760.jpg',1799,1999,1,'https://www.mi.com/',1,'/imgs/category/h1/h11.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/963679eaf3937351e154600ab3448460.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/phone/1.webp'),(20,2,'小米8青春版','50倍潜望式变焦，轻薄5G手机','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1590372843.12185799.jpg',1509,1831,1,'https://www.mi.com/',1,'/imgs/category/h1/h12.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b11742a0be47f9d97bb6a13ea580018d.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/phone/2.webp'),(21,3,'Redmi K20 Pro','高性能长续航 5G 手机','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606288963.72951431.jpg',1418,1618,1,'https://www.mi.com/',1,'/imgs/category/h1/h13.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a4a76ee684e51f0ee531ef3dc7f0aeaf.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/phone/3.webp'),(22,4,'小米11','2021轻装上阵','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158754.96998301.jpg',4299,4599,1,'https://www.mi.com/',1,'/imgs/category/h1/h14.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3bf20f1df3f2e22c5b29ff07634f3c59.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/phone/4.webp'),(23,13,'小米透明电视','一次对未来的想象与探索','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1597155788.15473323.jpg',49999,52999,2,'https://www.mi.com/',1,'/imgs/category/h2/h21.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/932b583c6eccd8aabfa0771f8a854940.jpg?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/tv/1.webp'),(24,14,'小米电视大师','一次对未来的想象与探索','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1601453164.95842829.jpg',9999,11999,2,'https://www.mi.com/',1,'/imgs/category/h2/h22.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/174a2f9256a44b98f9e08bbe30528329.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/tv/2.webp'),(25,15,'量子点电视','10.7亿原色显示 / 98.5%DCI-P3广色域 ','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1593671513.90269727.jpg',1999,2300,2,'https://www.mi.com/',1,'/imgs/category/h2/h23.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ea3390a20547c7298a258528e4aa69ad.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/tv/3.webp'),(26,19,'Redmi智能电视A55\r\n','量子点高端电视','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1572952295.07262734.jpg',1999,2222,2,'https://www.mi.com/',1,'/imgs/category/h2/h27.jpg','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'/imgs/imgfoot/tv/7.webp'),(27,25,'Redmi G 游戏本','不受流行的掌控，每一种体验都为你带来娱乐无限','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1597309814.26328072.jpg',5299,5500,3,'https://www.mi.com/',1,'/imgs/category/h3/h31.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0bfdd3b985b4a9da58a1f5a861c5895f.png?thumb=1&w=160&h=110&f=webp&q=90',NULL),(28,26,'小米笔记本Air 13.3','第八代四核处理器，显卡再升级','http://i1.mifile.cn/f/i/18/mibookair/13/index_intro_shadow.png',5399,5600,3,'https://www.mi.com/',1,'/imgs/category/h3/h32.png','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e6c9a677acbb3b0c75d4d0d83e8a695.png?thumb=1&w=160&h=110&f=webp&q=90',NULL),(29,27,'Pro 15.6 2020款','IPS广角硬屏/7.3mm纤薄机身/低蓝光舒适护眼','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1590547529.11256588.png',6999,7366,3,'https://www.mi.com/',1,'/imgs/category/h3/h33.png','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/d712f71b3c4a3b562601c2b956a660ad.png?thumb=1&w=160&h=110',NULL),(30,28,'RedmiBook 14 Ⅱ','全新十代酷睿处理器 / MX350独显 / 14英寸超窄边框高清屏','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1594121477.94796852.jpg',3299,3500,3,'https://www.mi.com/',1,'/imgs/category/h3/h34.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/682027c81244d5244d72990cc8b5341f.png?thumb=1&w=160&h=110&f=webp&q=90',NULL),(32,37,'米家互联网开门冰箱','风冷无霜/环绕出风/纤薄箱体/电脑控温','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606296263.35415824.jpg',1299,1999,4,'https://www.mi.com/',1,'/imgs/category/h4/h41.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(33,38,'米家微波炉','智能APP操控 / 平板式加热 / 专项分类解冻 / 20L容量 / 30+精选','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1563787495.67039374.jpg',1299,1999,4,'https://www.mi.com/',1,'/imgs/category/h4/h42.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(34,39,'小米新1级立式空调','智能互联 / 新一级能效 / 自清洁 / 抑菌滤网','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1572868360.8284015.jpg',1299,1999,4,'https://www.mi.com/',1,'/imgs/category/h4/h43.png','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(35,40,'互联网洗烘一体机','安静洗涤│健康银离子│除菌微蒸空气洗│深度除螨洗','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1598841549.11714200.jpg',1299,1999,4,'https://www.mi.com/',1,'/imgs/category/h4/h44.png','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(36,49,'Redmi 手表','高清彩显大屏，100款潮流表盘/7种运动模式，NFC、小爱多项便携操作/睡眠、心','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606357020.90171867.jpg',1299,1999,5,'https://www.mi.com/',1,'/imgs/category/h5/h51.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(37,50,'小米手环5 NFC版','多功能NFC/ 14天超长续航 / 磁吸式充电 / 11种运动模式','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591780204.23988738.jpg',1299,1999,5,'https://www.mi.com/',1,'/imgs/category/h5/h52.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(38,51,'小米手表','能打电话、独立上网 / 压力、睡眠、身体能量监测 / 36h超长续航 / 十大专','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595389518.61717267.jpg',1299,1999,5,'https://www.mi.com/',1,'/imgs/category/h5/h53.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(39,87,'卡丁车兰博基尼版','与兰博基尼合作设计/全新风冷式轮毂电机/40km/h 极速/可变身为平衡车/大容','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1596609066.25445436.jpg',9999,11000,8,'https://www.mi.com/',1,'/imgs/category/h5/h54.jpg','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'/imgs/imgfoot/other/3.webp'),(40,61,'移动电源皮卡丘款','皮卡丘联名，大电池能量；双口输出，双向快充/可方便为手环、蓝牙耳机等设备进行充电','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1603353229.05998841.jpg',1299,1999,6,'https://www.mi.com/',1,'/imgs/category/h6/h61.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(41,62,'亲肤保护壳玻璃版','简约原色 | 亲肤材质 | 周全保护','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609128612.79611003.jpg',1299,1999,6,'https://www.mi.com/',1,'/imgs/category/h6/h62.jpg','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(42,63,'小米USB-C数据线','标准USB-C接口 / 数据传输、充电二合一 / 充电迅速、传输稳定 / 严格测','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1562931178.58958259.jpg',1299,1999,6,'https://www.mi.com/',1,'/imgs/category/h6/h63.jpg','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(43,64,'小米立式风冷无线充','高效安全 / 理想视角 / 静音散热','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1597067683.40078353.jpg',1299,1999,6,'https://www.mi.com/',1,'/imgs/category/h6/h64.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(44,73,'小米小爱音箱电池版','4850mAh大容量电池持久续航随身听 / 2.5英寸12W全频扬声器DTS专业','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1603769856.61877700.jpg',1299,1999,7,'https://www.mi.com/',1,'/imgs/category/h7/h71.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(45,74,'小米小爱触屏音箱','真正的大屏旗舰智能音箱','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575882742.47577677.jpg',1299,1999,7,'https://www.mi.com/',1,'/imgs/category/h7/h72.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(46,75,'Redmi小爱触屏音箱','超大屏，让智能更多可能','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1584930592.94895287.jpg',1299,1999,7,'https://www.mi.com/',1,'/imgs/category/h7/h73.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(47,76,'Redmi小爱音箱Play','听音乐、语音遥控家电的人工智能音箱','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575427252.04796744.jpg',1299,1999,7,'https://www.mi.com/',1,'/imgs/category/h7/h74.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,NULL),(48,79,'小米小背包','城市休闲 / 简约设计 / 多容量选择 / 防泼水','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1583488244.68831099.jpg',48,60,7,'https://www.mi.com/',1,'/imgs/category/h8/h81.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/12fe0ea5e8dafecce5ffa65108796683.jpg?thumb=1&w=200&h=200&f=webp&q=90'),(49,86,'小米极简都市双肩包','可容纳15.6英寸电脑/耐磨防水/方形简约造型','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1571835343.8744739.jpg',139,149,8,'https://www.mi.com/',1,'/imgs/category/h8/h82.jpg','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'/imgs/imgfoot/other/2.webp'),(50,52,'米家护颈记忆绵枕','仰卧侧卧皆可/舒缓护颈/内外抗菌/四季适用','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1558946216.36898736.jpg',1299,1999,5,'https://www.mi.com/',1,'/imgs/category/h8/h83.png','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'/imgs/imgfoot/other/3.webp'),(51,88,'盲盒系列之欢喜过年','新年主题特色趣味 | 独特换装 |精致做工','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1611554885.00242050.jpg',552,666,8,'https://www.mi.com/',1,'/imgs/category/h8/h84.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！','更能AI 精准分析视频内容，15个场景智能匹配背景音效。',1000,1,NULL,'/imgs/imgfoot/other/4.webp'),(52,5,'Redmi K30S纪念版','144Hz 变速高刷，硬核旗舰','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1603708777.40827786.jpg',2599,2799,1,'https://www.mi.com/',1,'/imgs/category/h1/h15.webp','60帧超慢动作摄影','慢慢回味每一瞬间的精彩','后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！',NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5d19da60f9f62eb2aa5dcdbd7df19f0f.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/phone/5.webp'),(53,6,'Redmi Note 8','千元4800万四摄','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b4534b9fd22f478314f3cbbf286b7338.png?thumb=1&w=40&h=40&f=webp&q=90',899,1000,1,'https://www.mi.com/',1,'/imgs/category/h1/h16.webp',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/584add2c9cfdb9eefe7b642bf191773a.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/phone/6.webp'),(54,7,'腾讯黑鲨游戏手机','骁龙865处理器/双模5G/270Hz触控采样率','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595486329.61241316.jpg',2999,3199,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f382e29367ad5852fc1adfdae1332d5c.pn',1,'/imgs/category/h1/h17.webp',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/phone/7.webp'),(55,8,'Redmi 8A','5000mAh 充电宝级大电量','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1574763049.66425763.jpg',699,799,1,'https://www.mi.com/',1,'/imgs/category/h1/h18.webp',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/phone/8.webp'),(56,17,'全面屏电视Pro','全面屏设计搭配金属机身','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1569287811.46782023.jpg',3799,3688,2,NULL,1,'/imgs/category/h2/h25.webp',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f0f2d1079c767a834f098dd824bb6fee.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/tv/5.webp'),(57,18,'米家投影抗光幕','大画面/抗环境光/方便入户/10毫米窄边框','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1601351031.56167615.png',1999,2222,2,NULL,1,'/imgs/category/h2/h26.webp',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0112cb7e2ea8489fbd36ce3a781d5232.jpg?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/tv/6.webp'),(58,16,'米家空调','4K 分辨率画面 / 2000 ANSI 流明','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591343526.32329938.jpg',2399,2500,2,'https://www.mi.com/',1,'/imgs/category/h2/h24.webp',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e513ac03d0ebb594bf42f7d6b1b44944.png?thumb=1&w=160&h=110&f=webp&q=90','/imgs/imgfoot/tv/4.jpg'),(59,20,'Redmi MAX 98\"','超震撼！客厅里的巨幕影院','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1584958755.36428250.jpg',19999,21000,2,NULL,1,'/imgs/category/h2/h28.webp',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/tv/8.webp'),(60,32,'USB至HDMI转接器','多功能转接器','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e18c5807226399f5b24b340241fe8cc1.png?thumb=1&w=40&h=40&f=webp&q=90',1299,1999,3,NULL,1,'/imgs/category/h3/h38.webp',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e27b3211230c2b8c21c0ef4efcbc17bc.png?thumb=1&w=160&h=110&f=webp&q=90',NULL),(61,30,'RedmiBook 16','全新十代酷睿处理器 / MX350独显 / 16英寸超窄边框高清屏','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1594113149.83176048.jpg',5299,5699,3,NULL,1,'/imgs/category/h3/h36.webp',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e6c9a677acbb3b0c75d4d0d83e8a695.png?thumb=1&w=160&h=110&f=webp&q=90',NULL),(62,31,'小米无线键鼠套装','2.4G Hz无线传输 / 全尺寸104键 / 多功能快捷键 / 简洁轻薄','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1576481939.81337301.jpg',1299,1999,3,NULL,1,'/imgs/category/h3/h37.webp',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(63,29,'曲面显示器34英寸','超宽大环绕沉浸视界，爽快游戏娱乐体验','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1571279105.88953033.jpg',2399,2577,3,NULL,1,'/imgs/category/h3/h35.webp',NULL,NULL,NULL,NULL,1000,1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f0f2175b9a6d4fdb0f0eeb843398044.png?thumb=1&w=160&h=110&f=webp&q=90',NULL),(64,41,'米家空气净化器3','每分钟可输送6660升洁净空气 / 轻微污染也可灵敏感应 / 3层净化，层层高效','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1565074581.53061893.jpg',1299,1999,4,NULL,1,'/imgs/category/h4/h45.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(65,42,'米家扫拖机器人1T','S-cross™3D避障 | 3D VSLAM视觉导航 | 3000Pa超大吸力','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/603beb09930e32addd1b362bf43c7ac2.jpg?thumb=1&w=40&h=40',1299,1999,4,NULL,1,'/imgs/category/h4/h46.jpg',NULL,NULL,NULL,'https://cdn.cnbj0.fds.api.mi-img.com/b2c',1000,1,NULL,NULL),(66,43,'米家电饭煲C1','3L、4L可选 / 650W大功率 / 支持20分钟热水快饭 / 一键调节加热时','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1574391572.30114650.jpg',1299,1999,4,NULL,1,'/imgs/category/h4/h47.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(67,44,'米家滤水壶滤芯三支','高效过滤，享安心好水 / 有效滤除余氯，减少水垢、重金属等有害物质 / 360°','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1528791063.64331921.jpg',1299,1999,4,NULL,1,'/imgs/category/h4/h48.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(68,53,'米家石英表','腕上的科技与美学','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1531448937.8625685.jpg',1299,1999,5,NULL,1,'/imgs/category/h5/h55.webp',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(69,54,'小米记录仪2 2K版','2K超清/140°超广角/智能语音声控/3D降噪夜视',NULL,1299,1999,5,NULL,1,'/imgs/category/h5/h56.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(70,55,'小米后视镜记录仪','语音控制 ／ 5英寸IPS大屏 ／ 停车监控 ／ 前后双录','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1586855094.03756665.jpg',1299,1999,5,NULL,1,'/imgs/category/h5/h57.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(71,56,'米家电动滑板车1S','30km超长续航 / 25km/h最高时速 / 可视化交互仪表盘 / 双重刹车系','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1586937333.45342874.jpg',1299,1999,5,NULL,1,'/imgs/category/h5/h58.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(72,65,'黑鲨快充数字耳放','HIFI音质 / 支持快充 / 游戏不挡手 / 耳放快充二合一','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1573034570.24467227.jpg',1299,1999,6,NULL,1,'/imgs/category/h6/h65.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(73,66,'小米支架式自拍杆','360°可旋转手机支架 / 独立式蓝牙遥控器 / 铝合金防滑拉杆','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1577951165.19164817.jpg',1299,1999,6,NULL,1,'/imgs/category/h6/h66.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(74,67,'车载充电器快充版','QC3.0双口输出/智能温度控制/兼容iOS&Android','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591600822.31543126.jpg',1299,1999,6,NULL,1,'/imgs/category/h6/h67.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(75,68,'小米平板4Plus','10.1\"全高清大屏 / 8620mAh大容量电池，超长续航 / 支持AI人脸识','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1536653482.78091231.jpg',1299,1999,6,NULL,1,'/imgs/category/h6/h68.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(76,77,'红米 AirDots 2','疾速秒连，戴上耳机就能用 / 蓝牙5.0技术 / 12小时长续航 / 单双耳模式','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1594807763.78483029.jpg',1299,1999,7,NULL,1,'/imgs/category/h7/h75.webp',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(77,78,'小米双动圈耳机','双动圈设计 / 低音增强 / 磁吸耳壳 / 多功能线控','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1590139389.87797748.png',1299,1999,7,NULL,1,'/imgs/category/h7/h76.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,NULL),(78,85,'小米小爱随身音箱','内置小爱同学,快速唤醒 / 立式造型,快捷操作','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1593339346.09992308.jpg',49,69,8,NULL,1,'/imgs/category/h7/h77.webp',NULL,NULL,NULL,NULL,1000,NULL,NULL,'/imgs/imgfoot/other/1.webp'),(79,80,'小米AI音箱','听音乐、语音遥控家电的','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1522666970.27937468.jpg',199,299,7,NULL,1,'/imgs/category/h7/h78.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e7c6e79433c883e1a022ec21402c1679.jpg?thumb=1&w=200&h=200&f=webp&q=90'),(80,89,'小米防蓝光眼镜','蓝光阻隔率＞80% / 超轻β钛镜腿 / 新型高清尼龙镜片 / 双面防污耐磨','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1601215716.46047205.jpg',179,199,8,NULL,1,'/imgs/category/h8/h85.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/other/5.webp'),(81,90,'米家驱蚊器 智能版','智能操控 / 一键循环定时 / 长效驱蚊 / 室内自由摆放 / 无加热设计','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1557977821.03156568.jpg',59,69,8,NULL,1,'/imgs/category/h8/h86.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/other/6.webp'),(82,91,'米家保温杯弹盖版','保温杯弹盖版新品上架内胆316L不锈钢 | 超轻旋薄内胆 | 480ML大容量','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1601304253.78328490.jpg',99,119,8,NULL,1,'/imgs/category/h8/h87.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/other/7.webp'),(83,92,'巨能写多彩中性笔','醒目五色 | 4倍书写长度 | 8.5g磨砂笔身 | 颜料型油墨 | 0.5mm','https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1607063604.46323457.jpg',10,12,8,NULL,1,'/imgs/category/h8/h88.jpg',NULL,NULL,NULL,NULL,1000,1,NULL,'/imgs/imgfoot/other/8.webp');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `paymentType` int(11) NOT NULL,
  `paymentTypeDesc` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `postage` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '10',
  `statusDesc` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `paymentTime` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `sendTime` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `endTime` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `closeTime` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `createTime` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `imageHost` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `shippingId` int(11) NOT NULL,
  `receiverName` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `receiverMobile` int(11) NOT NULL,
  `receiverProvince` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `receiverCity` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `receiverAddress` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `receiverZip` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_orderNo_uindex` (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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
  `pwd` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('60e7d760-1fa9-4391-a0e7-a302b0439ca1','ZTY','ZTY@sina.com','123','12345678909');
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

-- Dump completed on 2021-02-14 18:44:12
