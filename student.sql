-- 학생테이블 만들기
CREATE TABLE student(
    snumber NUMBER(10) PRIMARY KEY,
    sname   VARCHAR2(20) NOT NULL,
    age     NUMBER(3),
    gender  VARCHAR2(4),  --가변문자 영문 1byte / 한글 2bytes
    address VARCHAR2(50),
    cname   VARCHAR2(30),
    pnumber NUMBER(3),
    
    --외래키 제약조건 (constraint) (학과) 제약 조건이란 데이터의 무결성을 지키기 위해 제한된 조건을 의미한다. (부적절한 데이터가 들어오는 것을 미리 차단)
    --CONSTRAINT 제약조건이름 FORENGN KEY (컬럼명)
    --REFERENCES 테이블명(컬럼명)
    CONSTRAINT fk_class FOREIGN KEY(cname)
    REFERENCES class(cname),
    
    --외래키 (교수)
    CONSTRAINT fk_professor FOREIGN KEY(pnumber)
    REFERENCES professor(pnumber)
    
);

-- 학생 자료 삽입
INSERT INTO student VALUES(20211234, '이강', 22, '여', '서울시 종로구', '소프트웨어학과', 301);
INSERT INTO student VALUES(20211235, '박대양', 25, '남', '서울시 성북구', '전기전자공학과', 501);
INSERT INTO student VALUES(20211236, '한비야', 33, '여', '수원시 장안구', '전기전자공학과', 501);
INSERT INTO student(snumber, sname, age, cname, pnumber) VALUES(20211237, '김산', 33, '화학공학과', 401);
INSERT INTO student(snumber, sname, age, cname, pnumber) VALUES(20211238, '김산', 15, '소프트웨어학과', 302);

-- 학생 자료 검색
SELECT * FROM student;

-- 성별인 '여'인 학생을 검색하시오
SELECT * FROM student WHERE gender = '여';

-- 나이가 20대인 학생을 검색하시오. BETWEEN A AND B (A이상 (>=) B이하 (<=)) 크거나 같고 작거나 같다
SELECT * FROM student
WHERE age BETWEEN 20 AND 30;

SELECT * FROM student
WHERE age >= 20 AND age <= 30;

-- 주소가 수원시인 자료를 검색하시오 like '%'
SELECT * FROM student
WHERE address LIKE '수원시%';

-- 자료 수정
UPDATE student SET pnumber =302 WHERE snumber =20211238;

-- 정렬 (ORDER BY 컬럼명 오름차순 ASC(생략가능) 내림차순 DESC)
SELECT * FROM student
ORDER BY age; --(기본 ASC)

SELECT * FROM student
ORDER BY age DESC;

SELECT * FROM student
ORDER BY sname ASC;

-- NULL인 자료를 찾을 때는 IS NULL / IS NOT NULL
-- 주소가 없는 자료를 검색하시오
SELECT * FROM student
WHERE address IS NULL;

SELECT * FROM student
WHERE address IS NOT NULL;
