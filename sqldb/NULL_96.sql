SELECT *
FROM dual 
WHERE is NULL = NULL;

SELECT *
FROM EMP
--WHERE MGR is NULL; 
WHERE NULL=NULL; -- ���������� ����
-- is NULL�� ��� �Ѵ�.

SELECT MGR, NVL(MGR,0), COALESCE (NULL, MGR, 1) -- NULL 1�̰� NULL�� �ƴϸ� MGR �÷� ��
FROM EMP;