-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `agence`
--
USE mydb;
DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agence` (
  `idAgence` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `code1` varchar(45) DEFAULT NULL,
  `code2` varchar(45) DEFAULT NULL,
  `code3` varchar(45) DEFAULT NULL,
  `code4` varchar(45) DEFAULT NULL,
  `code5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAgence`),
  UNIQUE KEY `idAgence_UNIQUE` (`idAgence`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
INSERT INTO `agence` VALUES (1,'Agence1','Code 1','Code 2','Code 3','Code 4','Code 5'),(2,'Agence2','Adresse2','dsc','sdc','few','ewf'),(3,' test1',' test2','ewf','ewf','efw','wef');
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `est_stationne`
--

DROP TABLE IF EXISTS `est_stationne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `est_stationne` (
  `id_stationnement` int(11) NOT NULL AUTO_INCREMENT,
  `immat` varchar(45) DEFAULT NULL,
  `nomParking` varchar(45) DEFAULT NULL,
  `nomPreparteur` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_stationnement`),
  KEY `fk_Vehicule_has_Parking_Parking1_idx` (`nomParking`),
  KEY `fk_Vehicule_has_Parking_Vehicule1_idx` (`immat`),
  KEY `fk_Est_Stationné_Operateur1_idx` (`nomPreparteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `est_stationne`
--

LOCK TABLES `est_stationne` WRITE;
/*!40000 ALTER TABLE `est_stationne` DISABLE KEYS */;
/*!40000 ALTER TABLE `est_stationne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livraison` (
  `idLivraison` int(11) NOT NULL AUTO_INCREMENT,
  `immat` varchar(45) DEFAULT NULL,
  `nomPreparateur` varchar(45) DEFAULT NULL,
  `prev_date` date DEFAULT NULL,
  `accompli` tinyint(1) DEFAULT NULL,
  `nomOperateur` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLivraison`),
  KEY `fk_Livraison_Preparateur1_idx` (`nomPreparateur`),
  KEY `fk_Livraison_Vehicule1_idx` (`immat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking`
--

DROP TABLE IF EXISTS `parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking` (
  `idParking` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `agence` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idParking`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking`
--

LOCK TABLES `parking` WRITE;
/*!40000 ALTER TABLE `parking` DISABLE KEYS */;
INSERT INTO `parking` VALUES (1,'  Ready Line BVA','   '),(2,'Nom2','Agence2'),(3,' NOM ',' AGENCE '),(4,' trucc  ',' j '),(5,' NOM ',' AGENCE '),(6,' NOM ',' AGENCE '),(7,' NOM ',' AGENCE '),(8,' NOM ',' AGENCE '),(9,' Base Arriere BVA',' ');
/*!40000 ALTER TABLE `parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preparation`
--

DROP TABLE IF EXISTS `preparation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preparation` (
  `idPreparation` int(11) NOT NULL AUTO_INCREMENT,
  `immat` varchar(45) NOT NULL,
  `prev_date` date DEFAULT NULL,
  `accompli` tinyint(1) DEFAULT NULL,
  `nomOperateur` varchar(45) DEFAULT NULL,
  `nomPreparateur` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPreparation`,`immat`),
  UNIQUE KEY `id_preparation_UNIQUE` (`idPreparation`),
  KEY `fk_Preparation_Vehicule1_idx` (`immat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preparation`
--

LOCK TABLES `preparation` WRITE;
/*!40000 ALTER TABLE `preparation` DISABLE KEYS */;
/*!40000 ALTER TABLE `preparation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_check_in`
--

DROP TABLE IF EXISTS `process_check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_check_in` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `immat` varchar(45) DEFAULT NULL,
  `mva` varchar(45) DEFAULT NULL,
  `date_retour_reel` varchar(45) DEFAULT NULL,
  `heure_retour_reel` varchar(45) DEFAULT NULL,
  `km` double unsigned DEFAULT NULL,
  `carburant` tinyint(1) DEFAULT '0',
  `dommage` tinyint(1) DEFAULT '0',
  `presence_gps` varchar(45) DEFAULT NULL,
  `position_vehicule` varchar(45) DEFAULT NULL,
  `nomOperateur` varchar(70) DEFAULT NULL,
  `proprio` varchar(45) DEFAULT NULL,
  `modele` varchar(45) DEFAULT NULL,
  `wizard` varchar(45) DEFAULT NULL,
  `contrat` varchar(45) DEFAULT NULL,
  `presence_sb` varchar(45) DEFAULT NULL,
  `transfert` varchar(45) DEFAULT NULL,
  `preparation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Numero_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_check_in`
--

LOCK TABLES `process_check_in` WRITE;
/*!40000 ALTER TABLE `process_check_in` DISABLE KEYS */;
INSERT INTO `process_check_in` VALUES (1,'','','10-09-2015','',0,0,0,'inconnu','0','admin','','','','','inconnu','0','0'),(2,'','','10-09-2015','',55,0,0,'inconnu','0','admin','','','','','inconnu','0','0'),(3,'DL569AB','29','14-09-2015','12:55',544,1,1,'oui','readyline','admin','9508','C3 NEW HDI 90CV 1,6','ON MOVE','545885','oui','alocaliser','achecker'),(4,'','','19-09-2015','',0,1,1,'inconnu','0','admin','','','','','inconnu','0','0'),(5,'','','20-09-2015','',0,0,0,'oui','p2','foo','','','','','non','alocaliser','apreparerquickprep');
/*!40000 ALTER TABLE `process_check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_f44`
--

DROP TABLE IF EXISTS `process_f44`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_f44` (
  `Numero` int(11) NOT NULL AUTO_INCREMENT,
  `mva` varchar(45) DEFAULT NULL,
  `immat` varchar(45) DEFAULT NULL,
  `aspiration_interieur` tinyint(1) DEFAULT NULL,
  `lavage_exterieur` tinyint(1) DEFAULT '0',
  `nettoyage_vitre` tinyint(1) DEFAULT '0',
  `nettoyage_parebrise_interieur` tinyint(1) DEFAULT '0',
  `niveau_huile` tinyint(1) DEFAULT '0',
  `niveau_lave_glace` tinyint(1) DEFAULT '0',
  `pression_pneus` tinyint(1) DEFAULT '0',
  `controle_carosserie` tinyint(1) DEFAULT '0',
  `controle_interieur` tinyint(1) DEFAULT '0',
  `remplissage_carburant` double DEFAULT NULL,
  `nomOperateur` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  UNIQUE KEY `Numero_UNIQUE` (`Numero`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_f44`
--

LOCK TABLES `process_f44` WRITE;
/*!40000 ALTER TABLE `process_f44` DISABLE KEYS */;
INSERT INTO `process_f44` VALUES (6,'2903003','DK517QS',1,0,0,1,0,0,1,0,1,10,'admin'),(7,'2902922','DL342AB',0,0,0,1,0,0,0,1,1,0,'admin'),(8,'29','DL569AB',0,1,0,0,0,1,0,0,1,0,'admin'),(9,'2903014','DK275QS',0,1,1,0,0,0,0,0,1,1,'admin');
/*!40000 ALTER TABLE `process_f44` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recuperation`
--

DROP TABLE IF EXISTS `recuperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recuperation` (
  `idRecuperation` int(11) NOT NULL AUTO_INCREMENT,
  `immat` varchar(45) DEFAULT NULL,
  `prev_date` date DEFAULT NULL,
  `accompli` tinyint(1) DEFAULT NULL,
  `nomOperateur` varchar(45) DEFAULT NULL,
  `nomPreparateur` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRecuperation`),
  KEY `fk_Recuperation_Vehicule1_idx` (`immat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recuperation`
--

LOCK TABLES `recuperation` WRITE;
/*!40000 ALTER TABLE `recuperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `recuperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tache`
--

DROP TABLE IF EXISTS `tache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tache` (
  `id_tache` int(11) NOT NULL AUTO_INCREMENT,
  `immat` varchar(45) DEFAULT NULL,
  `prev_date` varchar(45) DEFAULT NULL,
  `accompli` tinyint(1) DEFAULT NULL,
  `nomOperateur` varchar(45) DEFAULT NULL,
  `assigne_par` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tache`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tache`
--

LOCK TABLES `tache` WRITE;
/*!40000 ALTER TABLE `tache` DISABLE KEYS */;
INSERT INTO `tache` VALUES (1,'DL569AB','20-09-2015',0,'foo','admin','process_f44');
/*!40000 ALTER TABLE `tache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfert`
--

DROP TABLE IF EXISTS `transfert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfert` (
  `idTransfert` int(11) NOT NULL,
  `immat` varchar(45) NOT NULL,
  `prev_date` date DEFAULT NULL,
  `accompli` tinyint(1) DEFAULT NULL,
  `nomOperateur` varchar(45) DEFAULT NULL,
  `nomPreparateur` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTransfert`,`immat`),
  KEY `fk_Transfert_Vehicule1_idx` (`immat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfert`
--

LOCK TABLES `transfert` WRITE;
/*!40000 ALTER TABLE `transfert` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `attribut` varchar(45) DEFAULT NULL,
  `agence` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$QPS5x7o77TfyFRxgkBggw.mfTqcXd3q3KrGmaT5p3xh8ihRfGWi9m','administrateur','admin'),(2,'root','$2a$10$qLkqkjO6xeYBHaic2BNfyu82LCnsRnhPR./qexEnDCtvdjIEuKTXW','administrateur','CREIL'),(3,'Laurent Chantepie','$2a$10$xsUz5Qz4t2iu7OpxNdb89eWr7jqPVdXj0XABR1YLWlWZHU8wogPim','opérateur','CREIL'),(4,'foo','$2a$10$qLkqkjO6xeYBHaic2BNfyu82LCnsRnhPR./qexEnDCtvdjIEuKTXW','opérateur','CREIL');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicule` (
  `idVehicule` int(11) NOT NULL,
  `mva` varchar(45) DEFAULT NULL,
  `immat` varchar(45) DEFAULT NULL,
  `modele` varchar(45) DEFAULT NULL,
  `statut wizzard` varchar(45) DEFAULT NULL,
  `km` varchar(45) DEFAULT NULL,
  `carburant` varchar(45) DEFAULT NULL,
  `Vehiculecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVehicule`),
  UNIQUE KEY `idVehicule_UNIQUE` (`idVehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicule`
--

LOCK TABLES `vehicule` WRITE;
/*!40000 ALTER TABLE `vehicule` DISABLE KEYS */;
INSERT INTO `vehicule` VALUES (1,'52','25','252','1','5245','0',NULL);
/*!40000 ALTER TABLE `vehicule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicule_exterieur`
--

DROP TABLE IF EXISTS `vehicule_exterieur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicule_exterieur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `immat` varchar(45) DEFAULT NULL,
  `mva` varchar(45) DEFAULT NULL,
  `modele` varchar(45) DEFAULT NULL,
  `proprio` double DEFAULT NULL,
  `num_contrat` varchar(45) DEFAULT NULL,
  `agence` varchar(45) DEFAULT NULL,
  `date_limite_transfert` varchar(45) DEFAULT NULL,
  `date_limite_relocation` date DEFAULT NULL,
  `present_agence` tinyint(1) DEFAULT NULL,
  `statut_proprio` tinyint(1) DEFAULT NULL,
  `date_statut_proprio` date DEFAULT NULL,
  `date_transfert` date DEFAULT NULL,
  `date_relocation` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicule_exterieur`
--

LOCK TABLES `vehicule_exterieur` WRITE;
/*!40000 ALTER TABLE `vehicule_exterieur` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicule_exterieur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicules`
--

DROP TABLE IF EXISTS `vehicules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicules` (
  `MVA` int(11) DEFAULT NULL,
  `IMMAT` varchar(7) DEFAULT NULL,
  `PROPRIO_WIZARD` int(11) DEFAULT NULL,
  `INDICATIF_PROPRIO_CORP_LICENSEE` varchar(1) DEFAULT NULL,
  `CURRENT_LOCATION_STN` int(11) DEFAULT NULL,
  `DATE_DE_LIVRAISON` varchar(16) DEFAULT NULL,
  `STATUT` varchar(8) DEFAULT NULL,
  `KILOMETERS` int(11) DEFAULT NULL,
  `MARSHALL_DATE` varchar(16) DEFAULT NULL,
  `DESCRIPTION_VHL` varchar(8) DEFAULT NULL,
  `CODE_VEHICULE` varchar(4) DEFAULT NULL,
  `CATEGORIE_VHL` varchar(1) DEFAULT NULL,
  `MANUFACTURER_CODE` varchar(3) DEFAULT NULL,
  `WIZ_BODY_TYPE_CODE` varchar(3) DEFAULT NULL,
  `COULEUR` varchar(3) DEFAULT NULL,
  `DATE_ACHAT` varchar(16) DEFAULT NULL,
  `MISSING_DATE` int(11) DEFAULT NULL,
  `DATE_SORTIE_PREVUE` varchar(16) DEFAULT NULL,
  `REG_COUNTRY_CODE` varchar(2) DEFAULT NULL,
  `STATION_DEPART` int(11) DEFAULT NULL,
  `STATION_RETOUR` int(11) DEFAULT NULL,
  `DATE_DEPART` varchar(16) DEFAULT NULL,
  `DATE_RETOUR` varchar(16) DEFAULT NULL,
  `PREFIX_NUMERO_CONTRAT` varchar(1) DEFAULT NULL,
  `NUMERO_CONTRAT` int(11) DEFAULT NULL,
  `INDICATEUR_STATION_DEPART_CORPORATE_LICENSEE` varchar(1) DEFAULT NULL,
  `INDICATEUR_STATION_RETOUR_CORPORATE_LICENSEE` varchar(1) DEFAULT NULL,
  `INDICATEUR_MOYEN_DE_PAIEMENT` varchar(1) DEFAULT NULL,
  `CATGORIE_FACTUREE` varchar(1) DEFAULT NULL,
  `INDICATEUR_OPEN_MVT` varchar(1) DEFAULT NULL,
  `DATE_DEPART_PRECEDENT_CONTRAT` varchar(16) DEFAULT NULL,
  `DATE_RETOUR_PRECEDENT_CONTRAT` varchar(16) DEFAULT NULL,
  `PREFIX_NUMERO_CONTRAT_PRECEDENT` varchar(1) DEFAULT NULL,
  `NUMERO_CONTRAT_PRECEDENT` int(11) DEFAULT NULL,
  `INDICATEUR_CORP_LIC_PAGD_PRECEDENT` varchar(1) DEFAULT NULL,
  `INDICATEUR_CORP_LIC_PAGR_PRECEDENT` varchar(1) DEFAULT NULL,
  `INDICATEUR_STATUT_HOLD` int(11) DEFAULT NULL,
  `INDICATEUR_ON_MOVEMENT` int(11) DEFAULT NULL,
  `INDICATEUR_STATUT_TURNBACK` int(11) DEFAULT NULL,
  `DATE_ADDITION_VHL_DS_WIZARD` varchar(16) DEFAULT NULL,
  `STATION_ADDITION_VHL_DANS_WIZARD_NUMBER` int(11) DEFAULT NULL,
  `DATE_DERNEIR_ENTRETIEN` int(11) DEFAULT NULL,
  `STATION_DERNIER_ENTRETIEN` int(11) DEFAULT NULL,
  `MONTANT_DOMMAGES_ANTICIPES` int(11) DEFAULT NULL,
  `IN_SERVICE_DATE` int(11) DEFAULT NULL,
  `MISC_EQUIPMENT_CHARGES_AMT` int(11) DEFAULT NULL,
  `GLASS_CHARGES_AMT` int(11) DEFAULT NULL,
  `DISPOSAL_LEAD_MILEAGE_NO` int(11) DEFAULT NULL,
  `UNACCEPTABLE_REPAIR_AMT` int(11) DEFAULT NULL,
  `HI_MILEAGE_PROCESS_DATE` int(11) DEFAULT NULL,
  `HI_MILES_PROC_MAX_NO` int(11) DEFAULT NULL,
  `PM_IND` varchar(1) DEFAULT NULL,
  `PM_MILES_KMS` int(11) DEFAULT NULL,
  `PM_SERVICE` int(11) DEFAULT NULL,
  `PM_MK_MOD` int(11) DEFAULT NULL,
  `MVA_TRONQUE` varchar(20) DEFAULT NULL,
  `COLONNE_SUP_AVIS_1` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_2` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_3` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_4` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_5` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_6` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_7` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_8` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_9` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_10` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_11` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_12` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_13` int(11) DEFAULT NULL,
  `COLONNE_SUP_AVIS_14` int(11) DEFAULT NULL,
  `nom_agence` varchar(29) DEFAULT NULL,
  `concessionnaire` varchar(15) DEFAULT NULL,
  `ville` varchar(29) DEFAULT NULL,
  `position` varchar(5) DEFAULT NULL,
  `immo` int(11) DEFAULT NULL,
  `statut_immo_5j` varchar(4) DEFAULT NULL,
  `VP_VU` varchar(2) DEFAULT NULL,
  `nbre_mois_d_tention` int(11) DEFAULT NULL,
  `km_mois` int(11) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `mois_livraison` varchar(8) DEFAULT NULL,
  `Agence_retour` varchar(29) DEFAULT NULL,
  `Statut_VO` varchar(2) DEFAULT NULL,
  `marque` varchar(8) DEFAULT NULL,
  `d_lai_VO` int(11) DEFAULT NULL,
  `retard_sortie_VO_wizard` varchar(6) DEFAULT NULL,
  `libell_mod_le` varchar(26) DEFAULT NULL,
  `km_maxi` varchar(7) DEFAULT NULL,
  `km_maxi_par_mois` varchar(5) DEFAULT NULL,
  `KM_d_pass` varchar(6) DEFAULT NULL,
  `d_classement` varchar(8) DEFAULT NULL,
  `dur_e_contrat` int(11) DEFAULT NULL,
  `km_en_cours_d_pass` varchar(6) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `dur_e` int(11) DEFAULT NULL,
  `type_dur_e_courte_moyenne` varchar(7) DEFAULT NULL,
  `statut_VO_mensuel` varchar(10) DEFAULT NULL,
  `contrat_nrt` varchar(7) DEFAULT NULL,
  `POSITION_CDG_ORY` varchar(25) DEFAULT NULL,
  `agence_retour_CDG_ORY` varchar(25) DEFAULT NULL,
  `proprio_agence_retour` varchar(15) DEFAULT NULL,
  `one_way` varchar(6) DEFAULT NULL,
  `cat_reformat_e` varchar(12) DEFAULT NULL,
  `Date_du_fichier` datetime DEFAULT NULL,
  `position_app` varchar(45) DEFAULT 'Non renseignée',
  `localisation_agence_app` varchar(45) DEFAULT 'Non renseignée',
  `preparation_app` varchar(45) DEFAULT 'Non renseignée',
  `carburant` decimal(20,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicules`
--

LOCK TABLES `vehicules` WRITE;
/*!40000 ALTER TABLE `vehicules` DISABLE KEYS */;
INSERT INTO `vehicules` VALUES (29,'DL569AB',9508,'L',3901,'03/11/2014 00:00','ON MOVE',9528,NULL,'CITR C3 ','E13W','I','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',3901,3901,'23/04/2015 09:00','23/04/2015 15:45','E',339270153,'L','L',' ','B','1','20/04/2015 18:20','22/04/2015 10:00','E',339270083,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC9HP0EW668242',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ABBEVILLE GARE ','AMIENS','ABBEVILLE','LOCAL',123,'immo','VP',57,1672,9528,'nov.-14','ABBEVILLE GARE ','-','test',-18,'-','C3 NEW HDI 90CV 1,6','18 000','3 000','ok','déclassé',100,'ok','C3 ',28,'courte','-','contrat','ABB','ABB','AMIENS','local','I','2015-04-03 00:00:00','readyline','alocaliser','achecker',NULL),(2902922,'DL342AB',9508,'L',3965,'03/11/2014 00:00','ON MOVE',12971,NULL,'CITR C3 ','E13W','I','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',3965,3965,'22/04/2015 14:32','26/04/2015 17:30','E',303788671,'L','L',' ','A','1','20/04/2015 15:59','22/04/2015 08:49','E',303788225,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC9HP0EW667250',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'BIARRITZ APT   ','PAU','BIARRITZ APT   ','EXT',93,'immo','VP',58,2236,12971,'nov.-14','BIARRITZ APT   ','-','citroen',-18,'-','C3 NEW HDI 90CV 1,6','18 000','3 000','ok','déclassé',500,'ok','C3 ',412,'courte','-','contrat','PAU','PAU','PAU','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2902933,'DM195AH',9508,'L',52242,'22/12/2014 00:00','ON MOVE',8979,NULL,'NISSJUKE','NIJU','C','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/07/2015 00:00','FR',52242,52242,'22/04/2015 20:00','24/04/2015 18:00','E',303564601,'L','L',' ','C','1','20/04/2015 11:59','22/04/2015 07:20','E',303538491,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFCAF15U7045847',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'DOUAI GARAGE','AMIENS','DOUAI','LOCAL',113,'immo','VP',41,2190,8979,'déc.-14','DOUAI GARAGE','-','nissan',-78,'-','JUKE 110CV 1,5','21 000','3 500','ok','ok',200,'ok','Juke',192,'courte','-','contrat','DOUAI','DOUAI','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2902944,'DL109AB',9508,'L',4137,'03/11/2014 00:00','ON MOVE',8530,NULL,'CITR C3 ','E13W','I','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',4137,4137,'31/03/2015 10:57','30/04/2015 10:57','E',619180424,'L','L',' ','I','1','01/03/2015 10:57','31/03/2015 10:57','E',619180413,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC9HP0EW667251',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VALENCIENNES   ','AMIENS','VALENCIENNES   ','LOCAL',55,'immo','VP',59,1446,8530,'nov.-14','VALENCIENNES   ','-','citroen',-18,'-','C3 NEW HDI 90CV 1,6','18 000','3 000','ok','ok',3000,'ok','C3 ',3000,'moyenne','vo mensuel','contrat','VCS','VCS','AMIENS','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2902955,'DM197AH',9508,'L',4137,'17/12/2014 00:00','ON MOVE',10001,NULL,'NISSJUKE','NIJU','C','   ','5DR','GRY','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',4137,4137,'23/04/2015 16:00','25/04/2015 09:00','E',304502903,'L','L',' ','C','1','22/04/2015 15:22','22/04/2015 17:00','E',370357,' ',' ',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFCAF15U7050277',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VALENCIENNES   ','AMIENS','VALENCIENNES   ','LOCAL',106,'immo','VP',43,2326,10001,'déc.-14','VALENCIENNES   ','-','nissan',-48,'-','JUKE 110CV 1,5','21 000','3 500','ok','ok',200,'ok','Juke',171,'courte','-','contrat','VCS','VCS','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2902966,'DJ474VW',9508,'L',4137,'01/10/2014 00:00','MARSHALL',13700,'42111','CITRC3  ','53CC','I','   ','5DR','GRY','30/09/2014 00:00',NULL,'24/04/2015 00:00','FR',4137,4137,'09/04/2015 12:00','23/04/2015 12:00','E',619181220,'L','L',' ','I','1','14/03/2015 12:00','09/04/2015 12:00','E',619181216,'L','L',1,0,0,'30/09/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC8HR4EW645976',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VALENCIENNES   ','AMIENS','VALENCIENNES   ','LOCAL',125,'immo','VP',68,2015,13700,'oct.-14','VALENCIENNES   ','VO','citroen',12,'retard','C3 1,4 HDI 70','20 000','3 333','ok','ok',1400,'ok','C3 HDI 70',1400,'courte','-','contrat','VCS','VCS','AMIENS','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2902981,'DK436TC',9508,'L',6563,'30/10/2014 00:00','ON HAND',15831,NULL,'MERCB180','DI18','L','   ','5DR','BLK','20/10/2014 00:00',NULL,'20/07/2015 00:00','FR',6563,6563,'42117,3388888889','42117,7847222222','E',304406336,'L','L',' ','C','0','42114,3784722222','42115,7847222222','E',303524200,'L','L',0,0,0,'20/10/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2462121N110441',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'BEAUVAIS APT   ','AMIENS','BEAUVAIS APT','LOCAL',122,'immo','VP',59,2683,15831,'oct.-14','BEAUVAIS APT   ','-','mercedes',-75,'-','B180 HDI BA','24 000','2 667','ok','déclassé',100,'ok','B180 BA',45,'courte','-','contrat','BVS','BVS','AMIENS','local','L','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903003,'DK517QS',9508,'L',2628,'21/10/2014 00:00','ON MOVE',17327,NULL,'MERCB180','DI18','L','   ','5DR','WHI','20/10/2014 00:00',NULL,'11/07/2015 00:00','FR',2628,2628,'03/04/2015 14:04','22/04/2015 14:04','E',410739862,'L','L',' ','D','1','23/03/2015 11:47','30/03/2015 14:30','E',410739210,'L','L',0,0,0,'20/10/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2462121N107857',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'LENS DT        ','AMIENS','LENS','LOCAL',134,'immo','VP',61,2840,17327,'oct.-14','LENS DT        ','-','mercedes',-66,'-','B180 HDI BA','24 000','2 667','ok','déclassé',1900,'alerte','B180 BA',1900,'courte','-','contrat','LENS','LENS','AMIENS','local','L','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903014,'DK275QS',9508,'L',5652,'20/10/2014 00:00','ON MOVE',4622,NULL,'MERCB200','MD07','L','   ','5DR','WHI','20/10/2014 00:00',NULL,'10/07/2015 00:00','FR',5652,5652,'22/04/2015 18:00','27/04/2015 18:00','E',411557451,'L','L',' ','H','1','15/04/2015 15:00','18/04/2015 10:00','E',411556810,'L','L',0,0,0,'20/10/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2462011N105335',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'MAUBEUGEDT     ','AMIENS','MAUBEUGE','LOCAL',83,'immo','VP',63,734,4622,'oct.-14','MAUBEUGEDT     ','-','mercedes',-65,'-','B200 HDI BA','24 000','2 667','ok','déclassé',500,'ok','B200 BA',500,'courte','-','contrat','MAUB','MAUB','AMIENS','local','L','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903062,'BN707RA',9508,'L',10669,'31/05/2011 00:00','UNAV/REG',49939,NULL,'TRANKOMB','FRDT','N','   ','5DR','WHI','31/05/2011 00:00',NULL,'30/09/2014 00:00','FR',2476,10669,'23/04/2015 14:30','23/04/2015 15:00','E',33413,' ',' ',' ','N','0','07/10/2014 07:48','07/10/2014 09:55','E',745835,' ',' ',0,0,0,'31/05/2011 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WF0SXXBDFSAA84913',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CREIL VO','AMIENS','CREIL VO','VO',124,'immo','VU',475,1051,49939,'mai-11','CREIL VO','VO','ford',218,'retard','Minibus Ford 2,2 TDCI 115','100 000','2 778','ok','ok',100,'ok','Minibus',2,'courte','-','nrt','VO','VO','AMIENS','local','VU-N-Minibus','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903073,'BN264RA',9508,'L',10669,'31/05/2011 00:00','UNAV/REG',51210,NULL,'TRANKOMB','FRDT','N','   ','5DR','WHI','31/05/2011 00:00',NULL,'30/09/2014 00:00','FR',1995,10669,'09/09/2014 16:14','09/09/2014 17:30','E',676313,' ',' ',' ','N','0','26/08/2014 08:30','29/08/2014 18:00','E',146822336,'L','L',0,0,0,'31/05/2011 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WF0SXXBDFSAA84920',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CREIL VO','AMIENS','CREIL VO','VO',2383,'immo','VU',399,1283,51210,'mai-11','CREIL VO','VO','ford',218,'retard','Minibus Ford 2,2 TDCI 115','100 000','2 778','ok','ok',100,'ok','Minibus',5,'courte','-','nrt','VO','VO','AMIENS','local','VU-N-Minibus','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903084,'DJ436VW',9508,'L',15070,'01/10/2014 00:00','MARSHALL',10754,'42111','CITRC3  ','53CC','I','   ','5DR','GRY','30/09/2014 00:00',NULL,'24/04/2015 00:00','FR',2476,15070,'22/04/2015 07:00','22/04/2015 10:00','E',32739,' ',' ',' ','I','0','21/04/2015 17:06','21/04/2015 17:07','E',84348,' ',' ',1,0,0,'30/09/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC8HR4EW645979',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'AI2','AMIENS','AI2','VO',136,'immo','VP',68,1581,10754,'oct.-14','AI2','VO','citroen',12,'retard','C3 1,4 HDI 70','20 000','3 333','ok','ok',100,'ok','C3 HDI 70',13,'courte','-','nrt','VO','VO','AMIENS','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903095,'BN791RA',9508,'L',501,'20/06/2011 00:00','MARSHALL',58328,'42110','TRANKOMB','FTRK','N','   ','5DR','WHI','31/05/2011 00:00',NULL,'30/09/2014 00:00','FR',1851,501,'23/04/2015 08:58','23/04/2015 09:59','E',371804,' ',' ',' ','N','0','17/04/2015 14:25','20/04/2015 16:35','E',303326321,'L','L',1,0,0,'31/05/2011 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WF0SXXBDFSAA84963',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'PAVILLONS/BOIS ','VIRY CHATILLON ','PAVILLONS/BOIS ','EXT',126,'immo','VU',468,1246,58328,'juin-11','PAVILLONS/BOIS ','VO','ford',218,'retard','Minibus Ford','100 000','2 778','ok','ok',100,'ok','Minibus',4,'courte','-','nrt','VIRY CHATILLON ','VIRY CHATILLON ','VIRY CHATILLON ','local','VU-N-Minibus','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903106,'BN220RA',9508,'L',10669,'01/06/2011 00:00','UNAV/REG',57094,NULL,'TRANKOMB','FTRK','N','   ','5DR','WHI','31/05/2011 00:00',NULL,'30/09/2014 00:00','FR',1995,10669,'22/09/2014 17:54','23/09/2014 09:00','E',709282,' ',' ',' ','N','0','27/08/2014 08:30','10/09/2014 18:00','E',146822653,'L','L',0,0,5,'31/05/2011 00:00',9508,NULL,0,0,40700,0,0,0,0,NULL,0,'N',0,0,0,'290310',NULL,0,0,0,6,45000,99,12312018,9999999,99,3,0,0,0,'CREIL VO','AMIENS','CREIL VO','VO',2246,'immo','VU',403,1417,57094,'juin-11','CREIL VO','VO','ford',218,'retard','Minibus Ford','100 000','2 778','ok','ok',100,'ok','Minibus',63,'courte','-','nrt','VO','VO','AMIENS','local','VU-N-Minibus','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903110,'BN881QZ',9508,'L',4073,'01/06/2011 00:00','ON MOVE',63408,NULL,'TRANKOMB','FTRK','N','   ','5DR','WHI','31/05/2011 00:00',NULL,'30/06/2015 00:00','FR',4073,4073,'23/04/2015 14:04','27/04/2015 14:00','E',303297341,'C','C',' ','N','1','23/04/2015 10:11','23/04/2015 11:51','E',371946,' ',' ',0,0,0,'31/05/2011 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WF0SXXBDFSAA84857',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'PARIS NEUILLY  ','CORPORATE','PARIS NEUILLY  ','EXT',84,'immo','VU',476,1332,63408,'juin-11','PARIS NEUILLY  ','-','ford',-55,'-','Minibus Ford','100 000','2 778','ok','ok',400,'ok','Minibus',400,'courte','-','contrat','PARIS','PARIS','CORPORATE','local','VU-N-Minibus','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903121,'BN810RA',9508,'L',1642,'27/05/2011 00:00','ON MOVE',60578,NULL,'TRANKOMB','FTRK','N','   ','5DR','WHI','31/05/2011 00:00',NULL,'30/09/2014 00:00','FR',1642,1642,'18/04/2015 11:33','26/04/2015 11:20','E',339850501,'C','C',' ','N','1','17/04/2015 17:16','17/04/2015 19:00','E',359888,' ',' ',0,0,0,'31/05/2011 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WF0SXXBDFSAA85033',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'PARIS GARE NORD','CORPORATE','PARIS GARE NORD','EXT',95,'immo','VU',477,1270,60578,'mai-11','PARIS GARE NORD','VO','ford',218,'retard','Minibus Ford','100 000','2 778','ok','ok',800,'ok','Minibus',799,'courte','-','contrat','PARIS','PARIS','CORPORATE','local','VU-N-Minibus','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903294,'DF759JW',9508,'L',2476,'06/06/2014 00:00','ON MOVE',32778,NULL,'RENAMEGA','NE15','J','   ','5DR','GRY','10/06/2014 00:00',NULL,'01/04/2015 00:00','FR',2476,2476,'15/04/2015 16:59','15/05/2015 10:00','E',354137,' ',' ',' ','J','1','07/04/2015 17:53','08/04/2015 09:45','E',334165,' ',' ',0,0,0,'10/06/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF1BZ140650727274',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CREIL          ','AMIENS','CREIL          ','LOCAL',-94,'ok','VP',114,2875,32778,'juin-14','CREIL          ','VO','renault',35,'retard','Megane gps dci 110cv 1,5','27 500','3 438','alerte','ok',3000,'ok','megane gps 110cv 1,5',2971,'moyenne','vo mensuel','nrt','CREIL','CREIL','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903482,'CA645TM',9508,'L',4012,'05/06/2012 00:00','MISSING',11281,NULL,'RENATWIN','RTID','A','   ','3DR','GRY','05/06/2012 00:00',41271,'28/01/2013 00:00','FR',4012,4012,'17/12/2012 10:13','31/12/2012 11:40','E',103400964,'L','L',' ','A','0','15/12/2012 12:04','17/12/2012 09:00','E',103400942,'L','L',0,0,0,'05/06/2012 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF1CN030546882972',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'DUNKERQUE DT   ','AMIENS','DUNKERQUE','LOCAL',8555,'immo','VP',70,1612,11281,'juin-12','DUNKERQUE DT   ','VO','renault',828,'retard','Twingo d','24 000','3 000','ok','ok',1500,'ok','Twingo',1406,'courte','-','contrat','DUNK','DUNK','AMIENS','local','A','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903504,'DF154JV',9508,'L',15070,'06/06/2014 00:00','UNAV/REG',34116,NULL,'RENASCEN','15RS','H','   ','5DR','GRY','10/06/2014 00:00',NULL,'01/04/2015 00:00','FR',2476,15070,'17/04/2015 07:00','17/04/2015 10:00','E',60838,' ',' ',' ','H','0','08/04/2015 10:28','15/04/2015 10:00','E',335823,' ',' ',0,0,0,'10/06/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF1JZ14K650777211',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'AI2','AMIENS','AI2','VO',186,'immo','VP',105,3249,34116,'juin-14','AI2','VO','renault',35,'retard','Scenic D','27 500','2 750','alerte','ok',100,'alerte','Scenic',13,'courte','-','nrt','VO','VO','AMIENS','local','H','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903515,'AS459RY',9508,'L',14157,'01/06/2014 00:00','UNAV/REG',1,NULL,'AUDI A3 ','AU19','C','   ','5DR','GRY','10/06/2014 00:00',NULL,'01/04/2015 00:00','FR',0,0,NULL,NULL,' ',NULL,' ',' ',' ',' ',' ',NULL,NULL,' ',NULL,' ',' ',0,0,0,'10/06/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WAUZZZ8P6AA061218',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CVN AMIENS','AMIENS','CVN AMIENS','VN',421300,'immo','VP',-13930,0,1,'juin-14','#N/D','VO','audi',35,'retard','A3 tdi','30 000','3 000','ok','déclassé',0,'ok','A3',0,'courte','-','nrt','VN','#N/D','#N/D','#N/D','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903563,'DJ810QA',9508,'L',2476,'01/10/2014 00:00','MARSHALL',12266,'17/04/2015 00:00','CITR C3 ','E13W','I','   ','5DR','GRY','30/09/2014 00:00',NULL,'24/04/2015 00:00','FR',5224,2476,'22/04/2015 18:46','23/04/2015 09:43','E',370942,' ',' ',' ','I','0','19/04/2015 19:00','20/04/2015 08:00','E',303863442,'L','C',1,0,0,'30/09/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC9HP0EW629306',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CREIL          ','AMIENS','CREIL          ','LOCAL',126,'immo','VP',68,1804,12266,'oct.-14','CREIL          ','VO','citroen',12,'retard','C3 NEW HDI 90CV 1,6','18 000','3 000','ok','ok',100,'ok','C3 ',62,'courte','-','nrt','CREIL','CREIL','AMIENS','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903600,'DH778BX',9508,'L',2884,'25/07/2014 00:00','ON MOVE',15045,NULL,'FIAT 500','F125','A','   ','5DR','GRY','09/07/2014 00:00',NULL,'19/04/2015 00:00','FR',2884,2884,'20/04/2015 20:00','24/04/2015 10:30','E',303360201,'C','C',' ','A','1','17/04/2015 20:48','19/04/2015 13:00','E',303359906,'C','C',0,0,0,'09/07/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   ZFA3120000J226714',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'NANCYLORRAINTGV','CORPORATE','NANCYLORRAINTGV','EXT',116,'immo','VP',91,1653,15045,'juil.-14','NANCYLORRAINTGV','VO','fiat',17,'retard','500 1,2 69CV','24 000','3 000','ok','ok',400,'ok','500',360,'courte','-','contrat','LORRAINE-ALSACE-BOURGOGNE','LORRAINE-ALSACE-BOURGOGNE','CORPORATE','local','A','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903611,'DJ838QA',9508,'L',52352,'02/10/2014 00:00','MARSHALL',15550,'42111','CITR C3 ','E13W','I','   ','5DR','GRY','30/09/2014 00:00',NULL,'24/04/2015 00:00','FR',52352,52352,'03/04/2015 16:14','02/05/2015 16:30','E',407307213,'A','A',' ','I','1','03/04/2015 11:25','03/04/2015 16:10','E',410712116,'L','A',1,0,0,'30/09/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC9HP0EW629301',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'LE PORT MARLY','CORPORATE','LE PORT MARLY','EXT',33,'ok','VP',71,2190,15550,'oct.-14','LE PORT MARLY','VO','citroen',12,'retard','C3 NEW HDI 90CV 1,6','18 000','3 000','ok','ok',3000,'ok','C3 ',2901,'moyenne','vo mensuel','contrat','VERSAILLE VU','VERSAILLE VU','CORPORATE','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903670,'DM935WP',9508,'L',1599,'19/01/2015 00:00','ON HAND',8095,NULL,'MMERCB16','MMC1','H','   ','5DR','BRO','12/01/2015 00:00',NULL,'09/10/2015 00:00','FR',1599,1599,'18/04/2015 17:45','23/04/2015 17:44','E',411643466,'C','C',' ','H','0','17/04/2015 15:19','18/04/2015 15:23','E',303365731,'L','C',0,0,0,'12/01/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2462111N119516',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'LYON GARE PART ','CORPORATE','LYON GARE PART ','EXT',123,'immo','VP',32,2530,8095,'janv.-15','LYON GARE PART ','-','mercedes',-156,'-','CLASSE B 160 CDI BUS','24 000','2 667','ok','ok',500,'ok','B160 CDI',500,'courte','-','contrat','RHONE-ALPES','RHONE-ALPES','CORPORATE','local','H','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903681,'DK357PB',9508,'L',52866,'09/01/2015 00:00','ON MOVE',3525,NULL,'MERCEDES','ESBE','J','   ','5DR','GRY','12/01/2015 00:00',NULL,'29/09/2015 00:00','FR',52866,52866,'03/04/2015 16:47','02/05/2015 18:00','E',326351,' ',' ',' ','J','1','12/01/2015 12:14','03/04/2015 16:45','E',139516,' ',' ',0,0,0,'12/01/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2189231A089555',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'AMIENS PRESTIGE','AMIENS','AMIENS PRESTIGE','LOCAL',33,'ok','VP',38,928,3525,'janv.-15','AMIENS PRESTIGE','-','mercedes',-146,'-','CLS 350 CDI SHOOTING BREAK','24 000','2 667','ok','ok',3000,'ok','CLS 350 ',2905,'moyenne','-','nrt','AMIENS','AMIENS','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903751,'DM107AH',9508,'L',2476,'19/12/2014 00:00','ON MOVE',12000,NULL,'NISSJUKE','NIJU','C','   ','5DR','GRY','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',2476,2476,'30/03/2015 14:00','29/04/2015 14:00','E',757462252,'L','L',' ','C','1','28/02/2015 14:00','30/03/2015 14:00','E',757462241,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFCAF15U7051346',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CREIL          ','AMIENS','CREIL          ','LOCAL',64,'immo','VP',44,2727,12000,'déc.-14','CREIL          ','-','nissan',-48,'-','JUKE 110CV 1,5','21 000','3 500','ok','ok',3000,'ok','Juke',3000,'moyenne','-','contrat','CREIL','CREIL','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903806,'DJ197KC',9508,'L',6629,'28/08/2014 00:00','ON MOVE',25489,NULL,'RENAMEGA','NE15','J','   ','5DR','GRY','28/08/2014 00:00',NULL,'22/06/2015 00:00','FR',6629,6629,'27/04/2015 09:49','30/04/2015 17:29','E',959512676,'C','C',' ','A','1','18/04/2015 18:21','20/04/2015 16:42','E',303420994,'L','C',0,0,0,'28/08/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF1BZ140651446552',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'LUXEMBOURG GARE','ETRANGER','LUXEMBOURG GARE','ETR',53,'immo','VP',82,3108,25489,'août-14','LUXEMBOURG GARE','-','renault',-47,'-','Megane gps dci 110cv 1,5','27 500','3 438','ok','déclassé',400,'ok','megane gps 110cv 1,5',332,'courte','-','contrat','LUXEMBOURG','LUXEMBOURG','ETRANGER','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903810,'DN928MR',9508,'L',5652,'20/02/2015 00:00','ON MOVE',3106,NULL,'FORDFOCU','F0CC','J','   ','5DR','GRY','20/02/2015 00:00',NULL,'15/08/2015 00:00','FR',5652,5652,'18/03/2015 10:01','17/04/2015 10:01','E',941177484,'L','L',' ','C','1','23/02/2015 08:50','18/03/2015 10:01','E',339828215,'L','L',0,0,0,'20/02/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WF0KXXGCBKEB89785',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'MAUBEUGEDT     ','AMIENS','MAUBEUGE','LOCAL',186,'immo','VP',19,1635,3106,'févr.-15','MAUBEUGEDT     ','-','ford',-101,'-','FOCUS 1,6 TDCI GPS','20 000','3 333','ok','déclassé',3000,'ok','FOCUS DIESEL GPS',3000,'moyenne','-','contrat','MAUB','MAUB','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903821,'DJ233KC',9508,'L',6109,'28/08/2014 00:00','UNAV/OOS',13456,NULL,'RENAMEGA','NE15','J','   ','5DR','GRY','28/08/2014 00:00',NULL,'22/06/2015 00:00','FR',6109,2476,'30/03/2015 17:25','26/04/2015 10:00','E',315125,' ',' ',' ','J','1','26/03/2015 15:17','26/03/2015 16:30','E',306208,' ',' ',0,0,0,'28/08/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF1BZ140651446553',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROUEN DT       ','AMIENS','ROUEN','LOCAL',96,'immo','VP',80,1682,13456,'août-14','CREIL          ','-','renault',-47,'-','Megane gps dci 110cv 1,5','27 500','3 438','ok','ok',2700,'ok','megane gps 110cv 1,5',2669,'moyenne','-','nrt','ROUEN','CREIL','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903832,'DJ271KC',9508,'L',4001,'28/08/2014 00:00','ON MOVE',25294,NULL,'RENAMEGA','NE15','J','   ','5DR','GRY','28/08/2014 00:00',NULL,'22/06/2015 00:00','FR',4001,4130,'23/04/2015 08:15','24/04/2015 00:00','E',303668116,'L','C',' ','C','1','20/04/2015 08:15','22/04/2015 18:00','E',303667836,'L','L',0,0,0,'28/08/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF1BZ140651446554',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CLERMONT F APT ','CLERMONT FD','CLERMONT F APT ','EXT',120,'immo','VP',80,3162,25294,'août-14','TOULOUSE APT   ','-','renault',-47,'-','Megane gps dci 110cv 1,5','27 500','3 438','ok','déclassé',100,'ok','megane gps 110cv 1,5',66,'courte','-','contrat','CLERMONT FD','SUD-OUEST','CORPORATE','oneway','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903876,'DK046QS',9508,'L',1995,'17/10/2014 00:00','ON MOVE',13044,NULL,'MERCB200','MD07','L','   ','5DR','GRY','20/10/2014 00:00',NULL,'07/07/2015 00:00','FR',1995,1995,'20/04/2015 09:20','27/04/2015 09:30','E',303887684,'L','L',' ','H','1','13/04/2015 10:20','15/04/2015 09:43','E',303886693,'L','L',0,0,0,'20/10/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2462011N105802',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'AMIENS DT ','AMIENS','AMIENS','LOCAL',86,'immo','VP',64,2038,13044,'oct.-14','AMIENS DT ','-','mercedes',-62,'-','B200 HDI BA','24 000','2 667','ok','déclassé',800,'ok','B200 BA',701,'courte','-','contrat','AMS','AMS','AMIENS','local','L','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903880,'DM150AH',9508,'L',2132,'19/12/2014 00:00','ON MOVE',8605,NULL,'NISSJUKE','62NJ','J','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',2132,2132,'13/04/2015 09:00','25/04/2015 17:00','E',411605795,'L','L',' ','C','1','07/04/2015 11:00','09/04/2015 13:00','E',410040363,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFCAF15U7040322',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CALAIS GA FRET.','AMIENS','CALAIS','LOCAL',103,'immo','VP',43,2001,8605,'déc.-14','CALAIS GA FRET.','-','nissan',-48,'-','Juke dci GPS 110cv 1,5','21 000','3 500','ok','déclassé',1300,'ok','Juke GPS 110cv',1233,'courte','-','contrat','CAL','CAL','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903891,'DJ813QA',9508,'L',3050,'02/10/2014 00:00','MARSHALL',11758,'42111','CITR C3 ','E13W','I','   ','5DR','GRY','30/09/2014 00:00',NULL,'24/04/2015 00:00','FR',3050,4012,'20/04/2015 16:09','27/04/2015 18:00','E',364991,' ',' ',' ','I','1','10/04/2015 18:00','18/04/2015 18:29','E',412248443,'L','L',1,0,0,'30/09/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC9HP0EW629307',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'DUNKERQUE GARE ','AMIENS','DUNKERQUE','LOCAL',83,'immo','VP',69,1704,11758,'oct.-14','DUNKERQUE DT   ','VO','citroen',12,'retard','C3 NEW HDI 90CV 1,6','18 000','3 000','ok','ok',800,'ok','C3 ',708,'courte','-','nrt','DUNK','DUNK','AMIENS','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2903902,'DJ807QA',9508,'L',4041,'01/10/2014 00:00','MARSHALL',19791,'42111','CITR C3 ','E13W','I','   ','5DR','GRY','30/09/2014 00:00',NULL,'24/04/2015 00:00','FR',4041,4041,'16/04/2015 19:35','17/04/2015 18:48','E',303386090,'C','C',' ','I','0','16/04/2015 08:24','16/04/2015 17:35','E',303385176,'C','C',1,0,0,'30/09/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC9HP0EW629308',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'LYON APT       ','CORPORATE','LYON APT       ','EXT',182,'immo','VP',66,2999,19791,'oct.-14','LYON APT       ','VO','citroen',12,'retard','C3 NEW HDI 90CV 1,6','18 000','3 000','alerte','ok',100,'ok','C3 ',97,'courte','-','contrat','RHONE-ALPES','RHONE-ALPES','CORPORATE','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906606,'DK018NL',9508,'L',6109,'02/12/2014 00:00','ON MOVE',8258,NULL,'NISSQASH','NQAH','E','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',6109,6109,'28/03/2015 08:38','27/04/2015 08:38','E',339948921,'L','L',' ','H','1','26/02/2015 08:38','28/03/2015 08:38','E',339948910,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFDAJ11U1200832',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROUEN DT       ','AMIENS','ROUEN','LOCAL',86,'immo','VP',49,1685,8258,'déc.-14','ROUEN DT       ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',3000,'ok','QASHQAI 1,5 110CV',3000,'moyenne','-','contrat','ROUEN','ROUEN','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906610,'DK074NL',9508,'L',2503,'02/12/2014 00:00','ON MOVE',13917,NULL,'NISSQASH','NQAH','E','   ','5DR','WHI','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',2503,3965,'20/04/2015 10:50','27/04/2015 09:30','E',411260511,'L','L',' ','E','1','15/04/2015 08:16','16/04/2015 08:00','E',411260205,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1203642',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'PARIS IVRY     ','VIRY CHATILLON ','PARIS IVRY     ','EXT',86,'immo','VP',49,2840,13917,'déc.-14','BIARRITZ APT   ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','ok',700,'ok','QASHQAI 1,5 110CV',694,'courte','-','contrat','VIRY CHATILLON ','PAU','PAU','oneway','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906621,'DL172AB',9508,'L',4137,'03/11/2014 00:00','ON MOVE',8620,NULL,'CITR C3 ','E13W','I','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',4137,3578,'22/04/2015 09:41','22/04/2015 17:00','E',303848996,'L','L',' ','B','1','14/04/2015 20:34','16/04/2015 17:00','E',339472011,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SC9HP0EW667252',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VALENCIENNES   ','AMIENS','VALENCIENNES   ','LOCAL',133,'immo','VP',57,1512,8620,'nov.-14','VALENCIEN GARE ','-','citroen',-18,'-','C3 NEW HDI 90CV 1,6','18 000','3 000','ok','déclassé',100,'ok','C3 ',30,'courte','-','contrat','VCS','VCS','AMIENS','local','I','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906632,'DL559AB',9508,'L',3982,'03/11/2014 00:00','ON MOVE',15078,NULL,'CITR C3 ','C3PI','C','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',3982,3982,'21/04/2015 07:00','22/04/2015 09:00','E',411355545,'L','L',' ','C','1','14/04/2015 07:00','17/04/2015 07:00','E',411355221,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541129',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CAMBRAI        ','AMIENS','CAMBRAI        ','LOCAL',136,'immo','VP',57,2645,15078,'nov.-14','CAMBRAI        ','-','citroen',-18,'-','C3 PICASSO 90CV 1,6','18 000','3 000','ok','ok',200,'ok','C3 PICASSO',108,'courte','-','contrat','CAMB','CAMB','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906643,'DL385AB',9508,'L',3981,'03/11/2014 00:00','ON MOVE',12269,NULL,'CITR C3 ','C3PI','C','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',3981,3981,'42102,3958333333','42131,375','E',410295325,'L','L',' ','C','1','42095,5','42098,5','E',410295185,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541132',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ST OMER','AMIENS','ST OMER','LOCAL',-14,'ok','VP',62,1979,12269,'nov.-14','ST OMER','-','citroen',-18,'-','C3 PICASSO 90CV 1,6','18 000','3 000','ok','ok',2900,'ok','C3 PICASSO',2898,'moyenne','vo mensuel','contrat','CALAIS','CALAIS','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906654,'DL822WJ',9508,'L',2643,'03/02/2015 00:00','ON MOVE',6848,NULL,'PEUG 308','P8H1','C','   ','5DR','GRY','30/01/2015 00:00',NULL,'29/07/2015 00:00','FR',2643,3716,'22/04/2015 06:00','23/04/2015 19:00','E',303713034,'L','L',' ','I','1','20/04/2015 06:00','20/04/2015 19:30','E',303712872,'L','L',0,0,0,'30/01/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF3LB9HPAES144116',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'BETHUNE DT     ','AMIENS','BETHUNE','LOCAL',122,'immo','VP',27,2536,6848,'févr.-15','BETHUNE GARE   ','-','peugeot',-84,'-','308 1,6 HDI 92 5p ','23 100','3 850','ok','déclassé',200,'ok','308',154,'courte','-','contrat','BTH','BTH','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906665,'DL428AB',9508,'L',53410,'03/11/2014 00:00','ON HAND',15116,NULL,'CITR C3 ','C3PI','C','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',53410,53410,'31/03/2015 12:00','02/04/2015 11:00','E',411334173,'L','L',' ','C','0','23/03/2015 11:00','26/03/2015 09:00','E',411333554,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541127',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'DIEPPE GARAGE','AMIENS','DIEPPE','LOCAL',335,'immo','VP',50,3023,15116,'nov.-14','DIEPPE GARAGE','-','citroen',-18,'-','C3 PICASSO 90CV 1,6','18 000','3 000','ok','ok',200,'ok','C3 PICASSO',196,'courte','-','contrat','DIEPPE','DIEPPE','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906676,'DK089NL',9508,'L',1995,'02/12/2014 00:00','ON MOVE',10771,NULL,'NISSQASH','NQAH','E','   ','5DR','BLU','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',1995,1995,'16/04/2015 12:37','16/05/2015 18:00','E',355878,' ',' ',' ','E','1','09/03/2015 09:54','16/04/2015 12:35','E',264348,' ',' ',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1205765',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'AMIENS DT ','AMIENS','AMIENS','LOCAL',-108,'ok','VP',55,1958,10771,'déc.-14','AMIENS DT ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','ok',3100,'ok','QASHQAI 1,5 110CV',3022,'moyenne','-','nrt','AMS','AMS','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906680,'DK117NM',9508,'L',4079,'02/12/2014 00:00','ON MOVE',14989,NULL,'NISSQASH','NQAH','E','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',4079,2758,'05/04/2015 11:28','05/05/2015 11:28','E',558547054,'C','C',' ','I','1','06/03/2015 11:28','05/04/2015 11:28','E',558547043,'C','C',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1203678',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'PARIS APT ORLY ','CORPORATE','PARIS APT ORLY ','EXT',5,'ok','VP',51,2939,14989,'déc.-14','MARSEILLE RAB  ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',3000,'ok','QASHQAI 1,5 110CV',3000,'moyenne','-','contrat','ORLY','SUD-EST','CORPORATE','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906691,'DL617AB',9508,'L',1523,'03/11/2014 00:00','ON MOVE',14235,NULL,'CITR C3 ','C3PI','C','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',1523,1523,'20/04/2015 08:28','24/04/2015 18:00','E',411799791,'C','C',' ','C','1','18/04/2015 11:22','19/04/2015 09:56','E',411606311,'L','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541125',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'LILLE GA FLAND.','CORPORATE','LILLE GA FLAND.','EXT',113,'immo','VP',58,2454,14235,'nov.-14','LILLE GA FLAND.','-','citroen',-18,'-','C3 PICASSO 90CV 1,6','18 000','3 000','ok','ok',500,'ok','C3 PICASSO',440,'courte','-','contrat','LILLE','LILLE','CORPORATE','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906702,'DL365AB',9508,'L',2358,'03/11/2014 00:00','ON MOVE',17909,NULL,'CITR C3 ','C3PI','C','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',2358,2358,'13/04/2015 07:57','08/05/2015 18:00','E',411584423,'C','C',' ','C','1','11/04/2015 14:05','12/04/2015 18:24','E',410184762,'C','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541141',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'METZ GARE      ','CORPORATE','METZ GARE      ','EXT',-28,'ok','VP',62,2889,17909,'nov.-14','METZ GARE      ','-','citroen',-18,'-','C3 PICASSO 90CV 1,6','18 000','3 000','ok','ok',2600,'ok','C3 PICASSO',2542,'moyenne','vo mensuel','contrat','LORRAINE-ALSACE-BOURGOGNE','LORRAINE-ALSACE-BOURGOGNE','CORPORATE','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906713,'DL381AB',9508,'L',2476,'03/11/2014 00:00','ON HAND',11280,NULL,'CITR C3 ','C3PI','C','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',2476,2476,'10/04/2015 07:45','10/04/2015 07:45','E',411340392,'L','L',' ','B','0','08/04/2015 12:23','08/04/2015 15:02','E',336209,' ',' ',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541145',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CREIL          ','AMIENS','CREIL          ','LOCAL',257,'immo','VP',53,2128,11280,'nov.-14','CREIL          ','-','citroen',-18,'-','C3 PICASSO 90CV 1,6','18 000','3 000','ok','déclassé',0,'ok','C3 PICASSO',0,'courte','-','contrat','CREIL','CREIL','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906724,'DL686AB',9508,'L',4938,'03/11/2014 00:00','ON MOVE',15525,NULL,'CITR C3 ','C3PI','C','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',4938,4938,'19/04/2015 22:16','24/04/2015 13:58','E',698306206,'L','L',' ','C','1','17/04/2015 12:00','17/04/2015 16:58','E',698306125,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541148',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'DIEPPE GARE    ','AMIENS','DIEPPE','LOCAL',114,'immo','VP',58,2677,15525,'nov.-14','DIEPPE GARE    ','-','citroen',-18,'-','C3 PICASSO 90CV 1,6','18 000','3 000','ok','ok',500,'ok','C3 PICASSO',465,'courte','-','contrat','DIEPPE','DIEPPE','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906735,'DL845WJ',9508,'L',4137,'04/02/2015 00:00','ON MOVE',4963,NULL,'PEUG 308','P8H1','C','   ','5DR','GRY','30/01/2015 00:00',NULL,'29/07/2015 00:00','FR',4137,4137,'20/04/2015 18:00','21/04/2015 18:00','E',303848753,'L','L',' ','C','1','13/04/2015 11:00','18/04/2015 09:00','E',303549573,'L','L',0,0,0,'30/01/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF3LB9HPAES144117',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VALENCIENNES   ','AMIENS','VALENCIENNES   ','LOCAL',143,'immo','VP',26,1909,4963,'févr.-15','VALENCIENNES   ','-','peugeot',-84,'-','308 1,6 HDI 92 5p ','23 100','3 850','ok','ok',100,'ok','308',100,'courte','-','contrat','VCS','VCS','AMIENS','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906746,'DL709AB',9508,'L',2153,'03/11/2014 00:00','ON MOVE',11657,NULL,'CITR C3 ','C3PI','C','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',2153,2153,'20/04/2015 13:23','24/04/2015 13:45','E',410190012,'C','C',' ','C','1','17/04/2015 12:33','20/04/2015 10:08','E',410188575,'C','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541140',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'LILLE GA EUROP.','CORPORATE','LILLE GA EUROP.','EXT',114,'immo','VP',58,2010,11657,'nov.-14','LILLE GA EUROP.','-','citroen',-18,'-','C3 PICASSO 90CV 1,6','18 000','3 000','ok','ok',500,'ok','C3 PICASSO',402,'courte','-','contrat','LILLE','LILLE','CORPORATE','local','C','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906750,'DL500AB',9508,'L',4086,'03/11/2014 00:00','ON MOVE',20055,NULL,'CITRC3PI','19CP','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',4086,4574,'22/04/2015 20:45','23/04/2015 09:00','E',304167566,'C','L',' ','C','1','20/04/2015 18:19','22/04/2015 16:54','E',304160732,'C','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541566',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'PARIS APT CDG  ','CORPORATE','PARIS APT CDG  ','EXT',126,'immo','VP',57,3518,20055,'nov.-14','ST PIERRE D/C T','-','citroen',-18,'-','C3 PICASSO 90CV GPS','18 000','3 000','alerte','déclassé',100,'alerte','C3 PICASSO GPS',51,'courte','-','contrat','CDG','RENNES','RENNES','oneway','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906761,'DL749AB',9508,'L',4068,'05/11/2014 00:00','ON MOVE',11654,NULL,'CITRC3PI','19CP','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',4068,2344,'20/04/2015 07:00','24/04/2015 20:00','E',339488660,'C','C',' ','C','1','15/04/2015 15:53','16/04/2015 17:20','E',560115205,'C','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7SH9HP4ET541567',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'NANCY DT       ','CORPORATE','NANCY DT       ','EXT',112,'immo','VP',57,2045,11654,'nov.-14','NANCY GARE     ','-','citroen',-18,'-','C3 PICASSO 90CV GPS','18 000','3 000','ok','déclassé',500,'ok','C3 PICASSO GPS',454,'courte','-','contrat','LORRAINE-ALSACE-BOURGOGNE','LORRAINE-ALSACE-BOURGOGNE','CORPORATE','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906772,'DL850WJ',9508,'L',4137,'04/02/2015 00:00','ON HAND',2246,NULL,'PEUG 208','VTIP','B','   ','5DR','BLU','30/01/2015 00:00',NULL,'29/07/2015 00:00','FR',4137,4137,'13/04/2015 10:00','17/04/2015 18:00','E',303549492,'L','L',' ','B','0','14/03/2015 11:00','28/03/2015 10:09','E',411135524,'L','L',0,0,0,'30/01/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF3CCHMZ0ET118137',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VALENCIENNES   ','AMIENS','VALENCIENNES   ','LOCAL',183,'immo','VP',24,936,2246,'févr.-15','VALENCIENNES   ','-','peugeot',-84,'-','208 VTI 82','23 100','3 850','ok','ok',500,'ok','208 VTI',433,'courte','-','contrat','VCS','VCS','AMIENS','local','B','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906783,'DL734AB',9508,'L',6699,'03/11/2014 00:00','ON MOVE',13101,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',6699,6699,'42085,3763888889','42115,3756944444','E',619230150,'L','L',' ','C','1','42055,3756944445','42085,3756944444','E',619230080,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572474',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'SOISSONS DT','AMIENS','SOISSONS','LOCAL',146,'immo','VP',56,2339,13101,'nov.-14','SOISSONS DT','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',3000,'ok','C4',3000,'moyenne','vo mensuel','contrat','SOIS-LAON','SOIS-LAON','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906794,'DL436AB',9508,'L',3982,'03/11/2014 00:00','ON MOVE',7305,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',3982,3982,'21/04/2015 15:26','12/05/2015 14:00','E',411355663,'L','L',' ','B','1','31/03/2015 14:00','21/04/2015 14:00','E',411354602,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572476',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CAMBRAI        ','AMIENS','CAMBRAI        ','LOCAL',-66,'ok','VP',64,1141,7305,'nov.-14','CAMBRAI        ','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',2100,'ok','C4',2094,'courte','-','contrat','CAMB','CAMB','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906805,'DL456AB',9508,'L',2324,'03/11/2014 00:00','ON HAND',16105,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',4086,2324,'20/04/2015 10:01','20/04/2015 16:00','E',363719,' ',' ',' ','J','0','16/04/2015 20:30','16/04/2015 20:30','E',304150814,'C','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572475',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'MERU','AMIENS','MERU','LOCAL',153,'immo','VP',56,2876,16105,'nov.-14','MERU','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','ok',100,'ok','C4',25,'courte','-','nrt','MERU','MERU','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906816,'DL527AB',9508,'L',2372,'03/11/2014 00:00','ON MOVE',17275,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',2372,2372,'21/04/2015 09:35','11/05/2015 09:30','E',757391062,'L','L',' ','C','1','15/04/2015 09:00','16/04/2015 09:00','E',3794044,' ',' ',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572479',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'COMPIEGNE DT   ','AMIENS','COMPIEGNE','LOCAL',-54,'ok','VP',63,2742,17275,'nov.-14','COMPIEGNE DT   ','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',2000,'ok','C4',2000,'courte','-','contrat','COMP','COMP','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906820,'DL574AB',9508,'L',5224,'03/11/2014 00:00','ON MOVE',20845,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',5224,5224,'22/04/2015 16:23','24/04/2015 19:00','E',411612460,'C','C',' ','J','1','22/04/2015 10:00','22/04/2015 16:04','E',303887990,'L','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572480',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROISSY GARE TGV','CORPORATE','ROISSY GARE TGV','EXT',112,'immo','VP',58,3594,20845,'nov.-14','ROISSY GARE TGV','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','alerte','ok',300,'alerte','C4',211,'courte','-','contrat','CDG','CDG','CORPORATE','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906831,'DL505AB',9508,'L',53411,'04/11/2014 00:00','ON MOVE',11431,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',53411,1640,'42114,7395833333','42118,7083333333','E',411202713,'L','L',' ','C','1','42108,775','42109,7708333333','E',411564985,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572477',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'YVETOT GARAGE','AMIENS','YVETOT','LOCAL',113,'immo','VP',57,2005,11431,'nov.-14','YVETOT GARE    ','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',400,'ok','C4',397,'courte','-','contrat','YVETOT','YVETOT','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906842,'DL547AB',9508,'L',6109,'05/11/2014 00:00','ON MOVE',13115,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',6109,6109,'13/04/2015 11:31','11/05/2015 11:25','E',619435342,'L','L',' ','C','1','14/03/2015 11:25','13/04/2015 11:30','E',410825914,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572481',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROUEN DT       ','AMIENS','ROUEN','LOCAL',-55,'ok','VP',62,2115,13115,'nov.-14','ROUEN DT       ','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',2800,'ok','C4',2800,'moyenne','vo mensuel','contrat','ROUEN','ROUEN','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906853,'DL446KA',9508,'L',4012,'08/01/2015 00:00','ON MOVE',1018,NULL,'MERCC200','CDIS','D','   ','5DR','GRY','12/01/2015 00:00',NULL,'28/09/2015 00:00','FR',4012,3050,'22/04/2015 08:42','22/04/2015 17:00','E',409916861,'L','L',' ','A','1','10/04/2015 09:23','11/04/2015 08:30','E',409916021,'L','L',0,0,0,'12/01/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2050371F115066',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'DUNKERQUE DT   ','AMIENS','DUNKERQUE','LOCAL',133,'immo','VP',35,291,1018,'janv.-15','DUNKERQUE GARE ','-','mercedes',-145,'-','C200 CDI','24 000','2 667','ok','déclassé',100,'ok','C200 CDI',35,'courte','-','contrat','DUNK','DUNK','AMIENS','local','D','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906864,'DK188NM',9508,'L',1995,'02/12/2014 00:00','ON MOVE',12356,NULL,'NISSQASH','NQAH','E','   ','5DR','BRO','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',1995,1995,'01/04/2015 13:40','20/04/2015 18:00','E',9326886,' ',' ',' ','E','1','16/03/2015 18:06','19/03/2015 10:30','E',339462620,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFDAJ11U1201664',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'AMIENS DT ','AMIENS','AMIENS','LOCAL',153,'immo','VP',47,2629,12356,'déc.-14','AMIENS DT ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','ok',2000,'ok','QASHQAI 1,5 110CV',1918,'courte','-','nrt','AMS','AMS','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906875,'DK202NM',9508,'L',3952,'02/12/2014 00:00','ON MOVE',18452,NULL,'NISSQASH','NQAH','E','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',3952,1427,'20/04/2015 12:00','23/04/2015 20:00','E',410712691,'L','L',' ','E','1','15/04/2015 04:00','17/04/2015 19:00','E',303712673,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFDAJ11U1200800',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ARRAS DT       ','AMIENS','ARRAS','LOCAL',122,'immo','VP',48,3844,18452,'déc.-14','ARRAS GARE     ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','ok',400,'alerte','QASHQAI 1,5 110CV',333,'courte','-','contrat','ARR','ARR','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906886,'DL402AB',9508,'L',6563,'05/11/2014 00:00','ON MOVE',13642,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',6563,6563,'11/04/2015 10:34','01/05/2015 09:00','E',303522881,'L','L',' ','C','1','07/04/2015 13:28','10/04/2015 13:00','E',303522461,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572482',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'BEAUVAIS APT   ','AMIENS','BEAUVAIS APT','LOCAL',46,'ok','VP',59,2312,13642,'nov.-14','BEAUVAIS APT   ','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',2000,'ok','C4',1993,'courte','-','contrat','BVS','BVS','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906890,'DK203NL',9508,'L',3716,'02/12/2014 00:00','ON MOVE',12178,NULL,'NISSQASH','NQAH','E','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',3716,3716,'21/04/2015 14:23','22/04/2015 17:43','E',147778201,'L','L',' ','H','1','15/04/2015 11:13','15/04/2015 13:50','E',353129,' ',' ',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1203719',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'BETHUNE GARE   ','AMIENS','BETHUNE','LOCAL',133,'immo','VP',47,2591,12178,'déc.-14','BETHUNE GARE   ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',200,'ok','QASHQAI 1,5 110CV',114,'courte','-','contrat','BTH','BTH','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906901,'DK208NL',9508,'L',6563,'02/12/2014 00:00','ON HAND',15665,NULL,'NISSQASH','NQAH','E','   ','5DR','WHI','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',6563,6563,'22/04/2015 08:22','23/04/2015 20:45','E',304406174,'L','L',' ','H','0','18/04/2015 14:41','21/04/2015 17:30','E',303523964,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1203753',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'BEAUVAIS APT   ','AMIENS','BEAUVAIS APT','LOCAL',121,'immo','VP',48,3264,15665,'déc.-14','BEAUVAIS APT   ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',200,'ok','QASHQAI 1,5 110CV',152,'courte','-','contrat','BVS','BVS','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906912,'DL470AB',9508,'L',1523,'03/11/2014 00:00','ON MOVE',18700,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',1523,4036,'23/04/2015 19:44','24/04/2015 18:00','E',411800642,'C','C',' ','C','1','22/04/2015 14:00','23/04/2015 16:15','E',410040761,'L','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572487',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'LILLE GA FLAND.','CORPORATE','LILLE GA FLAND.','EXT',113,'immo','VP',58,3224,18700,'nov.-14','LILLE APT      ','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',100,'alerte','C4',93,'courte','-','contrat','LILLE','LILLE','CORPORATE','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906923,'DK341NM',9508,'L',6109,'01/12/2014 00:00','ON MOVE',14000,NULL,'NISSQASH','NQAH','E','   ','5DR','WHI','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',6109,6109,'22/04/2015 17:00','24/04/2015 09:00','E',411466495,'L','L',' ','I','1','22/04/2015 11:00','22/04/2015 16:00','E',411466484,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1203697',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROUEN DT       ','AMIENS','ROUEN','LOCAL',116,'immo','VP',48,2917,14000,'déc.-14','ROUEN DT       ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',200,'ok','QASHQAI 1,5 110CV',167,'courte','-','contrat','ROUEN','ROUEN','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906934,'DL361AB',9508,'L',3067,'05/11/2014 00:00','ON MOVE',23691,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',3067,1590,'11/04/2015 22:46','26/04/2015 09:00','E',203970200,'C','C',' ','J','1','09/04/2015 09:20','10/04/2015 15:07','E',411039845,'C','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572484',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VIGO APT','ETRANGER','VIGO APT','ETR',96,'immo','VP',57,4156,23691,'nov.-14','LONGREACH','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','alerte','ok',1500,'alerte','C4',1443,'courte','-','contrat','ESPAGNE','0','0','oneway','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906945,'DL490AB',9508,'L',6109,'05/11/2014 00:00','ON MOVE',18001,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',6109,6109,'05/04/2015 10:31','05/05/2015 10:30','E',619435294,'L','L',' ','C','1','06/03/2015 10:31','05/04/2015 10:30','E',619435062,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572483',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROUEN DT       ','AMIENS','ROUEN','LOCAL',6,'ok','VP',60,3000,18001,'nov.-14','ROUEN DT       ','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',3000,'ok','C4',3000,'moyenne','vo mensuel','contrat','ROUEN','ROUEN','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906956,'DL204JZ',9508,'L',4137,'12/01/2015 00:00','ON HAND',2758,NULL,'MERC220 ','22BS','F','   ','5DR','GRY','12/01/2015 00:00',NULL,'01/10/2015 00:00','FR',4137,4137,'15/04/2015 19:45','16/04/2015 18:00','E',303848241,'L','L',' ','C','0','01/04/2015 12:00','03/04/2015 09:00','E',411670943,'L','L',0,0,0,'12/01/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2050041F075598',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VALENCIENNES   ','AMIENS','VALENCIENNES   ','LOCAL',193,'immo','VP',32,862,2758,'janv.-15','VALENCIENNES   ','-','mercedes',-148,'-','C220 BVA','24 000','2 667','ok','déclassé',100,'ok','C220 BVA',93,'courte','-','contrat','VCS','VCS','AMIENS','local','F','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906960,'DL204AB',9508,'L',6109,'03/11/2014 00:00','ON MOVE',18366,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',6109,6109,'20/04/2015 16:46','20/05/2015 16:46','E',410827163,'L','L',' ','C','1','21/03/2015 16:46','20/04/2015 16:46','E',131529101,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572485',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROUEN DT       ','AMIENS','ROUEN','LOCAL',-147,'ok','VP',66,2783,18366,'nov.-14','ROUEN DT       ','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',3000,'ok','C4',3000,'moyenne','vo mensuel','contrat','ROUEN','ROUEN','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906971,'DL332AB',9508,'L',2262,'03/11/2014 00:00','ON HAND',17106,NULL,'CITRC4  ','C4D6','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',1995,2262,'21/04/2015 16:20','23/04/2015 12:00','E',303887942,'L','L',' ','C','0','21/04/2015 12:41','21/04/2015 16:00','E',367324,' ',' ',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572486',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'TGV HTE PICARD.','AMIENS','TGV HTE PICARDIE','LOCAL',125,'immo','VP',57,3001,17106,'nov.-14','TGV HTE PICARD.','-','citroen',-18,'-','C4 HDI 90','18 000','3 000','ok','déclassé',200,'ok','C4',182,'courte','-','contrat','TGV','TGV','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906982,'DL640JY',9508,'L',5652,'12/01/2015 00:00','ON MOVE',5064,NULL,'MERC220 ','22BS','F','   ','5DR','BLK','12/01/2015 00:00',NULL,'01/10/2015 00:00','FR',5652,5652,'21/04/2015 16:00','23/04/2015 16:00','E',411557322,'L','L',' ','C','1','15/04/2015 08:00','16/04/2015 09:00','E',411556740,'L','L',0,0,0,'12/01/2015 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   WDD2050041F074258',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'MAUBEUGEDT     ','AMIENS','MAUBEUGE','LOCAL',123,'immo','VP',34,1489,5064,'janv.-15','MAUBEUGEDT     ','-','mercedes',-148,'-','C220 BVA','24 000','2 667','ok','déclassé',200,'ok','C220 BVA',200,'courte','-','contrat','MAUB','MAUB','AMIENS','local','F','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2906993,'DL517AB',9508,'L',50198,'03/11/2014 00:00','ON MOVE',17889,NULL,'CITRC4  ','CH08','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',50198,50198,'17/04/2015 12:09','27/04/2015 09:00','E',411653465,'C','C',' ','C','1','15/04/2015 17:57','16/04/2015 16:46','E',411653303,'C','C',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572584',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'PARIS LA DEFENSE LIVRAISON 92','PARIS VILLE 1','PARIS LA DEFENSE LIVRAISON 92','EXT',86,'immo','VP',58,3084,17889,'nov.-14','PARIS LA DEFENSE LIVRAISON 92','-','citroen',-18,'-','C4 HDI 110 BM','27 000','4 500','ok','déclassé',1000,'ok','C4 HDI',987,'courte','-','contrat','PARIS','PARIS','PARIS VILLE 1','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907004,'DK346NM',9508,'L',2476,'01/12/2014 00:00','ON MOVE',5998,NULL,'NISSQASH','NQAH','E','   ','5DR','WHI','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',2476,2476,'17/04/2015 12:00','24/04/2015 11:59','E',411341081,'L','L',' ','E','1','13/04/2015 15:00','15/04/2015 14:30','E',411340580,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFDAJ11U1204098',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'CREIL          ','AMIENS','CREIL          ','LOCAL',115,'immo','VP',48,1250,5998,'déc.-14','CREIL          ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','ok',700,'ok','QASHQAI 1,5 110CV',700,'courte','-','contrat','CREIL','CREIL','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907015,'DL302AB',9508,'L',4137,'03/11/2014 00:00','ON MOVE',8615,NULL,'CITRC4  ','CH08','J','   ','5DR','GRY','03/11/2014 00:00',NULL,'24/05/2015 00:00','FR',4137,2478,'16/04/2015 14:17','30/04/2015 10:00','E',356127,' ',' ',' ','J','1','13/04/2015 12:02','15/04/2015 09:00','E',339471952,'L','L',0,0,0,'03/11/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   VF7NC9HD7EY572585',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'VALENCIENNES   ','AMIENS','VALENCIENNES   ','LOCAL',56,'immo','VP',59,1460,8615,'nov.-14','ST QUENTIN     ','-','citroen',-18,'-','C4 HDI 110 BM','27 000','4 500','ok','ok',1400,'ok','C4 HDI',1382,'courte','-','nrt','VCS','STQ','AMIENS','local','J','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907026,'DK366NL',9508,'L',6109,'01/12/2014 00:00','ON HAND',15059,NULL,'NISSQASH','NQAH','E','   ','5DR','WHI','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',6109,6109,'14/04/2015 15:00','18/04/2015 09:00','E',411465596,'L','L',' ','C','0','30/03/2015 09:01','08/04/2015 09:00','E',619435191,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFDAJ11U1205542',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROUEN DT       ','AMIENS','ROUEN','LOCAL',176,'immo','VP',46,3274,15059,'déc.-14','ROUEN DT       ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',400,'ok','QASHQAI 1,5 110CV',375,'courte','-','contrat','ROUEN','ROUEN','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907030,'DK392NL',9508,'L',6109,'01/12/2014 00:00','ON MOVE',7526,NULL,'NISSQASH','NQAH','E','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',6109,6109,'28/03/2015 08:30','27/04/2015 08:30','E',339947716,'L','L',' ','H','1','26/02/2015 08:30','28/03/2015 08:30','E',339947705,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1202333',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ROUEN DT       ','AMIENS','ROUEN','LOCAL',86,'immo','VP',49,1536,7526,'déc.-14','ROUEN DT       ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',3000,'ok','QASHQAI 1,5 110CV',3000,'moyenne','-','contrat','ROUEN','ROUEN','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907041,'DK548NL',9508,'L',3476,'04/12/2014 00:00','ON HAND',10003,NULL,'NISSQASH','NQAH','E','   ','5DR','WHI','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',3476,3476,'20/04/2015 14:00','22/04/2015 14:29','E',252667575,'L','L',' ','E','0','08/04/2015 17:51','14/04/2015 13:28','E',411760263,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1204740',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ST QUENTIN GARE','AMIENS','ST QUENTIN','LOCAL',134,'immo','VP',47,2128,10003,'déc.-14','ST QUENTIN GARE','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','ok',300,'ok','QASHQAI 1,5 110CV',202,'courte','-','contrat','STQ','STQ','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907052,'DK561NL',9508,'L',6563,'04/12/2014 00:00','ON HAND',15882,NULL,'NISSQASH','NQAH','E','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',6563,6563,'23/04/2015 08:14','23/04/2015 17:18','E',304406340,'L','L',' ','C','0','13/04/2015 10:56','16/04/2015 18:50','E',303523124,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1203903',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'BEAUVAIS APT   ','AMIENS','BEAUVAIS APT','LOCAL',123,'immo','VP',47,3379,15882,'déc.-14','BEAUVAIS APT   ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',100,'ok','QASHQAI 1,5 110CV',38,'courte','-','contrat','BVS','BVS','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907063,'DK578NM',9508,'L',2478,'04/12/2014 00:00','ON MOVE',6411,NULL,'NISSQASH','NQAH','E','   ','5DR','BLU','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',2478,2478,'23/04/2015 14:30','20/05/2015 14:00','E',303863770,'L','L',' ','E','1','13/04/2015 12:00','16/04/2015 12:00','E',411760440,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1204064',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ST QUENTIN     ','AMIENS','ST QUENTIN','LOCAL',-146,'ok','VP',56,1145,6411,'déc.-14','ST QUENTIN     ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','ok',2700,'ok','QASHQAI 1,5 110CV',2698,'moyenne','-','contrat','STQ','STQ','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907074,'DK583NL',9508,'L',2474,'02/12/2014 00:00','ON MOVE',8950,NULL,'NISSQASH','NQAH','E','   ','5DR','BLK','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',2474,2474,'31/03/2015 18:14','30/04/2015 18:00','E',318330,' ',' ',' ','E','1','28/02/2015 18:00','31/03/2015 18:00','E',8797019,' ',' ',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1204780',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'ABBEVILLE DT   ','AMIENS','ABBEVILLE','LOCAL',53,'immo','VP',50,1790,8950,'déc.-14','ABBEVILLE DT   ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','ok',3000,'ok','QASHQAI 1,5 110CV',2999,'moyenne','-','nrt','ABB','ABB','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907085,'DK616NL',9508,'L',2643,'15/12/2014 00:00','ON MOVE',15457,NULL,'NISSQASH','NQAH','E','   ','5DR','WHI','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',2643,3716,'22/04/2015 15:00','24/04/2015 23:00','E',303713093,'L','L',' ','C','1','20/04/2015 17:30','22/04/2015 09:07','E',303712942,'L','L',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1204322',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'BETHUNE DT     ','AMIENS','BETHUNE','LOCAL',110,'immo','VP',44,3513,15457,'déc.-14','BETHUNE GARE   ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',300,'ok','QASHQAI 1,5 110CV',233,'courte','-','contrat','BTH','BTH','AMIENS','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL),(2907096,'DK669NM',9508,'L',4109,'01/12/2014 00:00','ON MOVE',19015,NULL,'NISSQASH','NQAH','E','   ','5DR','WHI','02/12/2014 00:00',NULL,'23/06/2015 00:00','FR',4109,4109,'19/04/2015 18:00','25/04/2015 18:20','E',411495873,'C','C',' ','D','1','12/04/2015 18:25','17/04/2015 19:44','E',411494322,'C','C',0,0,0,'02/12/2014 00:00',9508,NULL,0,0,NULL,0,0,0,0,NULL,0,'N',0,0,0,'   SJNFAAJ11U1204681',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'STRASBOURG APT ','CORPORATE','STRASBOURG APT ','EXT',102,'immo','VP',49,3881,19015,'déc.-14','STRASBOURG APT ','-','nissan',-48,'-','QASHQAI 1,5 110','21 000','3 500','ok','déclassé',700,'alerte','QASHQAI 1,5 110CV',601,'courte','-','contrat','EST','EST','CORPORATE','local','E','2015-04-03 00:00:00','Non renseignée','Non renseignée','Non renseignée',NULL);
/*!40000 ALTER TABLE `vehicules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voiture_à_récuperer`
--

DROP TABLE IF EXISTS `voiture_à_récuperer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voiture_à_récuperer` (
  `id_récupération` int(11) NOT NULL AUTO_INCREMENT,
  `nomPréparateur` varchar(45) DEFAULT NULL,
  `immat` varchar(45) DEFAULT NULL,
  `num_contrat` varchar(45) DEFAULT NULL,
  `nomParking` varchar(45) DEFAULT NULL,
  `nomClient` varchar(45) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `date_prevue` date DEFAULT NULL,
  PRIMARY KEY (`id_récupération`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voiture_à_récuperer`
--

LOCK TABLES `voiture_à_récuperer` WRITE;
/*!40000 ALTER TABLE `voiture_à_récuperer` DISABLE KEYS */;
/*!40000 ALTER TABLE `voiture_à_récuperer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-20 23:41:09
