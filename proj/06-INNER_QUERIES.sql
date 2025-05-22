# 1)查找与“丁一平”在同一年出生的学生情况
SELECT *
FROM Student
WHERE YEAR(birthday) = (SELECT YEAR(birthday)
                        FROM Student
                        WHERE name = '丁一平');


# 2)查询未选修任何课程的学生情况。
SELECT *
FROM Student
WHERE id NOT IN (SELECT DISTINCT id
                 FROM StuCourse);

# 3)查找未选修“程序设计基础”课程的学生情况。
SELECT *
FROM Student
WHERE id NOT IN (SELECT DISTINCT id
                 FROM StuCourse
                 WHERE course = '1001');