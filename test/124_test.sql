-- TOP N QUARY
-- ROWNUM

SELECT ROWNUM, ENAME
FROM EMP;

--����1
SELECT ROWNUM, ENAME
FROM EMP
WHERE ROWNUM <= 5;


-- FROM -> SELECT ������ ����ǹǷ� WHERE ���� RN�� ���̺��� ���� �÷����� �νĵǾ� ������
SELECT ROWNUM RN, ENAME
FROM EMP
WHERE RN < 5;
---



-- ����2
--FROM -> SELECT ������ ����ǹǷ� FROM �� ���� �ζ��� ���� RN�� ����ǰ� WHERE�� RN�� ����ǹǷ� �����߻�x
SELECT * FROM (
SELECT ROWNUM RN, ENAME
FROM EMP) 
WHERE RN > 5 ;
