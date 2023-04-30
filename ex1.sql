-- ���̺����
CREATE TABLE exl(
    column1 CHAR(10), -- �������� 10BYTE ��Ī�� �༭ alias
    column2 VARCHAR2(10) -- �������� 10BYTE
);

-- ���̺� ����
INSERT INTO exl(column1, column2) VALUES ('abc','abc'); 
INSERT INTO exl(column1, column2) VALUES ('���','���');

-- ������ �˻� LENGTH ���ڱ��� / ��Ī alias ��� �տ� AS�� ���� (������ ����)
SELECT column1, LENGTH(column1) as len1, LENGTHB (column1) as col1_bytes,
       column2, LENGTH(column2) as len2, LENGTHB (column2) as col2_bytes
from exl;