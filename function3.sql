-- NULL �Լ� - NVL (�μ�1, �μ�2) : �μ�1�� ������ �μ� 1, �μ�1�� ���� NULL�̸� �μ�2�� ���
-- �����÷������� NVL (�μ�1, 0) : �μ�1 NULL �ƴϸ� �μ�1 ���, �μ�1�� NULL�̸� 0���� ���
-- �����÷������� NVL (�μ�1, '����') : �μ�1 NULL �ƴϸ� �μ�1, �μ�1�� NULL�̸� '����'���� ���

CREATE TABLE test(
    id VARCHAR2(3), -- Į���� �ڷ��� / �ѱ� �ѱ���
    cnt NUMBER(2) --���ڽ��� �ڸ�
);

-- �ڷ� ����
INSERT INTO test VALUES ('��', 5);
INSERT INTO test VALUES ('��', NULL); -- ȸ�����Խ� ���� �Է� ���ϴ� ��� �Ǵ� '' -- ���� ��꿡 ���� ���Ѵ�!
INSERT INTO test VALUES ('��', 5);
INSERT INTO test VALUES ('��', NULL);
INSERT INTO test VALUES ('��', 10);

SELECT * FROM test;

SELECT id, cnt, NVL(cnt,0)
FROM test;


SELECT 
    COUNT(*) ��ü����, 
    COUNT(cnt) cntĮ��_����, -- ��(NULL)�� ��꿡 ���� ���Ѵ�!
    SUM(cnt) cntĮ��_�հ�
FROM test;

SELECT 
    COUNT(*) ��ü����, 
    COUNT(NVL(cnt,0)) cntĮ��_����, -- ��(NULL)�� ������ 0���� ��ģ��!
    SUM(cnt) cntĮ��_�հ�
FROM test;

-- ���� �� ������� �ٸ� ������ ������
SELECT COUNT(NVL(cnt,0)) FROM test; -- ����� 5
SELECT SUM(NVL(cnt,0))/4 FROM test; -- ����� 5
SELECT AVG(NVL(cnt,0)) FROM test; --20/4
SELECT MIN(NVL(cnt,5)) FROM test; --5

-- DROP TABLE test; ���̺� ����

-- emp ���̺� ���� �÷� �߰� : ���� �Ǵ� ���� �̹Ƿ� 6����Ʈ ���� ���� : ���� �̹Ƿ�
ALTER TABLE emp ADD gender VARCHAR2(6);
DESC emp;


-- ������ NULL�� ��� '����' �� '����'�� �Է��Ͻÿ� (UPDATE ���� ����)
UPDATE emp 
SET gender ='����'
WHERE empno in (100, 101, 102, 103);  -- DESC emp���� empno�� �������� �������� Ȯ��

UPDATE emp 
SET gender ='����'
WHERE empno in (104,105);

-- DECODE(�÷�, ����, ���ΰ�, �����ΰ�) ���� ó���� ���� ����� ���� �˷��ִ� ��ȯ���ִ� �Լ� DECODE #�ص��ϴ� #
-- ����� ������ '����'�̸� 'M'���� ǥ���ϰ�, '����'�̸� 'F'�� ǥ��
SELECT ename, 
       salary, 
       DECODE(gender, '����', 'M', 'F') gender
FROM emp;

-- CASE WHEN ---END ���� : DECODE �ȵǴ� ���� �ϸ� ��
SELECT ename, 
       salary, 
       CASE  
            WHEN gender = '����' THEN 'M'
            --WHEN gender = '����' THEN 'M
            ELSE 'F' -- �����ص� �ǳ� ���α׷��ֿ��� �̷��� ���ִ� ��찡 ����!
       END gender
FROM emp;

-- ������ 2�� �̻��� ��� �̷��� �� �ش�!
SELECT ename, 
       salary, 
       CASE  
            WHEN gender = '����' THEN 'M'
            WHEN gender = '����' THEN 'F'
       END gender
FROM emp;

-- �޿��� 500���� �̻��̸� '����', 300���� �̻��̸� '�븮', 300���� �̸��̸�, '���'���� ǥ��
-- ������ ���� ���� DECODE �ȵǰ� CASE WHEN END�� ��� ��
SELECT ename, 
       salary, 
       CASE  
           WHEN salary >= 5000000 THEN '����' --WHEN THEN if ����
           WHEN salary >= 3000000 THEN '�븮'
           ELSE '���'
       END ����
FROM emp;


-- DECODE() --������ ���� �����ϳ�, ���� �ִ� ���� ����Ȯ �� ex)���������� 1�� ������ -> 1�� : 158��
SELECT ename, 
       salary, 
       DECODE(salary, 5000000, '����', 3000000, '�븮', '���') ����  
FROM emp;
-- 320������ ������� ���ͼ� ����Ȯ��

SELECT *
FROM emp
WHERE ename LIKE '__���'; -- ������ھ� 2���� ��� ã���� __

SELECT *
FROM emp
WHERE ename LIKE '_����';















