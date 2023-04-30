-- 논리적인 일련번호 - 페이지 같은데 행수를 제한하여 웹 10개 1페이지 / 앱 5줄 페이지
-- 조회되는 행수 제한
-- 인라인 뷰로 서브쿼리르 해야 함
-- 실무많이 사용 p.160 유선배 
-- 게시판 만들 때 사용

-- 게시판 테이블 생성
CREATE TABLE board(
    bno NUMBER(5) PRIMARY KEY,      -- 글번호
    title VARCHAR2(200) NOT NULL,   -- 글제목 글자수는 안맞는게 있으므로 넣어줘야 함 VARCHAR2(200
    writer VARCHAR2(20) NOT NULL,   --글쓴이
    content VARCHAR2(2000) NOT NULL, -- 글내용
    regdate DATE DEFAULT SYSDATE     -- 작성일 -- sysdate 자동으로 생성되므로 데이터에는 안써도 됨)
);

CREATE SEQUENCE seq; -- 뷰같은 객체, 순번을 넣음

INSERT INTO board (bno, title, writer, content)
VALUES (seq.NEXTVAL, '가입인사', '김회원', '안녕하세요, 가입인사 드립니다');
INSERT INTO board (bno, title, writer, content)
VALUES (seq.NEXTVAL, '공지사항', '관리자', '공지사항을 알려 드립니다');
INSERT INTO board (bno, title, writer, content)
VALUES (seq.NEXTVAL, '좋은 하루', '박회원', '좋은 하루 되세요');


-- 데이터 재귀복사 : 기하급수적 복사 : INSERT ~ INTO ~ (SELECT FROM ~)
INSERT INTO board (bno, title, writer, content)
(SELECT seq.NEXTVAL, title, writer, content FROM board);


-- 4번 게시글 삭제하기  번호가 삭제되지 않은  ROWNUM 필요
DELETE FROM board WHERE bno = 4;


--ROWNUM 사용 : ROWNUM은 반드시 1이 들어가야 함 : 중첩쿼리 inline 뷰 필요
SELECT ROWNUM, bno, title, content
FROM board
-- WHERE ROWNUM > 10 AND ROWNUM <= 20 ; --  ROWNUM은 반드시 1이 들어가야 함 검색 안됨
WHERE ROWNUM > 1 AND ROWNUM <= 10;

-- 인라인뷰 부속질의
-- 별칭을 사용하면 검색이 됨

SELECT *
FROM 
    (SELECT ROWNUM rn, bno, title, content -- ROWNUM은 별칭을 사용하면 검색이 됨
     FROM board)
WHERE rn > 20 AND rn <= 30;

-- ROWID : 오브젝트번호, 상대 파일번호, 블록번호, 데이터번호로 구성됨
-- 데이터를 구분할 수 있는 유일한 값임
SELECT ROWID, bno, title FROM board;

SELECT * 
FROM board 
WHERE ROWID ='AAAStUAAHAAAAGcAAB';

SELECT * FROM board 
WHERE writer = '관리자';

--인덱스 형성
-- 인덱스 범위 스캔 RANGE SCAN
CREATE INDEX idx_admin ON board(writer);

-- 인덱스 삭제
DROP INDEX idx_admin;

















-- 인덱스 생성











