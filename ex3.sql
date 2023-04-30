-- 제약 조건
CREATE TABLE ex3(
    column1   VARCHAR2(10),
    column2   VARCHAR2(10) NOT NULL
);

-- 문자 입력 시 홑따옴표 
-- INSERT INTO ex3 VALUES ('HELLO', ''); #null을 입력 불가
INSERT INTO ex3 VALUES ('', '안녕'); 
-- INSERT INTO ex3(column1) VALUES ('HELLO', 'good'); 오류 값이 너무 많다
INSERT INTO ex3 VALUES ('HELLO'); -- 값이 수가 충분하지 않다.
INSERT INTO ex3 (column1, column2) VALUES ('HELLO', '안녕'); --됨

SELECT * FROM ex3;

