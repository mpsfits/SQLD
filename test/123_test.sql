SELECT sal
FROM EMP
ORDER BY sal desc;

CREATE INDEX IND_sal on EMP(sal desc); -- ������������ �÷� ���� �ε����� 

SELECT sal  
FROM EMP
WHERE sal >0; -- WHERE 0���� ũ�ٰ� ������ ������, ������������ ���ĵǾ� ����