-- bookmall

SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- ���ѹα��� �����ϴ� ���� �̸�
-- �迬�� �Ȼ�
SELECT name
FROM customer
WHERE address LIKE '%���ѹα�%';

-- ������ �ֹ��� ���� �̸��� �˻��Ͻÿ� (JOIN)
-- �������� (EQUI JOIN) �⺻Ű�� �ܷ�Ű�� �����ϱ� 
--������ �迬�� �Ȼ� ������
SELECT DISTINCT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- ���ѹα����� �����ϴ� ���� �̸��� ������ �ֹ��� ��
-- UNION �ߺ� �������� ���� �� DISTINCT ����� ����
SELECT name
FROM customer
WHERE address LIKE '%���ѹα�%'
UNION  -- DISTINCT ����� ����
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;


SELECT name
FROM customer
WHERE address LIKE '%���ѹα�%'
UNION ALL -- �ߺ�����
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;


-- ������ �ֹ��� ���� �̸��� �˻��Ͻÿ� (SUBQUERY - ������ �ƴϴ�!)
-- ���������� SELECT ���� �ٽ� SELECT���� ����ϴ� SQL ���̴�. 
-- ������ �迬�� �Ȼ� ������
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- �������� (EQUI JOIN) 
-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid 
ORDER BY cus.name;

-- ������ ���� �ֹ��� ���� �̸��� �Ǹ� ������ �˻��Ͻÿ� : 3�� ���̺� ����
SELECT cus.name, bk.bookname, ord.saleprice
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid 
AND bk.bookid = ord.bookid 
AND cus.name = '������';
-- ORDER BY cus.name;

-- ǥ�� SQL���� �����ϴ� ��� : ���� ���� (INNER ~ JOIN ~ ON where�� �ش�Ǵ� ���� on)
-- ���������� �ٸ� ������� ���Ĵٵ� ����
-- ����SQL ����Ŭ ���� �ٸ� ���α׷������� ����� �� �ֵ��� INNER JOIN (���Ĵٵ� ����) 

SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;

-- ����Ŭ ���
-- WHERE ���� (+) ���
-- '�ֹ��� ���� ���� �����Ͽ�'(�ƿ������� ����) �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
-- ��� ���� ��µǴ� ���̺��� �ݴ��� ���̺�(+)��ȣ�� �ٿ��ش�. 
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid (+) -- ���� ������ ���� ������ �ݴ��� ���̺� (+)
ORDER BY cus.name;

-- å�� �Ȼ� ����� NULL�� ����

-- LEFT OUTER ~ JOIN : ���� ���ǿ� �������� �����Ͱ� �ƴϾ ����ϴ� ���
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;

-- ���� ����Ѱ��� �������� 

-- cross ����
-- �������̺�� �����̺��� ����
-- ī�׽þ� �� : ����� ���� �ٳ��� (book 10��, ���� 5�� =50)
SELECT * 
FROM book
CROSS JOIN customer;












