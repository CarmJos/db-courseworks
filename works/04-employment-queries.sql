DROP DATABASE IF EXISTS test1;
CREATE DATABASE test1;
USE test1;

# 部门表
CREATE TABLE dept
(
    deptno INT PRIMARY KEY,##部门编号
    dname  VARCHAR(14),    ##部门名称
    loc    VARCHAR(13)     ##部门地址
);

INSERT INTO dept
VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept
VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept
VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept
VALUES (40, 'OPERATIONS', 'BOSTON');

##员工表
# DROP IF EXISTS TABLE emp;
CREATE TABLE emp
(
    empno    INT PRIMARY KEY, #员工编号
    ename    VARCHAR(10),     #员工姓名
    job      VARCHAR(9),      #员工工作
    mgr      INT,             #员工直属领导编号
    hiredate DATE,            #入职时间
    sal      DOUBLE,          #工资
    comm     DOUBLE,          #奖金
    deptno   INT              #对应dept表的外键
);

## 添加 部门 和 员工 之间的主外键关系
ALTER TABLE emp
    ADD CONSTRAINT FOREIGN KEY emp (deptno) REFERENCES dept (deptno);

INSERT INTO emp
VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO emp
VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO emp
VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO emp
VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO emp
VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO emp
VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO emp
VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO emp
VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-07-03', 3000, NULL, 20);
INSERT INTO emp
VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO emp
VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO emp
VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100, NULL, 20);
INSERT INTO emp
VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO emp
VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO emp
VALUES (7934, 'MILLER', 'CLERK', 7782, '1981-01-23', 1300, NULL, 10);

#工资等级表
CREATE TABLE salgrade
(
    grade INT,    #等级
    losal DOUBLE, #最低工资
    hisal DOUBLE  #最高工资
);

INSERT INTO salgrade
VALUES (1, 700, 1200);
INSERT INTO salgrade
VALUES (2, 1201, 1400);
INSERT INTO salgrade
VALUES (3, 1401, 2000);
INSERT INTO salgrade
VALUES (4, 2001, 3000);
INSERT INTO salgrade
VALUES (5, 3001, 9999);

#1、查找部门30中员工的详细信息。

SELECT *
FROM emp
WHERE deptno = 30;

#2、找出从事clerk工作的员工的编号、姓名、部门号。

SELECT empno, ename, deptno
FROM emp
WHERE job = 'CLERK';

#3、检索出奖金多于基本工资的员工信息。

SELECT *
FROM emp
WHERE comm > sal;

#4、检索出奖金多于基本工资60%的员工信息。

SELECT *
FROM emp
WHERE comm > sal * 0.6;

#5、找出10部门的经理、20部门的职员 的员工信息。
SELECT *
FROM emp
WHERE deptno = 10 AND job = 'MANAGER'
   OR deptno = 20 AND job != 'MANAGER';


#6、找出10部门的经理、20部门的职员 或者既不是经理也不是职员但是工资高于2000元的员工信息。

SELECT *
FROM emp
WHERE deptno = 10 AND job = 'MANAGER'
   OR deptno = 20 AND job != 'MANAGER'
   OR sal > 2000;

#7、找出获得奖金的员工的工作。

SELECT DISTINCT job
FROM emp
WHERE comm IS NOT NULL;

#8、找出奖金少于100或者没有获得奖金的员工的信息。

SELECT *
FROM emp
WHERE comm < 100
   OR comm IS NULL;

#9、找出姓名以A、B、S开始的员工信息。

SELECT *
FROM emp
WHERE ename LIKE 'A%'
   OR ename LIKE 'B%'
   OR ename LIKE 'S%';

#10、找到名字长度为6个字符的员工信息。

SELECT *
FROM emp
WHERE LENGTH(ename) = 6;

#11、名字中不包含R字符的员工信息。

SELECT *
FROM emp
WHERE ename NOT LIKE '%R%';

#12、返回员工的详细信息并按姓名排序。

SELECT *
FROM emp
ORDER BY ename;

#13、返回员工的信息并按工作降序工资升序排列。

SELECT *
FROM emp
ORDER BY job DESC, sal;

#14、计算员工的日薪(按30天)。

SELECT ename, sal / 30 AS 日薪
FROM emp;

#15、找出姓名中包含A的员工信息。

SELECT *
FROM emp
WHERE ename LIKE '%A%';
