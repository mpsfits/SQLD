--CASE WHEN 
CREATE TABLE mytest(
    sclass VARCHAR2(1), --�б�
    sname VARCHAR2(6) --�л��̸�
);
INSERT INTO mytest VALUES ('A', '����');
INSERT INTO mytest VALUES ('A', '����');
INSERT INTO mytest VALUES ('A', '����');
INSERT INTO mytest VALUES ('B', '����');
INSERT INTO mytest VALUES ('B', '����');
INSERT INTO mytest VALUES ('C', '����');
INSERT INTO mytest VALUES ('C', '����');

SELECT * FROM mytest;

-- �б޺� �л��� �˻�
SELECT sclass, COUNT (*) 
FROM mytest
GROUP BY ;

-- �л� �̸��� '����'�̸� 1��, '����'�̸� 2��, �������� 3������ �� �����Ͽ� ����ϱ�
SELECT sname,

    CASE WHEN sname = '����' THEN '1��'
         WHEN sname = '����' THEN '2��'
         ELSE '3��'
    END AS �б� --end ���� �÷��̸�

FROM mytest;


-- DECODE 
SELECT sname,
       DECODE(sname, '����', '1��', '����', '2��', '3��') as �б�

FROM mytest;

-- �б��� 'A'�̸� 'B', 'C'�� 1�� ī��Ʈ�Ͽ� ���
SELECT 
    COUNT (CASE WHEN sclass='A' THEN 1
    END) as A,
    COUNT (CASE WHEN sclass='B' THEN 1
    END) as B,
    COUNT (CASE WHEN sclass='C' THEN 1
    END) as C
FROM mytest;


SELECT 
       COUNT(DECODE(sclass, 'A', 1)) as A,
       COUNT(DECODE(sclass, 'B', 1)) as B,
       COUNT(DECODE(sclass, 'C', 1)) as C
FROM mytest;


