INSERT INTO Student
VALUES ('070205', '李冰', '电子信息工程',
        '男', '1988-10-15', 74, NULL);

INSERT INTO Course
VALUES ('2002', '面向对象程序设计', 2, 48, 3);

INSERT INTO StuCourse
VALUES ('070207', '1001', 70);

INSERT INTO StuCourse
VALUES ('070207', '1002', 80),
       ('070207', '2001', 88),
       ('070208', '1001', 89),
       ('070208', '1002', 92),
       ('070208', '2001', 92);


UPDATE StuCourse
SET score=score + 2
WHERE id = '1001';

DELETE
FROM StuCourse
WHERE id = '070208'