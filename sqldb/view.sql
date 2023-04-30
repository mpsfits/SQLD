-- view 만들기 CREATE VIEW vw_customer AS ~
-- 주소에 '대한민국'인 고객의 구성된 뷰 만들기
CREATE VIEW vw_customer
AS SELECT *
    FROM customer 
    WHERE address LIKE '%대한민국%';
    
SELECT * FROM vw_customer;

--뷰 삭제
DROP VIEW vw_coustomer;


SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- 고객의 이름과 주문한 도서의 이름과 가격을 검색하시오. (JOIN)
-- 조인먼저
CREATE VIEW vw_book_orders AS
SELECT cs.name, bk.bookname, od.saleprice
FROM customer cs, book bk, orders od
WHERE cs.custid = od.custid
AND bk.bookid = od.bookid;

SELECT * FROM vw_book_orders;

-- 고객별 주문 도서의 총 판매 가격을 구하시오. (집계함수)
-- 주문총액이 30000원 이상인 자료를 검색하시오.
-- COUNT 
SELECT name, SUM(saleprice) sum, COUNT(*) count -- 4번 
FROM vw_book_orders  -- 1번 
GROUP BY name  -- 2번
HAVING SUM(saleprice) >= 30000 --3번
-- HAVING SUM >= 30000 ; -- 에러 남 왜냐면... 3번 다음 4번이므로 별칭 사용할 수 없음 / HAVING은 실행 순서상 SELECT 이전이므로 별칭 사용 불가함
ORDER BY sum DESC;  -- ORDER BY 실행 순서상 SELECT 다음이므로 별칭 사용 가능

/* 실행순서
    1. FROM
    2. WHERE
    3. GROUP BY
    4. SELECT
    5. ORDER BY
*/ -- SQL은 절차적 언어가 아니라서 비절차적 언어 비구조적 언어라서 


-- 고객별 주문 도서의 총 판매 가격을 구하시오. (집계함수)

SELECT name, SUM(saleprice)
FROM vw_book_orders
GROUP BY name;




