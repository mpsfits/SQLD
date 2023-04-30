-- 날짜 데이터 타입
CREATE TABLE ex2(
    col_date    DATE, --날짜
    col_timestamp TIMESTAMP --날짜, 시간
);

INSERT INTO ex2 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT col_date,
       col_timestamp,
       TO_CHAR(col_date, 'yyyy/mm/dd'),
       TO_CHAR(col_timestamp, 'yyyy/mm/dd hh:mi:ss')
FROM ex2;