-- 부서와 사원 tabel 2
CREATE TABLE dept(
    deptno VARCHAR2(4) PRIMARY KEY,
    deptname VARCHAR2(20)
);

CREATE TABLE emp(
    empno NUMBER(10),
    ename VARCHAR2(20),
    sal   NUMBER(10,2) default 0,
    createdate DATE DEFAULT SYSDATE, -- date만 있어도 됨 
    deptno VARCHAR2(4) NOT NULL,
    CONSTRAINT emppk PRIMARY KEY(empno), --emppk 이름만 달리하면됨 앞 전의 내용과 겹쳐서 테이블 생성이 안됨 --emp 기본키
    CONSTRAINT empfk FOREIGN KEY(deptno) --외래키
    REFERENCES dept(deptno) ON DELETE CASCADE
);

-- 자료 삽입
INSERT INTO dept VALUES ('1000', '인사팀');
INSERT INTO dept VALUES ('1001', '총무팀');
INSERT INTO dept VALUES ('1002', '마케팅팀');
INSERT INTO dept VALUES ('1003', 'IT팀');


INSERT INTO emp VALUES (100, '임베스트', 2000000, SYSDATE, '1000');
INSERT INTO emp VALUES (101, '을지문덕', 3000000, SYSDATE, '1001');
INSERT INTO emp VALUES (102, '연개소문', 3000000, SYSDATE, '1002');
INSERT INTO emp VALUES (103, '세종대왕', 5000000, SYSDATE, '1000');
INSERT INTO emp VALUES (104, '신사임당', 3000000, SYSDATE, '1002');
INSERT INTO emp VALUES (106, '정조대왕', 4000000, SYSDATE, '1002', '남자');


-- 컬럼명 변경 : Commit 안해도 됨 insert delte 경우는 커밋
-- DML Commit 명령어를 통해 Transaction을 종료해야 해당 변경 사항이 테이블에 반영된다.
-- https://velog.io/@alicesykim95/DB-DDL-DML-DCL-TCL%EC%9D%B4%EB%9E%80
-- 데이터 정의 언어(DDL: Data Definition Language) : DDL은 명령어를 입력하는 순간 작업이 즉시 반영(Auto Commit)되기 때문에 사용할 때 주의해야 한다. CREATE / ALTER 수정 / DROP 삭제 / RENAME /TRUNCATE 테이블을 초기화하는 역할  
-- 데이터 조작 언어(DML:Data Manipulation Language) :
-- 데이터 제어 언어(DCL:Date Control Language) :
-- 트랜잭션 제어 언어(TCL: Transaction Control Language) : 

ALTER TABLE emp RENAME COLUMN sal to salary;


-- 자료검색
select * from dept;
select * from emp;

-- 부서별 급여 평균 구하기
-- 부서번호, 부서명, 급여, 급여평균

select 
    deptno 부서번호,
    AVG(sal) 급여평균
from emp
GROUP BY deptno;


-- 부서 자료 삭제
DELETE FROM dept WHERE deptno ='1001';

DROP TABLE dept;
DROP TABLE emp;

DESC emp;

-- 컬럼명 변경
ALTER TABLE emp
    RENAME COLUMN ename TO newname;

DROP TABLE emp;
DROP TABLE emp CASCADE CONSTRAINTS;
DESC emp;

-- 자료 변경
UPDATE dept SET deptname ='영업팀'
WHERE deptno = '1002';

-- 오라클 방식 JOIN : 부서와 사원의 모든 정보를 검색하시오.
SELECT *
FROM dept, emp
WHERE dept.deptno = emp.deptno;

-- 오라클 방식 JOIN : 부서의 이름과 부서에 소속된 사원의 모든 정보를 검색하시오.
SELECT dept.deptname, emp.ename
FROM dept, emp
WHERE dept.deptno = emp.deptno;

-- 사원의 이름과 사원이 없는 부서이름을 검색하시오!
SELECT *
FROM dept, emp
WHERE dept.deptno = emp.deptno(+);

-- 부서의 이름과 부서의 소속되지 않은 사원의 이름도 검색하시오!
SELECT dept.deptname, emp.ename -- 테이블 꼭 지칭 안해도 나옴
FROM dept, emp
WHERE dept.deptno = emp.deptno(+)
ORDER BY dept.deptno;

-- INNER JOIN ON 방식으로 검색
-- 부서의 이름과 부서의 소속된 사원의 이름을 검색하시오.
SELECT dept.deptname, emp.ename
FROM dept INNER JOIN emp
    ON dept.deptno = emp.deptno
    ORDER BY dept.deptno;

-- LEFT JOIN ON 방식으로 검색
-- 부서의 이름과 부서에 소속된 사원의 이름을 검색하시오
SELECT dept.deptname, emp.ename
FROM dept LEFT OUTER JOIN emp  --컬럼과 테이블을 불러 놓고
    ON dept.deptno = emp.deptno -- 조건에 맞는 조인을 한다. 
    ORDER BY dept.deptno;










