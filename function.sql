-- ���� �Լ� : �ϴ� ���� - 
SELECT * from emp;

-- ������̺��� �̸��� '��������'�� �˻��Ͻÿ� : ���̺��� ���� ã��, where������ �����͸� ã�´�.
SELECT * from emp
WHERE ename = '��������';

-- �޿��� 300������ �ʰ��ϴ� ����� �˻��Ͻÿ�
SELECT * from emp
WHERE salary > 3000000;

-- �÷��̸� �ٲٱ� : �������� �� DDL ��� ( creat alter drop)

-- �޿��� 300���� �̸鼭 �μ���ȣ�� 1002�� ����� �˻��Ͻÿ�
SELECT * from emp
WHERE salary = 3000000 and deptno = '1002'; -- ������ ''��� : varchar2 �̹Ƿ�

-- �Ż��Ӵ��� �޿��� 320�������� �����ϼ���.
-- UADATE ���̺� �̸� SET �÷����� ����
UPDATE emp SET salary = 3200000
WHERE empno = 104; -- ���������� �����Ƿ� �⺻Ű�� ������ �ش�, �⺻Ű �ĺ��ڷ� �ؾ� ��Ȯ�ϰ� ������ 

SELECT * from emp;

-- ����� �ο��� �Ѽ��� ���Ͻÿ�: AS�� ��Ī �׷��� AS�� �����ص� ��
select COUNT(*) AS ���ο���
FROM emp;

-- ��� �޿��� ���հ踦 ���Ͻÿ� (SUM �Լ�)
SELECT SUM(salary) �ѱ޿��հ�
FROM emp;

-- ��� �޿��� ����� ���Ͻÿ� (AVG �Լ� �Ǵ� SUM/COUNT)
SELECT SUM(salary)/COUNT(*) �޿����
FROM emp;

SELECT AVG(salary) �޿����
FROM emp;

-- ����Ÿ�� �Լ�
-- ���ڸ� �ݿø��Ѵ�. : ROUND(����, �ڸ���)
SELECT ROUND(3.87, 1) FROM DUAL; --��ü������ ������� DUAL; ����Ŭ���� �����ϴ� �������̺�

-- �ڸ��� : 1 �Ҽ�ù��¥�� ��Ÿ�� / 0 : ���� / -1: �����ڸ�
SELECT ROUND(12351, -1) FROM DUAL;

-- ���밪 ABS(����) absoulute : ����� ����̰� , ������ ����� �ٲ�
SELECT ABS(-10), ABS(10) FROM DUAL;

-- ��� �޿����� �ݿø� �Լ� ���
SELECT ename, salary,
             salary/30 �ϱ�,
             ROUND(salary/30,1) ���1,
             ROUND(salary/30,0) ���2,
             ROUND(salary/30,-1) ���3
FROM emp;

-- ���ڸ� ������ �� ������ �� : ���ڸ� ���� ���� TRUNC �Լ� (����, �ڸ���)
SELECT TRUNC(3.87, 1), TRUNC(3.87) FROM DUAL;
-- SELECT TRUNC(3.87, 1), TRUNC(3.87,0) FROM DUAL;

-- ���ڸ� ������ �����Ѵ� : FLOOR �Լ� (�Ǽ�) : �Ҽ����� �ִ� �� = �Ǽ�
SELECT FLOOR(3.87) FROM DUAL;

-- ��� �޿��� TRUNC()����
SELECT ename, salary,
             salary/30 �ϱ�,
             TRUNC(salary/30,1) ���1,
             TRUNC(salary/30,0) ���2,
             TRUNC(salary/30,-1) ���3
FROM emp;















