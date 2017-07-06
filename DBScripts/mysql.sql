CREATE DATABASE APP_STAGE1;

USE APP_STAGE1;

-- Stage 1 Target Tables --

CREATE TABLE APP_STAGE1.APP_USER ( 
             APP_USER_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP_USER_NAME VARCHAR(255) NOT NULL, 
             APP_USER_PASSWORD VARCHAR(255) NOT NULL,
             APP_SALT_VALUE VARCHAR(31),
             APP_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             PRIMARY KEY (APP_USER_ID), 
             UNIQUE(APP_USER_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE1.APP_USER (APP_USER_NAME,APP_USER_PASSWORD) VALUES ('ADMIN','SECRETPASS!');

CREATE TABLE APP_STAGE1.APP_PRODUCT ( 
             APP_PRODUCT_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP_PRODUCT_NAME VARCHAR(255) NOT NULL, 
             APP_PRODUCT_PRICE DOUBLE(40,2) NOT NULL,
             PRIMARY KEY (APP_PRODUCT_ID), 
             UNIQUE(APP_PRODUCT_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE1.APP_PRODUCT (APP_PRODUCT_NAME,APP_PRODUCT_PRICE) VALUES ('USB',35.50);
INSERT INTO APP_STAGE1.APP_PRODUCT (APP_PRODUCT_NAME,APP_PRODUCT_PRICE) VALUES ('Micro USB Cambe',10.23);
INSERT INTO APP_STAGE1.APP_PRODUCT (APP_PRODUCT_NAME,APP_PRODUCT_PRICE) VALUES ('Monitor',100);
INSERT INTO APP_STAGE1.APP_PRODUCT (APP_PRODUCT_NAME,APP_PRODUCT_PRICE) VALUES ('Arduino',50);

-- Bunch of Dummy tables to make it more intersting!!! --

CREATE TABLE APP_STAGE1.UM_TENANT (
			UM_ID INTEGER NOT NULL AUTO_INCREMENT,
	        UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG LONGBLOB,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME)
)ENGINE INNODB;

CREATE TABLE APP_STAGE1.UM_DOMAIN(
            UM_DOMAIN_ID INTEGER NOT NULL AUTO_INCREMENT,
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
)ENGINE INNODB;

CREATE TABLE APP_STAGE1.UM_USER ( 
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

CREATE TABLE APP_STAGE1.UM_SYSTEM_USER ( 
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

CREATE TABLE APP_STAGE1.UM_ROLE ( 
             UM_ID INTEGER NOT NULL AUTO_INCREMENT, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
)ENGINE INNODB;


CREATE TABLE APP_STAGE1.UM_MODULE(
	UM_ID INTEGER  NOT NULL AUTO_INCREMENT,
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
)ENGINE INNODB;
CREATE DATABASE APP_STAGE2;

USE APP_STAGE2;

-- Stage 1 Target Tables --

CREATE TABLE APP_STAGE2.APP561_USER ( 
             APP561_USER_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP561_USER_NAME VARCHAR(255) NOT NULL, 
             APP561_USER_PASSWORD VARCHAR(255) NOT NULL,
             APP561_SALT_VALUE VARCHAR(31),
             APP561_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             PRIMARY KEY (APP561_USER_ID), 
             UNIQUE(APP561_USER_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE2.APP561_USER (APP561_USER_NAME,APP561_USER_PASSWORD) VALUES ('ADMIN','SECRETPASS!');

CREATE TABLE APP_STAGE2.APP561_PRODUCT ( 
             APP561_PRODUCT_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP561_PRODUCT_NAME VARCHAR(255) NOT NULL, 
             APP561_PRODUCT_PRICE DOUBLE(40,2) NOT NULL,
             PRIMARY KEY (APP561_PRODUCT_ID), 
             UNIQUE(APP561_PRODUCT_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE2.APP561_PRODUCT (APP561_PRODUCT_NAME,APP561_PRODUCT_PRICE) VALUES ('USB',35.50);
INSERT INTO APP_STAGE2.APP561_PRODUCT (APP561_PRODUCT_NAME,APP561_PRODUCT_PRICE) VALUES ('Micro USB Cambe',10.23);
INSERT INTO APP_STAGE2.APP561_PRODUCT (APP561_PRODUCT_NAME,APP561_PRODUCT_PRICE) VALUES ('Monitor',100);
INSERT INTO APP_STAGE2.APP561_PRODUCT (APP561_PRODUCT_NAME,APP561_PRODUCT_PRICE) VALUES ('Arduino',50);

-- Bunch of Dummy tables to make it more intersting!!! --

CREATE TABLE APP_STAGE2.UM_TENANT (
			UM_ID INTEGER NOT NULL AUTO_INCREMENT,
	        UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG LONGBLOB,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME)
)ENGINE INNODB;

CREATE TABLE APP_STAGE2.UM_DOMAIN(
            UM_DOMAIN_ID INTEGER NOT NULL AUTO_INCREMENT,
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
)ENGINE INNODB;

CREATE TABLE APP_STAGE2.UM_USER ( 
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

CREATE TABLE APP_STAGE2.UM_SYSTEM_USER ( 
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

CREATE TABLE APP_STAGE2.UM_ROLE ( 
             UM_ID INTEGER NOT NULL AUTO_INCREMENT, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
)ENGINE INNODB;


CREATE TABLE APP_STAGE2.UM_MODULE(
	UM_ID INTEGER  NOT NULL AUTO_INCREMENT,
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
)ENGINE INNODB;
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
CREATE DATABASE APP_STAGE4;

USE APP_STAGE4;

-- Stage 1 Target Tables --

CREATE TABLE APP_STAGE4.APP245_USER ( 
             APP245_USER_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP245_USER_NAME VARCHAR(255) NOT NULL, 
             APP245_USER_PASSWORD VARCHAR(255) NOT NULL,
             APP245_SALT_VALUE VARCHAR(31),
             APP245_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             PRIMARY KEY (APP245_USER_ID), 
             UNIQUE(APP245_USER_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE4.APP245_USER (APP245_USER_NAME,APP245_USER_PASSWORD) VALUES ('ADMIN','SEC181!');

CREATE TABLE APP_STAGE4.APP245_PRODUCT ( 
             APP245_PRODUCT_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP245_PRODUCT_NAME VARCHAR(255) NOT NULL, 
             APP245_PRODUCT_PRICE DOUBLE(40,2) NOT NULL,
             PRIMARY KEY (APP245_PRODUCT_ID), 
             UNIQUE(APP245_PRODUCT_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE4.APP245_PRODUCT (APP245_PRODUCT_NAME,APP245_PRODUCT_PRICE) VALUES ('USB',35.50);
INSERT INTO APP_STAGE4.APP245_PRODUCT (APP245_PRODUCT_NAME,APP245_PRODUCT_PRICE) VALUES ('Micro USB Cambe',10.23);
INSERT INTO APP_STAGE4.APP245_PRODUCT (APP245_PRODUCT_NAME,APP245_PRODUCT_PRICE) VALUES ('Monitor',100);
INSERT INTO APP_STAGE4.APP245_PRODUCT (APP245_PRODUCT_NAME,APP245_PRODUCT_PRICE) VALUES ('Arduino',50);

-- Bunch of Dummy tables to make it more intersting!!! --

CREATE TABLE APP_STAGE4.UM_TENANT (
			UM_ID INTEGER NOT NULL AUTO_INCREMENT,
	        UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG LONGBLOB,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME)
)ENGINE INNODB;

CREATE TABLE APP_STAGE4.UM_DOMAIN(
            UM_DOMAIN_ID INTEGER NOT NULL AUTO_INCREMENT,
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
)ENGINE INNODB;

CREATE TABLE APP_STAGE4.UM_USER ( 
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

CREATE TABLE APP_STAGE4.UM_SYSTEM_USER ( 
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

CREATE TABLE APP_STAGE4.UM_ROLE ( 
             UM_ID INTEGER NOT NULL AUTO_INCREMENT, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
)ENGINE INNODB;


CREATE TABLE APP_STAGE4.UM_MODULE(
	UM_ID INTEGER  NOT NULL AUTO_INCREMENT,
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
)ENGINE INNODB;
CREATE DATABASE APP_STAGE5;

USE APP_STAGE5;

-- Stage 1 Target Tables --

CREATE TABLE APP_STAGE5.APP084_USER ( 
             APP084_USER_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP084_USER_NAME VARCHAR(255) NOT NULL, 
             APP084_USER_PASSWORD VARCHAR(255) NOT NULL,
             APP084_SALT_VALUE VARCHAR(31),
             APP084_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             PRIMARY KEY (APP084_USER_ID), 
             UNIQUE(APP084_USER_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE5.APP084_USER (APP084_USER_NAME,APP084_USER_PASSWORD) VALUES ('ADMIN','SEC991!');

CREATE TABLE APP_STAGE5.APP084_PRODUCT ( 
             APP084_PRODUCT_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP084_PRODUCT_NAME VARCHAR(255) NOT NULL, 
             APP084_PRODUCT_PRICE DOUBLE(40,2) NOT NULL,
             PRIMARY KEY (APP084_PRODUCT_ID), 
             UNIQUE(APP084_PRODUCT_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE5.APP084_PRODUCT (APP084_PRODUCT_NAME,APP084_PRODUCT_PRICE) VALUES ('USB',35.50);
INSERT INTO APP_STAGE5.APP084_PRODUCT (APP084_PRODUCT_NAME,APP084_PRODUCT_PRICE) VALUES ('Micro USB Cambe',10.23);
INSERT INTO APP_STAGE5.APP084_PRODUCT (APP084_PRODUCT_NAME,APP084_PRODUCT_PRICE) VALUES ('Monitor',100);
INSERT INTO APP_STAGE5.APP084_PRODUCT (APP084_PRODUCT_NAME,APP084_PRODUCT_PRICE) VALUES ('Arduino',50);

-- Bunch of Dummy tables to make it more intersting!!! --

CREATE TABLE APP_STAGE5.UM_TENANT (
			UM_ID INTEGER NOT NULL AUTO_INCREMENT,
	        UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG LONGBLOB,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME)
)ENGINE INNODB;

CREATE TABLE APP_STAGE5.UM_DOMAIN(
            UM_DOMAIN_ID INTEGER NOT NULL AUTO_INCREMENT,
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
)ENGINE INNODB;

CREATE TABLE APP_STAGE5.UM_USER ( 
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

CREATE TABLE APP_STAGE5.UM_SYSTEM_USER ( 
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

CREATE TABLE APP_STAGE5.UM_ROLE ( 
             UM_ID INTEGER NOT NULL AUTO_INCREMENT, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
)ENGINE INNODB;


CREATE TABLE APP_STAGE5.UM_MODULE(
	UM_ID INTEGER  NOT NULL AUTO_INCREMENT,
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
)ENGINE INNODB;
CREATE DATABASE APP_STAGE6;

USE APP_STAGE6;

-- Stage 1 Target Tables --

CREATE TABLE APP_STAGE6.APP444_USER ( 
             APP444_USER_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP444_USER_NAME VARCHAR(255) NOT NULL, 
             APP444_USER_PASSWORD VARCHAR(255) NOT NULL,
             APP444_SALT_VALUE VARCHAR(31),
             APP444_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             PRIMARY KEY (APP444_USER_ID), 
             UNIQUE(APP444_USER_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE6.APP444_USER (APP444_USER_NAME,APP444_USER_PASSWORD) VALUES ('ADMIN','SEC7363!');

CREATE TABLE APP_STAGE6.APP444_PRODUCT ( 
             APP444_PRODUCT_ID INTEGER NOT NULL AUTO_INCREMENT, 
             APP444_PRODUCT_NAME VARCHAR(255) NOT NULL, 
             APP444_PRODUCT_PRICE DOUBLE(40,2) NOT NULL,
             PRIMARY KEY (APP444_PRODUCT_ID), 
             UNIQUE(APP444_PRODUCT_NAME)
)ENGINE INNODB; 

INSERT INTO APP_STAGE6.APP444_PRODUCT (APP444_PRODUCT_NAME,APP444_PRODUCT_PRICE) VALUES ('USB',35.50);
INSERT INTO APP_STAGE6.APP444_PRODUCT (APP444_PRODUCT_NAME,APP444_PRODUCT_PRICE) VALUES ('Micro USB Cambe',10.23);
INSERT INTO APP_STAGE6.APP444_PRODUCT (APP444_PRODUCT_NAME,APP444_PRODUCT_PRICE) VALUES ('Monitor',100);
INSERT INTO APP_STAGE6.APP444_PRODUCT (APP444_PRODUCT_NAME,APP444_PRODUCT_PRICE) VALUES ('Arduino',50);

-- Bunch of Dummy tables to make it more intersting!!! --

CREATE TABLE APP_STAGE6.UM_TENANT (
			UM_ID INTEGER NOT NULL AUTO_INCREMENT,
	        UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG LONGBLOB,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME)
)ENGINE INNODB;

CREATE TABLE APP_STAGE6.UM_DOMAIN(
            UM_DOMAIN_ID INTEGER NOT NULL AUTO_INCREMENT,
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
)ENGINE INNODB;

CREATE TABLE APP_STAGE6.UM_USER ( 
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

CREATE TABLE APP_STAGE6.UM_SYSTEM_USER ( 
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

CREATE TABLE APP_STAGE6.UM_ROLE ( 
             UM_ID INTEGER NOT NULL AUTO_INCREMENT, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
)ENGINE INNODB;


CREATE TABLE APP_STAGE6.UM_MODULE(
	UM_ID INTEGER  NOT NULL AUTO_INCREMENT,
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
)ENGINE INNODB;