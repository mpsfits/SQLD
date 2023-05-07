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

DROP TABLE exam_score;


















