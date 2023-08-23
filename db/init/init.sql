-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: matp
-- ------------------------------------------------------
-- Server version	8.0.29

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

create database matp;
use matp;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `tel_number` varchar(13) DEFAULT NULL COMMENT '연락처',
  `auth` varchar(4) DEFAULT NULL COMMENT '인증번호',
  `expire` varchar(100) DEFAULT NULL COMMENT '만료시간',
  `ok` tinyint(1) DEFAULT NULL COMMENT '인증완료',
  PRIMARY KEY (`no`),
  UNIQUE KEY `auth_UN` (`tel_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,'01073383966','2601','1691998479874',NULL);
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_no` bigint NOT NULL AUTO_INCREMENT COMMENT '게시판 번호',
  `user_no` bigint NOT NULL COMMENT '회원 번호',
  `board_title` varchar(100) NOT NULL COMMENT '제목',
  `board_content` text NOT NULL COMMENT '내용',
  `img` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`board_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `users` (`user_no`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,3,'adf','asdfasdfsdaf','[{\"url\": \"/img/화면 캡처 2023-05-06 221416_1691998635612.png\", \"filename\": \"화면 캡처 2023-05-06 221416_1691998635612.png\"}]','2023-08-14 07:37:15','2023-08-14 07:37:15');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_files`
--

DROP TABLE IF EXISTS `board_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_files` (
  `board_files_no` bigint NOT NULL AUTO_INCREMENT COMMENT '첨부파일 번호',
  `board_no` bigint NOT NULL COMMENT '게시판 번호',
  `board_files_ori_nm` text NOT NULL COMMENT '원본명',
  `board_files_up_nm` text NOT NULL COMMENT '업로드명',
  PRIMARY KEY (`board_files_no`),
  KEY `board_no` (`board_no`),
  CONSTRAINT `board_files_ibfk_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_files`
--

LOCK TABLES `board_files` WRITE;
/*!40000 ALTER TABLE `board_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_no` bigint NOT NULL AUTO_INCREMENT COMMENT '댓글 번호',
  `board_no` bigint NOT NULL COMMENT '게시판 번호',
  `user_no` bigint NOT NULL COMMENT '회원 번호',
  `comment_content` text NOT NULL COMMENT '내용',
  `create_dt` datetime NOT NULL COMMENT '등록일자',
  `update_dt` datetime NOT NULL COMMENT '수정일자',
  `comment_del` tinyint NOT NULL COMMENT '삭제',
  PRIMARY KEY (`comment_no`),
  KEY `board_no` (`board_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_no`) REFERENCES `users` (`user_no`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_category`
--

DROP TABLE IF EXISTS `food_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_category` (
  `food_ctgr_no` bigint NOT NULL AUTO_INCREMENT COMMENT '음식 종류 번호',
  `food_ctgr_nm` varchar(100) NOT NULL COMMENT '음식 종류 명',
  PRIMARY KEY (`food_ctgr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_category`
--

LOCK TABLES `food_category` WRITE;
/*!40000 ALTER TABLE `food_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtags`
--

DROP TABLE IF EXISTS `hashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(15) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtags`
--

LOCK TABLES `hashtags` WRITE;
/*!40000 ALTER TABLE `hashtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `hashtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_no` bigint NOT NULL AUTO_INCREMENT COMMENT '메뉴 번호',
  `store_no` bigint NOT NULL COMMENT '가게 번호',
  `food_ctgr_no` bigint NOT NULL COMMENT '음식 종류 번호',
  `menu_nm` varchar(100) NOT NULL COMMENT '메뉴 명',
  `menu_price` double NOT NULL COMMENT '가격',
  PRIMARY KEY (`menu_no`),
  KEY `store_no` (`store_no`),
  KEY `food_ctgr_no` (`food_ctgr_no`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`store_no`) REFERENCES `stores` (`store_no`),
  CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`food_ctgr_no`) REFERENCES `food_category` (`food_ctgr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_imgs`
--

DROP TABLE IF EXISTS `menu_imgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_imgs` (
  `menu_imgs_no` bigint NOT NULL AUTO_INCREMENT COMMENT '메뉴 이미지 번호',
  `menu_no` bigint NOT NULL COMMENT '메뉴 번호',
  `menu_imgs_ori_nm` text NOT NULL COMMENT '원본 명',
  `menu_imgs_up_nm` text NOT NULL COMMENT '업로드 명',
  PRIMARY KEY (`menu_imgs_no`),
  KEY `menu_no` (`menu_no`),
  CONSTRAINT `menu_imgs_ibfk_1` FOREIGN KEY (`menu_no`) REFERENCES `menu` (`menu_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_imgs`
--

LOCK TABLES `menu_imgs` WRITE;
/*!40000 ALTER TABLE `menu_imgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_imgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `rgn_no` bigint NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) NOT NULL,
  PRIMARY KEY (`rgn_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'서울'),(2,'부산'),(3,'대구'),(4,'울산'),(5,'인천'),(6,'경기도'),(7,'강원도'),(8,'충청도'),(9,'전라도'),(10,'경상도');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_imgs`
--

DROP TABLE IF EXISTS `review_imgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_imgs` (
  `review_imgs_no` bigint NOT NULL AUTO_INCREMENT COMMENT '리뷰 이미지 번호',
  `review_no` bigint NOT NULL COMMENT '리뷰 등록번호',
  `review_imgs_ori_nm` text NOT NULL COMMENT '원본명',
  `review_imgs_up_nm` text NOT NULL COMMENT '업로드명',
  PRIMARY KEY (`review_imgs_no`),
  KEY `review_no` (`review_no`),
  CONSTRAINT `review_imgs_ibfk_1` FOREIGN KEY (`review_no`) REFERENCES `reviews` (`review_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_imgs`
--

LOCK TABLES `review_imgs` WRITE;
/*!40000 ALTER TABLE `review_imgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_imgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_no` bigint NOT NULL AUTO_INCREMENT COMMENT '리뷰 등록번호',
  `store_no` bigint NOT NULL COMMENT '가게 번호',
  `user_no` bigint NOT NULL COMMENT '회원 번호',
  `review_content` varchar(255) NOT NULL COMMENT '리뷰 내용',
  `star_cnt` float NOT NULL COMMENT '별점',
  `review_del` tinyint NOT NULL COMMENT '삭제',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`review_no`),
  KEY `store_no` (`store_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`store_no`) REFERENCES `stores` (`store_no`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_no`) REFERENCES `users` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `store_no` bigint NOT NULL AUTO_INCREMENT COMMENT '가게번호',
  `rgn_no` bigint NOT NULL COMMENT '지역번호',
  `store_nm` varchar(100) NOT NULL COMMENT '가게 이름',
  `store_addr` varchar(100) NOT NULL COMMENT '가게 주소',
  `store_detail_addr` varchar(100) NOT NULL COMMENT '가게 상세 주소',
  `store_tel` varchar(13) DEFAULT NULL COMMENT '가게 전화',
  `store_content` text COMMENT '가게 설명',
  `store_wkd_time` varchar(100) DEFAULT NULL COMMENT '평일 영업시간',
  `store_wknd_time` varchar(100) DEFAULT NULL COMMENT '주말 영업시간',
  `store_break_time` varchar(100) DEFAULT NULL COMMENT '쉬는 시간',
  `store_view_cnt` int DEFAULT NULL COMMENT '좋아요 수',
  `store_del` tinyint NOT NULL COMMENT '삭제 여부',
  `img` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`store_no`),
  UNIQUE KEY `uk_name` (`store_tel`),
  KEY `rgn_no` (`rgn_no`),
  CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`rgn_no`) REFERENCES `regions` (`rgn_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (10,1,'미라이','서울','서울특별시 강남구 논현로 153길 24 끌레르빌 1F','02-540-0934','이자카야/오뎅/꼬치','18:00~01:00','18:00~01:00','-',NULL,1,'[{\"url\": \"/img/mirai_1691999826974.jpeg\", \"filename\": \"mirai_1691999826974.jpeg\"}, {\"url\": \"/img/mirai1_1691999826975.jpeg\", \"filename\": \"mirai1_1691999826975.jpeg\"}, {\"url\": \"/img/mirai2_1691999826976.jpeg\", \"filename\": \"mirai2_1691999826976.jpeg\"}, {\"url\": \"/img/mirai3_1691999826977.jpeg\", \"filename\": \"mirai3_1691999826977.jpeg\"}, {\"url\": \"/img/mirai4_1691999826978.jpeg\", \"filename\": \"mirai4_1691999826978.jpeg\"}]','2023-08-14 07:57:06','2023-08-14 07:57:06'),(11,2,'비비비당','부산','부산광역시 해운대구 달맞이길 239-16','051-746-0705','카페/디저트','10:30 - 22:00','10:30 - 22:00','-',NULL,1,'[{\"url\": \"/img/bibibidang_1691999910372.jpg\", \"filename\": \"bibibidang_1691999910372.jpg\"}, {\"url\": \"/img/bibibidang1_1691999910373.jpg\", \"filename\": \"bibibidang1_1691999910373.jpg\"}, {\"url\": \"/img/bibibidang2_1691999910375.jpg\", \"filename\": \"bibibidang2_1691999910375.jpg\"}, {\"url\": \"/img/bibibidang3_1691999910375.jpg\", \"filename\": \"bibibidang3_1691999910375.jpg\"}, {\"url\": \"/img/bibibidang4_1691999910378.jpg\", \"filename\": \"bibibidang4_1691999910378.jpg\"}]','2023-08-14 07:58:30','2023-08-14 07:58:30'),(12,3,'주토피아','대구','대구광역시 중구 동덕로30길 141','057-1313-6549','이탈리안','09:00~22:00','09:00~22:00','-',NULL,1,'[{\"url\": \"/img/jutopia_1692000038608.jpg\", \"filename\": \"jutopia_1692000038608.jpg\"}, {\"url\": \"/img/jutopia1_1692000038608.jpg\", \"filename\": \"jutopia1_1692000038608.jpg\"}, {\"url\": \"/img/jutopia2_1692000038609.jpg\", \"filename\": \"jutopia2_1692000038609.jpg\"}, {\"url\": \"/img/jutopia3_1692000038610.jpg\", \"filename\": \"jutopia3_1692000038610.jpg\"}, {\"url\": \"/img/jutopia4_1692000038611.jpg\", \"filename\": \"jutopia4_1692000038611.jpg\"}]','2023-08-14 08:00:38','2023-08-14 08:00:38'),(13,4,'풍로옥','울산','울산광역시 남구 돋질로239번길 6','052-266-0210','국수/면 요리','11:30 - 21:00','11:30 - 21:00','14:40 - 17:00',NULL,1,'[{\"url\": \"/img/ulsan_1692000197804.jpg\", \"filename\": \"ulsan_1692000197804.jpg\"}, {\"url\": \"/img/ulsan1_1692000197804.jpg\", \"filename\": \"ulsan1_1692000197804.jpg\"}, {\"url\": \"/img/ulsan2_1692000197805.jpg\", \"filename\": \"ulsan2_1692000197805.jpg\"}, {\"url\": \"/img/ulsan3_1692000197805.jpg\", \"filename\": \"ulsan3_1692000197805.jpg\"}, {\"url\": \"/img/ulsan4_1692000197806.jpg\", \"filename\": \"ulsan4_1692000197806.jpg\"}]','2023-08-14 08:03:17','2023-08-14 08:03:17'),(14,5,'엘벧엘','인천','인천광역시 연수구 아트센터대로 203 135호','010-5025-7490','퓨전 중식','11:30~22:00','11:30~22:00','15:00~17:30',NULL,1,'[{\"url\": \"/img/incheon_1692768470402.jpg\", \"filename\": \"incheon_1692768470402.jpg\"}, {\"url\": \"/img/incheon1_1692768470406.jpg\", \"filename\": \"incheon1_1692768470406.jpg\"}, {\"url\": \"/img/incheon2_1692768470413.jpg\", \"filename\": \"incheon2_1692768470413.jpg\"}, {\"url\": \"/img/incheon3_1692768470418.jpg\", \"filename\": \"incheon3_1692768470418.jpg\"}, {\"url\": \"/img/incheon4_1692768470420.jpg\", \"filename\": \"incheon4_1692768470420.jpg\"}]','2023-08-23 05:27:50','2023-08-23 05:27:50'),(15,6,'만돈','경기도','경기도 고양시 일산동구 정발산로 24 B동 2F 225-226호','	031-901-9463','까스 요리','11:30~21:00','11:30~21:30','15:00~17:00',NULL,1,'[{\"url\": \"/img/gyeonggi_1692768667695.jpeg\", \"filename\": \"gyeonggi_1692768667695.jpeg\"}, {\"url\": \"/img/gyeonggi1_1692768667698.jpg\", \"filename\": \"gyeonggi1_1692768667698.jpg\"}, {\"url\": \"/img/gyeonggi2_1692768667704.jpg\", \"filename\": \"gyeonggi2_1692768667704.jpg\"}, {\"url\": \"/img/gyeonggi3_1692768667707.jpg\", \"filename\": \"gyeonggi3_1692768667707.jpg\"}, {\"url\": \"/img/gyeonggi4_1692768667711.jpeg\", \"filename\": \"gyeonggi4_1692768667711.jpeg\"}]','2023-08-23 05:31:07','2023-08-23 05:31:07'),(16,7,'속초붉은대게수산','강원도','강원도 속초시 중앙시장로6길 14-1 속초중앙시장 77호','033-633-6444','해산물 요리','10:00~20:00','10:00~20:00','-',NULL,1,'[{\"url\": \"/img/gangwon_1692768759090.jpeg\", \"filename\": \"gangwon_1692768759090.jpeg\"}, {\"url\": \"/img/gangwon1_1692768759092.jpg\", \"filename\": \"gangwon1_1692768759092.jpg\"}, {\"url\": \"/img/gangwon2_1692768759094.jpg\", \"filename\": \"gangwon2_1692768759094.jpg\"}, {\"url\": \"/img/gangwon3_1692768759097.jpg\", \"filename\": \"gangwon3_1692768759097.jpg\"}, {\"url\": \"/img/gangwon4_1692768759099.jpg\", \"filename\": \"gangwon4_1692768759099.jpg\"}]','2023-08-23 05:32:39','2023-08-23 05:32:39'),(17,8,'충청도순대','충청도','충청북도 단양군 단양읍 도전5길 37','043-421-1378','탕/찌개/전골','09:00~21:00','09:00~21:00','-',NULL,1,'[{\"url\": \"/img/chungcheong_1692768860838.jpeg\", \"filename\": \"chungcheong_1692768860838.jpeg\"}, {\"url\": \"/img/chungcheong1_1692768860840.jpg\", \"filename\": \"chungcheong1_1692768860840.jpg\"}, {\"url\": \"/img/chungcheong2_1692768860842.jpeg\", \"filename\": \"chungcheong2_1692768860842.jpeg\"}, {\"url\": \"/img/chungcheong3_1692768860844.jpeg\", \"filename\": \"chungcheong3_1692768860844.jpeg\"}, {\"url\": \"/img/chungcheong4_1692768860847.jpg\", \"filename\": \"chungcheong4_1692768860847.jpg\"}]','2023-08-23 05:34:20','2023-08-23 05:34:20'),(18,9,'성식당','전라도','전라남도 목포시 수강로4번길 6','061-244-1401','한정식/백반/정통한식','11:00~20:00','11:00~20:00','-',NULL,1,'[{\"url\": \"/img/jeolla_1692769057235.jpg\", \"filename\": \"jeolla_1692769057235.jpg\"}, {\"url\": \"/img/jeolla1_1692769057237.jpg\", \"filename\": \"jeolla1_1692769057237.jpg\"}, {\"url\": \"/img/jeolla2_1692769057240.jpg\", \"filename\": \"jeolla2_1692769057240.jpg\"}, {\"url\": \"/img/jeolla3_1692769057241.jpg\", \"filename\": \"jeolla3_1692769057241.jpg\"}, {\"url\": \"/img/jeolla4_1692769057243.jpeg\", \"filename\": \"jeolla4_1692769057243.jpeg\"}]','2023-08-23 05:37:37','2023-08-23 05:37:37'),(19,10,'여우주막','경상도','서울특별시 성동구 마조로 15-8','010-2282-6960','일반주점','16:00~02:00','16:00~02:00','-',NULL,1,'[{\"url\": \"/img/gyeongsangdo_1692769150371.jpeg\", \"filename\": \"gyeongsangdo_1692769150371.jpeg\"}, {\"url\": \"/img/gyeongsangdo1_1692769150373.jpg\", \"filename\": \"gyeongsangdo1_1692769150373.jpg\"}, {\"url\": \"/img/gyeongsangdo2_1692769150376.jpg\", \"filename\": \"gyeongsangdo2_1692769150376.jpg\"}, {\"url\": \"/img/gyeongsangdo3_1692769150379.jpg\", \"filename\": \"gyeongsangdo3_1692769150379.jpg\"}, {\"url\": \"/img/gyeongsangdo4_1692769150380.jpg\", \"filename\": \"gyeongsangdo4_1692769150380.jpg\"}]','2023-08-23 05:39:10','2023-08-23 05:39:10');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `user_type_no` bigint NOT NULL AUTO_INCREMENT COMMENT '회원유형 번호',
  `user_type_nm` varchar(20) NOT NULL COMMENT '회원유형 명',
  PRIMARY KEY (`user_type_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'1');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_no` bigint NOT NULL AUTO_INCREMENT COMMENT '유저번호',
  `user_type_no` bigint NOT NULL COMMENT '회원 유형 번호',
  `user_id` varchar(50) NOT NULL COMMENT '아이디',
  `user_pwd` varchar(255) NOT NULL COMMENT '비밀번호',
  `user_nm` varchar(50) NOT NULL COMMENT '이름',
  `user_nick` varchar(50) NOT NULL COMMENT '닉네임',
  `user_img` varchar(255) DEFAULT NULL COMMENT '프로필 사진',
  `user_gender` varchar(4) DEFAULT NULL COMMENT '성별',
  `user_birthday` datetime NOT NULL COMMENT '생일',
  `user_tel` varchar(13) DEFAULT NULL COMMENT '연락처',
  `user_addr` varchar(100) NOT NULL COMMENT '주소',
  `user_addr_detail` text COMMENT '상세주소',
  `user_email` varchar(60) DEFAULT NULL COMMENT '이메일',
  `user_leave` tinyint NOT NULL DEFAULT '0' COMMENT '회원탈퇴여부',
  `snsId` varchar(50) DEFAULT NULL,
  `provider` enum('local','kakao') NOT NULL DEFAULT 'local',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`user_no`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `user_nick` (`user_nick`),
  KEY `user_type_no` (`user_type_no`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_no`) REFERENCES `user_type` (`user_type_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,1,'admin','$2b$12$hD9r4.Vc7tGZ4nzzsndmJ.AIreymFMcuUnvbd2osBYZGy6x7lCFGC','이준영','이준영',NULL,'남자','1997-10-18 00:00:00','01073383988','북구',NULL,'wnsdud96908@naver.com',1,NULL,'local','2023-08-14 07:36:33','2023-08-14 07:36:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_list` (
  `wish_no` bigint NOT NULL AUTO_INCREMENT COMMENT '즐겨찾기 번호',
  `store_no` bigint NOT NULL COMMENT '가게 번호',
  `user_no` bigint NOT NULL COMMENT '회원 번호',
  PRIMARY KEY (`wish_no`),
  KEY `store_no` (`store_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `wish_list_ibfk_1` FOREIGN KEY (`store_no`) REFERENCES `stores` (`store_no`),
  CONSTRAINT `wish_list_ibfk_2` FOREIGN KEY (`user_no`) REFERENCES `users` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list`
--

LOCK TABLES `wish_list` WRITE;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-23 14:50:16
