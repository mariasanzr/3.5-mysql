-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blockbuster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blockbuster` ;

-- -----------------------------------------------------
-- Table `blockbuster`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actor` (
  `actor_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`language` (
  `language_id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`special_features`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`special_features` (
  `film_id` INT NOT NULL AUTO_INCREMENT,
  `special_features` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`rental` (
  `rental_id` INT NOT NULL AUTO_INCREMENT,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`inventory` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `rental_rental_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `rental_rental_id`),
  INDEX `fk_inventory_rental1_idx` (`rental_rental_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_rental1`
    FOREIGN KEY (`rental_rental_id`)
    REFERENCES `blockbuster`.`rental` (`rental_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`old`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`old` (
  `first_name` TEXT NOT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `category_category_id` INT NOT NULL,
  PRIMARY KEY (`first_name`, `category_category_id`),
  INDEX `fk_old_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_old_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `blockbuster`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`film` (
  `film_id` INT NOT NULL AUTO_INCREMENT,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` BIGINT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `language_language_id` INT NOT NULL,
  `special_features_film_id` INT NOT NULL,
  `inventory_inventory_id` INT NOT NULL,
  `old_first_name` TEXT NOT NULL,
  PRIMARY KEY (`film_id`, `language_language_id`, `special_features_film_id`, `inventory_inventory_id`, `old_first_name`),
  INDEX `fk_film_language_idx` (`language_language_id` ASC) VISIBLE,
  INDEX `fk_film_special_features1_idx` (`special_features_film_id` ASC) VISIBLE,
  INDEX `fk_film_inventory1_idx` (`inventory_inventory_id` ASC) VISIBLE,
  INDEX `fk_film_old1_idx` (`old_first_name` ASC) VISIBLE,
  CONSTRAINT `fk_film_language`
    FOREIGN KEY (`language_language_id`)
    REFERENCES `blockbuster`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_special_features1`
    FOREIGN KEY (`special_features_film_id`)
    REFERENCES `blockbuster`.`special_features` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_inventory1`
    FOREIGN KEY (`inventory_inventory_id`)
    REFERENCES `blockbuster`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_old1`
    FOREIGN KEY (`old_first_name`)
    REFERENCES `blockbuster`.`old` (`first_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`actor_has_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actor_has_film` (
  `actor_actor_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  `film_language_language_id` INT NOT NULL,
  `film_special_features_film_id` INT NOT NULL,
  `film_inventory_inventory_id` INT NOT NULL,
  `film_old_first_name` TEXT NOT NULL,
  PRIMARY KEY (`actor_actor_id`, `film_film_id`, `film_language_language_id`, `film_special_features_film_id`, `film_inventory_inventory_id`, `film_old_first_name`),
  INDEX `fk_actor_has_film_film1_idx` (`film_film_id` ASC, `film_language_language_id` ASC, `film_special_features_film_id` ASC, `film_inventory_inventory_id` ASC, `film_old_first_name` ASC) VISIBLE,
  INDEX `fk_actor_has_film_actor1_idx` (`actor_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor_has_film_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `blockbuster`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actor_has_film_film1`
    FOREIGN KEY (`film_film_id` , `film_language_language_id` , `film_special_features_film_id` , `film_inventory_inventory_id` , `film_old_first_name`)
    REFERENCES `blockbuster`.`film` (`film_id` , `language_language_id` , `special_features_film_id` , `inventory_inventory_id` , `old_first_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
