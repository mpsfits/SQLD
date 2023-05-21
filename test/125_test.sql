SELECT deptno 
FROM T_EMP
WHERE deptno NOT IN(SELECT deptno FROM T_EMP);

SELECT deptno
FROM T_EMP
WHERE deptno NOT IN (SELECT deptno FROM T_EMP);

SELECT deptno
FROM T_EMP
WHERE NOT EXISTS (SELECT deptno FROM T_EMP);

SELECT b.deptno
FROM T_EMP a
RIGHT OUTER JOIN T_dept b ON
a.deptno = b.deptno
WHERE empno IS NULL;

SELECT deptno
FROM T_DEPT
WHERE deptno <> ALL(SELECT deptno FROM T_EMP);
-- 공집합

SELECT deptno
FROM T_DEPT
WHERE deptno <> ALL(SELECT deptno FROM T_EMP);
-- 자료 나옴


SELECT *
FROM dept2;

SELECT *
FROM EMP2;


SELECT deptno 
FROM T_EMP
WHERE deptno NOT IN(SELECT detpno FROM T_EMP);
