-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema api-desafiochefao-grupo2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema api-desafiochefao-grupo2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `api-desafiochefao-grupo2` DEFAULT CHARACTER SET utf8mb3 ;
USE `api-desafiochefao-grupo2` ;

-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(70) NOT NULL,
  `nickname` VARCHAR(20) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `age` INT NULL,
  `createdAt` DATETIME NOT NULL,
  `udpatedAt` DATETIME NULL,
  `totalPoints` INT NOT NULL,
  `qtdSongs` INT NULL,
  `qtdChords` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`chords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`chords` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `chordName` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`users_chords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`users_chords` (
  `users_id` INT NOT NULL,
  `chords_id` INT NOT NULL,
  `learnedAt` DATETIME NULL,
  PRIMARY KEY (`users_id`, `chords_id`),
  INDEX `fk_users_has_chords_chords1_idx` (`chords_id` ASC),
  INDEX `fk_users_has_chords_users_idx` (`users_id` ASC),
  CONSTRAINT `fk_users_has_chords_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `api-desafiochefao-grupo2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_chords_chords1`
    FOREIGN KEY (`chords_id`)
    REFERENCES `api-desafiochefao-grupo2`.`chords` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genreName` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`users_genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`users_genres` (
  `users_id` INT NOT NULL,
  `genres_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `genres_id`),
  INDEX `fk_users_has_genres_genres1_idx` (`genres_id` ASC),
  INDEX `fk_users_has_genres_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_users_has_genres_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `api-desafiochefao-grupo2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_genres_genres1`
    FOREIGN KEY (`genres_id`)
    REFERENCES `api-desafiochefao-grupo2`.`genres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`classes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `classVideoLink` VARCHAR(255) NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`songs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `songName` VARCHAR(255) NOT NULL,
  `songVideoLink` VARCHAR(255) NULL,
  `songContentLink` VARCHAR(255) NULL,
  `classes_id` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL,
  PRIMARY KEY (`id`, `classes_id`),
  INDEX `fk_songs_classes1_idx` (`classes_id` ASC),
  CONSTRAINT `fk_songs_classes1`
    FOREIGN KEY (`classes_id`)
    REFERENCES `api-desafiochefao-grupo2`.`classes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`genres_songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`genres_songs` (
  `genres_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  PRIMARY KEY (`genres_id`, `songs_id`),
  INDEX `fk_songs_has_genres_genres1_idx` (`genres_id` ASC),
  INDEX `fk_songs_has_genres_songs1_idx` (`songs_id` ASC),
  CONSTRAINT `fk_songs_has_genres_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES `api-desafiochefao-grupo2`.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_has_genres_genres1`
    FOREIGN KEY (`genres_id`)
    REFERENCES `api-desafiochefao-grupo2`.`genres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`songs_chords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`songs_chords` (
  `songs_id` INT NOT NULL,
  `chords_id` INT NOT NULL,
  PRIMARY KEY (`songs_id`, `chords_id`),
  INDEX `fk_songs_has_chords_chords1_idx` (`chords_id` ASC),
  INDEX `fk_songs_has_chords_songs1_idx` (`songs_id` ASC),
  CONSTRAINT `fk_songs_has_chords_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES `api-desafiochefao-grupo2`.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_has_chords_chords1`
    FOREIGN KEY (`chords_id`)
    REFERENCES `api-desafiochefao-grupo2`.`chords` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`chords_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`chords_classes` (
  `chords_id` INT NOT NULL,
  `classes_id` INT NOT NULL,
  PRIMARY KEY (`chords_id`, `classes_id`),
  INDEX `fk_chords_has_classes_classes1_idx` (`classes_id` ASC),
  INDEX `fk_chords_has_classes_chords1_idx` (`chords_id` ASC),
  CONSTRAINT `fk_chords_has_classes_chords1`
    FOREIGN KEY (`chords_id`)
    REFERENCES `api-desafiochefao-grupo2`.`chords` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chords_has_classes_classes1`
    FOREIGN KEY (`classes_id`)
    REFERENCES `api-desafiochefao-grupo2`.`classes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`questions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `questionContent` VARCHAR(255) NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api-desafiochefao-grupo2`.`lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `api-desafiochefao-grupo2`.`lessons` (
  `id` VARCHAR(45) NOT NULL,
  `classes_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `completedAt` DATETIME NULL,
  `points` INT NOT NULL,
  `questions_id` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`classes_id`, `users_id`, `id`, `questions_id`),
  INDEX `fk_classes_has_users_users1_idx` (`users_id` ASC),
  INDEX `fk_classes_has_users_classes1_idx` (`classes_id` ASC),
  INDEX `fk_lessons_questions1_idx` (`questions_id` ASC),
  CONSTRAINT `fk_classes_has_users_classes1`
    FOREIGN KEY (`classes_id`)
    REFERENCES `api-desafiochefao-grupo2`.`classes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classes_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `api-desafiochefao-grupo2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lessons_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `api-desafiochefao-grupo2`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
