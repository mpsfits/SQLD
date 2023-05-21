SELECT 1, 0 
FROM DUAL
UNION ALL
SELECT 0, 1
FROM DUAL;

SELECT sum(x1), sum(x2)  -- 컬럼의 합계로 1,1
FROM(
SELECT 1 x1, 0 x2 
FROM DUAL
UNION ALL
SELECT 0, 1
FROM DUAL) a;


SELECT 'A', 1 
FROM DUAL
UNION ALL
SELECT 1, 'A'
FROM DUAL;