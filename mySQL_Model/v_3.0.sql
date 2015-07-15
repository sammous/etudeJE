-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`agence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`agence` ;

CREATE TABLE IF NOT EXISTS `mydb`.`agence` (
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `adresse` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`est_stationne`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`est_stationne` ;

CREATE TABLE IF NOT EXISTS `mydb`.`est_stationne` (
  `date` DATE NULL DEFAULT NULL,
  `immat` VARCHAR(45) NULL,
  `nomOperateur` VARCHAR(45) NULL,
  `nomParking` VARCHAR(45) NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`livraison`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`livraison` ;

CREATE TABLE IF NOT EXISTS `mydb`.`livraison` (
  `prev_date` DATE NULL DEFAULT NULL,
  `accompli` TINYINT(1) NULL DEFAULT NULL,
  `nomOperateur` VARCHAR(45) NULL DEFAULT NULL,
  `nomPreparateur` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`operateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`operateur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`operateur` (
  `nomOperateur` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`parking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`parking` ;

CREATE TABLE IF NOT EXISTS `mydb`.`parking` (
  `Nom` VARCHAR(45) NULL DEFAULT NULL,
  `Agence` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`preparateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`preparateur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`preparateur` (
  `nomPreparateur` VARCHAR(45) NULL DEFAULT NULL,
  `agence` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`preparation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`preparation` ;

CREATE TABLE IF NOT EXISTS `mydb`.`preparation` (
  `prev_date` DATE NULL DEFAULT NULL,
  `accompli` TINYINT(1) NULL DEFAULT NULL,
  `nomOperateur` VARCHAR(45) NULL DEFAULT NULL,
  `nomPreparateur` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`process_check_in`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`process_check_in` ;

CREATE TABLE IF NOT EXISTS `mydb`.`process_check_in` (
  `Numero` INT(11) NOT NULL AUTO_INCREMENT,
  `immat` VARCHAR(45) NULL DEFAULT NULL,
  `nomOperateur` VARCHAR(45) NULL,
  `mva` VARCHAR(45) NULL DEFAULT NULL,
  `date_retour_reel` DATE NULL DEFAULT NULL,
  `heure_retour_reel` TIME NULL DEFAULT NULL,
  `km` DOUBLE UNSIGNED NULL DEFAULT NULL,
  `carburant` VARCHAR(45) NULL DEFAULT NULL,
  `dommage` TINYINT(1) NULL DEFAULT '0',
  `presence_gps` TINYINT(1) NULL DEFAULT '0',
  `position_vehicule` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`process_f44`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`process_f44` ;

CREATE TABLE IF NOT EXISTS `mydb`.`process_f44` (
  `Numero` INT(11) NOT NULL AUTO_INCREMENT,
  `mva` VARCHAR(45) NULL DEFAULT NULL,
  `immat` VARCHAR(45) NULL DEFAULT NULL,
  `aspiration_interieur` TINYINT(1) NULL DEFAULT NULL,
  `lavage_exterieur` TINYINT(1) NULL DEFAULT '0',
  `nettoyage_vitre` TINYINT(1) NULL DEFAULT '0',
  `nettoyage_parebrise_interieur` TINYINT(1) NULL DEFAULT '0',
  `niveau_huile` TINYINT(1) NULL DEFAULT '0',
  `niveau_lave_glace` TINYINT(1) NULL DEFAULT '0',
  `pression_pneus` TINYINT(1) NULL DEFAULT '0',
  `controle_carosserie` TINYINT(1) NULL DEFAULT '0',
  `controle_interieur` TINYINT(1) NULL DEFAULT '0',
  `remplissage_carburant` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`recuperation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`recuperation` ;

CREATE TABLE IF NOT EXISTS `mydb`.`recuperation` (
  `prev_date` DATE NULL DEFAULT NULL,
  `accompli` TINYINT(1) NULL DEFAULT NULL,
  `nomOperateur` VARCHAR(45) NULL DEFAULT NULL,
  `nomPreparateur` VARCHAR(45) NULL DEFAULT NULL,
  `immat` VARCHAR(45) NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`transfert`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`transfert` ;

CREATE TABLE IF NOT EXISTS `mydb`.`transfert` (
  `prev_date` DATE NULL DEFAULT NULL,
  `accompli` TINYINT(1) NULL DEFAULT NULL,
  `nomOperateur` VARCHAR(45) NULL DEFAULT NULL,
  `nomPreparateur` VARCHAR(45) NULL DEFAULT NULL,
  `immat` VARCHAR(45) NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `attribut` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`vehicule_exterieur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`vehicule_exterieur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`vehicule_exterieur` (
  `immat` VARCHAR(45) NULL DEFAULT NULL,
  `mva` VARCHAR(45) NULL DEFAULT NULL,
  `modele` VARCHAR(45) NULL DEFAULT NULL,
  `proprio` DOUBLE NULL DEFAULT NULL,
  `num_contrat` VARCHAR(45) NULL DEFAULT NULL,
  `agence` VARCHAR(45) NULL DEFAULT NULL,
  `date_limite_transfert` VARCHAR(45) NULL DEFAULT NULL,
  `date_limite_relocation` DATE NULL DEFAULT NULL,
  `present_agence` TINYINT(1) NULL DEFAULT NULL,
  `statut_proprio` TINYINT(1) NULL DEFAULT NULL,
  `date_statut_proprio` DATE NULL DEFAULT NULL,
  `date_transfert` DATE NULL DEFAULT NULL,
  `date_relocation` DATE NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`vehicules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`vehicules` ;

CREATE TABLE IF NOT EXISTS `mydb`.`vehicules` (
  `MVA` INT(11) NULL DEFAULT NULL,
  `IMMAT` VARCHAR(7) NULL DEFAULT NULL,
  `PROPRIO_WIZARD` INT(11) NULL DEFAULT NULL,
  `INDICATIF_PROPRIO_CORP_LICENSEE` VARCHAR(1) NULL DEFAULT NULL,
  `CURRENT_LOCATION_STN` INT(11) NULL DEFAULT NULL,
  `DATE_DE_LIVRAISON` VARCHAR(16) NULL DEFAULT NULL,
  `STATUT` VARCHAR(8) NULL DEFAULT NULL,
  `KILOMETERS` INT(11) NULL DEFAULT NULL,
  `MARSHALL_DATE` VARCHAR(16) NULL DEFAULT NULL,
  `DESCRIPTION_VHL` VARCHAR(8) NULL DEFAULT NULL,
  `CODE_VEHICULE` VARCHAR(4) NULL DEFAULT NULL,
  `CATEGORIE_VHL` VARCHAR(1) NULL DEFAULT NULL,
  `MANUFACTURER_CODE` VARCHAR(3) NULL DEFAULT NULL,
  `WIZ_BODY_TYPE_CODE` VARCHAR(3) NULL DEFAULT NULL,
  `COULEUR` VARCHAR(3) NULL DEFAULT NULL,
  `DATE_ACHAT` VARCHAR(16) NULL DEFAULT NULL,
  `MISSING_DATE` INT(11) NULL DEFAULT NULL,
  `DATE_SORTIE_PREVUE` VARCHAR(16) NULL DEFAULT NULL,
  `REG_COUNTRY_CODE` VARCHAR(2) NULL DEFAULT NULL,
  `STATION_DEPART` INT(11) NULL DEFAULT NULL,
  `STATION_RETOUR` INT(11) NULL DEFAULT NULL,
  `DATE_DEPART` VARCHAR(16) NULL DEFAULT NULL,
  `DATE_RETOUR` VARCHAR(16) NULL DEFAULT NULL,
  `PREFIX_NUMERO_CONTRAT` VARCHAR(1) NULL DEFAULT NULL,
  `NUMERO_CONTRAT` INT(11) NULL DEFAULT NULL,
  `INDICATEUR_STATION_DEPART_CORPORATE_LICENSEE` VARCHAR(1) NULL DEFAULT NULL,
  `INDICATEUR_STATION_RETOUR_CORPORATE_LICENSEE` VARCHAR(1) NULL DEFAULT NULL,
  `INDICATEUR_MOYEN_DE_PAIEMENT` VARCHAR(1) NULL DEFAULT NULL,
  `CATGORIE_FACTUREE` VARCHAR(1) NULL DEFAULT NULL,
  `INDICATEUR_OPEN_MVT` VARCHAR(1) NULL DEFAULT NULL,
  `DATE_DEPART_PRECEDENT_CONTRAT` VARCHAR(16) NULL DEFAULT NULL,
  `DATE_RETOUR_PRECEDENT_CONTRAT` VARCHAR(16) NULL DEFAULT NULL,
  `PREFIX_NUMERO_CONTRAT_PRECEDENT` VARCHAR(1) NULL DEFAULT NULL,
  `NUMERO_CONTRAT_PRECEDENT` INT(11) NULL DEFAULT NULL,
  `INDICATEUR_CORP_LIC_PAGD_PRECEDENT` VARCHAR(1) NULL DEFAULT NULL,
  `INDICATEUR_CORP_LIC_PAGR_PRECEDENT` VARCHAR(1) NULL DEFAULT NULL,
  `INDICATEUR_STATUT_HOLD` INT(11) NULL DEFAULT NULL,
  `INDICATEUR_ON_MOVEMENT` INT(11) NULL DEFAULT NULL,
  `INDICATEUR_STATUT_TURNBACK` INT(11) NULL DEFAULT NULL,
  `DATE_ADDITION_VHL_DS_WIZARD` VARCHAR(16) NULL DEFAULT NULL,
  `STATION_ADDITION_VHL_DANS_WIZARD_NUMBER` INT(11) NULL DEFAULT NULL,
  `DATE_DERNEIR_ENTRETIEN` INT(11) NULL DEFAULT NULL,
  `STATION_DERNIER_ENTRETIEN` INT(11) NULL DEFAULT NULL,
  `MONTANT_DOMMAGES_ANTICIPES` INT(11) NULL DEFAULT NULL,
  `IN_SERVICE_DATE` INT(11) NULL DEFAULT NULL,
  `MISC_EQUIPMENT_CHARGES_AMT` INT(11) NULL DEFAULT NULL,
  `GLASS_CHARGES_AMT` INT(11) NULL DEFAULT NULL,
  `DISPOSAL_LEAD_MILEAGE_NO` INT(11) NULL DEFAULT NULL,
  `UNACCEPTABLE_REPAIR_AMT` INT(11) NULL DEFAULT NULL,
  `HI_MILEAGE_PROCESS_DATE` INT(11) NULL DEFAULT NULL,
  `HI_MILES_PROC_MAX_NO` INT(11) NULL DEFAULT NULL,
  `PM_IND` VARCHAR(1) NULL DEFAULT NULL,
  `PM_MILES_KMS` INT(11) NULL DEFAULT NULL,
  `PM_SERVICE` INT(11) NULL DEFAULT NULL,
  `PM_MK_MOD` INT(11) NULL DEFAULT NULL,
  `MVA_TRONQUE` VARCHAR(20) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_1` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_2` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_3` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_4` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_5` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_6` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_7` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_8` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_9` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_10` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_11` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_12` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_13` INT(11) NULL DEFAULT NULL,
  `COLONNE_SUP_AVIS_14` INT(11) NULL DEFAULT NULL,
  `nom_agence` VARCHAR(29) NULL DEFAULT NULL,
  `concessionnaire` VARCHAR(15) NULL DEFAULT NULL,
  `ville` VARCHAR(29) NULL DEFAULT NULL,
  `position` VARCHAR(5) NULL DEFAULT NULL,
  `immo` INT(11) NULL DEFAULT NULL,
  `statut_immo_5j` VARCHAR(4) NULL DEFAULT NULL,
  `VP_VU` VARCHAR(2) NULL DEFAULT NULL,
  `nbre_mois_d_tention` INT(11) NULL DEFAULT NULL,
  `km_mois` INT(11) NULL DEFAULT NULL,
  `km` INT(11) NULL DEFAULT NULL,
  `mois_livraison` VARCHAR(8) NULL DEFAULT NULL,
  `Agence_retour` VARCHAR(29) NULL DEFAULT NULL,
  `Statut_VO` VARCHAR(2) NULL DEFAULT NULL,
  `marque` VARCHAR(8) NULL DEFAULT NULL,
  `d_lai_VO` INT(11) NULL DEFAULT NULL,
  `retard_sortie_VO_wizard` VARCHAR(6) NULL DEFAULT NULL,
  `libell_mod_le` VARCHAR(26) NULL DEFAULT NULL,
  `km_maxi` VARCHAR(7) NULL DEFAULT NULL,
  `km_maxi_par_mois` VARCHAR(5) NULL DEFAULT NULL,
  `KM_d_pass` VARCHAR(6) NULL DEFAULT NULL,
  `d_classement` VARCHAR(8) NULL DEFAULT NULL,
  `dur_e_contrat` INT(11) NULL DEFAULT NULL,
  `km_en_cours_d_pass` VARCHAR(6) NULL DEFAULT NULL,
  `type` VARCHAR(20) NULL DEFAULT NULL,
  `dur_e` INT(11) NULL DEFAULT NULL,
  `type_dur_e_courte_moyenne` VARCHAR(7) NULL DEFAULT NULL,
  `statut_VO_mensuel` VARCHAR(10) NULL DEFAULT NULL,
  `contrat_nrt` VARCHAR(7) NULL DEFAULT NULL,
  `POSITION_CDG_ORY` VARCHAR(25) NULL DEFAULT NULL,
  `agence_retour_CDG_ORY` VARCHAR(25) NULL DEFAULT NULL,
  `proprio_agence_retour` VARCHAR(15) NULL DEFAULT NULL,
  `one_way` VARCHAR(6) NULL DEFAULT NULL,
  `cat_reformat_e` VARCHAR(12) NULL DEFAULT NULL,
  `Date_du_fichier` DATETIME NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`voiture_à_récuperer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`voiture_à_récuperer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`voiture_à_récuperer` (
  `immat` VARCHAR(45) NULL DEFAULT NULL,
  `num_contrat` VARCHAR(45) NULL DEFAULT NULL,
  `idParking` VARCHAR(45) NULL DEFAULT NULL,
  `idClient` VARCHAR(45) NULL DEFAULT NULL,
  `etat` TINYINT(1) NULL DEFAULT NULL,
  `date_prevue` DATE NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
