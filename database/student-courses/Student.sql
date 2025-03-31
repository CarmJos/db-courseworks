create table Student
(
    Sno       varchar(8)  not null
        primary key,
    Sname     varchar(50) not null,
    Ssex      varchar(3)  not null,
    Sbirthday date        not null,
    Smajor    varchar(50) not null
);

INSERT INTO learning.Student (Sno, Sname, Ssex, Sbirthday, Smajor) VALUES ('20180001', '李勇', '男', '2000-03-08', '信息安全');
INSERT INTO learning.Student (Sno, Sname, Ssex, Sbirthday, Smajor) VALUES ('20180002', '刘晨', '女', '1999-09-01', '计算机科学与技术');
INSERT INTO learning.Student (Sno, Sname, Ssex, Sbirthday, Smajor) VALUES ('20180003', '王敏', '女', '2001-08-01', '计算机科学与技术');
INSERT INTO learning.Student (Sno, Sname, Ssex, Sbirthday, Smajor) VALUES ('20180004', '张立', '男', '2000-01-08', '计算机科学与技术');
INSERT INTO learning.Student (Sno, Sname, Ssex, Sbirthday, Smajor) VALUES ('20180005', '陈新奇', '男', '2001-11-01', '信息管理与信息系统');
INSERT INTO learning.Student (Sno, Sname, Ssex, Sbirthday, Smajor) VALUES ('20180006', '赵明', '男', '2000-06-12', '数据科学与大数据技术');
INSERT INTO learning.Student (Sno, Sname, Ssex, Sbirthday, Smajor) VALUES ('20180007', '王佳佳', '女', '2001-12-07', '数据科学与大数据技术');
