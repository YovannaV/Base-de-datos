-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema s13t01
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema s13t01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `s13t01` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema s13t01_sql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema s13t01_sql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `s13t01_sql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `idClient` INT GENERATED ALWAYS AS () VIRTUAL,
  `Client_name` VARCHAR(45) GENERATED ALWAYS AS () VIRTUAL,
  `Client_lastname` VARCHAR(45) GENERATED ALWAYS AS () VIRTUAL,
  `Client_email` VARCHAR(45) GENERATED ALWAYS AS () VIRTUAL,
  `Client_address` VARCHAR(45) GENERATED ALWAYS AS (),
  `Client_telephone` INT(50) GENERATED ALWAYS AS (),
  UNIQUE INDEX `ID_CLIENT_UNIQUE` (`idClient` ASC) VISIBLE,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Types of products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Types of products` (
  `idTypes of products` INT GENERATED ALWAYS AS () VIRTUAL,
  `Product_name` VARCHAR(45) NOT NULL,
  `Quantity` INT(50) NOT NULL,
  `Unit_cost` FLOAT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTypes of products`),
  UNIQUE INDEX `idTypes of products_UNIQUE` (`idTypes of products` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`List_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`List_products` (
  `idList_products` INT(50) GENERATED ALWAYS AS () VIRTUAL,
  `id_Types of products` INT(50) NOT NULL,
  `Quantity` INT(50) NOT NULL,
  `Cost` INT(50) NOT NULL,
  PRIMARY KEY (`idList_products`),
  INDEX `idTypes_idx` (`id_Types of products` ASC) VISIBLE,
  CONSTRAINT `idTypes`
    FOREIGN KEY (`id_Types of products`)
    REFERENCES `mydb`.`Types of products` (`idTypes of products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Workers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Workers` (
  `idWorkers` INT GENERATED ALWAYS AS () VIRTUAL,
  `Workers_name` VARCHAR(45) NOT NULL,
  `Workers_lastname` VARCHAR(45) NOT NULL,
  `Workers_email` VARCHAR(45) NOT NULL,
  `Workers_phone` INT(45) NOT NULL,
  `Workers_position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idWorkers`),
  UNIQUE INDEX `idWorkers_UNIQUE` (`idWorkers` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Establisment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Establisment` (
  `idEstablisment` INT GENERATED ALWAYS AS () VIRTUAL,
  `idTypes of products` INT(45) NOT NULL,
  `idWorkers` INT(45) NOT NULL,
  `Store_name` VARCHAR(45) NOT NULL,
  `Store_address` VARCHAR(45) NOT NULL,
  `Store_telephone` INT(50) NOT NULL,
  `Store_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstablisment`),
  UNIQUE INDEX `idEstablisment_UNIQUE` (`idEstablisment` ASC) VISIBLE,
  INDEX `list_products_idx` (`idTypes of products` ASC) VISIBLE,
  INDEX `workers_idx` (`idWorkers` ASC) VISIBLE,
  CONSTRAINT `list_products`
    FOREIGN KEY (`idTypes of products`)
    REFERENCES `mydb`.`Types of products` (`idTypes of products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `workers`
    FOREIGN KEY (`idWorkers`)
    REFERENCES `mydb`.`Workers` (`idWorkers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transaction` (
  `idTransaction` INT GENERATED ALWAYS AS () VIRTUAL,
  `idClient` INT(50) NOT NULL,
  `idWorkers` INT(50) NOT NULL,
  `idEstablisment` INT(50) NOT NULL,
  `idList_products` INT(50) NOT NULL,
  `Transaction_date` DATETIME(50) NOT NULL,
  `Transaction_price` FLOAT NOT NULL,
  PRIMARY KEY (`idTransaction`),
  UNIQUE INDEX `idTransaction_UNIQUE` (`idTransaction` ASC) VISIBLE,
  INDEX `idClient_idx` (`idClient` ASC) VISIBLE,
  INDEX `idWorlets_idx` (`idWorkers` ASC) VISIBLE,
  INDEX `idEstablishment_idx` (`idEstablisment` ASC) VISIBLE,
  INDEX `idList_products_idx` (`idList_products` ASC) VISIBLE,
  CONSTRAINT `idClient`
    FOREIGN KEY (`idClient`)
    REFERENCES `mydb`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idWorkers`
    FOREIGN KEY (`idWorkers`)
    REFERENCES `mydb`.`Workers` (`idWorkers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstablishment`
    FOREIGN KEY (`idEstablisment`)
    REFERENCES `mydb`.`Establisment` (`idEstablisment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idList_products`
    FOREIGN KEY (`idList_products`)
    REFERENCES `mydb`.`List_products` (`id_Types of products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `s13t01` ;

-- -----------------------------------------------------
-- Table `s13t01`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01`.`clients` (
  `Client_ID` INT NOT NULL AUTO_INCREMENT,
  `Client_name` VARCHAR(50) NOT NULL,
  `Client_lastname` VARCHAR(50) NOT NULL,
  `Client_address` VARCHAR(50) NOT NULL,
  `Client_phone` INT NOT NULL,
  `Client_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Client_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01`.`establishment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01`.`establishment` (
  `Establishment_ID` INT NOT NULL AUTO_INCREMENT,
  `Estblishment_name` VARCHAR(50) NOT NULL,
  `Establishment_address` VARCHAR(50) NOT NULL,
  `Establishment_phone` INT NOT NULL,
  `Establishment_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Establishment_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01`.`product_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01`.`product_type` (
  `Type_ID` INT NOT NULL AUTO_INCREMENT,
  `Product_name` VARCHAR(50) NOT NULL,
  `Product_quantity` INT NOT NULL,
  `Product_unit_cost` INT NOT NULL,
  `Product_description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Type_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01`.`list_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01`.`list_product` (
  `Product_ID` INT NOT NULL AUTO_INCREMENT,
  `Type_ID` INT NOT NULL,
  `List_quantity` INT NOT NULL,
  `List_cost` INT NOT NULL,
  PRIMARY KEY (`Product_ID`),
  INDEX `Type_ID` (`Type_ID` ASC) VISIBLE,
  CONSTRAINT `list_product_ibfk_1`
    FOREIGN KEY (`Type_ID`)
    REFERENCES `s13t01`.`product_type` (`Type_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01`.`worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01`.`worker` (
  `Worker_ID` INT NOT NULL AUTO_INCREMENT,
  `Establishment_ID` INT NOT NULL,
  `Worker_name` VARCHAR(50) NOT NULL,
  `Worker_lastname` VARCHAR(50) NOT NULL,
  `Worker_email` VARCHAR(50) NOT NULL,
  `Worker_phone` INT NOT NULL,
  `Worker_position` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Worker_ID`),
  INDEX `Establishment_ID` (`Establishment_ID` ASC) VISIBLE,
  CONSTRAINT `worker_ibfk_1`
    FOREIGN KEY (`Establishment_ID`)
    REFERENCES `s13t01`.`establishment` (`Establishment_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01`.`transaction` (
  `Transaction_ID` INT NOT NULL AUTO_INCREMENT,
  `Product_ID` INT NOT NULL,
  `Worker_ID` INT NOT NULL,
  `Client_ID` INT NOT NULL,
  `Establishment_ID` INT NOT NULL,
  `Transaction_quantity` INT NOT NULL,
  `Transaction_total_price` FLOAT NOT NULL,
  `Transaction_date` DATETIME NOT NULL,
  PRIMARY KEY (`Transaction_ID`),
  INDEX `Product_ID` (`Product_ID` ASC) VISIBLE,
  INDEX `Worker_ID` (`Worker_ID` ASC) VISIBLE,
  INDEX `Establishment_ID` (`Establishment_ID` ASC) VISIBLE,
  INDEX `Client_ID` (`Client_ID` ASC) VISIBLE,
  CONSTRAINT `transaction_ibfk_1`
    FOREIGN KEY (`Product_ID`)
    REFERENCES `s13t01`.`list_product` (`Product_ID`),
  CONSTRAINT `transaction_ibfk_2`
    FOREIGN KEY (`Worker_ID`)
    REFERENCES `s13t01`.`worker` (`Worker_ID`),
  CONSTRAINT `transaction_ibfk_3`
    FOREIGN KEY (`Establishment_ID`)
    REFERENCES `s13t01`.`establishment` (`Establishment_ID`),
  CONSTRAINT `transaction_ibfk_4`
    FOREIGN KEY (`Client_ID`)
    REFERENCES `s13t01`.`clients` (`Client_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `s13t01_sql` ;

-- -----------------------------------------------------
-- Table `s13t01_sql`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01_sql`.`clients` (
  `Client_ID` INT NOT NULL AUTO_INCREMENT,
  `Client_name` VARCHAR(50) NOT NULL,
  `Client_lastname` VARCHAR(50) NOT NULL,
  `Client_address` VARCHAR(50) NOT NULL,
  `Client_phone` INT NOT NULL,
  `Client_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Client_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01_sql`.`establishment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01_sql`.`establishment` (
  `Establishment_ID` INT NOT NULL AUTO_INCREMENT,
  `Estblishment_name` VARCHAR(50) NOT NULL,
  `Establishment_address` VARCHAR(50) NOT NULL,
  `Establishment_phone` INT NOT NULL,
  `Establishment_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Establishment_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01_sql`.`product_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01_sql`.`product_type` (
  `Type_ID` INT NOT NULL AUTO_INCREMENT,
  `Product_name` VARCHAR(50) NOT NULL,
  `Product_quantity` INT NOT NULL,
  `Product_unit_cost` INT NOT NULL,
  `Product_description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Type_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01_sql`.`list_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01_sql`.`list_product` (
  `Product_ID` INT NOT NULL AUTO_INCREMENT,
  `Type_ID` INT NOT NULL,
  `List_quantity` INT NOT NULL,
  `List_cost` INT NOT NULL,
  PRIMARY KEY (`Product_ID`),
  INDEX `Type_ID` (`Type_ID` ASC) VISIBLE,
  CONSTRAINT `list_product_ibfk_1`
    FOREIGN KEY (`Type_ID`)
    REFERENCES `s13t01_sql`.`product_type` (`Type_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01_sql`.`worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01_sql`.`worker` (
  `Worker_ID` INT NOT NULL AUTO_INCREMENT,
  `Establishment_ID` INT NOT NULL,
  `Worker_name` VARCHAR(50) NOT NULL,
  `Worker_lastname` VARCHAR(50) NOT NULL,
  `Worker_email` VARCHAR(50) NOT NULL,
  `Worker_phone` INT NOT NULL,
  `Worker_position` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Worker_ID`),
  INDEX `Establishment_ID` (`Establishment_ID` ASC) VISIBLE,
  CONSTRAINT `worker_ibfk_1`
    FOREIGN KEY (`Establishment_ID`)
    REFERENCES `s13t01_sql`.`establishment` (`Establishment_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `s13t01_sql`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s13t01_sql`.`transaction` (
  `Transaction_ID` INT NOT NULL AUTO_INCREMENT,
  `Product_ID` INT NOT NULL,
  `Worker_ID` INT NOT NULL,
  `Client_ID` INT NOT NULL,
  `Establishment_ID` INT NOT NULL,
  `Transaction_quantity` INT NOT NULL,
  `Transaction_total_price` FLOAT NOT NULL,
  `Transaction_date` DATETIME NOT NULL,
  PRIMARY KEY (`Transaction_ID`),
  INDEX `Product_ID` (`Product_ID` ASC) VISIBLE,
  INDEX `Worker_ID` (`Worker_ID` ASC) VISIBLE,
  INDEX `Establishment_ID` (`Establishment_ID` ASC) VISIBLE,
  INDEX `Client_ID` (`Client_ID` ASC) VISIBLE,
  CONSTRAINT `transaction_ibfk_1`
    FOREIGN KEY (`Product_ID`)
    REFERENCES `s13t01_sql`.`list_product` (`Product_ID`),
  CONSTRAINT `transaction_ibfk_2`
    FOREIGN KEY (`Worker_ID`)
    REFERENCES `s13t01_sql`.`worker` (`Worker_ID`),
  CONSTRAINT `transaction_ibfk_3`
    FOREIGN KEY (`Establishment_ID`)
    REFERENCES `s13t01_sql`.`establishment` (`Establishment_ID`),
  CONSTRAINT `transaction_ibfk_4`
    FOREIGN KEY (`Client_ID`)
    REFERENCES `s13t01_sql`.`clients` (`Client_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
