/*
-- SUBQUARY �μ����� ��ø�� ����
    1. WHERE �� ����ϴ� �μ�����
    2. FROM �� �ζ��� ���� ��
    3. SELECT ���� ��� - ��Į�� �μ�����    
*/

-- ���� ��� ������ �̸��� �˻��Ͻÿ�.
SELECT MAX(price) FROM book;
-- SELECT bookname, MAX(price) FROM book; ������! -> �������� 

SELECT bookname 
FROM BOOK
WHERE price = 35000;m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

-- ������ ��ø���� ('=' '>' '<' �����ڿ� �Բ� ���)
SELECT bookname, price
FROM BOOK
WHERE price = (SELECT MAX(price) FROM book);

-- �迬�� ���� �ֹ������� �˻��Ͻÿ�.
SELECT custid
FROM customer
WHERE name = '�迬��';

SELECT *
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '�迬��');
            -- = �����ุ ����!!

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�!
SELECT custid
FROM orders
GROUP BY custid
ORDER BY custid;
-- ������ in �Լ�

SELECT name
FROM customer
WHERE custid IN (SELECT custid
                FROM orders);

-- �������� ���� : oracle join
SELECT cs.name
FROM customer cs, orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;
                
-- INNER JOIN ON
SELECT cs.name
FROM customer cs INNER JOIN orders od
    ON cs.custid = od.custid
    GROUP BY cs.name;

-- �̻�̵��� ������ ������ ������ ���� �̸��� �˻��Ͻÿ�.
SELECT bookname
FROM book
WHERE publisher = '�̻�̵��';

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
                                        WHERE publisher = '�̻�̵��'));
                                        
                                        
--JOIN
SELECT cs.name
FROM customer cs, book bk, orders od
WHERE cs.custid = od.custid
    AND bk.bookid = od.bookid
    AND bk.publisher = '�̻�̵��'
GROUP BY cs.name;

-- FROM�� �������� : 
-- ������ ���� �Ǹž��� �˻��Ͻÿ�. (���̸�, �Ǹž�)
SELECT cs.name, cs.custid, SUM(saleprice) total
FROM (SELECT custid, name 
      FROM customer) cs, 
      orders od --selct ���
WHERE cs.custid = od.custid
GROUP BY cs.name, cs.custid;


-- ������ ���� �Ǹž��� ���Ͻÿ�(����ȣ�� 2������ ��)
SELECT cs.name, cs.custid, SUM(saleprice) total
FROM (SELECT custid, name 
      FROM customer
      WHERE custid <=2) cs, 
      orders od --selct ���
WHERE cs.custid = od.custid
GROUP BY cs.name, cs.custid;

-- SELECT ���� �ִ� �μ����� (��Į�� �μ�����)
-- ������ ���� �Ǹž��� �˻��Ͻÿ�. (���̸�, �Ǹž�)
-- �������̳� ���Ͽ��� ��ȯ : �������̳� ���߿��� ��ȯ���� �ʴ´�.
SELECT cs.name, SUM(saleprice) total
FROM customer cs, orders od  -- customer
WHERE cs.custid = od.custid
GROUP BY cs.name;

SELECT (SELECT name 
        FROM customer cs
        WHERE cs.custid = od.custid) name, SUM(saleprice) total  -- ORDERS �� �߽�
FROM orders od
GROUP BY od.custid;


-- WHERE EXISTS ���� : WHERE �������� ��(TRUE)�� ���� ��ȯ  -�������� �� ������ �������ϱ�
SELECT name
FROM customer cs
WHERE EXISTS(SELECT custid 
            FROM orders od
            WHERE cs.custid= od.custid);


-- ���� ������ ��� ���� ���ݺ��� ū �ڷḦ �˻��Ͻÿ�
SELECT bookname, price, publisher
FROM book;

SELECT AVG(price)
FROM book;

SELECT bookname, price, publisher
FROM book
WHERE price > (SELECT AVG(price) FROM book);


-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ �˻��Ͻÿ�
-- ���̺� �̸��� ��Ī : Ʃ�� ����
SELECT b1.bookname, b1.price, b1.publisher
FROM book b1
WHERE b1.price > (SELECT AVG(price) FROM book b2
                  WHERE b1.publisher = b2.publisher);
                  
-- self join
SELECT b1.bookname, b1.price, b1.publisher
FROM book b1, book b2
WHERE b1.price > (SELECT (AVG(price) FROM book2 
                WHERE b1.publisher = b2.publisher);

                  
                  
                  



