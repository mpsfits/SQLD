SELECT * 
FROM EMP
WHERE deptno > 20;

SELECT *
FROM DEPT;

SELECT *
FROM EMP e, DEPT d
WHERE e.deptno >20;

DELETE FROM EMP 
WHERE empno >= 1009;