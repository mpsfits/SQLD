-- bookmall �����ͺ��̽� ����
-- book(����) ���̺� ����
CREATE TABLE book (
    bookid NUMBER PRIMARY KEY,          --å���̵� �⺻Ű
    bookname VARCHAR2(20) NOT NULL,     --å�̸�
    publisher VARCHAR2(40) NOT NULL,    --���ǻ�
    price NUMBER NOT NULL               --å���� 
);

-- book �ڷ� ����
INSERT INTO book VALUES (1, '�౸�� ����', '�½�����', 7000);
INSERT INTO book VALUES (2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO book VALUES (3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO book VALUES (4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO book VALUES (5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO book VALUES (6, '����� ����', '�½�����', 6000);
INSERT INTO book VALUES (7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO book VALUES (8, '�߱��� ��Ź��', '�̻�̵��', 20000);
INSERT INTO book VALUES (9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO book VALUES (10, 'Olympic Champions', 'Pearson', 13000);
SELECT * FROM book;

COMMIT; -- Ŀ���ؾ� �ٸ� ���� ���α׷��� �����

-- ��� ������ �̸��� ������ �˻��Ͻÿ�
SELECT bookname, price FROM book;

-- ���� ���̺��� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�
SELECT DISTINCT publisher FROM book; -- DISTINCT (publisher) dis tinct ��, ����, ������, ������,

-- ������ 20000�� �̸��� ������ �˻��Ͻÿ�
SELECT * FROM book
WHERE price < 20000;

-- ������ 10,000�� �̻��̰� 20,000�� ������ ������ �˻��Ͻÿ�
-- WHERE �÷��� �ε�ȣ AND 
SELECT * FROM book
WHERE price >= 10000 AND price <= 20000;

-- WHERE �÷��� BETWEEN �� AND ��
SELECT * FROM book
WHERE price BETWEEN 10000 AND 20000;

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�
-- WHERE �÷��̸� = �Ӽ�1 or �÷��̸� = �Ӽ�2
-- WHERE �÷��̸� (IN '�Ӽ�1', �Ӽ�2) --IN �Լ� (�Ǵ� ��� ��� ����)
SELECT * FROM book
WHERE publisher = '�½�����' OR publisher = '���ѹ̵��';

SELECT * FROM book
WHERE publisher IN( '�½�����', '���ѹ̵��');

-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�
SELECT publisher, bookname FROM book
WHERE bookname = '�౸�� ����';

-- LIKE�� �����̸��� ���Ե� �� �ַ� ���� ���
SELECT publisher, bookname FROM book
WHERE bookname LIKE '�౸�� ����';

-- �����̸��� '�౸�� ���Ե� ���ǻ�� å�̸��� �˻��Ͻÿ�
SELECT publisher, bookname FROM book
WHERE bookname LIKE '%�౸%'; -- '%�౸%' �� �ڷ� ���ڿ��� ���ԵǾ�����...

-- �౸�� ���� ���� �� ������ 20000�� �̻��� ������ ã���ÿ�
SELECT * FROM book
WHERE bookname LIKE '%�౸%' AND price >= 20000;

-- ���� ������ ���� ������ �����Ͻÿ� ORDER BY �÷��� DESC / ���� �� ORDER BY �÷��� ASC : ASC ���� ����
SELECT * FROM book
ORDER BY price DESC; 

-- ������ ������ ���ǻ縦 ������������ �����Ͻÿ�
SELECT * FROM book
ORDER BY price DESC, publisher ASC; 











