# 1.不带参数的存储过程。
#   1)定义存储过程Stu_Query, 功能是：从XSCJ数据库的3个表中查询，返回学号、姓名、专业名、选修课程名及成绩。
CREATE PROCEDURE Stu_Query
BEGIN
    SELECT S.id, S.name, S.major, C.name, SC.score
    FROM Student S,
         Course C,
         StuCourse SC
    WHERE SC.course = C.id
      AND SC.id = S.id;
END;

# 2.带参数的存储过程。
#   1)定义存储过程Query_Stu, 功能是：接收输入的学生姓名、课程名，从XSCJ数据库的3个表中查询该学生的该课程成绩。
CREATE PROCEDURE Query_Stu(
    IN stu_name VARCHAR(20),
    IN course_name VARCHAR(20)
)
BEGIN
    SELECT Student.id      AS '学号',
           Student.name    AS '姓名',
           Student.major   AS '专业',
           Course.name     AS '课程',
           StuCourse.score AS '成绩'
    FROM Student,
         Course,
         StuCourse
    WHERE StuCourse.course = Course.id
      AND StuCourse.id = Student.id
      AND Student.name = stu_name
      AND Course.name = course_name;
END;

#   2)执行存储过程Query_Stu
CALL Query_Stu('王红', '高等数学1');

#   3)定义存储过程Proc_Student，
#   功能是：接收输入的学号、姓名、专业名、性别、出生时间、总学分、备注字段值。
#   在Student表中查询该学号是否存在。
#   若不存在，则向Student表中插入以参数值为各字段值的新记录；
#   若存在，则将该记录的姓名、专业名、性别、出生时间、总学分、备注字段值修改为输入的各参数值。

CREATE PROCEDURE Proc_Student(
    IN stu_id CHAR(6),
    IN stu_name CHAR(20),
    IN stu_major VARCHAR(20),
    IN stu_gender CHAR(2),
    IN stu_birthday DATE,
    IN stu_credit INT,
    IN stu_remark TEXT
)
BEGIN
    REPLACE INTO Student(id, name, major, gender, birthday, credit, remark)
    VALUES (stu_id, stu_name, stu_major,
            stu_gender, stu_birthday,
            stu_credit, stu_remark);
END;

#   4)执行存储过程Proc_Student
CALL Proc_Student(
        '090112', 'Carm', '物联网工程',
        '男', '2000-01-01', 10, '强大'
     );


# 1)定义触发器SC_trig：在向StuCourse表插入一条记录时，通过触发器检查记录的学生号值在Student表是否存在，
# 若不存在，则取消插入或修改操作。
CREATE TRIGGER SC_trig
    BEFORE INSERT
    ON StuCourse
    FOR EACH ROW
BEGIN
    DECLARE student_exists INT;

    SELECT COUNT(*)
    INTO student_exists
    FROM Student
    WHERE id = NEW.id;

    IF student_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Student ID does not exist in Student table';
    END IF;
END;

# 测试
INSERT INTO StuCourse
VALUES ('070120', '2001', 70);