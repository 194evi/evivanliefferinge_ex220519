-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema question_3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema question_3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `question_3` ;
USE `question_3` ;

-- -----------------------------------------------------
-- Table `question_3`.`Disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `question_3`.`Disease` (
  `disease_id` INT NOT NULL,
  `disease_name` VARCHAR(45) NULL,
  `disease_discription` TEXT(80) NULL,
  PRIMARY KEY (`disease_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question_3`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `question_3`.`Patient` (
  `Patient_id` INT NOT NULL AUTO_INCREMENT,
  `gender` ENUM("M", "F") NULL,
  `age` INT(3) NULL,
  `disease_id` INT NOT NULL,
  UNIQUE INDEX `Patient_id_UNIQUE` (`Patient_id` ASC) VISIBLE,
  PRIMARY KEY (`Patient_id`),
  INDEX `disease_idx` (`disease_id` ASC) VISIBLE,
  CONSTRAINT `disease`
    FOREIGN KEY (`disease_id`)
    REFERENCES `question_3`.`Disease` (`disease_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question_3`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `question_3`.`gene` (
  `gene_id` INT NOT NULL AUTO_INCREMENT,
  `gene_name` VARCHAR(45) NOT NULL,
  `gene_discription` TEXT(80) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` VARCHAR(2) NULL,
  `Patient_id` INT NOT NULL,
  `disease_id` INT NOT NULL,
  PRIMARY KEY (`gene_id`),
  UNIQUE INDEX `gene_id_UNIQUE` (`gene_id` ASC) VISIBLE,
  INDEX `patient_idx` (`Patient_id` ASC) VISIBLE,
  CONSTRAINT `patient`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `question_3`.`Patient` (`Patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
