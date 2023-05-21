SELECT sal
FROM EMP
ORDER BY sal desc;

CREATE INDEX IND_sal on EMP(sal desc); -- 내림차순으로 컬럼 정렬 인덱스가 

SELECT sal  
FROM EMP
WHERE sal >0; -- WHERE 0보다 크다고 조건을 넣으면, 내림차순으로 정렬되어 나옴