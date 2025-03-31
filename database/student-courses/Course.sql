create table Course
(
    Cno     varchar(5)   not null
        primary key,
    Cname   varchar(100) not null,
    Ccredit int          not null,
    Cpno    varchar(5)   null,
    constraint Course_ibfk_1
        foreign key (Cpno) references Course (Cno)
);

create index Cpno
    on Course (Cpno);

INSERT INTO learning.Course (Cno, Cname, Ccredit, Cpno) VALUES ('81001', '程序设计基础与C语言', 4, null);
INSERT INTO learning.Course (Cno, Cname, Ccredit, Cpno) VALUES ('81002', '数据结构', 4, '81001');
INSERT INTO learning.Course (Cno, Cname, Ccredit, Cpno) VALUES ('81003', '数据库系统概论', 4, '81002');
INSERT INTO learning.Course (Cno, Cname, Ccredit, Cpno) VALUES ('81004', '信息系统概论', 4, '81003');
INSERT INTO learning.Course (Cno, Cname, Ccredit, Cpno) VALUES ('81005', '操作系统', 4, '81001');
INSERT INTO learning.Course (Cno, Cname, Ccredit, Cpno) VALUES ('81006', 'Python语言', 3, '81002');
INSERT INTO learning.Course (Cno, Cname, Ccredit, Cpno) VALUES ('81007', '离散数学', 4, null);
INSERT INTO learning.Course (Cno, Cname, Ccredit, Cpno) VALUES ('81008', '大数据技术概论', 4, '81003');
