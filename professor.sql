-- 교수 테이블 (릴레이션)
CREATE TABLE professor(
    pnumber NUMBER(3)   PRIMARY KEY,
    pname   VARCHAR2(20)  NOT NULL,
    major   VARCHAR2(30)  NOT NULL
);

-- 자료설명
DESC professor;

-- 교수 자료 삽입
INSERT INTO professor(pnumber, pname, major) VALUES (301, '오용철', '데이터베이스');
INSERT INTO professor(pnumber, pname, major) VALUES (401, '송미영', '화학 개론');
INSERT INTO professor(pnumber, pname, major) VALUES (501, '박은종', '전기공학 개론');
INSERT INTO professor(pnumber, pname, major) VALUES (302, '남우창', '데이터베이스');
INSERT INTO professor(pnumber, pname, major) VALUES (601, '김운아', '전기공학 개론');

-- 교수 자료 삭제
DELETE FROM professor WHERE major = '데이터베이트'; 

-- 교수 자료 검색
SELECT pnumber, pname, major FROM professor;

-- '송미영' 교수의 전공을 검색하시오 (WHERE) (컬럼명 : 전공)
SELECT pname 교수, major as 전공 FROM professor WHERE pnumber =401;

-- 문자열 검색 (%연산자) 
-- 전공이 '화학 개론'인 자료를 검색하시오
SELECT * FROM professor WHERE major ='화학 개론'; 

-- 전공에 '개론'인 포함된 자료를 검색하시오
SELECT * FROM professor WHERE major LIKE '%개론%'; 

-- 전공 과목을 모두 검색하시오
-- 중복을 포함하지 않은 키워드 (DISTINCT)
SELECT DISTINCT major FROM professor;

-- OR 연산 사용, IN(값,값)함수 사용
-- 전공이 '데이터베이스' 또는(혹은) '화학개론'인 자료를 검색하시오
SELECT * FROM professor
WHERE major ='데이터베이스' OR major = '화학개론';

SELECT * FROM professor
WHERE major IN('데이터베이스', '화학개론');

SELECT * FROM professor
WHERE major NOT IN('데이터베이스', '화학개론'); -- 포함되지 않는 것 

-- 자료 수정 (UPDATE 테이블명 SET 컬럼명 ='~' WHERE 기본키 = ; 
UPDATE professor SET major = '화학개론' WHERE pnumber =401;
UPDATE professor SET major = '전기공학개론' WHERE pnumber =501;
UPDATE professor SET major = '전기공학개론' WHERE pnumber =601;

-- 자료 삭제
DELETE FROM professor 
WHERE pnumber = 301; -- 참조 무결성에 위배 자식이 참조 되있는 자료는 부모 자료가 삭제 안됨 (자식이 딸린 부모는 죽으면 안됨)  

-- 커밋 완료 해야 저장됨 (작업단위가 완료시 저장, 트렌젝션)
COMMIT;
