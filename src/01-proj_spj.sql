CREATE TABLE `S`
(
    `SNO`    CHAR(2)    NOT NULL PRIMARY KEY,
    `SNAME`  VARCHAR(5) NOT NULL,
    `STATUS` TINYINT UNSIGNED NOT NULL,
    `CITY`   VARCHAR(5) NOT NULL
);

CREATE TABLE `P`
(
    `PNO`    CHAR(2)       NOT NULL PRIMARY KEY,
    `PNAME`  VARCHAR(5)    NOT NULL,
    `COLOR`  CHAR(1)       NOT NULL,
    `WEIGHT` DECIMAL(5, 1) NOT NULL
);

CREATE TABLE `J`
(
    `JNO`   CHAR(2)    NOT NULL PRIMARY KEY,
    `JNAME` VARCHAR(5) NOT NULL,
    `CITY`  VARCHAR(5) NOT NULL
);

CREATE TABLE `SPJ`
(
    `SNO` CHAR(2) NOT NULL,
    `PNO` CHAR(2) NOT NULL,
    `JNO` CHAR(2) NOT NULL,
    `QTY` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`SNO`, `PNO`, `JNO`),
    CONSTRAINT `fk_spj_s` FOREIGN KEY (`SNO`) REFERENCES `S` (`SNO`),
    CONSTRAINT `fk_spj_p` FOREIGN KEY (`PNO`) REFERENCES `P` (`PNO`),
    CONSTRAINT `fk_spj_j` FOREIGN KEY (`JNO`) REFERENCES `J` (`JNO`)
);