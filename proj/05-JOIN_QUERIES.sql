# 1)查询每个学生的情况和其选修课程的课程号及成绩
SELECT Student.*, StuCourse.course, StuCourse.score
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id;

# 2)查询计算机科学与技术专业学生的情况和其选修课程的课程号及成绩
SELECT Student.*, StuCourse.course, StuCourse.score
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
WHERE major = '计算机科学与技术';

# 3)查询成绩低于60分的学生的情况和不及格课程的课程号及成绩
SELECT Student.*, StuCourse.course, StuCourse.score
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
WHERE StuCourse.score < 60;

# 4)查询每个学生的情况和其选修的课程名及成绩。
SELECT Student.*, Course.name, StuCourse.score
FROM Student
         JOIN StuCourse ON Student.id = StuCourse.id
         JOIN Course ON StuCourse.course = Course.id;

# 5)查询所有学生及其选课情况, 若学生未选课程, 也要将该生的信息输出。
SELECT Student.*, Course.name, StuCourse.score
FROM Student
         LEFT JOIN StuCourse ON Student.id = StuCourse.id
         LEFT JOIN Course ON StuCourse.course = Course.id;