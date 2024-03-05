-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER5` ;
USE `MER5` ;

-- -----------------------------------------------------
-- Table `MER5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Client` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Adreça` VARCHAR(45) NULL,
  `Poblacio` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `Telefon` INT(9) NULL,
  `Ususari` VARCHAR(45) NULL,
  `Contrsenya` VARCHAR(45) NULL,
  `Numero_Vehicles` INT NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER5`.`Tipus_Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Tipus_Vehicle` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Vehicle` (
  `ID` INT(9) NOT NULL,
  `Matricula` VARCHAR(7) NULL,
  `Marca_Fabricant` VARCHAR(10) NULL,
  `Tipus_Vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Tipus_Vehicle_ID`),
  INDEX `fk_Vehicle_Tipus_Vehicle_idx` (`Tipus_Vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Tipus_Vehicle`
    FOREIGN KEY (`Tipus_Vehicle_ID`)
    REFERENCES `MER5`.`Tipus_Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `MER5`.`Cites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Cites` (
  `ID` INT NOT NULL,
  `Usuari` VARCHAR(45) NULL,
  `Matricula_Vehicle` VARCHAR(10) NULL,
  `Data` DATE NULL,
  `Hora` TIME NULL,
  `Vehicle_ID` INT(9) NOT NULL,
  `Vehicle_Tipus_Vehicle_ID` INT NOT NULL,
  `Client_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`ID`, `Vehicle_ID`, `Vehicle_Tipus_Vehicle_ID`, `Client_DNI`),
  INDEX `fk_Cites_Vehicle1_idx` (`Vehicle_ID` ASC, `Vehicle_Tipus_Vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Cites_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Cites_Vehicle1`
    FOREIGN KEY (`Vehicle_ID` , `Vehicle_Tipus_Vehicle_ID`)
    REFERENCES `MER5`.`Vehicle` (`ID` , `Tipus_Vehicle_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cites_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `MER5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `MER5`.`Client - Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Client - Vehicle` (
  `ID` INT NOT NULL,
  `Data_Inici` DATE NULL,
  `Data_Final` DATE NULL,
  `Client_DNI` VARCHAR(9) NOT NULL,
  `Vehicle_ID` INT(9) NOT NULL,
  `Vehicle_Tipus_Vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Client_DNI`, `Vehicle_ID`, `Vehicle_Tipus_Vehicle_ID`),
  INDEX `fk_Client - Vehicle_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Client - Vehicle_Vehicle1_idx` (`Vehicle_ID` ASC, `Vehicle_Tipus_Vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Client - Vehicle_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `MER5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client - Vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_ID` , `Vehicle_Tipus_Vehicle_ID`)
    REFERENCES `MER5`.`Vehicle` (`ID` , `Tipus_Vehicle_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
