-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mer Ex2 (c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mer Ex2 (c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mer Ex2 (c` ;
USE `Mer Ex2 (c` ;

-- -----------------------------------------------------
-- Table `Mer Ex2 (c`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer Ex2 (c`.`Alumne` (
  `Expedient` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(20) NULL,
  `Cognom` VARCHAR(32) NULL,
  `Telefon` INT(9) NULL,
  `Adreça` VARCHAR(45) NULL,
  `Data_Naixament` DATE NULL,
  `Correu` VARCHAR(45) NULL,
  `Professor_DNI` VARCHAR(9) NOT NULL,
  `Professor_Departament_Nom` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Expedient`, `Professor_DNI`, `Professor_Departament_Nom`));


-- -----------------------------------------------------
-- Table `Mer Ex2 (c`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer Ex2 (c`.`Departament` (
  `Nom` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Nom`));


-- -----------------------------------------------------
-- Table `Mer Ex2 (c`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer Ex2 (c`.`Assignatura` (
  `Nom` VARCHAR(15) NOT NULL,
  `Credits` VARCHAR(45) NULL,
  `Departament` VARCHAR(45) NULL,
  `Professor` VARCHAR(45) NULL,
  PRIMARY KEY (`Nom`));


-- -----------------------------------------------------
-- Table `Mer Ex2 (c`.`Matrícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer Ex2 (c`.`Matrícula` (
  `ID` VARCHAR(45) NOT NULL,
  `Data` DATE NULL,
  `Assignatura` VARCHAR(20) NULL,
  `Alumne_Expedient1` VARCHAR(45) NOT NULL,
  `Alumne_Professor_DNI1` VARCHAR(9) NOT NULL,
  `Alumne_Professor_Departament_Nom1` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Alumne_Expedient1`, `Alumne_Professor_DNI1`, `Alumne_Professor_Departament_Nom1`, `ID`),
  INDEX `fk_Matrícula_Alumne1_idx` (`Alumne_Expedient1` ASC, `Alumne_Professor_DNI1` ASC, `Alumne_Professor_Departament_Nom1` ASC) VISIBLE,
  CONSTRAINT `fk_Matrícula_Alumne1`
    FOREIGN KEY (`Alumne_Expedient1` , `Alumne_Professor_DNI1` , `Alumne_Professor_Departament_Nom1`)
    REFERENCES `Mer Ex2 (c`.`Alumne` (`Expedient` , `Professor_DNI` , `Professor_Departament_Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Mer Ex2 (c`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer Ex2 (c`.`Professor` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(20) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Titulacio` VARCHAR(25) NULL,
  `Departament` VARCHAR(15) NULL,
  `Cap_del_Departament` VARCHAR(30) NULL,
  `Departament_Nom` VARCHAR(10) NOT NULL,
  `Departament_Nom1` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`DNI`, `Departament_Nom`, `Departament_Nom1`),
  INDEX `fk_Professor_Departament1_idx` (`Departament_Nom1` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_Nom1`)
    REFERENCES `Mer Ex2 (c`.`Departament` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Mer Ex2 (c`.`Matricula_Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer Ex2 (c`.`Matricula_Assignatura` (
  `Professor_DNI` VARCHAR(9) NOT NULL,
  `Professor_Departament_Nom` VARCHAR(10) NOT NULL,
  `Professor_Departament_Nom1` VARCHAR(10) NOT NULL,
  `Matrícula_Alumne1` VARCHAR(30) NOT NULL,
  `Matrícula_Alumne_Professor_DNI2` VARCHAR(9) NOT NULL,
  `Matrícula_Alumne_Expedient11` VARCHAR(45) NOT NULL,
  `Matrícula_Alumne_Professor_DNI11` VARCHAR(9) NOT NULL,
  `Matrícula_Alumne_Professor_Departament_Nom11` VARCHAR(10) NOT NULL,
  `Assignatura_Nom1` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Professor_DNI`, `Professor_Departament_Nom`, `Professor_Departament_Nom1`, `Matrícula_Alumne1`, `Matrícula_Alumne_Professor_DNI2`, `Matrícula_Alumne_Expedient11`, `Matrícula_Alumne_Professor_DNI11`, `Matrícula_Alumne_Professor_Departament_Nom11`, `Assignatura_Nom1`),
  INDEX `fk_Matricula_Assignatura_Matrícula1_idx` (`Matrícula_Alumne1` ASC, `Matrícula_Alumne_Professor_DNI2` ASC, `Matrícula_Alumne_Expedient11` ASC, `Matrícula_Alumne_Professor_DNI11` ASC, `Matrícula_Alumne_Professor_Departament_Nom11` ASC) VISIBLE,
  INDEX `fk_Matricula_Assignatura_Assignatura1_idx` (`Assignatura_Nom1` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Assignatura_Professor1`
    FOREIGN KEY (`Professor_DNI` , `Professor_Departament_Nom` , `Professor_Departament_Nom1`)
    REFERENCES `Mer Ex2 (c`.`Professor` (`DNI` , `Departament_Nom` , `Departament_Nom1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Assignatura_Matrícula1`
    FOREIGN KEY (`Matrícula_Alumne_Expedient11` , `Matrícula_Alumne_Professor_DNI11` , `Matrícula_Alumne_Professor_Departament_Nom11`)
    REFERENCES `Mer Ex2 (c`.`Matrícula` (`Alumne_Expedient1` , `Alumne_Professor_DNI1` , `Alumne_Professor_Departament_Nom1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Assignatura_Assignatura1`
    FOREIGN KEY (`Assignatura_Nom1`)
    REFERENCES `Mer Ex2 (c`.`Assignatura` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
