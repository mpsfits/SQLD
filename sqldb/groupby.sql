-- DEPT 테이블 생성
CREATE TABLE dept(
    dept_no VARCHAR2(3),
    job_nm VARCHAR2(20),
    salary NUMBER
);

INSERT INTO dept VALUES ('100', '증권사', 3300000);
INSERT INTO dept VALUES ('100', '관리자', 4300000);
INSERT INTO dept VALUES ('200', '증권사', 5000000);
INSERT INTO dept VALUES ('200', '데이터분석가', 4000000);
INSERT INTO dept VALUES ('200', '관리자', 6000000);
INSERT INTO dept VALUES ('300', '관리자', 6000000);
INSERT INTO dept VALUES ('400', '관리자', 6000000);

SELECT * FROM dept;

-- DROP TABLE dept; -- 테이블 삭제 / 프라이머리 키없으면 계속 입력됨,

-- 부서별, 이름별 그룹 묶어줘야함
--SELECT *
--FROM dept
--GROUP BY dept_no;

SELECT dept_no, COUNT(*) 인원수 -- 그룹과 1개만 나오므로 안됨 에러남
FROM dept;
-- GROUP BY dept_no;

-- 부서 전체 인원수와 급여합계
SELECT COUNT(*) 인원수, SUM(salary) 급여합계
FROM dept;
-- GROUP BY dept_no;

-- 부서 전체의 급여 누적합계 (오름차순)
SELECT dept_no,
       job_nm,
       salary,
       SUM(salary) OVER (ORDER BY dept_no
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) SAL_SUM
                                   -- 윈도우 함수를 넣어야
FROM dept;

-- 부서 전체의 급여 누적합계 (내림차순)
SELECT dept_no,
       job_nm,
       salary,
       SUM(salary) OVER (ORDER BY dept_no
            ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING ) SAL_SUM
                                   -- 윈도우 함수를 넣어야
FROM dept;


-- 부서별 직업이름별 인원수 급여합계 컬럼을 중심으로 
SELECT dept_no, job_nm, COUNT(*)인원수, SUM(salary) 급여합계
FROM dept
GROUP BY dept_no, job_nm;

----
SELECT dept_no, job_nm, COUNT(*)인원수, SUM(salary) 급여합계
FROM dept
GROUP BY dept_no, job_nm,(dept_no, job_nm);


SELECT dept_no, job_nm, COUNT(*)인원수, SUM(salary) 급여합계
FROM dept
GROUP BY ROLLUP (dept_no, job_nm);

SELECT dept_no, job_nm, COUNT(*)인원수, SUM(salary) 급여합계
FROM dept
GROUP BY CUBE (dept_no, job_nm);

SELECT dept_no, job_nm, COUNT(*)인원수, SUM(salary) 급여합계
FROM dept
GROUP BY GROUPING SETS (dept_no, job_nm, (dept_no, job_nm),());

SELECT dept_no, job_nm, COUNT(*)인원수, SUM(salary) 급여합계
FROM dept
GROUP BY GROUPING SETS(dept_no, job_nm,());

----



-- 부서별 직업별 급여 소계와 전체 총계
-- GROUP BY ROLLUP(컬럼명)
-- ROLLUP 총계가 나옴
SELECT dept_no, job_nm, SUM(salary) 급여합계
FROM dept
GROUP BY ROLLUP (dept_no, job_nm)
ORDER BY dept_no;

-- 부서별 직업별 급여 소계와 전체 총계
-- GROUP BY CUBE(컬럼명) 다면적으로 총계 , 조합할 있는 경우의 수가 모두 조합
-- ROLLUP 총계가 나옴
SELECT dept_no, job_nm, SUM(salary) 급여합계
FROM dept
GROUP BY CUBE (dept_no, job_nm)
ORDER BY dept_no;

-- 부서별 직업 이름별 급여 소계
-- 총계 안 나옴 소계만 나옴
SELECT dept_no, job_nm, SUM(salary) 급여합계
FROM dept
GROUP BY GROUPING SETS (dept_no, job_nm)
ORDER BY dept_no;

-- GROUPING ()함수 : 결과가 1이면 그룹핑 됨 0이면 아님
SELECT GROUPING(dept_no), 
       GROUPING(job_nm), 
       dept_no,
       job_nm,
       SUM(salary) 급여합계
FROM dept
GROUP BY ROLLUP (dept_no, job_nm)
ORDER BY dept_no; 

-- NULL을 소계, 총계로 변경하기
SELECT 
       CASE GROUPING(dept_no) WHEN 1 THEN '총계'
            ELSE dept_no
       END dept_no, 
       SUM(salary) 급여합계
FROM dept
GROUP BY ROLLUP (dept_no, job_nm)
ORDER BY dept_no; 




























