# 创建数据库dblibrary；
CREATE DATABASE `dblibrary`;
USE `dblibrary`;


# 创建 Book表：
#   Bookid  Char   20 非空，主键
#   Booktitle   Varchar    40 非空
#   ISBN    Char   21
#   Typeid  Tinyint       外键引用图书分类表类别号
#   Author  Varchar    30
#   Press   Varchar    30
#   Pubdate Date
#   Price   Decimal    10，2
#   Regdate Date
#   State   Varchar    10
CREATE TABLE `book`
(
    `Bookid`    char(20)    NOT NULL,
    `Booktitle` varchar(40) NOT NULL,
    `ISBN`      char(21)       DEFAULT NULL,
    `Typeid`    tinyint(4)     DEFAULT NULL,
    `Author`    varchar(30)    DEFAULT NULL,
    `Press`     varchar(30)    DEFAULT NULL,
    `Pubdate`   date           DEFAULT NULL,
    `Price`     decimal(10, 2) DEFAULT NULL,
    `Regdate`   date           DEFAULT NULL,
    `State`     varchar(10)    DEFAULT NULL,
    PRIMARY KEY (`Bookid`),
    CONSTRAINT `fk_book_type` FOREIGN KEY (`Typeid`) REFERENCES `booktype` (`Typeid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Booktype表：
#   Typeid  Tinyint       非空，主键，自增
#   Typename    Varchar    20 非空
CREATE TABLE `booktype`
(
    `Typeid`   tinyint(4)  NOT NULL AUTO_INCREMENT,
    `Typename` varchar(20) NOT NULL,
    PRIMARY KEY (`Typeid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


# Readertype表：
#    Typeid Tinyint       非空，主键，自增
#   Typename    Varchar    20 非空
#   Booksum Tinyint       非空
#   Bookday Smallint      非空

CREATE TABLE `readertype`
(
    `Typeid`   tinyint(4)  NOT NULL AUTO_INCREMENT,
    `Typename` varchar(20) NOT NULL,
    `Booksum`  tinyint(4)  NOT NULL,
    `Bookday`  smallint(6) NOT NULL,
    PRIMARY KEY (`Typeid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

# Reader表：
#   Readerid    Char   13 非空，主键
#   Readername  Varchar    20 非空
#   Typeid  Tinyint       外键引用读者分类表类别号
#   Birthday    Date
#   Sex Char   1  非空，默认值“男”，取值“男”或“女”
#   Tel Char   11
#   Enrolldate  Date      非空
#   State   Char   10 取值“有效”或“无效”
CREATE TABLE `reader`
(
    `Readerid`   char(13)    NOT NULL,
    `Readername` varchar(20) NOT NULL,
    `Typeid`     tinyint(4) DEFAULT NULL,
    `Birthday`   date       DEFAULT NULL,
    `Sex`        char(1)    DEFAULT '男' CHECK (`Sex` IN ('男', '女')),
    `Tel`        char(11)   DEFAULT NULL,
    `Enrolldate` date        NOT NULL,
    `State`      char(10)   DEFAULT NULL CHECK (`State` IN ('有效', '无效')),
    PRIMARY KEY (`Readerid`),
    CONSTRAINT `fk_reader_type` FOREIGN KEY (`Typeid`) REFERENCES `readertype` (`Typeid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

# Record表：
#   Recordid    Int       非空，主键
#   Readerid    Char   13 非空，外键引用读者表读者号
#   Bookid  Char   20 非空，外键引用图书表图书号
#   Outdate Date      非空
#   Indate  Date
#   State   Varchar    10 非空

CREATE TABLE `record`
(
    `Recordid` int(11)     NOT NULL AUTO_INCREMENT,
    `Readerid` char(13)    NOT NULL,
    `Bookid`   char(20)    NOT NULL,
    `Outdate`  date        NOT NULL,
    `Indate`   date DEFAULT NULL,
    `State`    varchar(10) NOT NULL,
    PRIMARY KEY (`Recordid`),
    CONSTRAINT `fk_record_reader` FOREIGN KEY (`Readerid`) REFERENCES `reader` (`Readerid`),
    CONSTRAINT `fk_record_book` FOREIGN KEY (`Bookid`) REFERENCES `book` (`Bookid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;