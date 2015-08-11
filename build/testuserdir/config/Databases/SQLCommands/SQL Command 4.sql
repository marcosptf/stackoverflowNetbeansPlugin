drop table if exists evaluation_system.measured;
drop table if exists evaluation_system.evaluation_type;
drop table if exists evaluation_system.action_plan;
drop table if exists evaluation_system.competence;
drop table if exists evaluation_system.evaluation_type;
drop table if exists evaluation_system.question;
drop table if exists evaluation_system.competence_evaluation_type;
drop table if exists evaluation_system.evaluation;
drop table if exists evaluation_system.answer;
drop table if exists evaluation_system.evaluation_action_plan;
drop table if exists evaluation_system.profile;

use evaluation_system;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `action_plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `action_plan` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `action_plan` TEXT NOT NULL ,
  `language` ENUM('es_MX', 'pt_BR') NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competence` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `competence` VARCHAR(45) NOT NULL ,
  `question_matter` INT NOT NULL,
  `target` INT NOT NULL,
  `gap` INT NOT NULL,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `evaluation_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluation_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `evaluation_type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `question` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `question_code` INT NOT NULL ,
  `question_content` TEXT NOT NULL ,
  `language` ENUM('es_MX', 'pt_BR') NOT NULL ,
  `competence_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_question_question_section1_idx` (`competence_id` ASC) ,
  CONSTRAINT `fk_question_question_section1`
    FOREIGN KEY (`competence_id` )
    REFERENCES `competence` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competence_evaluation_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competence_evaluation_type` (
  `competence_id` INT NOT NULL ,
  `evaluation_type_id` INT NOT NULL ,
  PRIMARY KEY (`competence_id`, `evaluation_type_id`) ,
  INDEX `fk_section_has_evaluation_type_evaluation_type1_idx` (`evaluation_type_id` ASC) ,
  INDEX `fk_section_has_evaluation_type_section1_idx` (`competence_id` ASC) ,
  CONSTRAINT `fk_section_has_evaluation_type_section1`
    FOREIGN KEY (`competence_id` )
    REFERENCES `competence` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_evaluation_type_evaluation_type1`
    FOREIGN KEY (`evaluation_type_id` )
    REFERENCES `evaluation_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

set FOREIGN_KEY_CHECKS = 0;
DROP TABLE `measured`;
-- -----------------------------------------------------
-- Table `measured`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `measured` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(70) NOT NULL ,
  `language` ENUM('es_MX', 'pt_BR') NOT NULL ,
  `measurer_id` INT,
  `evaluation_type_id` INT NOT NULL ,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`id`) ,
  INDEX `fk_measured_measured1_idx` (`measurer_id` ASC) ,
  INDEX `fk_measured_evaluation_type1_idx` (`evaluation_type_id` ASC) ,
  INDEX `fk_measured_profile1_idx` (`profile_id` ASC) ,
  CONSTRAINT `fk_measured_evaluation_type1`
    FOREIGN KEY (`evaluation_type_id` )
    REFERENCES `evaluation_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_measured_profile_type1`
    FOREIGN KEY (`profile_id` )
    REFERENCES `profile` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
set FOREIGN_KEY_CHECKS = 1;

-- -----------------------------------------------------
-- Table `evaluation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `date_send_mensured` DATETIME NULL ,
  `date_send_mensurer` DATETIME NULL ,
  `measured_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_evaluation_measured1_idx` (`measured_id` ASC) ,
  CONSTRAINT `fk_evaluation_measured1`
    FOREIGN KEY (`measured_id` )
    REFERENCES `measured` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `answer` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `mensured_grade` TINYINT NOT NULL ,
  `mensurer_grade` TINYINT NOT NULL ,
  `measured_id` INT NOT NULL ,
  `question_id` INT NOT NULL ,
  `evaluation_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_answer_measured1_idx` (`measured_id` ASC) ,
  INDEX `fk_answer_question1_idx` (`question_id` ASC) ,
  INDEX `fk_answer_evaluation1_idx` (`evaluation_id` ASC) ,
  CONSTRAINT `fk_answer_measured1`
    FOREIGN KEY (`measured_id` )
    REFERENCES `measured` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_question1`
    FOREIGN KEY (`question_id` )
    REFERENCES `question` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_evaluation1`
    FOREIGN KEY (`evaluation_id` )
    REFERENCES `evaluation` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluation_action_plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluation_action_plan` (
  `evaluation_id` INT NOT NULL ,
  `action_plan_id` INT NOT NULL ,
  PRIMARY KEY (`evaluation_id`, `action_plan_id`) ,
  INDEX `fk_evaluation_has_action_plan_action_plan1_idx` (`action_plan_id` ASC) ,
  INDEX `fk_evaluation_has_action_plan_evaluation1_idx` (`evaluation_id` ASC) ,
  CONSTRAINT `fk_evaluation_has_action_plan_evaluation1`
    FOREIGN KEY (`evaluation_id` )
    REFERENCES `evaluation` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluation_has_action_plan_action_plan1`
    FOREIGN KEY (`action_plan_id` )
    REFERENCES `action_plan` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `profile` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


