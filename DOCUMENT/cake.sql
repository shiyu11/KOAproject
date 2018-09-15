-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Cake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cake` DEFAULT CHARACTER SET utf8 ;
USE `Cake` ;

-- -----------------------------------------------------
-- Table `Cake`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`event` (
  `eid` INT NOT NULL AUTO_INCREMENT,
  `etimestart` DATETIME NOT NULL,
  `rule` VARCHAR(45) NOT NULL,
  `etimeend` DATETIME NOT NULL,
  PRIMARY KEY (`eid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`products` (
  `pid` INT NOT NULL AUTO_INCREMENT,
  `pname` VARCHAR(45) NOT NULL,
  `ppic` VARCHAR(45) NOT NULL,
  `pprice` VARCHAR(45) NOT NULL,
  `pnum` INT NOT NULL,
  `occasion` VARCHAR(45) NOT NULL,
  `taste` VARCHAR(45) NULL,
  `theme` BIT NOT NULL DEFAULT 0,
  `dpic` VARCHAR(45) NOT NULL,
  `xpic` VARCHAR(45) NOT NULL,
  `text` VARCHAR(45) NULL,
  `intr` VARCHAR(255) NULL,
  `xxpic` VARCHAR(45) NULL,
  PRIMARY KEY (`pid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`eventdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`eventdetails` (
  `qid` INT NOT NULL AUTO_INCREMENT,
  `qpic` VARCHAR(45) NULL,
  `eid` INT NOT NULL,
  `pid` INT NOT NULL,
  `discount` VARCHAR(45) NULL,
  PRIMARY KEY (`qid`),
  INDEX `fk_eventdetails_event1_idx` (`eid` ASC),
  INDEX `fk_eventdetails_products1_idx` (`pid` ASC),
  CONSTRAINT `fk_eventdetails_event1`
    FOREIGN KEY (`eid`)
    REFERENCES `Cake`.`event` (`eid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_eventdetails_products1`
    FOREIGN KEY (`pid`)
    REFERENCES `Cake`.`products` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`users` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `uname` VARCHAR(45) NOT NULL,
  `upwd` VARCHAR(50) NOT NULL,
  `headpic` VARCHAR(45) NULL,
  `grade` INT NULL DEFAULT 0,
  `level` INT NULL DEFAULT 1,
  `sex` BIT NULL,
  `birth` DATETIME NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`address` (
  `aid` INT NOT NULL AUTO_INCREMENT,
  `aname` INT NOT NULL,
  `phone` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `defaultaddress` BIT NOT NULL,
  `uid` INT NOT NULL,
  PRIMARY KEY (`aid`),
  INDEX `fk_address_users1_idx` (`uid` ASC),
  CONSTRAINT `fk_address_users1`
    FOREIGN KEY (`uid`)
    REFERENCES `Cake`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`order` (
  `oid` INT NOT NULL,
  `method` BIT NOT NULL DEFAULT 0,
  `state` INT NOT NULL,
  `note` VARCHAR(45) NULL,
  `uid` INT NOT NULL,
  PRIMARY KEY (`oid`),
  INDEX `fk_order_users1_idx` (`uid` ASC),
  CONSTRAINT `fk_order_users1`
    FOREIGN KEY (`uid`)
    REFERENCES `Cake`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`orderdetails` (
  `rid` INT NOT NULL,
  `rnum` INT NOT NULL,
  `oid` INT NOT NULL,
  `pid` INT NOT NULL,
  PRIMARY KEY (`rid`),
  INDEX `fk_orderdetails_order1_idx` (`oid` ASC),
  INDEX `fk_orderdetails_products1_idx` (`pid` ASC),
  CONSTRAINT `fk_orderdetails_order1`
    FOREIGN KEY (`oid`)
    REFERENCES `Cake`.`order` (`oid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderdetails_products1`
    FOREIGN KEY (`pid`)
    REFERENCES `Cake`.`products` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`review` (
  `vid` INT NOT NULL AUTO_INCREMENT,
  `vcontent` VARCHAR(45) NOT NULL,
  `vtime` DATETIME NOT NULL,
  `vstate` BIT NOT NULL DEFAULT 0,
  `reply` VARCHAR(45) NULL,
  `pid` INT NOT NULL,
  `uid` INT NOT NULL,
  PRIMARY KEY (`vid`),
  INDEX `fk_review_products1_idx` (`pid` ASC),
  INDEX `fk_review_users1_idx` (`uid` ASC),
  CONSTRAINT `fk_review_products1`
    FOREIGN KEY (`pid`)
    REFERENCES `Cake`.`products` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_users1`
    FOREIGN KEY (`uid`)
    REFERENCES `Cake`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lid` INT NULL,
  `laddress` VARCHAR(45) NOT NULL,
  `details` VARCHAR(45) NULL,
  `uid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_location_users1_idx` (`uid` ASC),
  CONSTRAINT `fk_location_users1`
    FOREIGN KEY (`uid`)
    REFERENCES `Cake`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`theme` (
  `tid` INT NOT NULL AUTO_INCREMENT,
  `ttime` DATETIME NOT NULL,
  `tname` VARCHAR(45) NOT NULL,
  `tpic` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`tpicture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`tpicture` (
  `hid` INT NOT NULL AUTO_INCREMENT,
  `hpic` VARCHAR(45) NULL,
  `tid` INT NOT NULL,
  `text1` VARCHAR(45) NULL,
  `text2` VARCHAR(45) NULL,
  `text3` VARCHAR(45) NULL,
  PRIMARY KEY (`hid`),
  INDEX `fk_tpicture_theme1_idx` (`tid` ASC),
  CONSTRAINT `fk_tpicture_theme1`
    FOREIGN KEY (`tid`)
    REFERENCES `Cake`.`theme` (`tid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`card` (
  `cid` INT NOT NULL AUTO_INCREMENT,
  `ctime` DATETIME NOT NULL,
  `cpic` VARCHAR(45) NULL,
  `cnote` VARCHAR(45) NULL,
  `cstate` BIT NOT NULL DEFAULT 0,
  `tid` INT NOT NULL,
  `uid` INT NOT NULL,
  PRIMARY KEY (`cid`),
  INDEX `fk_card_theme1_idx` (`tid` ASC),
  INDEX `fk_card_users1_idx` (`uid` ASC),
  CONSTRAINT `fk_card_theme1`
    FOREIGN KEY (`tid`)
    REFERENCES `Cake`.`theme` (`tid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_users1`
    FOREIGN KEY (`uid`)
    REFERENCES `Cake`.`users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`admin` (
  `gid` INT NOT NULL AUTO_INCREMENT,
  `admin` VARCHAR(45) NULL,
  `apwd` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cake`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cake`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
