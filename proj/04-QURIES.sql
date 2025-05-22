
# 1)对于实验3给出的数据表结构，查询每个学生的所有数据。
SELECT * FROM Student;

# 2)查询每个学生的专业名和总学分。
SELECT name, major, credit FROM Student;

# 3)查询学号为070101的学生的姓名和专业名
SELECT name, major FROM Student WHERE id = '070101';

# 4)查询所有的专业名
SELECT DISTINCT major FROM Student;

# 5)查询Student表中计算机科学与技术专业学生的学号、姓名和总学分，
# 结果中各列的标题分别指定为number 、name 和 mark。
SELECT id AS number, name, credit AS mark
FROM Student
WHERE major = '计算机科学与技术';

# 6)找出所有在1989年出生的“电子信息工程”专业学生的信息
SELECT * FROM Student
WHERE major = '电子信息工程' AND YEAR(birthday) = 1989;


# 7)找出所以姓王的学生的信息
SELECT * FROM Student
WHERE name LIKE '王%';