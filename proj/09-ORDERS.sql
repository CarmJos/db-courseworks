# 1)将学生数据按出生时间排序
SELECT *
FROM Student
ORDER BY birthday;

# 2)将计算机科学与技术专业的“程序设计基础”课程按成绩由高到底排序。
SELECT *
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
WHERE major = '计算机科学与技术'
  AND course = '1001';

# 3)将各课程按平均成绩由高到底排序。
SELECT course AS '课程', AVG(score) AS '平均成绩'
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
GROUP BY course
ORDER BY AVG(score) DESC;