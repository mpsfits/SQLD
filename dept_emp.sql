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
INSERT INTO dept VALUES ('1002', '��������');
INSERT INTO dept VALUES ('1003', 'IT��');


INSERT INTO emp VALUES (100, '�Ӻ���Ʈ', 2000000, SYSDATE, '1000');
INSERT INTO emp VALUES (101, '��������', 3000000, SYSDATE, '1001');
INSERT INTO emp VALUES (102, '�����ҹ�', 3000000, SYSDATE, '1002');
INSERT INTO emp VALUES (103, '�������', 5000000, SYSDATE, '1000');
INSERT INTO emp VALUES (104, '�Ż��Ӵ�', 3000000, SYSDATE, '1002');
INSERT INTO emp VALUES (106, '�������', 4000000, SYSDATE, '1002', '����');


-- �÷��� ���� : Commit ���ص� �� insert delte ���� Ŀ��
-- DML Commit ��ɾ ���� Transaction�� �����ؾ� �ش� ���� ������ ���̺� �ݿ��ȴ�.
-- https://velog.io/@alicesykim95/DB-DDL-DML-DCL-TCL%EC%9D%B4%EB%9E%80
-- ������ ���� ���(DDL: Data Definition Language) : DDL�� ��ɾ �Է��ϴ� ���� �۾��� ��� �ݿ�(Auto Commit)�Ǳ� ������ ����� �� �����ؾ� �Ѵ�. CREATE / ALTER ���� / DROP ���� / RENAME /TRUNCATE ���̺��� �ʱ�ȭ�ϴ� ����  
-- ������ ���� ���(DML:Data Manipulation Language) :
-- ������ ���� ���(DCL:Date Control Language) :
-- Ʈ����� ���� ���(TCL: Transaction Control Language) : 

ALTER TABLE emp RENAME COLUMN sal to salary;


-- �ڷ�˻�
select * from dept;
select * from emp;

-- �μ��� �޿� ��� ���ϱ�
-- �μ���ȣ, �μ���, �޿�, �޿����

select 
    deptno �μ���ȣ,
    AVG(sal) �޿����
from emp
GROUP BY deptno;


-- �μ� �ڷ� ����
DELETE FROM dept WHERE deptno ='1001';

DROP TABLE dept;
DROP TABLE emp;

DESC emp;

-- �÷��� ����
ALTER TABLE emp
    RENAME COLUMN ename TO newname;

DROP TABLE emp;
DROP TABLE emp CASCADE CONSTRAINTS;
DESC emp;

-- �ڷ� ����
UPDATE dept SET deptname ='������'
WHERE deptno = '1002';

-- ����Ŭ ��� JOIN : �μ��� ����� ��� ������ �˻��Ͻÿ�.
SELECT *
FROM dept, emp
WHERE dept.deptno = emp.deptno;

-- ����Ŭ ��� JOIN : �μ��� �̸��� �μ��� �Ҽӵ� ����� ��� ������ �˻��Ͻÿ�.
SELECT dept.deptname, emp.ename
FROM dept, emp
WHERE dept.deptno = emp.deptno;

-- ����� �̸��� ����� ���� �μ��̸��� �˻��Ͻÿ�!
SELECT *
FROM dept, emp
WHERE dept.deptno = emp.deptno(+);

-- �μ��� �̸��� �μ��� �Ҽӵ��� ���� ����� �̸��� �˻��Ͻÿ�!
SELECT dept.deptname, emp.ename -- ���̺� �� ��Ī ���ص� ����
FROM dept, emp
WHERE dept.deptno = emp.deptno(+)
ORDER BY dept.deptno;

-- INNER JOIN ON ������� �˻�
-- �μ��� �̸��� �μ��� �Ҽӵ� ����� �̸��� �˻��Ͻÿ�.
SELECT dept.deptname, emp.ename
FROM dept INNER JOIN emp
    ON dept.deptno = emp.deptno
    ORDER BY dept.deptno;

-- LEFT JOIN ON ������� �˻�
-- �μ��� �̸��� �μ��� �Ҽӵ� ����� �̸��� �˻��Ͻÿ�
SELECT dept.deptname, emp.ename
FROM dept LEFT OUTER JOIN emp  --�÷��� ���̺��� �ҷ� ����
    ON dept.deptno = emp.deptno -- ���ǿ� �´� ������ �Ѵ�. 
    ORDER BY dept.deptno;










