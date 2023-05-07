
-- ROWNUM 순번을 정해놓은 오라클의 관리컬럼 (SUDO COLUMN) 관리 컬럼 같은...
CREATE TABLE ex_score(
    name VARCHAR2(10),
    score NUMBER
);

INSERT INTO ex_score VALUES ('최웅', 94);
INSERT INTO ex_score VALUES ('국연수', 100);
INSERT INTO ex_score VALUES ('김지웅', 97);
INSERT INTO ex_score VALUES ('엔제이', 77);
INSERT INTO ex_score VALUES ('이솔이', 87);
INSERT INTO ex_score VALUES ('박동일', 91);
INSERT INTO ex_score VALUES ('구은호', 66);
INSERT INTO ex_score VALUES ('정채란', 85);
INSERT INTO ex_score VALUES ('방이훈', 80);

SELECT * FROM ex_score;

COMMIT;

-- 점수가 높은 순으로 5명 검색하기 (잘못된 사용)
-- 왜 77점이 5등인가? 
SELECT ROWNUM, NAME, SCORE
    FROM ex_score 
WHERE ROWNUM <=5
ORDER BY score DESC;

-- 점수가 높은 순으로 5명 검색하기 (올바른 사용)
-- 서브쿼리 (인라인 뷰)
-- 전체 정렬 후 5명을 추출  
SELECT * FROM(
SELECT ROWNUM, NAME, SCORE
    FROM ex_score 
ORDER BY score DESC
) WHERE ROWNUM <=5;

-- 게시글을 ROWNUM을 사용하여 페이지 제한 (10행 검색)
-- ROWNUM은 반드시 1을 포함해야 함 
SELECT ROWNUM, bno, title, content, regdate
FROM board
-- WHERE ROWNUM >0 AND ROWNUM <= 10;
-- WHERE ROWNUM >10 AND ROWNUM <= 20; 오류남 ROWNUM은 반드시 1을 포함해야 함 

-- 게시글을 페이지 처리 (11~20행 검색)
--SELECT ROWNUM 별칭 사용 해야 오류가 없다!!
SELECT * FROM
(SELECT ROWNUM rn, bno, title, content, regdate
    FROM board)
WHERE rn >10 AND rn <= 20;  --rn 이라는 별칭 사용

-- INDEX 제귀 복사
-- 데이터가 수백만건으로 늘어나면 ORDER BY 시간이 오래 걸림
-- 그래서 INDEX 사용한다.
SELECT * FROM board ORDER BY regdate DESC; -- 게시글은 최신 쓴게 먼저 나옴

-- 인덱스 : 데이터가 수백만건으로 늘어날 때 사용하면 시간이 짧게 걸림
-- CREATE INDEX 인덱스 이름 ON 테이블명 (컬럼명)
-- 작성사자 '관리자'인 이름을 인덱스로 만들기
DROP INDEX idx_admin;

SELECT * FROM board WHERE writer ='관리자';  -- 안될수있다 FULL SCAN으로 바뀔 수 가 있어 RANGE SCAN안나옴

CREATE INDEX idx_writer ON board(writer); -- 안만들어져서 DROP 인덱스 해줌

-- 힌트 사용법 - 실무 사용
-- /*+ INDEX (테이블명 인덱스명) */
-- 힌트 사용하면 더 정확함
SELECT /*+ INDEX(board idx_writer) */ * FROM board 
WHERE writer ='관리자'; 

-- 옵티마이저 실행 계획 상태 - 전체 조회 코드
SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST'));

















