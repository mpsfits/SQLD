-- 테이블생성
CREATE TABLE exl(
    column1 CHAR(10), -- 고정길이 10BYTE 별칭을 줘서 alias
    column2 VARCHAR2(10) -- 가변길이 10BYTE
);

-- 테이블 삽입
INSERT INTO exl(column1, column2) VALUES ('abc','abc'); 
INSERT INTO exl(column1, column2) VALUES ('사과','사과');

-- 데이터 검색 LENGTH 글자길이 / 별칭 alias 사용 앞에 AS를 붙임 (생략도 가능)
SELECT column1, LENGTH(column1) len1
       column2, LENGTH(column2) len2
from exl;