-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER7` ;
USE `MER7` ;

-- -----------------------------------------------------
-- Table `MER7`.`Treballador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Treballador` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` INT(9) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Client` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Ticket` (
  `Numero` INT NOT NULL,
  `Num_Factura` VARCHAR(45) NULL,
  `Nom_Empresa` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NULL,
  `Domicili_Fiscal` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Web` VARCHAR(45) NULL,
  `Data` DATE NULL,
  `Forma_Pagament` VARCHAR(45) NULL,
  `Treballador_ID` INT NOT NULL,
  `Client_ID` INT NOT NULL,
  PRIMARY KEY (`Numero`, `Treballador_ID`, `Client_ID`),
  INDEX `fk_Ticket_Treballador1_idx` (`Treballador_ID` ASC) VISIBLE,
  INDEX `fk_Ticket_Client1_idx` (`Client_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Treballador1`
    FOREIGN KEY (`Treballador_ID`)
    REFERENCES `MER7`.`Treballador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Client1`
    FOREIGN KEY (`Client_ID`)
    REFERENCES `MER7`.`Client` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `MER7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Producte` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripció` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `Preu_Unitari` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER7`.`Linia_Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Linia_Ticket` (
  `ID` INT NOT NULL,
  `Quantitat` INT NULL,
  `Descompte` VARCHAR(45) NULL,
  `Ticket_Numero` INT NOT NULL,
  `Producte_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Ticket_Numero`, `Producte_ID`),
  INDEX `fk_Linia_Ticket_Ticket_idx` (`Ticket_Numero` ASC) VISIBLE,
  INDEX `fk_Linia_Ticket_Producte1_idx` (`Producte_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Linia_Ticket_Ticket`
    FOREIGN KEY (`Ticket_Numero`)
    REFERENCES `MER7`.`Ticket` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linia_Ticket_Producte1`
    FOREIGN KEY (`Producte_ID`)
    REFERENCES `MER7`.`Producte` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
