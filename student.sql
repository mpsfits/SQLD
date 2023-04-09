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
INSERT INTO student VALUES(20211234, '이산', 22, '여', '서울시 종로구', '소프트웨어학과', 301, 3.5);
INSERT INTO student VALUES(20211235, '박대양', 25, '남', '서울시 성북구', '전기전자공학과', 501);
INSERT INTO student VALUES(20211236, '한비야', 33, '여', '수원시 장안구', '전기전자공학과', 501, 4.2);
INSERT INTO student(snumber, sname, age, cname, pnumber) VALUES(20211237, '김산', 33, '화학공학과', 401);
INSERT INTO student(snumber, sname, age, cname, pnumber) VALUES(20211238, '김산', 15, '소프트웨어학과', 302);
INSERT INTO student VALUES(20211239, '강감찬', 43, '남', '수원시 장안구', '전기전자공학과', 501, 4.1);
INSERT INTO student VALUES(20211240, '강감찬', 43, '남', '수원시 장안구', '전기전자공학과', 501, 4.1);
INSERT INTO student VALUES(20211241, '이순신', 37, '남', '수원시 장안구', '전기전자공학과', 301, 3.6);
INSERT INTO student VALUES(20211242, '이강', 22, '남', '수원시 장안구', '전기전자공학과', 302, 4.3);


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


-- 테이블 조인
-- 학생이름 나이 성별 전공 교수이름
-- SELECT sname, age, gender, cname from student;
SELECT 
    st.sname as 학생이름, 
    st.age as 나이, 
    st.gender as 성별, 
    st.cname as 전공, 
    pr.pname as 교수
FROM student st, professor pr -- Cartesian Product (카티시안 곱) 5*5=25
-- 발생가능한 모든 경우의 수의 행이 출력되는 것
-- N 개의 행을 가진 테이블과 M 개의 행을 가진 테이블의 카티시안 곱은 N*M 이 되는거죠!
-- 이 현상은 조인 조건을 생략한 경우이거나 조인 조건이 부적합할 경우 발생합니다.
WHERE st.pnumber = pr.pnumber -- 기본키 연결
ORDER BY st.sname;

-- 그룹함수 또는 집계함수 y=f(X) x가 y결정한다 y는 x에 종속된다. 
-- 학생의 수를 출력하시오
SELECT COUNT(*) 학생수 
FROM student;

SELECT COUNT(sname) 학생수 
FROM student;

-- 학생 나이의 평균 구하기
SELECT AVG(age) 평균나이, MAX (age) 최고나이, MIN (age) 최저나이
FROM student;

-- 기존에 만든 테이블에서 새롭게 학점(point)이라는 컬럼 추가  : ALTER
ALTER TABLE student ADD point NUMBER(3); -- FLOAT 오라클 실수자료형, 4.5 점까지 합산해야 3자리

-- 테이블에서 소수점 수정
ALTER TABLE student MODIFY point NUMBER(3,2); -- (소수 둘째자리와 점 포함 총 세자리임) 

-- 학점이 NULL인 학생 삭제
DELETE FROM student
Where point IS NULL;


-- 학생수, 학점평균  
SELECT COUNT(*) 학생수, AVG (point) 학점평균
FROM student;

-- 학점이 4 이상이고 성별이 여자인 학생을 검색하시오 
SELECT * 
FROM student
WHERE point >= 4.0 AND gender = '여';


-- 학생이름, 성별, 학점, 학과명, 학과전화번호, 교수 출력 -> 이 학생의 교수는? join
SELECT 
    st.sname 학생이름, 
    st.gender 성별, 
    st.point 학점, 
    cl.cname 학과명, 
    cl.ctel 학과전화번호,
    pr.pname 교수
FROM student st, class cl, professor pr
WHERE point >= 4.0 AND gender = '여'
    AND st.cname = cl.cname
    AND st.pnumber = pr.pnumber;

-- 학과별 학점 평균 : 그룹으로 통계 (GROUP BY 구문 사용)
SELECT cname 학과명, AVG(point) 학점평균  --그룹바이할 떄는 반드시 그룹할 컬럼명을 써준다! 
FROM student
GROUP BY cname;

-- 학과별 학점 평균 : 조건 4.0 미만인 자료
SELECT cname 학과명, AVG(point) 학점평균  
FROM student
GROUP BY cname
HAVING AVG(point) < 4.0; -- GROUP BY의 조건절은 HAVING  (그룹에서 가진 것은 무엇무엇이다)


-- 성별 학점 평균을 구하시오


DESC student;

