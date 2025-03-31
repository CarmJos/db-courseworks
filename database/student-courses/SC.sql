create table SC
(
    Sno           varchar(8)  not null,
    Cno           varchar(5)  not null,
    Grade         int         null,
    Semester      varchar(5)  not null,
    Teachingclass varchar(10) not null,
    primary key (Sno, Cno),
    constraint SC_ibfk_1
        foreign key (Sno) references Student (Sno),
    constraint SC_ibfk_2
        foreign key (Cno) references Course (Cno)
);

create index Cno
    on SC (Cno);

INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180001', '81001', 85, '20192', '81001-01');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180001', '81002', 96, '20201', '81002-01');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180001', '81003', 87, '20202', '81003-01');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180002', '81001', 80, '20192', '81001-02');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180002', '81002', 98, '20201', '81002-01');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180002', '81003', 71, '20202', '81003-02');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180003', '81001', 81, '20192', '81001-01');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180003', '81002', 76, '20201', '81002-02');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180004', '81001', 56, '20192', '81001-02');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180004', '81002', 97, '20201', '81002-02');
INSERT INTO learning.SC (Sno, Cno, Grade, Semester, Teachingclass) VALUES ('20180005', '81003', 68, '20202', '81003-01');
