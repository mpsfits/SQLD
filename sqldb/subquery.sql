/*
-- SUBQUARY 부속질의 중첩된 쿼리
    1. WHERE 절 사용하는 부속질의
    2. FROM 절 인라인 뷰라고 함
    3. SELECT 절에 사용 - 스칼라 부속질의    
*/

-- 가장 비싼 도서의 이름을 검색하시오.
SELECT MAX(price) FROM book;
-- SELECT bookname, MAX(price) FROM book; 오류남! -> 서브쿼리 

SELECT bookname 
FROM BOOK
WHERE price = 35000;m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

-- 단일행 중첩쿼리 ('=' '>' '<' 연산자와 함께 사용)
SELECT bookname, price
FROM BOOK
WHERE price = (SELECT MAX(price) FROM book);

-- 김연아 고객의 주문내역을 검색하시오.
SELECT custid
FROM customer
WHERE name = '김연아';

SELECT *
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '김연아');
            -- = 단일행만 가능!!

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오!
SELECT custid
FROM orders
GROUP BY custid
ORDER BY custid;
-- 여러명 in 함수

SELECT name
FROM customer
WHERE custid IN (SELECT custid
                FROM orders);

-- 조인으로 가능 : oracle join
SELECT cs.name
FROM customer cs, orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;
                
-- INNER JOIN ON
SELECT cs.name
FROM customer cs INNER JOIN orders od
    ON cs.custid = od.custid
    GROUP BY cs.name;

-- 이상미디어에서 출판한 도서를 구매한 고객의 이름을 검색하시오.
SELECT bookname
FROM book
WHERE publisher = '이상미디어';

SELECT custid
FROM orders
WHERE bookid IN (7,8);

SELECT name
FROM customer
WHERE custid IN (3,4);

SELECT name
FROM customer
WHERE custid IN (SELECT custid
                    FROM orders
                    WHERE bookid IN (SELECT bookname
                                        FROM book
                                        WHERE publisher = '이상미디어'));
                                        
                                        
--JOIN
SELECT cs.name
FROM customer cs, book bk, orders od
WHERE cs.custid = od.custid
    AND bk.bookid = od.bookid
    AND bk.publisher = '이상미디어'
GROUP BY cs.name;

-- FROM절 서브쿼리 : 
-- 서점의 고객별 판매액을 검색하시오. (고객이름, 판매액)
SELECT cs.name, cs.custid, SUM(saleprice) total
FROM (SELECT custid, name 
      FROM customer) cs, 
      orders od --selct 사용
WHERE cs.custid = od.custid
GROUP BY cs.name, cs.custid;


-- 서점의 고객별 판매액을 구하시오(고객번호가 2이하인 고객)
SELECT cs.name, cs.custid, SUM(saleprice) total
FROM (SELECT custid, name 
      FROM customer
      WHERE custid <=2) cs, 
      orders od --selct 사용
WHERE cs.custid = od.custid
GROUP BY cs.name, cs.custid;

-- SELECT 절에 있는 부속질의 (스칼러 부속질의)
-- 서점의 고객별 판매액을 검색하시오. (고객이름, 판매액)
-- 단일행이나 단일열이 반환 : 다중행이나 다중열은 반환되지 않는다.
SELECT cs.name, SUM(saleprice) total
FROM customer cs, orders od  -- customer
WHERE cs.custid = od.custid
GROUP BY cs.name;

SELECT (SELECT name 
        FROM customer cs
        WHERE cs.custid = od.custid) name, SUM(saleprice) total  -- ORDERS 쪽 중심
FROM orders od
GROUP BY od.custid;


-- WHERE EXISTS 구문 : WHERE 조건절이 참(TRUE)인 값을 변환  -조건절이 참 거짓을 가져오니까
SELECT name
FROM customer cs
WHERE EXISTS(SELECT custid 
            FROM orders od
            WHERE cs.custid= od.custid);


-- 도서 가격이 평균 도서 가격보다 큰 자료를 검색하시오
SELECT bookname, price, publisher
FROM book;

SELECT AVG(price)
FROM book;

SELECT bookname, price, publisher
FROM book
WHERE price > (SELECT AVG(price) FROM book);


-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 검색하시오
-- 테이블 이름의 별칭 : 튜플 변수
SELECT b1.bookname, b1.price, b1.publisher
FROM book b1
WHERE b1.price > (SELECT AVG(price) FROM book b2
                  WHERE b1.publisher = b2.publisher);
                  
-- self join
SELECT b1.bookname, b1.price, b1.publisher
FROM book b1, book b2
WHERE b1.price > (SELECT (AVG(price) FROM book2 
                WHERE b1.publisher = b2.publisher);

                  
                  
                  



