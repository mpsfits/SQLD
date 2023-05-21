Create table DEPT2(

deptno number(10) primary key,
dname varchar2(20));

DROP TABLE DEPT2;

insert into DEPT2 values(10, 'ACCOUNTING');
insert into DEPT2 values(20, 'RESEARCH');
insert into DEPT2 values(30, 'SALES'); 
insert into DEPT2 values(40, 'OPERATIONS');

Create table EMP2(
empno number(10) primary key,
ename varchar2(20),
deptno number(10),
job varchar2(20),
sal number(10)
);

insert into EMP2 values(1000, 'test1', 20, 'CLERK', 800);
insert into EMP2 values(1001, 'test2', 30, 'SALESMAN', 1600);
insert into EMP2 values(1002, 'test3', 30, 'SALESMAN', 1250);
insert into EMP2 values(1003, 'test4', 20,'MANAGER', 2975);
insert into EMP2 values(1004, 'test5', 30, 'SALESMAN', 1250);
insert into EMP2 values(1005, 'test6', 30, 'MANAGER', 2850);
insert into EMP2 values(1006, 'test7', 10, 'MANAGER', 2450);
insert into EMP2 values(1007, 'test8', 20, 'ANALYST', 3000);
insert into EMP2 values(1008, 'test9', 30,'PRESIDENT', 5000);
insert into EMP2 values(1009, 'test10', 30, 'SALESMAN', 1500);
insert into EMP2 values(1010, 'test11', 20, 'CLERK', 1100);
insert into EMP2 values(1011, 'test12', 30, 'CLERK', 950);
insert into EMP2 values(1012, 'test13', 20, 'ANALYST', 3000);
insert into EMP2 values(1013, 'test14', 10, 'CLERK', 1300);


UPDATE EMP2 SET deptno = 10 
WHERE empno=1008;

SELECT * FROM DEPT2;
SELECT * FROM EMP2;


SELECT B.deptno, A.job, count(*) "Total EMP2", SUM(sal) "Total sal"
FROM EMP2 A, DEPT2 B
WHERE A.deptno = B.deptno
GROUP BY CUBE (B.deptno, A.job);

SELECT *
FROM EMP2 emp, DEPT2 dept
WHERE emp.deptno > 30;