-- 부서와 사원 테이블 생성
CREATE TABLE dapartment (
    deptid      NUMBER, --  옆에 PRIMARY KEY 써줘도 됨
    deptname    VARCHAR2(20) NOT NULL,
    loc_office  VARCHAR2(20) NOT NULL,
    PRIMARY KEY(deptid) -- NOT NULL 안해줘도 됨
);

CREATE TABLE employee(
    empid       NUMBER,
    empname     VARCHAR2(20) NOT NULL,
    age         NUMBER,
    deptid       NUMBER NOT NULL, --NOT NULL,해줘야 외래키 제약 조건 설정
    CONSTRAINT emp_fk FOREIGN KEY(deptid) -- emp_fk 이름을 써줘야 수정이 가능
    REFERENCES dapartment(deptid) ON DELETE CASCADE -- 연쇄적으로 삭제 가능하도록 
);

-- 부서자료 추가
INSERT INTO dapartment VALUES (10, '전산팀', '서울');
INSERT INTO dapartment VALUES (20, '총무팀', '인천');

-- 사원 자료 추가
INSERT INTO employee VALUES (101,'이강', 27, 10);
INSERT INTO employee VALUES (102,'김산', 28, 20);
INSERT INTO employee VALUES (103,'정들', 31, 30); --실수를 줄이기 위해 제약을 걸어서 부서가 30 없기 때문에 삽입이 안됨 / 참조 무결성 제약

-- 부서 삭제 : 부서코드 20번인 부서 삭제 Where 절
DELETE FROM dapartment WHERE deptid = 20; -- 부모는 자식과 연결되어 부모를 삭제 불가능  다만 자식행을 삭제하면 가능  : 회원탈퇴시 댓글도 삭제

-- 자료 검색
SELECT * from dapartment;
SELECT * from employee;

DROP TABLE dapartment; -- 부모가 있어 삭제 안됨
DROP TABLE employee;

