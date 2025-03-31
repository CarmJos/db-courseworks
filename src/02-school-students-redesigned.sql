
# 设计的还不够全面，例如：
# 1. 教师应当有教师表，教师表应当有教师编号，教师编号应当有规则
# 2. 课程应当包含更多信息，例如平台、学期、学年等
# 3. 选课表应当包含更多信息，例如选课时间、选课状态、选课方式等。

CREATE DATABASE school;
USE school;

CREATE TABLE `department`
(
    `id`   CHAR(2)     NOT NULL PRIMARY KEY COMMENT '系别编号',
    `name` VARCHAR(20) NOT NULL COMMENT '系别名称'
);

CREATE TABLE `major`
(
    `id`   CHAR(2)          NOT NULL PRIMARY KEY COMMENT '专业编号',
    `name` VARCHAR(20)      NOT NULL COMMENT '专业名称',
    `dept` TINYINT UNSIGNED NOT NULL COMMENT '系别',
    CONSTRAINT `fk_major_dept` FOREIGN KEY (`dept`) REFERENCES `department` (`id`)
);

CREATE TABLE `class`
(
    `grade`   YEAR             NOT NULL COMMENT '级',
    `major`   CHAR(2)          NOT NULL COMMENT '专业',
    `id`      TINYINT UNSIGNED NOT NULL COMMENT '班',
    `name`    VARCHAR(20)      NOT NULL COMMENT '班级名称',
    `teacher` VARCHAR(20) COMMENT '班主任', # 有条件可以额外做教师表
    CONSTRAINT `pk_class` PRIMARY KEY (`major`, `grade`, `id`)
);

# 学生表
# - 学号计算 2000(grade) 00(系别) 00(专业) 00(班级) 00(学号)
CREATE TABLE `student`
(
    `pid`    CHAR(18)         NOT NULL PRIMARY KEY COMMENT '身份证号码',
    `class`  TINYINT UNSIGNED NOT NULL COMMENT '班级',
    `cid`    CHAR(2)          NOT NULL PRIMARY KEY COMMENT '班内学号',
    `name`   VARCHAR(20)      NOT NULL COMMENT '姓名',
    `gender` CHAR(1)          NOT NULL COMMENT '性别',
    CONSTRAINT `fk_student_class` FOREIGN KEY (`class`) REFERENCES `class` (`id`),
    CONSTRAINT `uk_class_id` UNIQUE (`class`, `cid`),
    CONSTRAINT `ck_student_gender` CHECK (`gender` IN ('男', '女'))
);

# 课程表
CREATE TABLE `course`
(
    `id`      CHAR(8)          NOT NULL PRIMARY KEY COMMENT '课程编号',
    `name`    VARCHAR(20)      NOT NULL COMMENT '课程名称',
    `type`    TINYINT          NOT NULL COMMENT '课程类型',
    `credit`  TINYINT UNSIGNED NOT NULL COMMENT '学分',
    `hour`    TINYINT UNSIGNED NOT NULL COMMENT '学时',
    `teacher` VARCHAR(20) COMMENT '任课教师'
);

# 选课表

CREATE TABLE `stu_course`
(
    `student` CHAR(18) NOT NULL COMMENT '学生',
    `course`  CHAR(8)  NOT NULL COMMENT '课程',
    `score`   TINYINT COMMENT '结课成绩',
    PRIMARY KEY (`student`, `course`),
    CONSTRAINT `fk_select_course_student` FOREIGN KEY (`student`) REFERENCES `student` (`pid`),
    CONSTRAINT `fk_select_course_course` FOREIGN KEY (`course`) REFERENCES `course` (`id`),
    CONSTRAINT `ck_select_course_grade` CHECK (score BETWEEN 0 AND 100)
);