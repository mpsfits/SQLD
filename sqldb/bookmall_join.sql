-- bookmall

SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- 대한민국에 거주하는 고객의 이름
-- 김연아 안산
SELECT name
FROM customer
WHERE address LIKE '%대한민국%';

-- 도서를 주문한 고객의 이름을 검색하시오 (JOIN)
-- 동등조인 (EQUI JOIN) 기본키와 외래키로 조인하기 
--박지성 김연아 안산 류현진
SELECT DISTINCT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- 대한민국에서 거주하는 고객의 이름과 도서를 주문한 고객
-- UNION 중복 포함하지 않음 즉 DISTINCT 기능이 있음
SELECT name
FROM customer
WHERE address LIKE '%대한민국%'
UNION  -- DISTINCT 기능이 있음
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;


SELECT name
FROM customer
WHERE address LIKE '%대한민국%'
UNION ALL -- 중복포함
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;


-- 도서를 주문한 고객의 이름을 검색하시오 (SUBQUERY - 조인이 아니다!)
-- 서브쿼리는 SELECT 문에 다시 SELECT문을 사용하는 SQL 문이다. 
-- 박지성 김연아 안산 류현진
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- 동등조인 (EQUI JOIN) 
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid 
ORDER BY cus.name;

-- 박지성 고객의 주문한 도서 이름과 판매 가격을 검색하시오 : 3개 테이블 조인
SELECT cus.name, bk.bookname, ord.saleprice
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid 
AND bk.bookid = ord.bookid 
AND cus.name = '박지성';
-- ORDER BY cus.name;

-- 표준 SQL에서 권장하는 방식 : 내부 조인 (INNER ~ JOIN ~ ON where에 해당되는 것이 on)
-- 동등조인을 다른 방식으로 스탠다드 조인
-- 마이SQL 오라클 말고 다른 프로그램에서도 사용할 수 있도록 INNER JOIN (스탠다드 조인) 

SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;

-- 오라클 방식
-- WHERE 절에 (+) 사용
-- '주문이 없는 고객을 포함하여'(아웃터조인 차이) 이름과 고객이 주문한 도서의 판매가격을 검색하시오
-- 모든 행이 출력되는 테이블의 반대편 테이블에(+)기호를 붙여준다. 
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid (+) -- 내가 나오고 싶은 집합의 반대편 테이블에 (+)
ORDER BY cus.name;

-- 책을 안산 사람은 NULL로 나옴

-- LEFT OUTER ~ JOIN : 조인 조건에 충족되지 데이터가 아니어도 출력하는 방식
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;

-- 조인 비슷한것이 서브쿼리 

-- cross 조인
-- 도서테이블과 고객테이블을 조인
-- 카테시안 곱 : 경우의 수가 다나옴 (book 10권, 고객이 5명 =50)
SELECT * 
FROM book
CROSS JOIN customer;












