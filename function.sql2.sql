-- ���� Ÿ�� �Լ�
-- �ҹ��ڷ� �ٲٴ� �Լ� LOWER()
SELECT LOWER('ABCD') FROM DUAL;

-- �빮�ڷ� �ٲٴ� �Լ� UPPER()
SELECT UPPER('abcd') FROM DUAL;

-- ù���� �빮�ڷ� �ٲٴ� �Լ� INITCAP() initial cap ù ����
SELECT INITCAP('hello korea') FROM DUAL;

-- ���ڿ��߿��� �Ϻθ� ����(����) sub str
-- SUBSTR(����, ����, ����)
SELECT SUBSTR ('ABCD', 2, 3) FROM DUAL; --���ڿ����� ���� �A��

SELECT * FROM dept;

SELECT SUBSTR(deptname, 1,2) ����
FROM dept;

-- Ư�� ���ڿ��� ã�� �ٲ� - REPLACE(���ڿ�, ������ ����, ������ ����)
SELECT REPLACE ('AB', 'A', 'D') FROM DUAL;

-- LPAD(���ڿ�, �ѹ��ڰ���, Ư������) : ���ʺ��� Ư�� ���ڷ� ä�� : ��ǥ����ŷ�� �ʿ�
SELECT LPAD('sky123', 10, '*') FROM DUAL;

-- RPAD(���ڿ�, �ѹ��ڰ���, Ư������) : �����ʺ��� Ư�� ���ڷ� ä�� : ��ǥ����ŷ�� �ʿ�
SELECT RPAD('sky123', 10, '*') FROM DUAL;

--  ���ڿ� ���� (���ϱ�) CONCAT (����1, ����2) -> ����1����2
SELECT CONCAT('sky','123') FROM DUAL;

 -- ���ڿ� ���� (���ϱ�) - ������ ��ȣ '||' Ÿ���� �Ǵ�
SELECT 'sky' || '123' FROM DUAL;

-- ���ڿ��� ���� LENGTH
SELECT LENGTH('cloud')���ڼ�, LENGTHB('cloud')����Ʈ��
FROM DUAL;

-- ����Ʈ �� : ���� ���� - 1BYTE, �ѱ� - 3BYTE
SELECT LENGTH('����')���ڼ�, LENGTHB('����') ����Ʈ��
FROM DUAL;

-- ��¥ �Լ� ����
-- DATE + NUMBER : ��¥���� �ϼ�(day)�� ����
-- DATE - NUMBER : ��¥���� �ϼ�(day)�� ��

SELECT SYSDATE FROM DUAL;  --���� ��¥
SELECT SYSDATE, SYSDATE+3, SYSDATE-3 FROM DUAL;

-- Ư���� ��¥���� ����
-- TO_DATE(��¥���ڿ�): ���ڸ� ��¥�� ��ȯ�ϱ�
SELECT TO_DATE('2023-4-1') -10 ���1, 
       TO_DATE('2023-4-1') +10 ���2
FROM DUAL;

-- ��¥ �Լ�
-- ADD_MONTHS(SYSDATE, +2): �������� ���ϰ� ����
-- ADD_MONTHS(SYSDATE, -2)
SELECT 
    ADD_MONTHS(SYSDATE, 2) ���ϱ�_���, -- �̸��� ������ �������� : _ �־ ������ ä��� ��Ģ 
    ADD_MONTHS(SYSDATE, -2) ����_��� 
FROM DUAL; 

-- MONTHS_BETWEEN(): �� ��¥ ������ �������� ���
-- �Ի��Ͽ��� ����ϱ����� ������ ���
SELECT
    ROUND(MONTHS_BETWEEN(TO_DATE('2022-11-30'),
    TO_DATE('2022-1-1')),0) �Ѱ�����
FROM DUAL;

-- ���� ��ȯ �Լ�
SELECT 1+2 FROM DUAL;
SELECT 1+'2' FROM DUAL; --������ ������ ����� : �ڵ� Ÿ��(��) ��ȯ
SELECT TO_NUMBER('300') FROM DUAL; -- �Լ��� �Ἥ ���� Ÿ�� ��ȯ �Լ�

-- ��¥ ���� ��ȯ (��¥�� ���ڿ��� ��ȯ)
SELECT 
    TO_CHAR(SYSDATE, 'YYYY-MM-DD') ��¥,
    TO_CHAR(SYSDATE, 'YYYY')����,
    TO_CHAR(SYSDATE, 'MM')��,
    TO_CHAR(SYSDATE, 'DD')��
FROM DUAL;

-- �ð� ���� ��ȯ (�ð��� ���ڿ��� ��ȯ)
SELECT 
    TO_CHAR(SYSDATE, 'HH::MI:SS AM') �ð�, -- AM �Ǵ� PM ���� ���ĸ� ���ָ� �ȴ�. 
    TO_CHAR(SYSDATE, 'YYYY/MM/DD') ��¥�ͽð�
FROM DUAL;













