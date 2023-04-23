-- NULL 함수 - NVL (인수1, 인수2) : 인수1이 있으면 인수 1, 인수1이 없고 NULL이면 인수2로 출력
-- 숫자컬럼에서는 NVL (인수1, 0) : 인수1 NULL 아니면 인수1 출력, 인수1이 NULL이면 0으로 출력
-- 문자컬럼에서는 NVL (인수1, '없음') : 인수1 NULL 아니면 인수1, 인수1이 NULL이면 '없음'으로 출력

CREATE TABLE test(
    id VARCHAR2(3), -- 칼럼명 자료형 / 한글 한글자
    cnt NUMBER(2) --숫자십의 자리
);

-- 자료 삽입
INSERT INTO test VALUES ('가', 5);
INSERT INTO test VALUES ('나', NULL); -- 회원가입시 나이 입력 안하는 경우 또는 '' -- 널은 계산에 참여 안한다!
INSERT INTO test VALUES ('다', 5);
INSERT INTO test VALUES ('라', NULL);
INSERT INTO test VALUES ('마', 10);

SELECT * FROM test;

SELECT id, cnt, NVL(cnt,0)
FROM test;


SELECT 
    COUNT(*) 전체갯수, 
    COUNT(cnt) cnt칼럼_갯수, -- 널(NULL)은 계산에 참여 안한다!
    SUM(cnt) cnt칼럼_합계
FROM test;

SELECT 
    COUNT(*) 전체갯수, 
    COUNT(NVL(cnt,0)) cnt칼럼_갯수, -- 널(NULL)이 있으면 0으로 고친다!
    SUM(cnt) cnt칼럼_합계
FROM test;

-- 다음 중 결과값이 다른 것으로 고르세요
SELECT COUNT(NVL(cnt,0)) FROM test; -- 결과값 5
SELECT SUM(NVL(cnt,0))/4 FROM test; -- 결과값 5
SELECT AVG(NVL(cnt,0)) FROM test; --20/4
SELECT MIN(NVL(cnt,5)) FROM test; --5

-- DROP TABLE test; 테이블 삭제

-- emp 테이블에 성별 컬럼 추가 : 남자 또는 여자 이므로 6바이트 까지 가능 : 문자 이므로
ALTER TABLE emp ADD gender VARCHAR2(6);
DESC emp;


-- 성별이 NULL인 경우 '남자' 와 '여자'를 입력하시오 (UPDATE 구문 쓰기)
UPDATE emp 
SET gender ='남자'
WHERE empno in (100, 101, 102, 103);  -- DESC emp에서 empno가 숫자인지 문자인지 확인

UPDATE emp 
SET gender ='여자'
WHERE empno in (104,105);

-- DECODE(컬럼, 조건, 참인값, 거짓인값) 조건 처리에 대한 결과를 값을 알려주는 반환해주는 함수 DECODE #해독하다 #
-- 사원의 성별이 '남자'이면 'M'으로 표기하고, '여자'이면 'F'로 표기
SELECT ename, 
       salary, 
       DECODE(gender, '남자', 'M', 'F') gender
FROM emp;

-- CASE WHEN ---END 구문 : DECODE 안되는 것을 하면 됨
SELECT ename, 
       salary, 
       CASE  
            WHEN gender = '남자' THEN 'M'
            --WHEN gender = '남자' THEN 'M
            ELSE 'F' -- 생략해도 되나 프로그래밍에서 이렇게 써주는 경우가 많다!
       END gender
FROM emp;

-- 조건이 2개 이상인 경우 이렇게 써 준다!
SELECT ename, 
       salary, 
       CASE  
            WHEN gender = '남자' THEN 'M'
            WHEN gender = '여자' THEN 'F'
       END gender
FROM emp;

-- 급여가 500만원 이상이면 '과장', 300만원 이상이면 '대리', 300만원 미만이며, '사원'으로 표기
-- 범위가 있을 때는 DECODE 안되고 CASE WHEN END를 써야 함
SELECT ename, 
       salary, 
       CASE  
           WHEN salary >= 5000000 THEN '과장' --WHEN THEN if 구문
           WHEN salary >= 3000000 THEN '대리'
           ELSE '사원'
       END 직급
FROM emp;


-- DECODE() --정해진 값은 가능하나, 범위 있는 값은 부정확 함 ex)엘리베이터 1층 누르면 -> 1층 : 158쪽
SELECT ename, 
       salary, 
       DECODE(salary, 5000000, '과장', 3000000, '대리', '사원') 직급  
FROM emp;
-- 320만원이 사원으로 나와서 부정확함

SELECT *
FROM emp
WHERE ename LIKE '__대왕'; -- 언더스코어 2개를 써야 찾아줌 __

SELECT *
FROM emp
WHERE ename LIKE '_관순';















