-- �л����̺� �����
CREATE TABLE student(
    snumber NUMBER(10) PRIMARY KEY,
    sname   VARCHAR2(20) NOT NULL,
    age     NUMBER(3),
    gender  VARCHAR2(4),  --�������� ���� 1byte / �ѱ� 2bytes
    address VARCHAR2(50),
    cname   VARCHAR2(30),
    pnumber NUMBER(3),
    
    --�ܷ�Ű �������� (constraint) (�а�) ���� �����̶� �������� ���Ἲ�� ��Ű�� ���� ���ѵ� ������ �ǹ��Ѵ�. (�������� �����Ͱ� ������ ���� �̸� ����)
    --CONSTRAINT ���������̸� FORENGN KEY (�÷���)
    --REFERENCES ���̺��(�÷���)
    CONSTRAINT fk_class FOREIGN KEY(cname)
    REFERENCES class(cname),
    
    --�ܷ�Ű (����)
    CONSTRAINT fk_professor FOREIGN KEY(pnumber)
    REFERENCES professor(pnumber)
    
);

-- ������ ���� ���̺��� ���Ӱ� ����(point)�̶�� �÷� �߰�  : ALTER
ALTER TABLE student ADD point NUMBER(3); -- FLOAT ����Ŭ �Ǽ��ڷ���, 4.5 ������ �ջ��ؾ� 3�ڸ�

-- ���̺��� �Ҽ��� ����
ALTER TABLE student MODIFY point NUMBER(3,2); -- (�Ҽ� ��°�ڸ��� �� ���� �� ���ڸ���) 

-- �л� �ڷ� ����
INSERT INTO student VALUES(20211234, '�̻�', 22, '��', '����� ���α�', '����Ʈ�����а�', 301, 3.5);
INSERT INTO student VALUES(20211235, '�ڴ��', 25, '��', '����� ���ϱ�', '�������ڰ��а�', 501, 3.6);
INSERT INTO student VALUES(20211236, '�Ѻ��', 33, '��', '������ ��ȱ�', '�������ڰ��а�', 501, 4.2);
-- INSERT INTO student(snumber, sname, age, cname, pnumber) VALUES(20211237, '���', 33, 'ȭ�а��а�', 401);
-- INSERT INTO student(snumber, sname, age, cname, pnumber) VALUES(20211238, '���', 15, '����Ʈ�����а�', 302);
INSERT INTO student VALUES(20211239, '������', 43, '��', '������ ��ȱ�', '�������ڰ��а�', 501, 4.1);
INSERT INTO student VALUES(20211240, '������', 43, '��', '������ ��ȱ�', '�������ڰ��а�', 501, 4.1);
INSERT INTO student VALUES(20211241, '�̼���', 37, '��', '������ ��ȱ�', '�������ڰ��а�', 301, 3.6);
INSERT INTO student VALUES(20211242, '�̰�', 22, '��', '������ ��ȱ�', '�������ڰ��а�', 302, 4.3);




-- �л� �ڷ� �˻�
SELECT * FROM student;

-- ������ '��'�� �л��� �˻��Ͻÿ�
SELECT * FROM student WHERE gender = '��';

-- ���̰� 20���� �л��� �˻��Ͻÿ�. BETWEEN A AND B (A�̻� (>=) B���� (<=)) ũ�ų� ���� �۰ų� ����
SELECT * FROM student
WHERE age BETWEEN 20 AND 30;

SELECT * FROM student
WHERE age >= 20 AND age <= 30;

-- �ּҰ� �������� �ڷḦ �˻��Ͻÿ� like '%'
SELECT * FROM student
WHERE address LIKE '������%';

-- �ڷ� ����
UPDATE student SET pnumber =302 WHERE snumber =20211238;

-- ���� (ORDER BY �÷��� �������� ASC(��������) �������� DESC)
SELECT * FROM student
ORDER BY age; --(�⺻ ASC)

SELECT * FROM student
ORDER BY age DESC;

SELECT * FROM student
ORDER BY sname ASC;

-- NULL�� �ڷḦ ã�� ���� IS NULL / IS NOT NULL
-- �ּҰ� ���� �ڷḦ �˻��Ͻÿ�
SELECT * FROM student
WHERE address IS NULL;

SELECT * FROM student
WHERE address IS NOT NULL;


-- ���̺� ����
-- �л��̸� ���� ���� ���� �����̸�
-- SELECT sname, age, gender, cname from student;
SELECT 
    st.sname as �л��̸�, 
    st.age as ����, 
    st.gender as ����, 
    st.cname as ����, 
    pr.pname as ����
FROM student st, professor pr -- Cartesian Product (īƼ�þ� ��) 5*5=25
-- �߻������� ��� ����� ���� ���� ��µǴ� ��
-- N ���� ���� ���� ���̺�� M ���� ���� ���� ���̺��� īƼ�þ� ���� N*M �� �Ǵ°���!
-- �� ������ ���� ������ ������ ����̰ų� ���� ������ �������� ��� �߻��մϴ�.
WHERE st.pnumber = pr.pnumber -- �⺻Ű ����
ORDER BY st.sname;

-- �׷��Լ� �Ǵ� �����Լ� y=f(X) x�� y�����Ѵ� y�� x�� ���ӵȴ�. 
-- �л��� ���� ����Ͻÿ�
SELECT COUNT(*) �л��� 
FROM student;

SELECT COUNT(sname) �л��� 
FROM student;

-- �л� ������ ��� ���ϱ�
SELECT AVG(age) ��ճ���, MAX (age) �ְ���, MIN (age) ��������
FROM student;





-- ������ NULL�� �л� ����
DELETE FROM student
Where point IS NULL;


-- �л���, �������  
SELECT COUNT(*) �л���, AVG (point) �������
FROM student;

-- ������ 4 �̻��̰� ������ ������ �л��� �˻��Ͻÿ� 
SELECT * 
FROM student
WHERE point >= 4.0 AND gender = '��';


-- �л��̸�, ����, ����, �а���, �а���ȭ��ȣ, ���� ��� -> �� �л��� ������? join
SELECT 
    st.sname �л��̸�, 
    st.gender ����, 
    st.point ����, 
    cl.cname �а���, 
    cl.ctel �а���ȭ��ȣ,
    pr.pname ����
FROM student st, class cl, professor pr
WHERE point >= 4.0 AND gender = '��'
    AND st.cname = cl.cname
    AND st.pnumber = pr.pnumber;

-- �а��� ���� ��� : �׷����� ��� (GROUP BY ���� ���)
SELECT cname �а���, AVG(point) �������  --�׷������ ���� �ݵ�� �׷��� �÷����� ���ش�! 
FROM student
GROUP BY cname;

-- �а��� ���� ��� : ���� 4.0 �̸��� �ڷ�
SELECT cname �а���, AVG(point) �������  
FROM student
GROUP BY cname
HAVING AVG(point) < 4.0; -- GROUP BY�� �������� HAVING  (�׷쿡�� ���� ���� ���������̴�)


-- ���� ���� ����� ���Ͻÿ�


DESC student;

DELETE FROM student;

