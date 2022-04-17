#FIRST CREATE DATABASE
CREATE database S13T01;
USE S13T01;
#NOW CREATE THE TABLES
CREATE TABLE CLIENTS(
Client_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
Transaction_ID integer not null,
Client_name varchar(50) NOT NULL,
Client_lastname varchar(50) not null, 
Client_address varchar(50) not null, 
Client_phone integer not null,
Client_email varchar(50) not null,
FOREIGN KEY(Transaction_ID) REFERENCES TRANSACTION (Transaction_ID)
);

# ESTABLISHMENT TABLE
CREATE TABLE ESTABLISHMENT(
Establishment_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
Worker_ID integer NOT NULL, 
Estblishment_name VARCHAR(50) NOT NULL,
Establishment_address VARCHAR(50) NOT NULL,
Establishment_phone integer NOT NULL, 
Establishment_email VARCHAR(50) NOT NULL,
FOREIGN KEY(Worker_ID) REFERENCES WORKER (Worker_ID)
);

# WORKER TABLE
CREATE TABLE WORKER(
Worker_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
Establishment_ID INTEGER NOT NULL,
Worker_name VARCHAR(50) NOT NULL,
Worker_lastname VARCHAR(50) NOT NULL,
Worker_email VARCHAR(50) NOT NULL,
Worker_phone integer NOT NULL, 
Worker_position varchar(50) NOT NULL,
FOREIGN KEY(Establishment_ID) REFERENCES ESTABLISHMENT (Establishment_ID)
);

# TYPES OF PRODUCT TABLE
CREATE TABLE PRODUCT_TYPE (
Type_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
Product_name VARCHAR(50) NOT NULL,
Product_quantity integer NOT NULL,
Product_unit_cost integer NOT NULL,
Product_description VARCHAR(50) NOT NULL
);

# LIST OF PRODUCT TABLE
CREATE TABLE LIST_PRODUCT(
Product_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
Type_ID INTEGER NOT NULL,
List_quantity integer NOT NULL,
List_cost integer NOT NULL,
FOREIGN KEY (Type_ID) REFERENCES PRODUCT_TYPE (Type_ID)
);

# TRANSACTION TABLE
CREATE TABLE TRANSACTION(
Transaction_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
Product_ID integer NOT NULL,
Worker_ID integer NOT NULL,
Client_ID integer NOT NULL,
Establishment_ID INTEGER NOT NULL,
Transaction_quantity integer NOT NULL,
Transaction_total_price FLOAT NOT NULL,
Transaction_date DATETIME NOT NULL,
FOREIGN KEY (Product_ID) REFERENCES LIST_PRODUCT (Product_ID),
FOREIGN KEY (Worker_ID) REFERENCES WORKER (Worker_ID),
FOREIGN KEY (Establishment_ID) REFERENCES ESTABLISHMENT (Establishment_ID),
FOREIGN KEY (Client_ID) REFERENCES CLIENTS (Client_ID)
);