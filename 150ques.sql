use sql_clas_5;

create table department(
deptno int,
dname varchar(25),
dloc varchar(25));

insert into department(deptno,dname,dloc)
values(10,'Accounting','Newyork'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operations','Boston');

Create table employee(
empno int,
ename varchar(20),
job varchar(20),
mgr int,
hiredate date,
sal int,
comm int,
deptno int);

INSERT INTO employee(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES
    (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
    (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
    (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
    (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
    (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
    (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
    (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
    (7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, 3000, 20),
    (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
    (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
    (7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20),
    (7902, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
    (7934, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
    (7935, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);
    
select * from employee;
select distinct(job) as Job from employee;
select ename,sal as salary from employee order by salary asc;
select ename,deptno,job from employee order by deptno asc, job desc;
select distinct job from employee order by job desc;
select * from employee where empno in (select mgr from employee);
SELECT * FROM employee  WHERE YEAR(hiredate) < 1981;
select empno,ename,sal/30 as dailysal,sal, sal*12 as annsal from employee order by annsal asc;
select empno,ename,job,hiredate from employee where job <> 'manager';
select empno,ename,sal,  datediff(current_date(), hiredate ) as exp from employee where mgr= 7369;
select * from employee where comm > sal;
select * from employee where hiredate > '1981-06-30' order by job asc;
select *, sal/30 as dailysal, datediff(current_date(),hiredate)/365 as exp from employee having dailysal > 100; 
select * from employee where job = 'Clerk' or job =  'Analyst' order by job desc;
select * from employee where hiredate in ('1981-05-01','1981-12-03','1981-12-17','1980-01-19') order by hiredate asc;
select * from employee where deptno in (10,20);
select * from employee where year(hiredate) = '1981';
select * from employee where hiredate between '1980-08-01' and '1980-08-31';
select *,sal*12 as annsal  from employee having annsal between 22000 and 45000; 
select ename from employee where length(ename) =5;
select ename from employee where ename like 's%'and length(ename) =5;
select ename from employee where ename like '__r_%' and length (ename) = 4;
select ename from employee where ename like 'S___H%' and length(ename) = 5;
select ename from employee where ename like 'S%H' and length(ename) = 5;
select * from employee where month(hiredate) = '01';
select * from employee where substr(date_format(hiredate,'%M'),2,1) = 'a';
select * from employee where length(sal) = 4 and sal like '%0';
select ename from employee where ename like '%ll%';
select * from employee where year(hiredate) = '1980';
select * from employee where deptno not in (20);
select * from employee where job not in ('president','manager') order by sal asc;
select * from employee where year(hiredate) < '1981' or year(hiredate) > '1981';
select empno from employee where empno not like '78%';
select * from employee where mgr is not null ;
select e1.ename , e2.ename from employee e1 , employee e2 where e1.mgr = e2.empno;
select * from employee where month(hiredate) = '5';
select * from employee where job = 'CLERK' and deptno = 20;
select * from employee where year(hiredate) = '1981' and (deptno = 20 or deptno = 10);
select * from employee where ename = 'smith';
select e.ename, dep.dloc from employee e inner join department dep on e.deptno = dep.deptno where e.ename = 'SMITH';
select e.* , dep.dname, dep.dloc  from employee e inner join department dep on e.deptno = dep.deptno where dep.dname in ('accounting','research') order by e.deptno asc; 
select e.empno,e.ename,e.sal,dep.dname, datediff(current_date(), hiredate) as exp from employee e inner join department dep on e.deptno = dep.deptno 
where e.job in ('Manager','analyst') and e.comm is null and dep.dloc in ('new york','dallas') having exp > 7*365 order by dep.dloc asc;

select e.empno,e.ename,e.sal,dep.dname,dep.dloc,e.deptno,e.job, sal*12 as annsal
from employee e inner join department dep on e.deptno = dep.deptno 
where e.sal <> 3000 or 2800  and (dep.dloc = 'Chicago' or dep.dname = 'Accounting')
order by e.deptno asc, e.job desc ;

select E.empno,E.ename,E.sal,Dep.dname,Dep.loc,E.deptno,E.job from employee E,department dep
where(Dep.loc='CHICAGO'or Dep.dname='ACCOUNTING')and E.deptno=Dep.deptno and
E.empno in(select E.empno from employee E where(12*E.sal)>28000 and E.sal not in
(3000,2800) and E.job !='MANAGER' and (E.empno like'__7%'or E.empno like '__8%' ))
order by E.deptno asc, E.job desc;

select e.empno, e.ename, e.sal, dep.dname, datediff(current_date(),hiredate) as exp, 12*sal as annsal 
from employee e inner join department dep on e.deptno = dep.deptno
where e.deptno in (10,20);

select* from employee e , e.sal grades where e.sal between s.losal and s.hisal order by grades
asc;

select * from employee e, e.sal grades where e.sal >= s.losal and e.sal <= s.hisal order by
s.grade asc;

select datediff(current_date(),hiredate) as exp from employee where ename = 'BLAKE';

select e.*, datediff(current_date(),e.hiredate) as Expp  from employee e inner join department d on e.deptno = d.deptno
where d.dloc in ('Chicago','Boston') 
having Expp > (select datediff(current_date(),hiredate) as exp from employee where ename = 'BLAKE');

select job , datediff(current_date(),hiredate) as exp 
from employee where year(hiredate) = '1981' having exp = (
select max(datediff(current_date(),hiredate)) from employee);

select * from employee where job in (select job from employee where hiredate in (select min(hiredate) from employee where year(hiredate) = '1981'));
 
select sum(sal) as totsalmgr from employee where job = 'manager';
select job,sum(sal*12) as Annsal from employee where year(hiredate) = '1981' group by job;
select ename, avg(sal) as avgsal from employee where job = 'clerk' group by ename;
select* from employee where sal > (select avg(sal) from employee where deptno = 10);
select job,deptno, count(*) as empcount from employee group by deptno,job;

select e1.mgr as mgrnum, count(e1.ename) as empcount
from employee e1 , employee e2 where e1.mgr = e2.empno group by e1.mgr order by e1.mgr asc; 

select deptno, count(deptno) as empcount from employee group by deptno having empcount >= 2;

select d.dname, count(e.ename) as empcount
from employee e inner join department d on e.deptno = d.deptno
where e.job = 'clerk'
group by d.dname
having empcount >=2;

select deptno, count(deptno) as empcount from employee 
group by deptno
order by empcount desc limit 1;
select ename from employee where mgr in (select mgr from employee where ename ='jones');
select ename, sal*(0.20) + sal as incsal from employee having incsal > 3000; 
select * from employee where job != 'salesman';

select e.ename, e.deptno,e.sal,e.comm
from employee e inner join department d on e.deptno = d.deptno
where (e.sal between 2000 and 5000) and d.dloc = 'chicago';

select empno,sal from employee where job = 'manager';
select empno,sal from employee where job <> 'manager' and (select empno,sal from employee where job = 'manager');

select e.ename, e.job,d.dname, d.dloc from employee e, department d 
where e.deptno = d.deptno and e.empno in (select mgr from employee);
SELECT e.ename, e.job, d.dname, d.dloc 
FROM employee e 
INNER JOIN department d ON e.deptno = d.deptno
WHERE e.job = 'Manager';

select mgr from employee where ename = 'jones';
select e1.ename  as empname, e2.ename  as mgrname from employee e1 join employee e2 on e1.mgr = e2.empno
where e1.ename = 'jones';

select e.ename,e.job,e.sal, d.dname from employee e join department d on e.deptno = d.deptno
order by e.sal desc;

select e.ename,e.job,e.sal, d.dname from employee e join department d on e.deptno = d.deptno
where job <> 'clerk'
order by e.sal desc;

select ename from employee where mgr is null;

select ename,max(sal) as salmax, deptno from employee group by deptno,ename order by salmax desc;  

select max(sal) as maxsal , min(sal) as minsal from employee; 
select ename, sal from employee 
where sal in (select max(sal) as maxsal from employee ) and (select min(sal) as minsal from employee );

select * from employee where sal = (select (max(sal) + min(sal))/2 from employee);

select deptno, count(ename) as empcount from employee 
group by deptno having empcount >=3 order by empcount desc ;

select d.dname, count(*) as empcount from employee e join department d on e.deptno = d.deptno
group by d.dname  having count(*) >= 3 order by empcount desc;

select avg(sal) as avgsal from employee where job <> 'Manager' and job <> 'President';
select ename,sal from employee where sal > (select avg(sal) as avgsal from employee where job <> 'Manager' and job <> 'President') and job = 'manager';


