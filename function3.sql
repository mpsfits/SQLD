-- NULL �Լ� - NVL (�μ�1, �μ�2) : �μ�1�� ������ �μ� 1, �μ�1�� ���� NULL�̸� �μ�2�� ���
-- �����÷������� NVL (�μ�1, 0) : �μ�1 NULL �ƴϸ� �μ�1 ���, �μ�1�� NULL�̸� 0���� ���
-- �����÷������� NVL (�μ�1, '����') : �μ�1 NULL �ƴϸ� �μ�1, �μ�1�� NULL�̸� '����'���� ���

CREATE TABLE test(
    id VARCHAR2(3), -- Į���� �ڷ���
    cnt NUMBER(2)
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


