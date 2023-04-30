-- view ����� CREATE VIEW vw_customer AS ~
-- �ּҿ� '���ѹα�'�� ���� ������ �� �����
CREATE VIEW vw_customer
AS SELECT *
    FROM customer 
    WHERE address LIKE '%���ѹα�%';
    
SELECT * FROM vw_customer;

--�� ����
DROP VIEW vw_coustomer;


SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- ���� �̸��� �ֹ��� ������ �̸��� ������ �˻��Ͻÿ�. (JOIN)
-- ���θ���
CREATE VIEW vw_book_orders AS
SELECT cs.name, bk.bookname, od.saleprice
FROM customer cs, book bk, orders od
WHERE cs.custid = od.custid
AND bk.bookid = od.bookid;

SELECT * FROM vw_book_orders;

-- ���� �ֹ� ������ �� �Ǹ� ������ ���Ͻÿ�. (�����Լ�)
-- �ֹ��Ѿ��� 30000�� �̻��� �ڷḦ �˻��Ͻÿ�.
-- COUNT 
SELECT name, SUM(saleprice) sum, COUNT(*) count -- 4�� 
FROM vw_book_orders  -- 1�� 
GROUP BY name  -- 2��
HAVING SUM(saleprice) >= 30000 --3��
-- HAVING SUM >= 30000 ; -- ���� �� �ֳĸ�... 3�� ���� 4���̹Ƿ� ��Ī ����� �� ���� / HAVING�� ���� ������ SELECT �����̹Ƿ� ��Ī ��� �Ұ���
ORDER BY sum DESC;  -- ORDER BY ���� ������ SELECT �����̹Ƿ� ��Ī ��� ����

/* �������
    1. FROM
    2. WHERE
    3. GROUP BY
    4. SELECT
    5. ORDER BY
*/ -- SQL�� ������ �� �ƴ϶� �������� ��� ������ ���� 


-- ���� �ֹ� ������ �� �Ǹ� ������ ���Ͻÿ�. (�����Լ�)

SELECT name, SUM(saleprice)
FROM vw_book_orders
GROUP BY name;




