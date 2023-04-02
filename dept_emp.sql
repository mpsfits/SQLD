-- �μ��� ��� tabel 2
CREATE TABLE dept(
    deptno VARCHAR2(4) PRIMARY KEY,
    deptname VARCHAR2(20)
);

CREATE TABLE emp(
    empno NUMBER(10),
    ename VARCHAR2(20),
    sal   NUMBER(10,2) default 0,
    createdate DATE DEFAULT SYSDATE, -- date�� �־ �� 
    deptno VARCHAR2(4) NOT NULL,
    CONSTRAINT emppk PRIMARY KEY(empno), --emppk �̸��� �޸��ϸ�� �� ���� ����� ���ļ� ���̺� ������ �ȵ� --emp �⺻Ű
    CONSTRAINT empfk FOREIGN KEY(deptno) --�ܷ�Ű
    REFERENCES dept(deptno) ON DELETE CASCADE
);

-- �ڷ� ����
INSERT INTO dept VALUES ('1000', '�λ���');
INSERT INTO dept VALUES ('1001', '�ѹ���');

INSERT INTO emp VALUES (100, '�Ӻ���Ʈ', 2000000, SYSDATE, '1000');
INSERT INTO emp VALUES (101, '��������', 3000000, SYSDATE, '1001');
INSERT INTO emp VALUES (102, '�����ҹ�', 3000000, SYSDATE, '1002');

-- �ڷ�˻�
select * from dept;
select * from emp;

-- �μ� �ڷ� ����
DELETE FROM dept WHERE deptno ='1001';

DROP TABLE dept;
DROP TABLE emp;

DESC emp;

-- �÷��߰�
ALTER TABLE emp
    ADD (age NUMBER(3) DEFAULT 1);
    
-- �÷� ���� 
ALTER TABLE emp
 MODIFY ename VARCHAR2(40) NOT NULL;

-- �÷� ����
ALTER TABLE emp
    DROP COLUMN age;

-- �÷��� ����
ALTER TABLE emp
    RENAME COLUMN ename TO newname;

DROP TABLE emp;
DROP TABLE emp CASCADE CONSTRAINTS;
DESC emp;


