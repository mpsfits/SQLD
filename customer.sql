-- CUSTOMER 테이블 (고객번호, 이름, 주소, 전화번호)
CREATE TABLE customer (
    custid  NUMBER PRIMARY KEY,
    name    VARCHAR2(20) NOT NULL,
    address VARCHAR2(50),
    phone   VARCHAR2(15)

);

-- 고객 자료 삽입
INSERT INTO customer VALUES (1, '박지성', '영국 맨체스터', '000-5000-0001');
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO customer VALUES (3, '안산', '대한민국 광주광역시', '000-7000-0001');
INSERT INTO customer VALUES (4, '류현진', '미국 토론토', '');
INSERT INTO customer VALUES (5, '손흥민', '영국 토트넘', '000-8000-0001');

SELECT * FROM customer;

-- 전화번호가 없는 고객을 찾으시오
SELECT * FROM customer
WHERE phone is NULL;

-- 주소가 대한민국인 고객을 검색하시오 : LIKE 문자열 검색시 사용
SELECT * FROM customer
WHERE address LIKE '%대한민국%';  -- '대한민국%' 검색가능 

-- 고객을 이름순으로 정렬하시오 (오름차순)
SELECT * FROM customer
ORDER BY name ASC; -- ASC 생략 가능

-- 주소에 '영국'이 포함된 주소를 '프랑스'로 변경하여 검색하시오 (REPLACE)
SELECT custid,
       name,
       REPLACE(address, '영국', '프랑스') address,
       phone
FROM customer;












