-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER6` ;
USE `MER6` ;

-- -----------------------------------------------------
-- Table `MER6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Avio` (
  `ID` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat` VARCHAR(45) NULL,
  `Autonomia` VARCHAR(45) NULL,
  `Data_Fabricacio` DATE NULL,
  `Data_Mort` DATE NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER6`.`Passatgers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Passatgers` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Vol` (
  `ID` INT NOT NULL,
  `Num_Viatge` INT NULL,
  `Origen` VARCHAR(45) NULL,
  `Destinacio` VARCHAR(45) NULL,
  `Data_Sortida` DATE NULL,
  `Hora_Sortida` TIME NULL,
  `Data_Arribada` DATE NULL,
  `Hora_Arribada` TIME NULL,
  `Avio_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Avio_ID`),
  INDEX `fk_Vol_Avio1_idx` (`Avio_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio1`
    FOREIGN KEY (`Avio_ID`)
    REFERENCES `MER6`.`Avio` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `MER6`.`Reserves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Reserves` (
  `ID` INT NOT NULL,
  `Data` DATE NULL,
  `Import` VARCHAR(45) NULL,
  `Num_Seient` INT NULL,
  `Passatgers_ID` INT NOT NULL,
  `Vol_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Passatgers_ID`, `Vol_ID`),
  INDEX `fk_Reserves_Passatgers_idx` (`Passatgers_ID` ASC) VISIBLE,
  INDEX `fk_Reserves_Vol1_idx` (`Vol_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reserves_Passatgers`
    FOREIGN KEY (`Passatgers_ID`)
    REFERENCES `MER6`.`Passatgers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserves_Vol1`
    FOREIGN KEY (`Vol_ID`)
    REFERENCES `MER6`.`Vol` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
