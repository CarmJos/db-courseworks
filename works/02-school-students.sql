# 创建学生成绩数据库dbstudent；
CREATE DATABASE `dbstudent`;
USE `dbstudent`;


# 1.创建班级表class，保存班级信息；
CREATE TABLE `class`
(
    `Classid`   CHAR(10)    NOT NULL PRIMARY KEY,
    `Classname` VARCHAR(20) NOT NULL,
    `Specialty` VARCHAR(20),
    `Classnum`  TINYINT,
    `Departid`  TINYINT     NOT NULL
);

# 2.向班级表中添加字段年级year，smallint型，非空；
ALTER TABLE `class`
    ADD COLUMN `year` SMALLINT NOT NULL;

# 3.将year重命名为grade；
ALTER TABLE `class`
    CHANGE COLUMN `year` `grade` SMALLINT NOT NULL;

# 4.将grade修改为int型，可为空；
ALTER TABLE `class`
    CHANGE COLUMN `grade` `grade` INT;

# 5.删除字段grade；
ALTER TABLE `class`
    DROP COLUMN `grade`;

# 6.查看表class的表结构。
DESC `class`;

# 7.创建系表department；
# Departed  Tinyint       非空
# Departname    Varchar    20 非空

CREATE TABLE `department`
(
    `Departid`   TINYINT     NOT NULL PRIMARY KEY,
    `Departname` VARCHAR(20) NOT NULL
);

# 8.向系表中添加字段系人数departnum，tinyint型，非空；
ALTER TABLE `department`
    ADD COLUMN `departnum` TINYINT NOT NULL;

# 9.将字段departnum重命名为departpeople，smallint型，可为空；
ALTER TABLE `department`
    CHANGE COLUMN `departnum` `departpeople` SMALLINT;

# 10.将字段departname数据类型修改为varchar（30）；
ALTER TABLE `department`
    CHANGE COLUMN `departname` `departname` VARCHAR(30);

# 11.删除字段departpeople；
ALTER TABLE `department`
    DROP COLUMN `departpeople`;

# 12.查看表department的表结构。
DESC `department`;

# 13.创建课程表course和成绩表score；
# Course表：
#   Courseid  Char   8  非空，主键
#   Coursename    Varchar    30 非空
#   Type  Varchar    10
#   Mark  Tinyint
# Score表：
#   Studentid Char   13 非空，主键，外键引用学生表学号
#   Courseid  Char   8  非空，主键，外键引用课程表课程号
#   Score Int       取值为0-100

CREATE TABLE `course`
(
    `Courseid`   CHAR(8)    NOT NULL PRIMARY KEY,
    `Coursename` VARCHAR(30) NOT NULL,
    `Type`       VARCHAR(10),
    `Mark`       TINYINT
);

CREATE TABLE `score`
(
    `Studentid` CHAR(13) NOT NULL PRIMARY KEY,
    `Courseid`  CHAR(8)  NOT NULL PRIMARY KEY,
    `Score`     INT
);