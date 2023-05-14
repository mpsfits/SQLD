--CASE WHEN 
CREATE TABLE mytest(
    sclass VARCHAR2(1), --학급
    sname VARCHAR2(6) --학생이름
);
INSERT INTO mytest VALUES ('A', '조조');
INSERT INTO mytest VALUES ('A', '조조');
INSERT INTO mytest VALUES ('A', '조조');
INSERT INTO mytest VALUES ('B', '유비');
INSERT INTO mytest VALUES ('B', '관우');
INSERT INTO mytest VALUES ('C', '여포');
INSERT INTO mytest VALUES ('C', '여포');

SELECT * FROM mytest;

-- 학급별 학생수 검색
SELECT sclass, COUNT (*) 
FROM mytest
GROUP BY ;

-- 학생 이름이 '조조'이면 1반, '유비'이면 2반, 나머지는 3반으로 을 지정하여 출력하기
SELECT sname,

    CASE WHEN sname = '조조' THEN '1반'
         WHEN sname = '유비' THEN '2반'
         ELSE '3반'
    END AS 학급 --end 다음 컬럼이름

FROM mytest;


-- DECODE 
SELECT sname,
       DECODE(sname, '조조', '1반', '유비', '2반', '3반') as 학급

FROM mytest;

-- 학급이 'A'이면 'B', 'C'에 1을 카운트하여 출력
SELECT 
    COUNT (CASE WHEN sclass='A' THEN 1
    END) as A,
    COUNT (CASE WHEN sclass='B' THEN 1
    END) as B,
    COUNT (CASE WHEN sclass='C' THEN 1
    END) as C
FROM mytest;


SELECT 
       COUNT(DECODE(sclass, 'A', 1)) as A,
       COUNT(DECODE(sclass, 'B', 1)) as B,
       COUNT(DECODE(sclass, 'C', 1)) as C
FROM mytest;


