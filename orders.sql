-- order 주문 테이블 (주문번호, 고객번호, 도서번호, 판매가격, 주문일)
CREATE TABLE orders (
    orderid     NUMBER(3) PRIMARY KEY,
    custid      NUMBER NOT NULL,
    bookid      NUMBER NOT NULL,
    saleprice   NUMBER(7) NOT NULL,
    orderdate   DATE NOT NULL,
    -- 외래키 제약 조건 --
    CONSTRAINT fk_customer FOREIGN KEY (custid)
    REFERENCES customer(custid),
    CONSTRAINT fk_book FOREIGN KEY (bookid)
    REFERENCES book(bookid)
);

-- orders 자료삽입
INSERT INTO orders VALUES (1, 1, 1, 6000, TO_DATE('2018-07-01'));
INSERT INTO orders VALUES (2, 1, 3, 21000, TO_DATE('2018-07-03'));
INSERT INTO orders VALUES (3, 2, 5, 8000, TO_DATE('2018-07-03'));
INSERT INTO orders VALUES (4, 3, 6, 6000, TO_DATE('2018-07-04'));
INSERT INTO orders VALUES (5, 4, 7, 20000, TO_DATE('2018-07-05'));
INSERT INTO orders VALUES (6, 1, 2, 12000, TO_DATE('2018-07-07'));
INSERT INTO orders VALUES (7, 4, 8, 13000, TO_DATE('2018-07-07'));
INSERT INTO orders VALUES (8, 3, 10, 12000, TO_DATE('2018-07-08'));
INSERT INTO orders VALUES (9, 2, 10, 7000, TO_DATE('2018-07-09'));
INSERT INTO orders VALUES (10, 3, 8, 13000, TO_DATE('2018-07-10'));

SELECT * FROM orders;

-- 서점의 도서 판매 건수를 구하시오 (총 판매)
SELECT COUNT(*) 총판매건수 
FROM orders;

-- 고객이 주문한 도서의 총 판매액을 구하시오
SELECT 
    SUM(saleprice) 총판매액
FROM orders;

-- 2번 고객의 주문 내역을 검색하시오
SELECT * 
FROM orders
WHERE custid = 2;

-- 2018.7.7일에 주문한 내역을 검색하시오
SELECT * 
FROM orders
WHERE orderdate = '2018/07/07'; --'2018-07-07'도 가능

-- 고객별로 주문한 도서의 총 판매액을 구하시오 (GROUP BY절 custid 이용)
SELECT custid, SUM(saleprice) 총판매액
FROM orders
GROUP BY custid;

-- 고객별로 주문한 도서의 총 판매액을 구하시오 (단 가격이 8000원 이상인 도서)
-- WHERE 사용 
SELECT custid, SUM(saleprice) 총판매액
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
ORDER BY custid;

-- 고객별로 주문한 도서의 총 판매건수을 구하시오.
SELECT custid, 
       SUM(saleprice) 총판매액,
       COUNT(*) 판매건수 -- COUNT(orderid)
FROM orders
GROUP BY custid;

-- HAVING절 - GROUP BY로 질의한 결과에서 제한을 두는 조건을 가지는 것 
-- 고객별로 주문한 도서의 총 판매건수을 구하시오 (단, 판매건수가 3권 이상 구매 고객)
SELECT custid, 
       SUM(saleprice) 총판매액,
       COUNT(*) 판매건수 -- COUNT(orderid)
FROM orders
GROUP BY custid -- 롤업 큐브 함수 소계 -- 그룹바이에서 더 제약조건이 들어가려면 HAVING 
HAVING COUNT(*) >= 3;











