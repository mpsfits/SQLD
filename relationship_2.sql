CREATE TABLE emp(
    empno NUMBER(10),
    ename VARCHAR2(20),
    sal   NUMBER(10,2) default 0,
    createdate DATE DEFAULT SYSDATE, -- date만 있어도 됨 
    deptno VARCHAR2(4) NOT NULL,
    CONSTRAINT emp_pk PRIMARY KEY(empno), --emp 기본키
    CONSTRAINT dept_fk FOREIGN KEY (deptno)
    REFERENCES deptno(deptno) ON DELETE CASCADE
);