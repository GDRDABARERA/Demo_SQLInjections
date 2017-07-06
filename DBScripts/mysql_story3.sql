CREATE DATABASE APP_STAGE3;

USE APP_STAGE3;

-- Stage 1 Target Tables --

CREATE TABLE APP_STAGE3.APP789_USER ( 
             APP789_USER_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP789_USER_NAME VARCHAR(255) NOT NULL, 
             APP789_USER_PASSWORD VARCHAR(255) NOT NULL,
             APP789_SALT_VALUE VARCHAR(31),
             APP789_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             PRIMARY KEY (APP789_USER_ID), 
             UNIQUE(APP789_USER_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE3.APP789_USER (APP789_USER_NAME,APP789_USER_PASSWORD) VALUES ('ADMIN','SEC736!');

CREATE TABLE APP_STAGE3.APP789_PRODUCT ( 
             APP789_PRODUCT_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP789_PRODUCT_NAME VARCHAR(255) NOT NULL, 
             APP789_PRODUCT_PRICE DOUBLE(40,2) NOT NULL,
             PRIMARY KEY (APP789_PRODUCT_ID), 
             UNIQUE(APP789_PRODUCT_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE3.APP789_PRODUCT (APP789_PRODUCT_NAME,APP789_PRODUCT_PRICE) VALUES ('USB',35.50);
INSERT INTO APP_STAGE3.APP789_PRODUCT (APP789_PRODUCT_NAME,APP789_PRODUCT_PRICE) VALUES ('Micro USB Cambe',10.23);
INSERT INTO APP_STAGE3.APP789_PRODUCT (APP789_PRODUCT_NAME,APP789_PRODUCT_PRICE) VALUES ('Monitor',100);
INSERT INTO APP_STAGE3.APP789_PRODUCT (APP789_PRODUCT_NAME,APP789_PRODUCT_PRICE) VALUES ('Arduino',50);

-- Bunch of Dummy tables to make it more intersting!!! --

CREATE TABLE APP_STAGE3.UM_TENANT (
			UM_ID INTEGER NOT NULL AUTO_INCREMENT,
	        UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG LONGBLOB,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME)
)ENGINE INNODB;

CREATE TABLE APP_STAGE3.UM_DOMAIN(
            UM_DOMAIN_ID INTEGER NOT NULL AUTO_INCREMENT,
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
)ENGINE INNODB;

CREATE TABLE APP_STAGE3.UM_USER ( 
             UM_ID INTEGER NOT NULL AUTO_INCREMENT, 
             UM_USER_NAME VARCHAR(255) NOT NULL, 
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(31),
             UM_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             UM_CHANGED_TIME TIMESTAMP NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID), 
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
)ENGINE INNODB; 

CREATE TABLE APP_STAGE3.UM_SYSTEM_USER ( 
             UM_ID INTEGER NOT NULL AUTO_INCREMENT, 
             UM_USER_NAME VARCHAR(255) NOT NULL, 
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(31),
             UM_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             UM_CHANGED_TIME TIMESTAMP NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID), 
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
)ENGINE INNODB; 

CREATE TABLE APP_STAGE3.UM_ROLE ( 
             UM_ID INTEGER NOT NULL AUTO_INCREMENT, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
)ENGINE INNODB;


CREATE TABLE APP_STAGE3.UM_MODULE(
	UM_ID INTEGER  NOT NULL AUTO_INCREMENT,
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
)ENGINE INNODB;
