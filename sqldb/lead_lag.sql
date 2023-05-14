-- �� ���� ���� �Լ�
CREATE TABLE EMP_INFO(
    EMP_NO VARCHAR(3),
    NAME   VARCHAR(20),
    SAL    NUMBER
);

INSERT INTO EMP_INFO VALUES ('100', 'Steven', 24000);
INSERT INTO EMP_INFO VALUES ('101', 'Neena', 17000);
INSERT INTO EMP_INFO VALUES ('102', 'Lex', 17000);
INSERT INTO EMP_INFO VALUES ('108', 'Nancy', 12000);
INSERT INTO EMP_INFO VALUES ('109', 'Daniel', 8200);
INSERT INTO EMP_INFO VALUES ('110', 'John', 24000);

SELECT * FROM EMP_INFO;

-- LEAD (�÷���, ��) : ���� ���� ���� ���� �࿡ �����
-- LEAD (�÷���, ��,-1) : NULL���� -1���� ��ü��
SELECT EMP_NO, NAME, SAL,
    LEAD(SAL,3) OVER (ORDER BY SAL DESC) AS SAL2,  --ORDER BY ����� ���� �ȳ�   3���� �ƴ϶� 3�� �Ʒ� 4�����
    LEAD(SAL,3,-1) OVER (ORDER BY SAL DESC) AS SAL2
FROM EMP_INFO;

-- LAG (�÷���, ��) : ���� ���� ���� ���� �࿡ �����
-- LAG (�÷���, ��, 0) : NULL���� 0���� ��ü��
SELECT EMP_NO, NAME, SAL,
    LAG(SAL,3) OVER (ORDER BY SAL DESC) AS SAL2, --ORDER BY ����� ���� �ȳ�   3���� �ƴ϶� 3�� �Ʒ� 4�����
    LAG(SAL,3,0) OVER (ORDER BY SAL DESC) AS SAL2
    
FROM EMP_INFO;

-- ������ ����ϱ� : ORDER BY EMP_NO �ʼ�
SELECT EMP_NO, NAME, SAL,
    SUM (SAL) OVER (ORDER BY EMP_NO) AS �޿��հ�
FROM EMP_INFO;

-- ������ ����ϱ�(��������) --�������Լ�
SELECT EMP_NO, NAME, SAL,
    SUM (SAL) OVER (ORDER BY EMP_NO
                    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS �޿��հ�
FROM EMP_INFO;


-- ������ ����ϱ�(��������)
SELECT EMP_NO, NAME, SAL,
    SUM (SAL) OVER (ORDER BY EMP_NO
                    ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS �޿��հ�
FROM EMP_INFO;






















