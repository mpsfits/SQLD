SELECT * FROM emp;

-- �����ȹ�� ��Ƽ��������� ��

DESC PLAN_TABLE;

-- �޿��� �ְ��� ����� ������ ����� �˻��Ͻÿ�
SELECT MAX(sal) �ְ�޿�, MIN(sal) �����޿�
FROM emp;

--> ����ȭ�� �ҿ����� ���� ����
SELECT ename, sal
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp)
    OR sal = (SELECT MIN(sal) FROM emp);

-- > cost 2 ����
--  > emp 3�� �ϹǷ� �� ���� �����ȹ��
--> ����ȭ�� �ҿ����� ���� ����

-- ����Ŭ �����ϴ� ���� ��ȹ
-- ��Ƽ������ ���� ��ȹ ���� - ��ü ��ȸ �ڵ�
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST'));

SELECT ename, sal
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp)
    OR sal = (SELECT MIN(sal) FROM emp); -- �����ϰ� 

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST')); --���߿�   
