-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: tech_blog
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `ptitle` varchar(150) NOT NULL,
  `pcontent` longtext,
  `pcode` longtext,
  `ppic` varchar(100) DEFAULT NULL,
  `pdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cateid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cateid` (`cateid`),
  KEY `userid` (`userid`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cateid`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'What is collection FrameWork?','A collection FrameWork is a way of manner to arrange data that we can easily access and modify.','No','1.jpg','2023-10-05 06:38:50',1,1),(2,'Whta is DataStructure?','A data structure is a storage that is used to store and organize data. It is a way of arranging data on a computer so that it can be accessed and updated efficiently. A data structure is not only used for organizing the data. It is also used for processing, retrieving, and storing data.','NO','3.jpeg','2023-10-05 06:57:42',3,1),(3,'What is For loop ?','A for loop is used for iterating over a sequence that is either a list, a tuple, a dictionary, a set, or a string.','fruits = [\"apple\", \"banana\", \"cherry\"]\r\nfor x in fruits:\r\n  print(x)','2.jpeg','2023-10-05 08:00:06',2,1),(4,'What is linked list?','Linked List is a linear data structure, in which elements are not stored at a contiguous location, rather they are linked using pointers. Linked List forms a series of connected nodes, where each node stores the data and the address of the next node.','public void push(int new_data)\r\n{\r\n    /* 1 & 2: Allocate the Node &\r\n              Put in the data*/\r\n    Node new_node = new Node(new_data);\r\n \r\n    /* 3. Make next of new Node as head */\r\n    new_node.next = head;\r\n \r\n    /* 4. Move the head to point to new Node */\r\n    head = new_node;\r\n}','Singlelinkedlist.png','2023-10-05 08:16:44',3,1),(5,'What is HashMap ?','HashMap is the part of collection framework which contain\r\ndata form a key value pair and order is not preserved.','no','3.jpeg','2023-10-07 10:38:34',1,1),(6,'What is SQL?','SQL is a Structured Programming Language Which is used for easily manipulating and access data from the database.it is interact with database.','','6554783.jpg','2023-10-08 09:34:08',4,2);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16 10:46:37
