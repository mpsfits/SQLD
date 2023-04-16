-- NULL 함수 - NVL (인수1, 인수2) : 인수1이 있으면 인수 1, 인수1이 없고 NULL이면 인수2로 출력
-- 숫자컬럼에서는 NVL (인수1, 0) : 인수1 NULL 아니면 인수1 출력, 인수1이 NULL이면 0으로 출력
-- 문자컬럼에서는 NVL (인수1, '없음') : 인수1 NULL 아니면 인수1, 인수1이 NULL이면 '없음'으로 출력

CREATE TABLE test(
    id VARCHAR2(3), -- 칼럼명 자료형
    cnt NUMBER(2)
);

-- 자료 삽입
INSERT INTO test VALUES ('가', 5);
INSERT INTO test VALUES ('나', NULL); -- 회원가입시 나이 입력 안하는 경우 또는 '' -- 널은 계산에 참여 안한다!
INSERT INTO test VALUES ('다', 5);
INSERT INTO test VALUES ('라', NULL);
INSERT INTO test VALUES ('마', 10);

SELECT * FROM test;

SELECT id, cnt, NVL(cnt,0)
FROM test;


SELECT 
    COUNT(*) 전체갯수, 
    COUNT(cnt) cnt칼럼_갯수, -- 널(NULL)은 계산에 참여 안한다!
    SUM(cnt) cnt칼럼_합계
FROM test;

SELECT 
    COUNT(*) 전체갯수, 
    COUNT(NVL(cnt,0)) cnt칼럼_갯수, -- 널(NULL)이 있으면 0으로 고친다!
    SUM(cnt) cnt칼럼_합계
FROM test;

-- 다음 중 결과값이 다른 것으로 고르세요
SELECT COUNT(NVL(cnt,0)) FROM test; -- 결과값 5
SELECT SUM(NVL(cnt,0))/4 FROM test; -- 결과값 5
SELECT AVG(NVL(cnt,0)) FROM test; --20/4
SELECT MIN(NVL(cnt,5)) FROM test; --5


