-- ���̺����
CREATE TABLE exl(
    column1 CHAR(10), -- �������� 10BYTE ��Ī�� �༭ alias
    column2 VARCHAR2(10) -- �������� 10BYTE
);

-- ���̺� ����
INSERT INTO exl(column1, column2) VALUES ('abc','abc'); 
INSERT INTO exl(column1, column2) VALUES ('���','���');

-- ������ �˻� LENGTH ���ڱ��� / ��Ī alias ��� �տ� AS�� ���� (������ ����)
SELECT column1, LENGTH(column1) len1
       column2, LENGTH(column2) len2
from exl;