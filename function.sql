-- 내장 함수 : 하는 이유 - 
SELECT * from emp;

-- 105 사원 입력 하기 : INSERT INTO 테이블명 VALUES (데이터1, 데이터2,...); 
INSERT INTO emp VALUES (105, '유관순', 2500000, SYSDATE, 1000);

-- 사원테이블에서 이름이 '을지문덕'을 검색하시오 : 테이블을 먼저 찾고, where절에서 데이터를 찾는다.
SELECT * from emp
WHERE ename = '을지문덕';

-- 급여가 300만원을 초과하는 사원을 검색하시오
SELECT * from emp
WHERE salary > 3000000;

-- 컬럼이름 바꾸기 : 구조적인 것 DDL 언어 (create alter drop)

-- 급여가 300만원 이면서 부서번호가 1002인 사원을 검색하시오
SELECT * from emp
WHERE salary = 3000000 and deptno = '1002'; -- 문자형 ''써야 : varchar2 이므로

--- 가입일 순으로 내림차순으로 정렬하시오.
SELECT * FROM emp
ORDER BY createdate DESC;

-- 신사임당의 급여를 320만원으로 변경하세요.
-- UADATE 테이블 이름 SET 컬럼변경 내역 (업데이트는 있는 데이터를 바꾸는 것)
UPDATE emp SET salary = 3200000
WHERE empno = 104; -- 동명이인이 있으므로 기본키로 조건을 준다, 기본키 식별자로 해야 정확하게 수정됨 

SELECT * from emp;

-- 사원의 인원의 총수를 구하시오: AS는 별칭 그러나 AS는 생략해도 됨
select COUNT(*) AS 총인원수
FROM emp;

-- 사원 급여의 총합계를 구하시오 (SUM 함수)
SELECT SUM(salary) 총급여합계
FROM emp;

-- 사원 급여의 평균을 구하시오 (AVG 함수 또는 SUM/COUNT)
SELECT SUM(salary)/COUNT(*) 급여평균
FROM emp;

SELECT ROUND(AVG(salary), -1) 급여평균
FROM emp;

-- 부서별 급여 총계 (GROUP BY를 사용하여 정렬)
-- SELECT deptno as 부서별이름 
-- SUM(salary) 급여 합계
-- ROUND (AVG(salary), -2) 
-- GROUP BY deptno;
SELECT deptno,
       SUM(salary) 급여합계, 
       ROUND(AVG(salary),-2) 급여평균
FROM emp -- 그룹바이는 컬럼명에도 따라와야 함
GROUP BY deptno ;

-- 부서별 소계 및 총계
-- GROUP BY ROLLUP (deptno); -- 급여총계

SELECT deptno,
       SUM(salary) 급여합계, 
       ROUND(AVG(salary),-2) 급여평균
FROM emp -- 그룹바이는 컬럼명에도 따라와야 함
GROUP BY ROLLUP (deptno); -- 급여총계




-- 급여가 많은 순으로 내림차순 (DESC) 정렬하시오
SELECT * FROM emp
ORDER BY salary DESC;

-- 급여가 많은 순으로 순위 정하기 :  RANK 함수 : 순위 1235, 1245

SELECT ename,
       salary,
       RANK() OVER(ORDER BY salary DESC) 급여_RANK, --12456 건너뜀
       DENSE_RANK() OVER(ORDER BY salary DESC) 급여_DENSE_RANK  --122345 건너뛰지x 
FROM emp;

-- 이름 순으로 정렬 하시오 (가나다순)
SELECT * FROM emp
ORDER BY ename ASC; --오름차순 ASC 생략 가능


-- 숫자타입 함수
-- 숫자를 반올림한다. : ROUND(숫자, 자릿수)
SELECT ROUND(3.87, 1) FROM DUAL; --자체적으로 만들어줌 DUAL; 오라클에서 제공하는 가상테이블

-- 자리수 : 1 소수첫재짜리 나타냄 / 0 : 정수 / -1: 일의자리
SELECT ROUND(12351, -1) FROM DUAL;

-- 절대값 ABS(숫자) absoulute : 양수는 양수이고 , 음수는 양수로 바뀜
SELECT ABS(-10), ABS(10) FROM DUAL;

-- 사원 급여에서 반올림 함수 사용
SELECT ename, salary,
             salary/30 일급,
             ROUND(salary/30,1) 결과1,
             ROUND(salary/30,0) 결과2,
             ROUND(salary/30,-1) 결과3
FROM emp;

-- 숫자를 버리는 것 내리는 것 : 숫자를 절삭 버림 TRUNC 함수 (숫자, 자리수)
SELECT TRUNC(3.87, 1), TRUNC(3.87) FROM DUAL;
-- SELECT TRUNC(3.87, 1), TRUNC(3.87,0) FROM DUAL;

-- 숫자를 정수로 내림한다 : FLOOR 함수 (실수) : 소수점이 있는 수 = 실수
SELECT FLOOR(3.87) FROM DUAL;

-- 사원 급여에 TRUNC()적용
SELECT ename, salary,
             salary/30 일급,
             TRUNC(salary/30,1) 결과1,  -- 소수 첫째자리 반올림
             TRUNC(salary/30,0) 결과2,  -- 정수 만들기
             TRUNC(salary/30,-1) 결과3  -- 일의자리 반올림
FROM emp;















