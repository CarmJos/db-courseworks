CREATE DATABASE `proj` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

#  学生情况表（表名Student）
# 列名	数据类型	是否允许为空值	默认值	说明
# 学号	char(6)	否	无	主码
# 姓名	char(12)	否	无
# 专业名	varchar(20)	是	无
# 性别	char(2)	否	无
# 出生时间	datetime	是	无
# 总学分	int	是	无
# 备注	text	是	无

CREATE TABLE IF NOT EXISTS `Student`
(
    `id`       CHAR(6) PRIMARY KEY NOT NULL COMMENT '学号',
    `name`     CHAR(12)            NOT NULL COMMENT '姓名',
    `major`    VARCHAR(20) COMMENT '专业名',
    `gender`   CHAR(2)             NOT NULL COMMENT '性别',
    `birthday` DATETIME COMMENT '出生时间',
    `credit`   INT COMMENT '总学分',
    `remark`   TEXT COMMENT '备注'
);

# 课程情况表（表名Course）
# 列名	数据类型	是否允许为空值	默认值	说明
# 课程号	char(4)	否	无	主码
# 课程名	varchar(40)	否	无
# 开课学期	int	是	无
# 学时	int	是	无
# 学分	int	是	无
CREATE TABLE IF NOT EXISTS `Course`
(
    `id`     CHAR(4) PRIMARY KEY NOT NULL COMMENT '课程号',
    `name`   VARCHAR(40)         NOT NULL COMMENT '课程名',
    `term`   INT COMMENT '开课学期',
    `time`   INT COMMENT '学时',
    `credit` INT COMMENT '学分'
);

# 表2.3 学生选课表（表名StuCourse）
# 列名	数据类型	是否允许为空值	默认值	说明
# 学号	char(6)	否	无	主码
# 课程号	char(4)	否	无	主码
# 成绩	real	是	无
CREATE TABLE IF NOT EXISTS `StuCourse`
(
    `id`     CHAR(6) NOT NULL COMMENT '学号',
    `course` CHAR(4) NOT NULL COMMENT '课程号',
    `score`  REAL COMMENT '成绩',
    PRIMARY KEY (`id`, `course`),
    CONSTRAINT `fk_StuCourse_student` FOREIGN KEY (`id`) REFERENCES `Student` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_StuCourse_course` FOREIGN KEY (`course`) REFERENCES `Course` (`id`) ON DELETE CASCADE
)