SELECT * FROM emp;

-- 실행계획을 옵티마이저라고 함

DESC PLAN_TABLE;

-- 급여가 최고인 사원과 최저인 사원을 검색하시오
SELECT MAX(sal) 최고급여, MIN(sal) 최저급여
FROM emp;

--> 최적화가 불완전한 서브 쿼리
SELECT ename, sal
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp)
    OR sal = (SELECT MIN(sal) FROM emp);

-- > cost 2 나옴
--  > emp 3번 하므로 안 좋은 실행계획임
--> 최적화가 불완전한 서브 쿼리

-- 오라클 제공하는 실행 계획
-- 옵티마이저 실행 계획 상태 - 전체 조회 코드
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST'));

SELECT ename, sal
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp)
    OR sal = (SELECT MIN(sal) FROM emp); -- 먼저하고 

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST')); --나중에   
