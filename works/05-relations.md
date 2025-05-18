# 关系问题

建立一个包含系、学生、班级、学会等信息的关系数据库，并描述各个实体的属性，以及它们之间的关系。具体要求包括：

- 描述学生的属性：学号、姓名、出生日期、系名、班号、宿舍区。
- 描述班级的属性：班号、专业名、系名、人数、入校年份。
- 描述系的属性：系名、系号、系办公室地点、人数。
- 描述学会的属性：学会名、成立年份、地点、人数。

此外，还需要给出关系模式，写出每个关系模式的最小依赖集，指出是否存在传递函数依赖，
对于函数依赖左部是多属性的情况，讨论函数依赖是完全函数依赖还是部分函数依赖。
最后，指出各关系的候选码、外部码，并说明是否全码存在。



## 示例库

```sql
CREATE DATABASE SchoolDB;

USE SchoolDB;

CREATE TABLE Department (
    DeptName VARCHAR(50) PRIMARY KEY,
    DeptID INT UNIQUE,
    OfficeLocation VARCHAR(100),
    NumberOfStudents INT
);

CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    MajorName VARCHAR(50),
    DeptName VARCHAR(50),
    NumberOfStudents INT,
    AdmissionYear INT,
    FOREIGN KEY (DeptName) REFERENCES Department(DeptName)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    BirthDate DATE,
    DeptName VARCHAR(50),
    ClassID INT,
    DormitoryArea VARCHAR(50),
    FOREIGN KEY (DeptName) REFERENCES Department(DeptName),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE Club (
    ClubName VARCHAR(50) PRIMARY KEY,
    EstablishmentYear INT,
    Location VARCHAR(100),
    NumberOfMembers INT
);

CREATE TABLE StudentClub (
    StudentID INT,
    ClubName VARCHAR(50),
    MembershipYear INT,
    PRIMARY KEY (StudentID, ClubName),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubName) REFERENCES Club(ClubName)
);
```

## 关系模式

- Department(DeptName, DeptID, OfficeLocation, NumberOfStudents)
- Class(ClassID, MajorName, DeptName, NumberOfStudents, AdmissionYear)
- Student(StudentID, Name, BirthDate, DeptName, ClassID, DormitoryArea)
- Club(ClubName, EstablishmentYear, Location, NumberOfMembers)
- StudentClub(StudentID, ClubName, MembershipYear)

## 最小依赖集
- Department: {DeptName → DeptID, DeptName → OfficeLocation, DeptName → NumberOfStudents}
- Class: {ClassID → MajorName, ClassID → DeptName, ClassID → NumberOfStudents, ClassID → AdmissionYear}
- Student: {StudentID → Name, StudentID → BirthDate, StudentID → DeptName, StudentID → ClassID, StudentID → DormitoryArea}
- Club: {ClubName → EstablishmentYear, ClubName → Location, ClubName → NumberOfMembers}
- StudentClub: {StudentID, ClubName → MembershipYear}

## 传递函数依赖
不存在明显的传递函数依赖。

## 函数依赖类型
所有函数依赖都是完全函数依赖，因为没有函数依赖的左部是多属性的情况。

## 候选码和外部码
- Department: 候选码为 DeptName，无外部码。
- Class: 候选码为 ClassID，外部码为 DeptName。
- Student: 候选码为 StudentID，外部码为 DeptName 和 ClassID。
- Club: 候选码为 ClubName，无外部码。
- StudentClub: 候选码为 (StudentID, ClubName)，外部码为 StudentID 和 ClubName。

## 全码存在
- StudentClub 表中存在全码 (StudentID, ClubName)。