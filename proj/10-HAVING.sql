# 1)查找平均成绩在85分以上的学生的学号和平均成绩
SELECT Student.id, AVG(score) AS 平均成绩
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
GROUP BY id
HAVING AVG(score) > 85;

# 2)查找选修人数超过3人的课程名和选修人数
SELECT name AS '课程', COUNT(*) AS '选修人数'
FROM StuCourse
         JOIN Course ON Course.id = StuCourse.course
GROUP BY course
HAVING COUNT(*) > 3;