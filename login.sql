-- 기본키 제약 조건 --constraint 제약조건
CREATE TABLE login(
    id VARCHAR2(10),
    passwd VARCHAR2(10) NOT NULL,
    PRIMARY KEY(id)
);

-- 자료 삽입
INSERT INTO login VALUES ('sky2023', '1234abc');
INSERT INTO login VALUES ('sky2023', '1234789'); -- 유니크 낫널 기본키에 제약 조건인 무결성 위배 / 개체무결성 (cf. 관계에서 무결성은 참조무결성)
INSERT INTO login VALUES ('moon', '12345678', '가나다라마바사'); -- 3바이트 /-> 30으로 바꿈
INSERT INTO login (id, passwd, name, create_date)
VALUES ('moon4', 'qwer', 'abc', SYSDATE); --널이라서
INSERT INTO login (id, passwd, name, create_date)
VALUES ('moon5', 'abc', 'abc', SYSDATE); --널이라서

-- 자료 검색
SELECT * FROM login; 
SELECT id, name FROM login;


-- 자료 수정 (UPDATE 테이블 이름 SET 컬럼속성 WHERE 절)
-- 이름이 'abc'인 자료를 'def'로 변경하기
UPDATE login 
SET name = 'def'
WHERE id = 'moon3';

-- 자료삭제 (DELET FROM 테이블이름 WHERE절) 기본키를 특정하면 
DELETE from login; -- 복구 가능 커밋 을 하기전 가능 저장하면서 커밋이 됨 : delete 후 ROLLBACK; 

ROLLBACK;


-- 정렬하기 (ASC, DESC) 내림차순인 경우 NULL 이 가장 상위로 감
-- 처리순서 : 1. FROM절 2. WHERE절 3. SELECT절 4. ORDER BY절 (가장 마지막)
SELECT * 
FROM login 
ORDER BY create_date; -- ASC 디폴트

SELECT * FROM login ORDER BY create_date DESC; -- 내림차순 시 NULL 높음

-- 특정 자료 검색 (WHERE절)
-- id가 'moon'인 자료 검색 보통 기본키로 찾음 : 명령어 순서 중요 테이블을 찾아 FROM -> WHERE 조건 찾기 -> SELECT cf) 정렬 마지막 

SELECT * 
from login 
WHERE id = 'moon'; -- 보통 기본키로 찾음


-- 칼럼 추가 (속성이 네임 추가) : 드랍으로 삭제하는 경우도 할 수 있고, 
ALTER TABLE login ADD name VARCHAR2(20);
ALTER TABLE login ADD create_date DATE;

-- 컬럼 변경
ALTER TABLE login MODIFY name VARCHAR2(30);

-- 테이블의 구조보기
DESC login;


