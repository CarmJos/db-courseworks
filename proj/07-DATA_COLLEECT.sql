# 1)计算所有课程的总学时，使用AS子句将结果列的标题指定为总学时。
SELECT SUM(time) AS 总学时
FROM Course;

# 2)求计算机科学与技术专业学生所有课程的平均成绩。
SELECT AVG(StuCourse.score) AS 平均成绩
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
WHERE major = '计算机科学与技术';

# 3)计算电子信息工程专业的“高等数学1”课程平均成绩。
SELECT AVG(StuCourse.score) AS 平均成绩
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
WHERE major = '电子信息工程'
  AND course = '1002';

# 4)查询电子信息工程专业的“高等数学1”课程的最高和最低成绩。
SELECT MAX(StuCourse.score) AS 最高成绩,
       MIN(StuCourse.score) AS 最低成绩
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
WHERE major = '电子信息工程'
  AND course = '1002';

# 5)查询电子信息工程专业的学生总数。
SELECT COUNT(*) AS 学生总数
FROM Student
WHERE major = '电子信息工程';

