-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mer ex 2 (b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mer ex 2 (b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mer ex 2 (b` ;
USE `Mer ex 2 (b` ;

-- -----------------------------------------------------
-- Table `Mer ex 2 (b`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer ex 2 (b`.`Cine` (
  `NIF` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Ubicacio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Numero de sales` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`));


-- -----------------------------------------------------
-- Table `Mer ex 2 (b`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer ex 2 (b`.`Tarifa` (
  `Preu` INT NOT NULL,
  `ID` VARCHAR(45) NULL,
  `Tipus` VARCHAR(45) NULL,
  `Cine` VARCHAR(25) NULL,
  PRIMARY KEY (`Preu`));


-- -----------------------------------------------------
-- Table `Mer ex 2 (b`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer ex 2 (b`.`Pelicula` (
  `ISBN` INT(20) NOT NULL,
  `Titol` VARCHAR(25) NULL,
  `Director` VARCHAR(30) NULL,
  `Protagonista` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`));


-- -----------------------------------------------------
-- Table `Mer ex 2 (b`.`Projeccio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer ex 2 (b`.`Projeccio` (
  `ID` INT(9) NOT NULL,
  `Pelicula` VARCHAR(20) NULL,
  `Data` DATE NULL,
  `Hora` TIME NULL,
  `Sala` VARCHAR(25) NULL,
  `Cine_NIF` VARCHAR(45) NULL,
  `Pel·lícula_ISBN` INT(20) NULL,
  `Tarifa_Preu` INT NULL,
  `Cine_NIF1` VARCHAR(45) NULL,
  INDEX `fk_Projecció_Pel·lícula1_idx` (`Pel·lícula_ISBN` ASC) VISIBLE,
  INDEX `fk_Projecció_Tarifa1_idx` (`Tarifa_Preu` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  INDEX `fk_Projeccio_Cine1_idx` (`Cine_NIF1` ASC) VISIBLE,
  CONSTRAINT `fk_Projecció_Pel·lícula1`
    FOREIGN KEY (`Pel·lícula_ISBN`)
    REFERENCES `Mer ex 2 (b`.`Pelicula` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projecció_Tarifa1`
    FOREIGN KEY (`Tarifa_Preu`)
    REFERENCES `Mer ex 2 (b`.`Tarifa` (`Preu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Cine1`
    FOREIGN KEY (`Cine_NIF1`)
    REFERENCES `Mer ex 2 (b`.`Cine` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
