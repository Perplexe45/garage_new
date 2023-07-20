-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: garage
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `avis`
--

DROP TABLE IF EXISTS `avis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idemploye_id` int DEFAULT NULL,
  `commentaire` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` int NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceptation` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F91ABF0CC1F4FA8` (`idemploye_id`),
  CONSTRAINT `FK_8F91ABF0CC1F4FA8` FOREIGN KEY (`idemploye_id`) REFERENCES `employe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avis`
--

LOCK TABLES `avis` WRITE;
/*!40000 ALTER TABLE `avis` DISABLE KEYS */;
INSERT INTO `avis` VALUES (1,2,'Y a pas à dire. C\'est un super garage. Les employés sont efficaces et niveau tarif, ils sont très interessant.',4,'Asselin',1),(2,6,'Ils ont des superbes voitures à vendre et bon marché.',4,'Durand',1),(3,2,'Je suis content de leurs services. Ils fonctionnent très bien et leurs voitures à vendre sont pas cher.',5,'Macron',1),(6,23,'Garage bien sympathique qui fait un grand effort pour nous acueillir. C\'est peut-être aussi parce que je suis une célébrité, allez savoir.',3,'Mireille Mathieu',1),(7,NULL,'Pourquoi j\'ai attendu si longtemps avant qu\'un mécanicien vienne voir ma voiture qui était en panne',1,'Elise Marsouaillet',1),(8,NULL,'Je fais un test avec Elise qui voudrait acheter la doche qui lui rapelle lorsque ses parents l\'enmenait faire des pique-nique à la campagne lorsqu\'elle était tout petite',4,'Elise Marsouaillet',1),(9,21,'garage bien accueillant. Le personnel est bien sympathique et dévoué.',2,'Lampion Gérard',1),(10,NULL,'Les voitures d\'occasions sont trop cher. Pouvez-vous faire un effort pour les faire baisser',4,'Asselin',1),(11,NULL,'Je voudrais bien la 2 CV si elle est encore en vente. Sinon le garage est pas mal',3,'Durand',1),(12,NULL,'Cool les anciennes voitures. Je vais peut-être acheter la 2 CV. ',5,'Guillaume Tell',1);
/*!40000 ALTER TABLE `avis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idemploye_id` int DEFAULT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `idvoiture_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C62E638CC1F4FA8` (`idemploye_id`),
  KEY `IDX_4C62E638CC28B580` (`idvoiture_id`),
  CONSTRAINT `FK_4C62E638CC1F4FA8` FOREIGN KEY (`idemploye_id`) REFERENCES `employe` (`id`),
  CONSTRAINT `FK_4C62E638CC28B580` FOREIGN KEY (`idvoiture_id`) REFERENCES `voiture` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,21,'Asselin','Alain','alain.asselin@laposte.net','0628069545','Je suis interessé par une de vos voitures',NULL),(2,2,'Macron','Emmanuel','emmanuelmarcron@free.fr','0205040608','Je suis interessé par une de vos voitures',1),(3,2,'Beauchamps','eric','eric.beauchamps@free.fr','0254363789','Je cherche une voiture d\'occasion en bon état.',NULL),(4,23,'Asselin','Alain','alain.asselin@laposte.net','0628069545','Je suis interessé par une de vos voitures',NULL),(17,NULL,'Depardieu','Gérard','depardieugerard@laposte.net','0565986534','Je veux absolument cette voiture. Veuillez me la réserver.',5),(19,NULL,'Petit','Jean François','petit.jeanfrancois@gmail.com','06.25.24.36.24','Test avec Monsieur Petit Jean François',NULL),(20,NULL,'Lampion','Arthur','arthur.lampion@free.fr','0205040608','test avec lampion',3),(21,NULL,'Defunes','Louis','defunes@gmail.com','02.25.63.54.51','test avec Loui de Funes',5),(22,NULL,'Petit','Jean François','petit.jeanfrancois@gmail.com','02.25.63.54.51','Super la 4L jaune',2),(23,24,'Asselin','Alain','asselin@free.fr','06.28.26.88.62','J\'aimerais bien avoir cette 207',5),(24,NULL,'Defunes','Louis','defunes@gmail.com','02.25.63.54.51','De mon vivant, j\'aurais bien aimé avoir la 207',2),(25,NULL,'Beneteau','jean','beneteau@orange.fr','0102030405','Je voudrais prendre RDV avec un commercial',1),(26,NULL,'Test Formulaire','Accueil','testform@gmail.com','0908070605','Je fais un test sur le form d\'accueil',NULL),(27,NULL,'Defunes','Louis','defunes@gmail.com','02.25.63.54.51','J\'aurais voulu la 4L lorsque j\'étais encore dans ce monde.',3),(28,NULL,'Dupond','Jean','jeandupond@gmail.com','0102030405','Mr Dupond veut qu\'on le rapelle',NULL),(30,NULL,'Dupond','Eric','duponderic@gmail.com','0625023698','Je veux absolument la 207. Réservez-la moi, s\'il vous plait.Elle me plait de trop',5),(31,NULL,'Berhelot','Brigitte','berthelot.brigite@sfr.fr','02.54.68.54.95','Je voudrais une voiture qui soit bon marché. En avez-vous une dans votre garage ?',NULL);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idservice_id` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6DE4402620F5B4DC` (`idservice_id`),
  CONSTRAINT `FK_6DE4402620F5B4DC` FOREIGN KEY (`idservice_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230602150220','2023-06-02 17:03:20',13771),('DoctrineMigrations\\Version20230606144457','2023-06-06 16:45:26',20178),('DoctrineMigrations\\Version20230607184944','2023-06-07 20:49:57',516),('DoctrineMigrations\\Version20230608082739','2023-06-08 10:27:57',6270),('DoctrineMigrations\\Version20230608091704','2023-06-08 11:30:05',4344),('DoctrineMigrations\\Version20230608092521','2023-06-08 11:32:06',1864),('DoctrineMigrations\\Version20230608093625','2023-06-08 11:44:52',1),('DoctrineMigrations\\Version20230608094558','2023-06-08 11:56:31',5245),('DoctrineMigrations\\Version20230608132353','2023-06-08 15:25:07',4338),('DoctrineMigrations\\Version20230608133232','2023-06-08 15:32:46',383),('DoctrineMigrations\\Version20230614094802','2023-06-14 11:48:24',7920),('DoctrineMigrations\\Version20230614101135','2023-06-14 12:11:46',2577),('DoctrineMigrations\\Version20230614163852','2023-06-14 18:39:07',4920),('DoctrineMigrations\\Version20230615032554','2023-06-15 05:26:11',5565),('DoctrineMigrations\\Version20230615094225','2023-06-15 11:48:46',913),('DoctrineMigrations\\Version20230615094821',NULL,NULL),('DoctrineMigrations\\Version20230616082442',NULL,NULL),('DoctrineMigrations\\Version20230616091425','2023-06-16 11:15:25',456),('DoctrineMigrations\\Version20230616095945','2023-06-16 12:00:04',291),('DoctrineMigrations\\Version20230620081549','2023-06-20 10:16:03',2980),('DoctrineMigrations\\Version20230623092506','2023-06-23 11:31:35',566),('DoctrineMigrations\\Version20230627143734','2023-06-28 10:35:41',1168),('DoctrineMigrations\\Version20230628074256','2023-06-28 10:35:43',3060),('DoctrineMigrations\\Version20230628075639','2023-06-28 10:41:06',2878),('DoctrineMigrations\\Version20230628101357','2023-06-28 12:23:53',3442),('DoctrineMigrations\\Version20230630064241','2023-06-30 08:49:53',7219),('DoctrineMigrations\\Version20230704064757','2023-07-04 08:50:35',408),('DoctrineMigrations\\Version20230704071419','2023-07-04 09:18:02',2990),('DoctrineMigrations\\Version20230704075917','2023-07-04 10:10:24',3018),('DoctrineMigrations\\Version20230705063315','2023-07-05 09:03:15',4977),('DoctrineMigrations\\Version20230705134827','2023-07-05 15:58:43',479),('DoctrineMigrations\\Version20230706082425','2023-07-06 10:33:52',2213),('DoctrineMigrations\\Version20230706144136','2023-07-06 17:06:08',1388),('DoctrineMigrations\\Version20230706151059','2023-07-06 17:34:10',2463);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` int NOT NULL,
  `ville` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint DEFAULT NULL,
  `confirm_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F804D3B9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (2,'aasselin@free.fr','{\"role\": \"ROLE_ADMIN\"}','$2y$13$nDroRy1lwlOOEraucZ3d7Oo1nUr1m7NqFJZp68Nb8zGjHUoNn3TFK','Asselin','Alain','19 rue de Larcay',37550,'Saint Avertin','0628069545',1,''),(6,'vincent@free.fr','{\"role\": \"ROLE_ADMIN\"}','$2y$13$l1DxGvlIie9wH2uphUBtse84uxUPGc0m7MP2d3gP064Hfh8CjsMW2','Vincent','Parrot','15 rue du garage',31000,'Toulouse','02.54.36.25.21',1,''),(21,'arthur.lampion@free.fr','[]','$2y$13$aHaZjmQvRWePIVqIwRF/9O2uz90YbXLEPrM6LHoE3FGhP3ZpZxrhu','Lampion','Arthur','25 rue du lampion',37000,'Tours','0205040608',NULL,''),(23,'jeandumont@free.fr','[]','$2y$13$CWNjLkGLXvwib3VJdY8FmeCF5BufJWuIZdELzSDEUiTbg0GBK/vVW','dumont','jean','5 rue du bac à sable',41000,'Blois','0985632514',NULL,NULL),(24,'macron.emmanuel@orange.fr','[]','$2y$13$CHhmx4YH0BPjKc/GZhrIpuivVQXJsRqg37/qQJBH9LvVA7g3xi8rC','Macron','Emmanuel','25 rue de l\'Elysée',75000,'Paris','0605040605',NULL,NULL),(25,'chirac@free.fr','[]','$2y$13$ejwx5v9OXIpXjM/8kXgWvuoFJjk.IPt30j8.Jq/hcJk5MrwNHHr9G','Chirac','Jacques','25 rue de l\'Elysée',75000,'Paris','0605040605',NULL,NULL),(26,'thomas.rene@gmail.com','[]','$2y$13$eHSPZ/D5kIugWpT//wi38.V37qGWcd7x3ELjbQNflnO2Pd.y5ZbGa','Thomas','René','5 rue du thomas',86000,'Poitiers','0535985475',NULL,NULL);
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipement`
--

DROP TABLE IF EXISTS `equipement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipement`
--

LOCK TABLES `equipement` WRITE;
/*!40000 ALTER TABLE `equipement` DISABLE KEYS */;
INSERT INTO `equipement` VALUES (1,'Jantes en Alluminium'),(2,'Freinage ABS'),(3,'Phares LED'),(4,'Aide au démarrage en côte'),(5,'Caméra à 360 degré'),(6,'Surveillance pression des pneus'),(7,'Assistance au stationnement'),(8,'Auto Radio Bluetooth');
/*!40000 ALTER TABLE `equipement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipement_voiture`
--

DROP TABLE IF EXISTS `equipement_voiture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipement_voiture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idvoiture_id` int DEFAULT NULL,
  `idequipement_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E26FCBDCCC28B580` (`idvoiture_id`),
  KEY `IDX_E26FCBDCF9F51887` (`idequipement_id`),
  CONSTRAINT `FK_E26FCBDCCC28B580` FOREIGN KEY (`idvoiture_id`) REFERENCES `voiture` (`id`),
  CONSTRAINT `FK_E26FCBDCF9F51887` FOREIGN KEY (`idequipement_id`) REFERENCES `equipement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipement_voiture`
--

LOCK TABLES `equipement_voiture` WRITE;
/*!40000 ALTER TABLE `equipement_voiture` DISABLE KEYS */;
INSERT INTO `equipement_voiture` VALUES (1,2,6),(2,2,3),(4,1,1),(6,1,3),(9,5,7),(10,3,8),(11,5,NULL),(12,6,NULL),(13,6,NULL),(14,2,4);
/*!40000 ALTER TABLE `equipement_voiture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evocation`
--

DROP TABLE IF EXISTS `evocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idservice_id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_263AAB0420F5B4DC` (`idservice_id`),
  CONSTRAINT `FK_263AAB0420F5B4DC` FOREIGN KEY (`idservice_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evocation`
--

LOCK TABLES `evocation` WRITE;
/*!40000 ALTER TABLE `evocation` DISABLE KEYS */;
INSERT INTO `evocation` VALUES (1,1,'Vidange avec remplacement des filtres',NULL),(2,1,'Remplacement des bougies',NULL),(3,1,'Contrôle des niveaux de liquide',NULL),(4,1,'Vérification des pneus',NULL),(5,1,'Réglage des freins',NULL),(6,2,'Moteur',NULL),(7,2,'Système de transmission',NULL),(8,2,'Système de freinage',NULL),(9,2,'Système d\'échappement',NULL),(10,3,'Diagnostic suite à une panne',NULL),(11,3,'Charge de la batterie',NULL),(12,3,'Problème de climatisation',NULL),(13,3,'Défaillance du systéme démarrage',NULL),(14,4,'Réparation suite à un accident',NULL),(15,4,'Réparation des pare-chocs',NULL),(16,4,'Remise en état suite à petit acrochage',NULL),(17,5,'complète du véhicule',NULL),(18,5,'Partiel du véhicule',NULL),(19,5,'Petite retouche',NULL),(20,6,'Airbags',NULL),(21,6,'Anti-démarrage',NULL),(22,6,'Assistance à la conduite',NULL),(23,7,'Montage-équilibrage',NULL),(24,7,'Vente de pneus neufs',NULL),(25,7,'Réparation suite à crevaison',NULL),(26,3,'Panne de chauffage',NULL);
/*!40000 ALTER TABLE `evocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallerie_image`
--

DROP TABLE IF EXISTS `gallerie_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallerie_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallerie_image`
--

LOCK TABLES `gallerie_image` WRITE;
/*!40000 ALTER TABLE `gallerie_image` DISABLE KEYS */;
INSERT INTO `gallerie_image` VALUES (2,'74e80773c762485caf024c10f783554124fc5f04.png','d07369dc4414fcd528af6598c11db74f3978f7fb.png','59eccfa0818e78a5e9975898e597d03365223021.png','b1d7da3dcfa996b9f7ca722694f29e81026999bb.png','9ad3c09968314865888ca88a2c13232e562def4c.png','fe916700a8f121b821056d1a0b21c9cec85d61e2.png','2 CV'),(3,'30270abc6de5faa977a3f8ceee0bc4cba96abf87.png','007b1e8c23082722024359d1f764cfcdec42f4db.png','ba67e7aad86c8046d4c87286234f979b1cc2682b.png','584a92f6cb266b7c3a15067b60e3dcd70b968107.png','b9f7454f1435268382f8f533af4d6ba115c4f532.png','8981e9e67728595082c35a53530d3a97cc5293ca.png','Renault5'),(4,'8071b42efc0f2527fbc9f0d1583ead1f7389cb7d.png','55f04827dcf9801fa4692c902a30194ec3c776b7.png','4d930b7f45b4824b9f97d84b01f6c3e4e68d0488.png','a30bcb07da3c9ef4a9c89b6cc3eae6bff46af1b1.png','1466320815e90891427cdc403d407e714b48a0b2.png','9afb5fba487a77dc489b8428d56bf0c5e6a6bdec.png','4L'),(5,'666a8da9dc062f771419379229f94dc054e36dd3.png','8967816070cb028d3a9f06112112c06e71748844.png','6eb0b62fa370eb312a5ab181094cc42a8acdbf0d.png','c3fd58e6f4f3beef2c4635806574b0500db14a24.png','a47bb1bb8713614dd74d69d4970b9fb72f69b420.png','6fbd06d0ac287e8c230be545b60bcf01870f88c8.png','207-Grise'),(6,'d06605f361f8d7fbae2ecf3d28f0d2d4209e582f.png','d3ca30d35d97c76abe4c6a976fcd6ae494a8ea76.png','328597d710bcd96639409fd3674e3afce60a662e.png','7550940aa7dafb80026842c942d95f7d85b37f5f.png','fa06456cc27956336a36ff683d4490e841f44a97.png','abf09edb393094cbdd6b266b87185e05f9f9a4a3.png','2008 orange');
/*!40000 ALTER TABLE `gallerie_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horaire`
--

DROP TABLE IF EXISTS `horaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idemploye_id` int DEFAULT NULL,
  `jour_semaine` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caracteristique` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BBC83DB6CC1F4FA8` (`idemploye_id`),
  CONSTRAINT `FK_BBC83DB6CC1F4FA8` FOREIGN KEY (`idemploye_id`) REFERENCES `employe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horaire`
--

LOCK TABLES `horaire` WRITE;
/*!40000 ALTER TABLE `horaire` DISABLE KEYS */;
INSERT INTO `horaire` VALUES (1,NULL,'Lundi','09h00 - 12h00      | |      14h30 - 19h00'),(2,NULL,'Mardi','09h00 - 12h00   | |   14h30 - 19h00'),(3,NULL,'Mercredi','09h00 - 12h00   | |   14h30 - 19h00'),(4,NULL,'jeudi','09h00 - 12h00   | |   14h30 - 19h00'),(5,NULL,'Vendredi','09h00 - 12h00   | |   14h30 - 17h00'),(6,NULL,'Samedi','09h00 - 12h00   | |   après-midi : Fermé'),(7,NULL,'Dimanche','Fermé');
/*!40000 ALTER TABLE `horaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_speciale`
--

DROP TABLE IF EXISTS `info_speciale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_speciale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idemploye_id` int DEFAULT NULL,
  `designation` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C1A0D9CDCC1F4FA8` (`idemploye_id`),
  CONSTRAINT `FK_C1A0D9CDCC1F4FA8` FOREIGN KEY (`idemploye_id`) REFERENCES `employe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_speciale`
--

LOCK TABLES `info_speciale` WRITE;
/*!40000 ALTER TABLE `info_speciale` DISABLE KEYS */;
INSERT INTO `info_speciale` VALUES (2,NULL,'Info spéciale :  le garage sera ouvert le mardi 15 août toute la journée. Notre personnel sera donc à votre service.');
/*!40000 ALTER TABLE `info_speciale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
INSERT INTO `marque` VALUES (1,'Peugeot'),(2,'Citroën'),(3,'Renault'),(4,'Fiat'),(5,'Wolkswagen');
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modele`
--

DROP TABLE IF EXISTS `modele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modele` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idmarque_id` int DEFAULT NULL,
  `id_marque` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_10028558363C1047` (`idmarque_id`),
  KEY `FK_modele_id_marque` (`id_marque`),
  CONSTRAINT `FK_10028558363C1047` FOREIGN KEY (`idmarque_id`) REFERENCES `marque` (`id`),
  CONSTRAINT `FK_modele_id_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modele`
--

LOCK TABLES `modele` WRITE;
/*!40000 ALTER TABLE `modele` DISABLE KEYS */;
INSERT INTO `modele` VALUES (1,'2CV',2,2),(2,'4L',3,3),(3,'Renault 5',3,3),(4,'207',1,1),(5,'Scénic',NULL,3),(6,'Golf',NULL,5),(7,'2008',NULL,1);
/*!40000 ALTER TABLE `modele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_voiture`
--

DROP TABLE IF EXISTS `option_voiture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_voiture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idoptions_id` int DEFAULT NULL,
  `idvoiture_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F116967AF77218CB` (`idoptions_id`),
  KEY `IDX_F116967ACC28B580` (`idvoiture_id`),
  CONSTRAINT `FK_F116967ACC28B580` FOREIGN KEY (`idvoiture_id`) REFERENCES `voiture` (`id`),
  CONSTRAINT `FK_F116967AF77218CB` FOREIGN KEY (`idoptions_id`) REFERENCES `options` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_voiture`
--

LOCK TABLES `option_voiture` WRITE;
/*!40000 ALTER TABLE `option_voiture` DISABLE KEYS */;
INSERT INTO `option_voiture` VALUES (1,2,2),(2,6,2),(6,2,1),(7,7,1),(9,6,3),(10,NULL,5),(11,NULL,5),(12,NULL,6),(13,NULL,6);
/*!40000 ALTER TABLE `option_voiture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'Air conditionné'),(2,'Toit ouvrant'),(3,'Caméra de recul'),(4,'Régulateur de vitesse'),(5,'Navigation GPS'),(6,'Sieges en cuir'),(7,'Peinture mettalisé'),(8,'Sièges chauffant');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realiser`
--

DROP TABLE IF EXISTS `realiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realiser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idservice_id` int NOT NULL,
  `idvoiture_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `heure` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7BAB8D0720F5B4DC` (`idservice_id`),
  KEY `IDX_7BAB8D07CC28B580` (`idvoiture_id`),
  CONSTRAINT `FK_7BAB8D0720F5B4DC` FOREIGN KEY (`idservice_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_7BAB8D07CC28B580` FOREIGN KEY (`idvoiture_id`) REFERENCES `voiture` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realiser`
--

LOCK TABLES `realiser` WRITE;
/*!40000 ALTER TABLE `realiser` DISABLE KEYS */;
/*!40000 ALTER TABLE `realiser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idemploye_id` int DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E19D9AD2CC1F4FA8` (`idemploye_id`),
  CONSTRAINT `FK_E19D9AD2CC1F4FA8` FOREIGN KEY (`idemploye_id`) REFERENCES `employe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,NULL,'Entretien courant'),(2,NULL,'Mécanique'),(3,NULL,'Electrique - Electronique'),(4,NULL,'Carosserie'),(5,NULL,'Peinture'),(6,NULL,'Système de sécurité'),(7,NULL,'Pneumatique');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voiture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idemploye_id` int NOT NULL,
  `idgallerie_image_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kilometre` int NOT NULL,
  `vendu` tinyint(1) DEFAULT NULL,
  `reference` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idmarque_id` int NOT NULL,
  `idmodele_id` int NOT NULL,
  `caracteristique` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `circulation` int NOT NULL,
  `prix` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E9E2810FCC1F4FA8` (`idemploye_id`),
  KEY `IDX_E9E2810FD48F7184` (`idgallerie_image_id`),
  KEY `IDX_E9E2810F363C1047` (`idmarque_id`),
  KEY `IDX_E9E2810FD20F1EFF` (`idmodele_id`),
  CONSTRAINT `FK_E9E2810FCC1F4FA8` FOREIGN KEY (`idemploye_id`) REFERENCES `employe` (`id`),
  CONSTRAINT `FK_E9E2810FD48F7184` FOREIGN KEY (`idgallerie_image_id`) REFERENCES `gallerie_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voiture`
--

LOCK TABLES `voiture` WRITE;
/*!40000 ALTER TABLE `voiture` DISABLE KEYS */;
INSERT INTO `voiture` VALUES (1,2,2,'b4f32872c4ce12b31dd7ffe3a77c581972f36162.png',27500,0,'2CVverte',2,1,'4 cv - Fauteuil souple - Refroidissement à air - 5 porte',1995,510000),(2,2,3,'977f07b8ea48d963836725bdc74caaa37a761efe.png',184521,0,'R5Jaune',3,3,'5 Portes - Tout confort - Essence - Boite Auto',1996,195000),(3,21,4,'81a90ba4f372ae2e4ba5f5d22096658152e5ec5f.png',49500,0,'4LBlanche',3,2,'Levier haut boite de vitesse - Essence - 5 Portes',1995,75000),(5,24,5,'e5113c2b7800572466e10787d8a8a79451bf3412.png',15150,0,'207-Grise-2015',1,4,'1.6 hdi  - 90CV - GPS - 5 Portes',2016,470000),(6,23,6,'6e37ff96e79ad0ff64090c87b64c4632a81a66a1.png',28500,0,'Belle 2008 Orange-2022',1,7,'1.2 PureTech - 130 CV - Allure',2021,1500000);
/*!40000 ALTER TABLE `voiture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-20 17:50:42
