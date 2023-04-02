--member 테이블 생성
CREATE TABLE member(
  name varchar2(20),
  age number(3),
  phone varchar2(15)
);
-- 자료 추가(INSERT 테이블 이름 INTO VALUES (값))
INSERT INTO member VALUES ('홍길동', 31, '010-1234-5678');
INSERT INTO member VALUES ('이젠', 17, '010-1234-6789');

-- 자료 검색 (SELECT 속성이름 또는 열이름 FROM 테이블이름)
SELECT * FROM member;
SELECT name, phone FROM member;

-- 특정한 자료 검색 (Where 조건절)
SELECT * FROM member WHERE name ='홍길동';

-- 자료수정 (UPDATE 테이블 SET 속성변경)
UPDATE member SET name ='홍길순' WHERE name ='홍길동';

SELECT * FROM member;

-- 자료 삭제 (DELETE FROM 테이블 이름 WHERE절)
DELETE FROM member WHERE name ='홍길순';

ROLLBACK;

COMMIT;

--drop 테이블 삭제
DROP TABLE member;