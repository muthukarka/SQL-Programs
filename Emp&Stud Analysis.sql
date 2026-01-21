create database Emps;
Use Emps;

create table Emptb ( 
empno int(10),
ename varchar(50),
job varchar(50),
mgr int(10),
hiredate date,
sal int(5),
comm int(5),
deptno int(5));

INSERT INTO emptb (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
(7788,'SCOTT','ANALYST',7566,'1982-12-09',3000,3000,20),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
(7902,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
(7934,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7935,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);

create table depttb( 
deptno int(5),
dname varchar(20),
loc varchar(20));

INSERT INTO depttb (deptno, dname, loc)
VALUES
(10, 'Accounting', 'Newyork'),
(20, 'Research', 'Dallas'),
(30, 'Sales', 'Chicago'),
(40, 'Operations', 'Boston');




