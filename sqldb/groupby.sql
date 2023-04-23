-- DEPT ���̺� ����
CREATE TABLE dept(
    dept_no VARCHAR2(3),
    job_nm VARCHAR2(20),
    salary NUMBER
);

INSERT INTO dept VALUES ('100', '���ǻ�', 3300000);
INSERT INTO dept VALUES ('100', '������', 4300000);
INSERT INTO dept VALUES ('200', '���ǻ�', 5000000);
INSERT INTO dept VALUES ('200', '�����ͺм���', 4000000);
INSERT INTO dept VALUES ('200', '������', 6000000);

SELECT * FROM dept;

-- DROP TABLE dept; -- ���̺� ���� / �����̸Ӹ� Ű������ ��� �Էµ�,

-- �μ���, �̸��� �׷� ���������
--SELECT *
--FROM dept
--GROUP BY dept_no;

SELECT dept_no, COUNT(*) �ο��� -- �׷�� 1���� �����Ƿ� �ȵ� ������
FROM dept;
-- GROUP BY dept_no;

-- �μ� ��ü �ο����� �޿��հ�
SELECT COUNT(*) �ο���, SUM(salary) �޿��հ�
FROM dept;
-- GROUP BY dept_no;

-- �μ��� �����̸��� �ο��� �޿��հ� �÷��� �߽����� 
SELECT dept_no, job_nm, COUNT(*)�ο���, SUM(salary) �޿��հ�
FROM dept
GROUP BY dept_no, job_nm;

-- �μ��� ������ �޿� �Ұ�� ��ü �Ѱ�
-- GROUP BY ROLLUP(�÷���)
-- ROLLUP �Ѱ谡 ����
SELECT dept_no, job_nm, SUM(salary) �޿��հ�
FROM dept
GROUP BY ROLLUP (dept_no, job_nm)
ORDER BY dept_no;

-- �μ��� ������ �޿� �Ұ�� ��ü �Ѱ�
-- GROUP BY CUBE(�÷���) �ٸ������� �Ѱ� , ������ �ִ� ����� ���� ��� ����
-- ROLLUP �Ѱ谡 ����
SELECT dept_no, job_nm, SUM(salary) �޿��հ�
FROM dept
GROUP BY CUBE (dept_no, job_nm)
ORDER BY dept_no;

-- �μ��� ���� �̸��� �޿� �Ұ�
-- �Ѱ� �� ���� �Ұ踸 ����
SELECT dept_no, job_nm, SUM(salary) �޿��հ�
FROM dept
GROUP BY GROUPING SETS (dept_no, job_nm)
ORDER BY dept_no;





















