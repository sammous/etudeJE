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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Preparateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Preparateur` (
  `idPreparateur` INT NOT NULL,
  `nomPreparateur` VARCHAR(45) NULL,
  `agence` VARCHAR(45) NULL,
  PRIMARY KEY (`idPreparateur`),
  UNIQUE INDEX `idOperateur_UNIQUE` (`idPreparateur` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicule` (
  `idVehicule` INT NOT NULL,
  `mva` VARCHAR(45) NULL,
  `immat` VARCHAR(45) NULL,
  `modele` VARCHAR(45) NULL,
  `statut wizard` VARCHAR(45) NULL,
  `km` VARCHAR(45) NULL,
  `carburant` VARCHAR(45) NULL,
  `Vehiculecol` VARCHAR(45) NULL,
  PRIMARY KEY (`idVehicule`),
  UNIQUE INDEX `idVehicule_UNIQUE` (`idVehicule` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parking` (
  `idParking` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idParking`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Agence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agence` (
  `idAgence` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `adresse` VARCHAR(45) NULL,
  PRIMARY KEY (`idAgence`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Est_Stationne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Est_Stationne` (
  `idVehicule` INT NOT NULL,
  `idParking` INT NOT NULL,
  `idPreparateur` INT NOT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`idVehicule`, `idParking`, `idPreparateur`),
  INDEX `fk_Vehicule_has_Parking_Parking1_idx` (`idParking` ASC),
  INDEX `fk_Vehicule_has_Parking_Vehicule1_idx` (`idVehicule` ASC),
  INDEX `fk_Est_Stationné_Operateur1_idx` (`idPreparateur` ASC),
  CONSTRAINT `fk_Vehicule_has_Parking_Vehicule1`
    FOREIGN KEY (`idVehicule`)
    REFERENCES `mydb`.`Vehicule` (`idVehicule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicule_has_Parking_Parking1`
    FOREIGN KEY (`idParking`)
    REFERENCES `mydb`.`Parking` (`idParking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Est_Stationné_Operateur1`
    FOREIGN KEY (`idPreparateur`)
    REFERENCES `mydb`.`Preparateur` (`idPreparateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Process_F44`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Process_F44` (
  `idPreparateur` INT NOT NULL,
  `idVehicule` INT NOT NULL,
  `Numero` INT NOT NULL,
  `mva` VARCHAR(45) NULL,
  `immat` VARCHAR(45) NULL,
  `aspiration_interieur` TINYINT(1) NULL,
  `lavage_exterieur` TINYINT(1) NULL DEFAULT 0,
  `nettoyage_vitre` TINYINT(1) NULL DEFAULT 0,
  `nettoyage_parebrise_interieur` TINYINT(1) NULL DEFAULT 0,
  `niveau_huile` TINYINT(1) NULL DEFAULT 0,
  `niveau_lave_glace` TINYINT(1) NULL DEFAULT 0,
  `pression_pneus` TINYINT(1) NULL DEFAULT 0,
  `controle_carosserie` TINYINT(1) NULL DEFAULT 0,
  `controle_interieur` TINYINT(1) NULL DEFAULT 0,
  `remplissage_carburant` DOUBLE NULL,
  PRIMARY KEY (`idPreparateur`, `idVehicule`, `Numero`),
  UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC),
  INDEX `fk_Process_F44_Vehicule1_idx` (`idVehicule` ASC),
  INDEX `fk_Process_F44_Operateur1_idx` (`idPreparateur` ASC),
  CONSTRAINT `fk_Process_F44_Vehicule1`
    FOREIGN KEY (`idVehicule`)
    REFERENCES `mydb`.`Vehicule` (`idVehicule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Process_F44_Operateur1`
    FOREIGN KEY (`idPreparateur`)
    REFERENCES `mydb`.`Preparateur` (`idPreparateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicule_exterieur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicule_exterieur` (
  `idVehicule_ext` INT NOT NULL,
  `immat` VARCHAR(45) NULL,
  `mva` VARCHAR(45) NULL,
  `modele` VARCHAR(45) NULL,
  `proprio` DOUBLE NULL,
  `num_contrat` VARCHAR(45) NULL,
  `agence` VARCHAR(45) NULL,
  `date_limite_transfert` VARCHAR(45) NULL,
  `date_limite_relocation` DATE NULL,
  `present_agence` TINYINT(1) NULL,
  `statut_proprio` TINYINT(1) NULL,
  `date_statut_proprio` DATE NULL,
  `date_transfert` DATE NULL,
  `date_relocation` DATE NULL,
  PRIMARY KEY (`idVehicule_ext`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Process_Check_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Process_Check_in` (
  `Numero` INT NOT NULL,
  `idPreparateur` INT NOT NULL,
  `idVehicule` INT NOT NULL,
  `Vehicule_exterieur` INT NOT NULL,
  `immat` VARCHAR(45) NULL,
  `mva` VARCHAR(45) NULL,
  `date_retour_reel` DATE NULL,
  `heure_retour_reel` TIME NULL,
  `km` DOUBLE UNSIGNED NULL,
  `carburant` VARCHAR(45) NULL,
  `dommage` TINYINT(1) NULL DEFAULT 0,
  `presence_gps` TINYINT(1) NULL DEFAULT 0,
  `position_vehicule` VARCHAR(45) NULL,
  PRIMARY KEY (`Numero`, `idPreparateur`, `idVehicule`, `Vehicule_exterieur`),
  UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC),
  INDEX `fk_Process_Check_in_Operateur1_idx` (`idPreparateur` ASC),
  INDEX `fk_Process_Check_in_Vehicule1_idx` (`idVehicule` ASC),
  INDEX `fk_Process_Check_in_Vehicule_exterieur1_idx` (`Vehicule_exterieur` ASC),
  CONSTRAINT `fk_Process_Check_in_Operateur1`
    FOREIGN KEY (`idPreparateur`)
    REFERENCES `mydb`.`Preparateur` (`idPreparateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Process_Check_in_Vehicule1`
    FOREIGN KEY (`idVehicule`)
    REFERENCES `mydb`.`Vehicule` (`idVehicule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Process_Check_in_Vehicule_exterieur1`
    FOREIGN KEY (`Vehicule_exterieur`)
    REFERENCES `mydb`.`Vehicule_exterieur` (`idVehicule_ext`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Operateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Operateur` (
  `idOperateur` INT NOT NULL,
  `nomOperateur` VARCHAR(45) NULL,
  PRIMARY KEY (`idOperateur`),
  UNIQUE INDEX `idPreparateur_UNIQUE` (`idOperateur` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Preparation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Preparation` (
  `idPreparation` INT NOT NULL,
  `idPreparateur` INT NOT NULL,
  `idVehicule` INT NOT NULL,
  `prev_date` DATE NULL,
  `accompli` TINYINT(1) NULL,
  `nomOperateur` VARCHAR(45) NULL,
  `nomPreparateur` VARCHAR(45) NULL,
  PRIMARY KEY (`idPreparation`, `idPreparateur`, `idVehicule`),
  UNIQUE INDEX `id_preparation_UNIQUE` (`idPreparation` ASC),
  INDEX `fk_Preparation_Preparateur1_idx` (`idPreparateur` ASC),
  UNIQUE INDEX `idPreparateur_UNIQUE` (`idPreparateur` ASC),
  INDEX `fk_Preparation_Vehicule1_idx` (`idVehicule` ASC),
  CONSTRAINT `fk_Preparation_Preparateur1`
    FOREIGN KEY (`idPreparateur`)
    REFERENCES `mydb`.`Operateur` (`idOperateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Preparation_Vehicule1`
    FOREIGN KEY (`idVehicule`)
    REFERENCES `mydb`.`Vehicule` (`idVehicule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transfert`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transfert` (
  `idTransfert` INT NOT NULL,
  `idPreparateur` INT NOT NULL,
  `idVehicule` INT NOT NULL,
  `prev_date` DATE NULL,
  `accompli` TINYINT(1) NULL,
  `nomOperateur` VARCHAR(45) NULL,
  `nomPreparateur` VARCHAR(45) NULL,
  PRIMARY KEY (`idTransfert`, `idPreparateur`, `idVehicule`),
  INDEX `fk_Transfert_Preparateur1_idx` (`idPreparateur` ASC),
  INDEX `fk_Transfert_Vehicule1_idx` (`idVehicule` ASC),
  CONSTRAINT `fk_Transfert_Preparateur1`
    FOREIGN KEY (`idPreparateur`)
    REFERENCES `mydb`.`Operateur` (`idOperateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transfert_Vehicule1`
    FOREIGN KEY (`idVehicule`)
    REFERENCES `mydb`.`Vehicule` (`idVehicule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recuperation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Recuperation` (
  `idRecuperation` INT NOT NULL,
  `idPreparateur` INT NOT NULL,
  `iidVehicule` INT NOT NULL,
  `prev_date` DATE NULL,
  `accompli` TINYINT(1) NULL,
  `nomOperateur` VARCHAR(45) NULL,
  `nomPreparateur` VARCHAR(45) NULL,
  PRIMARY KEY (`idRecuperation`, `idPreparateur`, `iidVehicule`),
  INDEX `fk_Recuperation_Preparateur1_idx` (`idPreparateur` ASC),
  INDEX `fk_Recuperation_Vehicule1_idx` (`iidVehicule` ASC),
  CONSTRAINT `fk_Recuperation_Preparateur1`
    FOREIGN KEY (`idPreparateur`)
    REFERENCES `mydb`.`Operateur` (`idOperateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recuperation_Vehicule1`
    FOREIGN KEY (`iidVehicule`)
    REFERENCES `mydb`.`Vehicule` (`idVehicule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livraison`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livraison` (
  `idLivraison` INT NOT NULL,
  `idVehicule` INT NOT NULL,
  `idPreparateur` INT NOT NULL,
  `prev_date` DATE NULL,
  `accompli` TINYINT(1) NULL,
  `nomOperateur` VARCHAR(45) NULL,
  `nomPreparateur` VARCHAR(45) NULL,
  PRIMARY KEY (`idLivraison`, `idVehicule`, `idPreparateur`),
  INDEX `fk_Livraison_Preparateur1_idx` (`idPreparateur` ASC),
  INDEX `fk_Livraison_Vehicule1_idx` (`idVehicule` ASC),
  CONSTRAINT `fk_Livraison_Preparateur1`
    FOREIGN KEY (`idPreparateur`)
    REFERENCES `mydb`.`Operateur` (`idOperateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livraison_Vehicule1`
    FOREIGN KEY (`idVehicule`)
    REFERENCES `mydb`.`Vehicule` (`idVehicule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Voiture_à_récuperer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Voiture_à_récuperer` (
  `idVoiture_à_récuperer` INT NOT NULL,
  `idPreparateur` VARCHAR(45) NULL,
  `idVehicule` VARCHAR(45) NULL,
  `immat` VARCHAR(45) NULL,
  `num_contrat` VARCHAR(45) NULL,
  `idParking` VARCHAR(45) NULL,
  `idClient` VARCHAR(45) NULL,
  `etat` TINYINT(1) NULL,
  `date_prevue` DATE NULL,
  PRIMARY KEY (`idVoiture_à_récuperer`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
