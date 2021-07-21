-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: clothes
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `clothesProductId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `color` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT '1',
  PRIMARY KEY (`clothesProductId`,`userId`),
  KEY `fk_user_idx` (`userId`),
  KEY `fk_clothesProduct_idx` (`clothesProductId`),
  CONSTRAINT `fk_clothesProduct` FOREIGN KEY (`clothesProductId`) REFERENCES `clothes_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `user_` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (52,24,'2021-06-03 13:40:23','beige','Medium',2);
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameBrand` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Giorgio Armani','One of the most favorable brands originating from the state of Turkey'),(2,'H&M',NULL),(3,'Zara',NULL),(4,'Esprit',NULL),(5,'Levi\'s',NULL),(6,'Mango',NULL);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes_category`
--

DROP TABLE IF EXISTS `clothes_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(380) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes_category`
--

LOCK TABLES `clothes_category` WRITE;
/*!40000 ALTER TABLE `clothes_category` DISABLE KEYS */;
INSERT INTO `clothes_category` VALUES (1,'Dress',NULL,''),(2,'T-shirt',NULL,''),(3,'coat',NULL,''),(4,'skirt',NULL,''),(5,'jeans',NULL,'');
/*!40000 ALTER TABLE `clothes_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes_order`
--

DROP TABLE IF EXISTS `clothes_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes_order` (
  `clothesProductId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `color` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` varchar(45) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`clothesProductId`,`userId`),
  KEY `fk_order_clothes_product_idx` (`clothesProductId`),
  KEY `fk_order_userId_idx` (`userId`),
  CONSTRAINT `fk_order_clothes_product` FOREIGN KEY (`clothesProductId`) REFERENCES `clothes_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_userId` FOREIGN KEY (`userId`) REFERENCES `user_` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes_order`
--

LOCK TABLES `clothes_order` WRITE;
/*!40000 ALTER TABLE `clothes_order` DISABLE KEYS */;
INSERT INTO `clothes_order` VALUES (1,24,'2021-04-27 13:43:01','black','Extra Small','2'),(2,24,'2021-04-27 13:42:22','palevioletred','Extra Small','2'),(11,24,'2021-04-28 00:32:15','yellow','Medium','1'),(40,24,'2021-05-01 17:42:10','brown','Extra Small','2');
/*!40000 ALTER TABLE `clothes_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes_product`
--

DROP TABLE IF EXISTS `clothes_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `color_2` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(5,2) NOT NULL,
  `image` varchar(520) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_2` varchar(582) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `soldInd` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0',
  `clothesCategoryId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `collectionId` int(11) NOT NULL,
  `description` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productQuantity` int(11) NOT NULL DEFAULT '1',
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clothes_category_idx` (`clothesCategoryId`),
  KEY `fk_brand_product_idx` (`brandId`),
  KEY `fk_product_type_idx` (`collectionId`),
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`clothesCategoryId`) REFERENCES `clothes_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_collection` FOREIGN KEY (`collectionId`) REFERENCES `type_of_clothes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes_product`
--

LOCK TABLES `clothes_product` WRITE;
/*!40000 ALTER TABLE `clothes_product` DISABLE KEYS */;
INSERT INTO `clothes_product` VALUES (1,'Long-sleeved shirt','black','darkblue',55.69,'https://i.pinimg.com/564x/8f/22/d6/8f22d655a12325904b9d7d7660402a66.jpg','https://i.pinimg.com/originals/5a/d5/b2/5ad5b295903b7f92a08c9e35e6f107a3.jpg','2020-04-20 08:00:00','0',2,2,3,NULL,NULL,8,4),(2,'Pleated Skirt','palevioletred','',49.95,'https://d010203.bibloo.cz/_galerie/varianty/84/844935-z.jpg','https://d010203.bibloo.cz/_galerie/varianty/84/844936-z.jpg','2020-10-28 07:25:00','0',4,1,1,'A flared, pleated skirt is the foolproof way of bringing a touch of panache to even the most serious of outfits. Choose this Armani Exchange two-tone, gradient version..','Women’s midi skirt, Gradient pleats, Elasticated waistband with contrasting logo lettering, Composition: 97% polyamide, 3% elastane',8,5),(5,'Mom Fit Jeans','black',NULL,59.99,'https://static.zara.net/photos///2020/I/0/1/p/9598/120/712/4/w/522/9598120712_1_1_1.jpg?ts=1601563118421','https://static.zara.net/photos///2021/V/0/1/p/8197/033/800/5/w/1920/8197033800_2_1_1.jpg?ts=1610037370099','2020-12-05 12:29:00','0',5,3,3,NULL,NULL,10,3),(6,' Raglan Tiered Mini Dress','teal',NULL,212.49,'https://adn-static1.nykaa.com/nykdesignstudio-images/tr:w-824,/pub/media/catalog/product/f/o/forever-26193601_1.jpg?rnd=20200526195200','https://images.theurge.com/the-iconic/Xc8DD6sYBbYARkZ3cw-PQbkzle8=/main/3x/828-1035/navy-forever-new-zara-raglan-tiered-mini-dress-3.jpg','2021-03-11 02:30:00','0',1,2,1,NULL,NULL,20,5),(11,'Straight Jersey Coat','yellow','pink',255.95,'https://images-na.ssl-images-amazon.com/images/I/81LXVTwaYRL._AC_UY606_.jpg','https://medias-cache.placedestendances.com/en/esprit-straight-jersey-coat-red/image/63/2/2909632.jpg?func=fit&bg_color=white&w=380&h=520','2021-04-15 01:25:00','0',3,4,4,'A stylish companion for mild autumn days: blazer coat made of jersey with a fine texture. Soft jersey made of high-quality blended cotton with stretch..','Outer fabric: 58% Cotton, 39% Polyester, 3% Elastane',12,4),(40,' Butterfly Dress','brown',NULL,189.99,'https://assets.vogue.com/photos/5ae0e13ef8acad647e0a2add/master/w_2000,h_3000,c_limit/01-high-street-bridal-reformation.jpg','https://weselectdresses.com/wp-content/uploads/2020/01/REFORMATION-Butterfly-Dress-3-1-scaled.jpg','2021-05-01 00:47:58','0',1,2,1,'Romance alert. The Butterfly is off the shoulder with elastic ruffle sleeves. It features a fitted bodice and a relaxed skirt with a ruffle hem. ','This is a lightweight georgette fabric with a dry handfeel - 100% viscose.',6,5),(41,'Flared Jeans','navy',NULL,77.85,'https://esprit.scene7.com/is/image/esprit/030EE1B306_901_14?$SFCC_L$','https://img01.ztat.net/article/spp-media-p1/db50911417b43c34821e5029f2c66f56/9e4813029e464977b868abd2999b9fa6.jpg?imwidth=1800','2021-05-01 01:37:10','0',5,4,2,'Perfect for work or any event that requires your diva attention. 2 back slits to look like pockets, front side usable pockets, unlined spring summer weight.','Outer fabric material: 90% cotton, 9% polyester, 1% elastane',10,4),(42,'Sculpt  JeansS','lightsteelblue',NULL,68.99,'https://static.zara.net/photos///2021/V/0/1/p/5252/243/400/2/w/1920/5252243400_2_1_1.jpg?ts=1609750821483','https://static.zara.net/photos///2021/V/0/1/p/5252/243/400/2/w/1920/5252243400_1_1_1.jpg?ts=1609750854102','2021-05-01 01:47:57','0',5,3,2,'Medium high washed jeans, Made of Stretched fabric intended for body shaping. Five-pocket model. ','Outer fabric: 92% cotton, 6% Elastomultiester, 2% Elastane Fibre',13,5),(43,'Levi\'s T-shirt','black','lightgray',27.99,'https://johnlewis.scene7.com/is/image/JohnLewis/003521126?$rsp-pdp-port-1440$','https://images2.drct2u.com/pdp_main_tablet_x2/products/ko/ko886/p02ko886501w.jpg','2021-05-01 02:24:46','0',2,5,1,'Levi\'s Women\'s The Perfect Tee T-Shirt. Designed for comfort, casual style and versatility','Fabric: 100% Cotton. Regular Fit. Fastening: No closure.',20,4),(44,'Levi\'s Taper Jeans','black',NULL,75.88,'https://cdn.shopify.com/s/files/1/0076/6040/4818/products/2_c96f671b-058f-4aa5-a601-36106c30afda.jpg?v=1603067904','https://cdn.shopify.com/s/files/1/0076/6040/4818/products/3_74863395-85f4-432c-b6cc-7d0aefd83170.jpg?v=1603067904','2021-05-01 02:55:43','0',5,5,2,'Slim fitting. Zip & button fastening. Belt loops at waist. Tapered design. Classic five pocket design','Outer fabric: 98% cotton 2% elastane',7,4),(45,'Printed pleated skirt','pink',NULL,136.79,'https://st.mngbcn.com/rcs/pics/static/T5/fotos/S20/53045741_85.jpg?ts=1564061666890&imwidth=412&imdensity=2','https://st.mngbcn.com/rcs/pics/static/T5/fotos/S20/53045741_85_D1.jpg?ts=1564061666890&imwidth=412&imdensity=2','2021-05-01 03:08:07','0',4,6,3,'Midi design. Flared design. Textured fabric. Print. Elastic waist.','Composition: 63% Polyester, 33% Viscose, 4% Elastane',8,5),(46,'Cotton linen blouse','pink',NULL,108.55,'https://st.mngbcn.com/rcs/pics/static/T8/fotos/S20/87027127_81.jpg?ts=1615395899441&imwidth=388&imdensity=2','https://st.mngbcn.com/rcs/pics/static/T8/fotos/S20/87027127_81_D1.jpg?ts=1615394509157&imwidth=388&imdensity=2','2021-05-01 18:38:20','0',2,6,1,'Cotton and linen mix. Flowy fabric. Flared design. V-neck. Decorative cord. Puffed three quarter sleeves. Embroidered details. Openwork details.','Composition: 70% cotton,30% linen',14,5),(47,'Pocket flowy shirt','darkolivegreen','skyblue',57.99,'https://st.mngbcn.com/rcs/pics/static/T8/fotos/S20/87057129_37_D2.jpg?ts=1612969480669&imwidth=388&imdensity=2','https://st.mngbcn.com/rcs/pics/static/T8/fotos/S20/87057129_50.jpg?ts=1610467503407&imwidth=388&imdensity=2','2021-05-01 18:49:33','0',2,6,1,'Flowy fabric. Wide design. V-neck. Wide sleeve. Short sleeve. Pocket on the front. Button fastening on the front section.','Composition: 100% polyester',8,4),(48,'Leopard midi dress','saddlebrown',NULL,177.89,'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67080603_30.jpg?ts=1574345161043&imwidth=412&imdensity=2','https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67080603_30_D1.jpg?ts=1574345161043&imwidth=412&imdensity=2','2021-05-01 18:59:11','0',1,6,1,'Midi design. Flowy fabric. Leopard print. Square neckline. Long puffed sleeves. Elastic cuffs. Frills ending. Flared hem.','Composition: 100% polyester. Lining: 100% polyester',6,5),(49,'Long silk dress','black','crimson',289.99,'https://www.armani.com/34/34815634uc_14_f.jpg','https://www.armani.com/34/34815634sx_14_d.jpg','2021-05-01 19:07:09','0',1,1,2,'An exquisite piece that adds elegance to the most special occasions. Long dress made of soft silk, featuring a delicate series of pleats and layers.','Composition 100% Silk',7,5),(50,'Pure cashmere coat','black',NULL,267.88,'https://www.armani.com/41/41820769kj_14_d.jpg','https://www.armani.com/41/41820769kj_14_f.jpg','2021-05-01 19:16:29','0',3,1,4,'The beauty of the yarn enhances this classic model, characterised by the single breasted buttoning, high society style collar.','Composition 100% Cashmere. Classic Neckline',12,4),(51,'Belted felted coat','cornsilk',NULL,193.79,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fca%2F26%2Fca261e2a1aa0b1914ca6da2fdef574dbb6a0d6d0.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jacketscoats_coats%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F4e%2Fca%2F4eca830239fe619c5e9aca769437d553f9fa7921.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jacketscoats_coats%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2021-05-01 21:57:44','0',3,2,4,'Calf-length coat in woven fabric with notch lapels, diagonal side pockets and long raglan sleeves. Detachable tie belt at the waistt.','Composition - Shell: Polyester 93%, Viscose 6%, Elastane 1%, Lining: Polyester 100%',10,5),(52,'Calf-length coat','beige',NULL,79.99,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F15%2Fe6%2F15e6fa501c11cb062595531af946ff4fd748101a.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jacketscoats_coats%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F9e%2Fdd%2F9edda11ec9dadd4d741c0faeda4c0f5add2c4125.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jacketscoats_coats%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2021-05-01 22:03:03','0',3,2,3,'Calf-length coat in a soft weave with notch lapels and a concealed, double-breasted press-stud fastening. Relaxed fit with long sleeves.','Composition - Lining: Polyester 100, %Shell:  Polyester 61%, Viscose 36%, Elastane 3%',8,4),(53,'Ribbed vest top','black',NULL,51.99,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fff%2F79%2Fff79051de144ce816fa99e19c61fa8e84eadfb8a.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_basics_tops_vests%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fce%2F7b%2Fce7b8686d06d4b9f980cc761acb89d1e67961bb9.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_basics_tops_vests%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/mobilefullscreen]','2021-05-01 22:25:44','0',2,2,1,'Fitted vest top in ribbed cotton jersey with a round neck.','Composition - Cotton 95%, Elastane 5%',15,4),(54,'Esprit Denim Pants','darkblue',NULL,69.85,'https://www.aukia.fi/wp-content/uploads/2020/07/070eo1b305-901-sin-1.jpg','https://a4j9n8e6.rocketcdn.me/wp-content/uploads/2020/07/070eo1b305-901-sin-2.jpg','2021-05-02 01:53:00','1',5,4,3,'These jeans with organic cotton combine a casual style, high comfort and sustainability.','Outer fabric: 85% Cotton, 14% Lyocell (TENCEL™), 1% Elastane',0,4);
/*!40000 ALTER TABLE `clothes_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes_size`
--

DROP TABLE IF EXISTS `clothes_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes_size`
--

LOCK TABLES `clothes_size` WRITE;
/*!40000 ALTER TABLE `clothes_size` DISABLE KEYS */;
INSERT INTO `clothes_size` VALUES (1,'Extra Small'),(2,'Small'),(3,'Medium'),(4,'Large'),(5,'Extra Large');
/*!40000 ALTER TABLE `clothes_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `productId` int(11) NOT NULL,
  `sizeId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`sizeId`),
  KEY `fk_productId_idx` (`productId`),
  KEY `fk_sizeId_idx` (`sizeId`),
  CONSTRAINT `fk_productId` FOREIGN KEY (`productId`) REFERENCES `clothes_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sizeId` FOREIGN KEY (`sizeId`) REFERENCES `clothes_size` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` VALUES (1,1),(1,2),(1,4),(2,1),(2,3),(5,2),(5,3),(5,4),(11,3),(11,4),(11,5),(40,1),(40,2),(40,3),(41,2),(41,3),(41,5),(42,1),(42,2),(43,3),(43,4),(43,5),(44,2),(44,3),(44,4),(45,2),(45,3),(45,5),(46,2),(46,4),(46,5),(47,1),(47,2),(48,2),(48,3),(48,4),(49,1),(49,2),(49,4),(50,3),(50,4),(50,5),(51,3),(51,4),(51,5),(52,2),(52,3),(53,1),(53,2),(53,3),(54,2),(54,5);
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_clothes`
--

DROP TABLE IF EXISTS `type_of_clothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_clothes`
--

LOCK TABLES `type_of_clothes` WRITE;
/*!40000 ALTER TABLE `type_of_clothes` DISABLE KEYS */;
INSERT INTO `type_of_clothes` VALUES (1,'summer'),(2,'spring'),(3,'autumn'),(4,'winter');
/*!40000 ALTER TABLE `type_of_clothes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_`
--

DROP TABLE IF EXISTS `user_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `pasword` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `adress` varchar(216) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_`
--

LOCK TABLES `user_` WRITE;
/*!40000 ALTER TABLE `user_` DISABLE KEYS */;
INSERT INTO `user_` VALUES (24,'Hadzera','Ibrnovic','hadzera','$2b$10$cZk1Nqgoemvv12QUMjs1dOMFgBnmet.BfyUHJA8QzWgKq.E/lWz6e','hadzera.ibranovic@hotmail.com','Travnik Bosanska br 195','ADMIN','female'),(31,'Ado','Kopcic','Ado','$2b$10$bvv9Gid2tjN7eNwDZo5dQOiXGK/ufCgkYrP/mfOcY7BRGyjb6/saq','adnan123@gmail.com','Ciglane bb Travnik','USER','male'),(32,'Alma','Telatovic','Alma','$2b$10$2hRVjTgDV9RVTbnpAKaWu.7EOcmB7/FnMTwp2NGIPDmXDVGjuCFw.','telatovic@gmail.com','Travnik Kalibunar bb','USER','female'),(33,'Ermin','Alagic','Erma','$2b$10$iUUOGIK1F/mQDRvx7weZSuYXaPUMkm85YlIQLHEsxvc5cvDc62Hqy','ermin999@gmail.com','Strojsmajerova ulica Zenica','USER','male'),(35,'Keno','Smajlovic','Keno','$2b$10$jKp6lfqLPkxNRfbg0Xzfou2Mu.UgNBEz.eloxJVQmhetRXkYC/292','keno.smajl123@gmail.com','Tuzla Simin Han bb','USER','male'),(36,'Arnes','Selman','Arnes','$2b$10$.YW41BZfKnDFqyRjLUiSw.VHrx1vVahKpRd7XgER7vI6oHz5mfa4W','arnes123gmail.com','Travnik Kalibunar','USER','male'),(37,'Emina','Ibranović','Minka','$2b$10$6CKruWG7WtVbTHhDOwx05OvlsQ4E.f7qlFT03THc5Tq.5sXWOjFHy','emina.ibranovic@live.com','Dolac bb','USER','female');
/*!40000 ALTER TABLE `user_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'clothes'
--
/*!50003 DROP PROCEDURE IF EXISTS `ProductAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductAddOrEdit`(
IN _id INT,
IN _name varchar(60),
IN _color varchar(120),
IN _color_2 varchar(120),
IN _price decimal(5,2),
IN _image varchar(520),
IN _image_2 varchar(582),
IN _create_date timestamp ,
IN _soldInd varchar(2),
IN _clothesCategoryId int,
IN _brandId int,
IN _collectionId int,
IN _description varchar(260),
IN _details varchar(260),
IN _productQuantity int,
IN _rating int


)
BEGIN
  

  IF _id = 0  THEN 
  INSERT INTO clothes_product (name ,color, color_2, price, image, image_2, create_date, soldInd,
 clothesCategoryId, brandId, collectionId, description, details, productQuantity, rating )
  VALUES( _name, _color, _color_2, _price, _image, _image_2, _create_date, _soldInd,
 _clothesCategoryId, _brandId, _collectionId, _description, _details, _productQuantity, _rating);
   
  SET _id = last_insert_id();
  else
  UPDATE clothes_product
  SET 
  name = _name,
  color = _color,
  color_2 = _color_2,
  price = _price,
  image = _image,
  image_2 = _image_2,
  create_date = _create_date,
  soldInd = _soldInd,
  clothesCategoryId = _clothesCategoryId,
  brandId = _brandId,
  collectionId = _collectionId,
  description = _description,
  details = _details,
  productQuantity = _productQuantity,
  rating = _rating
  where id = _id;
END IF;

select _id AS 'id';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `User_AddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `User_AddOrEdit`(
IN _id INT,
IN _firstName varchar(60),
IN _lastName varchar(60),
IN _username varchar(60),
IN _pasword varchar(90),
IN _email varchar(120),
IN _adress varchar(216),
IN _role varchar(45),
IN _gender varchar(45)
)
BEGIN
  IF _id = 0 THEN 
  INSERT INTO user_ (firstName,lastName, username, pasword, email, adress, role, gender)
  VALUES(_firstName, _lastName, _username, _pasword, _email, _adress, _role, _gender);
  
  SET _id = last_insert_id();
  else
  UPDATE user_
  SET 
  firstName = _firstName,
  lastName = _lastName,
  username = _username,
  pasword = _pasword,
  email = _email,
  adress = _adress,
  role = _role,
  gender = _gender
  where id = _id;
END IF;
 
 select _id AS 'id';
 
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

-- Dump completed on 2021-07-21 18:59:14
