# 1)查询各专业的学生数。
SELECT major, COUNT(*) AS 学生数
FROM Student
GROUP BY major;

# 2)求被选修课程的名称和选修该课程的学生人数
SELECT course AS '课程', COUNT(*) AS '选修人数'
FROM StuCourse
GROUP BY course;

# 3)统计各专业、各课程的平均成绩
SELECT major AS '专业', course AS '课程', AVG(score) AS '平均成绩'
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
GROUP BY major, course;
