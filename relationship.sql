-- �μ��� ��� ���̺� ����
CREATE TABLE dapartment (
    deptid      NUMBER, --  ���� PRIMARY KEY ���൵ ��
    deptname    VARCHAR2(20) NOT NULL,
    loc_office  VARCHAR2(20) NOT NULL,
    PRIMARY KEY(deptid) -- NOT NULL �����൵ ��
);

CREATE TABLE employee(
    empid       NUMBER,
    empname     VARCHAR2(20) NOT NULL,
    age         NUMBER,
    deptid       NUMBER NOT NULL, --NOT NULL,����� �ܷ�Ű ���� ���� ����
    CONSTRAINT emp_fk FOREIGN KEY(deptid) -- emp_fk �̸��� ����� ������ ����
    REFERENCES dapartment(deptid) ON DELETE CASCADE -- ���������� ���� �����ϵ��� 
);

-- �μ��ڷ� �߰�
INSERT INTO dapartment VALUES (10, '������', '����');
INSERT INTO dapartment VALUES (20, '�ѹ���', '��õ');

-- ��� �ڷ� �߰�
INSERT INTO employee VALUES (101,'�̰�', 27, 10);
INSERT INTO employee VALUES (102,'���', 28, 20);
INSERT INTO employee VALUES (103,'����', 31, 30); --�Ǽ��� ���̱� ���� ������ �ɾ �μ��� 30 ���� ������ ������ �ȵ� / ���� ���Ἲ ����

-- �μ� ���� : �μ��ڵ� 20���� �μ� ���� Where ��
DELETE FROM dapartment WHERE deptid = 20; -- �θ�� �ڽİ� ����Ǿ� �θ� ���� �Ұ���  �ٸ� �ڽ����� �����ϸ� ����  : ȸ��Ż��� ��۵� ����

-- �ڷ� �˻�
SELECT * from dapartment;
SELECT * from employee;

DROP TABLE dapartment; -- �θ� �־� ���� �ȵ�
DROP TABLE employee;

