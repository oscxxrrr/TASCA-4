-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mer ex 2.a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mer ex 2.a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mer ex 2.a` ;
USE `mer ex 2.a` ;

-- -----------------------------------------------------
-- Table `mer ex 2.a`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer ex 2.a`.`Pacient` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(50) NOT NULL,
  `Telefon` INT(9) NULL,
  `Direcció` VARCHAR(200) NULL,
  `Num_SS` INT(9) NULL,
  `DNI` INT(9) NOT NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `mer ex 2.a`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer ex 2.a`.`Metge` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(50) NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Carrec` VARCHAR(45) NOT NULL,
  `Especialitat` VARCHAR(45) NOT NULL,
  `Telefon` INT(9) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `mer ex 2.a`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer ex 2.a`.`Consulta` (
  `ID` INT NOT NULL,
  `Lloc` VARCHAR(45) NOT NULL,
  `Edifici` VARCHAR(45) NOT NULL,
  `Data_Inici` DATE NOT NULL,
  `Data_fi` DATE NOT NULL,
  `Diagnostic` TEXT(500) NULL,
  `Planta` VARCHAR(45) NOT NULL,
  `Pacient_ID` INT NOT NULL,
  `Metge_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Pacient_ID`, `Metge_ID`),
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_ID` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_ID`)
    REFERENCES `mer ex 2.a`.`Pacient` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_ID`)
    REFERENCES `mer ex 2.a`.`Metge` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
