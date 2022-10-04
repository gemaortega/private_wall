-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Fist_name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NULL,
  `email` VARCHAR(155) NULL,
  `password` VARCHAR(425) NULL,
  `created_at` DATETIME NULL DEFAULT 'NOW()',
  `updated_at` DATETIME NULL DEFAULT 'NOW()',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT 'NOW()',
  `updated_at` DATETIME NULL DEFAULT "NOW()",
  `sender_id` INT NOT NULL,
  `receiver_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_Users_idx` (`sender_id` ASC) VISIBLE,
  INDEX `fk_messages_Users1_idx` (`receiver_id1` ASC) VISIBLE,
  CONSTRAINT `fk_messages_Users`
    FOREIGN KEY (`sender_id`)
    REFERENCES `mydb`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_Users1`
    FOREIGN KEY (`receiver_id1`)
    REFERENCES `mydb`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
