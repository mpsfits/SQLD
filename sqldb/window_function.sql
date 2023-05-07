-- NTILE() 함수 : 주어진 수만큼 행들을 N등분한 후 현재행에 해당되는 등급을 구한다.
CREATE TABLE exam_score(
    이름 VARCHAR(20),
    국어 NUMBER,
    영어 NUMBER,
    수학 NUMBER
);

INSERT INTO exam_score VALUES ('김수현', 116, 77, 75);
INSERT INTO exam_score VALUES ('박보검', 101, 69, 80);
INSERT INTO exam_score VALUES ('아이유', 118, 62, 60);
INSERT INTO exam_score VALUES ('김하늘', 100, 72, 70);
INSERT INTO exam_score VALUES ('이효리', 100, 77, 55);
INSERT INTO exam_score VALUES ('유재석', 78, 66, 61);
INSERT INTO exam_score VALUES ('신동엽', 85, 72, 75);
INSERT INTO exam_score VALUES ('서장훈', 99, 70, 53);
INSERT INTO exam_score VALUES ('한혜진', 105, 75, 69);
INSERT INTO exam_score VALUES ('김동률', 117, 68, 73);

SELECT * FROM exam_score;

-- 과목별 등급 검색
SELECT 이름, 
       국어,
       NTILE(8) OVER (ORDER BY 국어 DESC) 국어등급  -- RANK OVER 윈도우 함수 
FROM exam_score;

-- '아이유'가 없는 9명인 경우
SELECT 이름, 
       국어,
       NTILE(8) OVER (ORDER BY 국어 DESC) 국어등급  -- RANK OVER 윈도우 함수 
FROM exam_score
WHERE 이름 <> '아이유';  --아이유가 아닌것

-- 전체 과목별 등급 검색
SELECT 이름, 
       국어,
       NTILE(8) OVER (ORDER BY 국어 DESC) 국어등급,  -- RANK OVER 윈도우 함수 
       수학,
       NTILE(8) OVER (ORDER BY 수학 DESC) 수학등급,
       영어,
       NTILE(8) OVER (ORDER BY 영어 DESC) 영어등급
FROM exam_score;

-- 순위 검색
-- 함수이름 (매개변수) : NTILE() 함수는 무조건 ()가 있음 /order by는 함수가 아님
-- RANK() : 매게변수가 없는 함수임
SELECT 이름, 
       국어,
       RANK() OVER (ORDER BY 국어 DESC) RANK,
       DENSE_RANK() OVER (ORDER BY 국어 DESC) DENSE_RANK,
       ROW_NUMBER() OVER (ORDER BY 국어 DESC) ROW_NUMBER_RANK  -- RANK()매개변수 없음 OVER 윈도우 함수 
FROM exam_score;

-- 누적값 구하기
-- 주문테이블 
CREATE TABLE t_order(
    order_date DATE,
    order_cnt  NUMBER
);

INSERT INTO t_order VALUES ('20210801', 10);
INSERT INTO t_order VALUES ('20210802', 12);
INSERT INTO t_order VALUES ('20210803', 6);
INSERT INTO t_order VALUES ('20210804', 8);
INSERT INTO t_order VALUES ('20210805', 10);

SELECT * FROM t_order;


-- 주문일별 주문수량의 누적 합계
SELECT order_date, 
       order_cnt,
       SUM(order_cnt) OVER(ORDER BY order_date) AS SUM
    FROM t_order;

-- 주문일별 주문수량의 누적합계 (내림차순)
-- WINDOWING ()관련용어 : ROWS RANGE 
-- UNBOUNDED PRECEDING (첫 행), UNBOUNDED FOLLOWING (마지막행)
-- CURRENT ROW (시작 위치가 현재행임)

-- SELECT WINDOW_FUNCTION (ARGUMENTS) 매개변수
-- OVER (PARTITION BY 칼럼
-- OVER BY WINDOWING절)
        
-- 파티션별로 묶지 않으면 제대로 되지 안는 경우가 있다. 

SELECT order_date, 
       order_cnt,
       SUM(order_cnt) OVER(ORDER BY order_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS SUM
    FROM t_order;

-- 주문일별 주문수량의 누적합계 (오름차순)

SELECT order_date, 
       order_cnt,
       SUM(order_cnt) OVER(ORDER BY order_date
            ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS SUM
    FROM t_order;


DROP TABLE exam_score;


















