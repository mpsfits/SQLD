-- ���� ���̺� (�����̼�)
CREATE TABLE professor(
    pnumber NUMBER(3)   PRIMARY KEY,
    pname   VARCHAR2(20)  NOT NULL,
    major   VARCHAR2(30)  NOT NULL
);

-- �ڷἳ�� (���İ� �ٸ� ORDER BY �÷��� DESC;)
DESC professor; 

-- ���� �ڷ� ����
INSERT INTO professor(pnumber, pname, major) VALUES (301, '����ö', '�����ͺ��̽�');
INSERT INTO professor(pnumber, pname, major) VALUES (401, '�۹̿�', 'ȭ�� ����');
INSERT INTO professor(pnumber, pname, major) VALUES (501, '������', '������� ����');
INSERT INTO professor(pnumber, pname, major) VALUES (302, '����â', '�����ͺ��̽�');
INSERT INTO professor(pnumber, pname, major) VALUES (601, '����', '������� ����');

-- ���� �ڷ� ����
DELETE FROM professor WHERE major = '�����ͺ���Ʈ'; 

-- ���� �ڷ� �˻�
SELECT pnumber, pname, major FROM professor;

-- '�۹̿�' ������ ������ �˻��Ͻÿ� (WHERE) (�÷��� : ����)
SELECT pname ����, major as ���� FROM professor WHERE pnumber =401;

-- ���ڿ� �˻� (%������) 
-- ������ 'ȭ�� ����'�� �ڷḦ �˻��Ͻÿ�
SELECT * FROM professor WHERE major ='ȭ�� ����'; 

-- ������ '����'�� ���Ե� �ڷḦ �˻��Ͻÿ�
SELECT * FROM professor WHERE major LIKE '%����%'; 

-- ���� ������ ��� �˻��Ͻÿ�
-- �ߺ��� �������� ���� Ű���� (DISTINCT)
SELECT DISTINCT major FROM professor;

-- SELECT COUNT (T_DEPT) AS "��ü ����",
-- COUNT (DISTINCT(T_DEPT)) AS "�ߺ� ����"
-- FROM TEST_USER;

-- OR ���� ���, IN(��,��)�Լ� ���
-- ������ '�����ͺ��̽�' �Ǵ�(Ȥ��) 'ȭ�а���'�� �ڷḦ �˻��Ͻÿ�
SELECT * FROM professor
WHERE major ='�����ͺ��̽�' OR major = 'ȭ�а���';

SELECT * FROM professor
WHERE major IN('�����ͺ��̽�', 'ȭ�а���');

SELECT * FROM professor
WHERE major NOT IN('�����ͺ��̽�', 'ȭ�а���'); -- ���Ե��� �ʴ� �� 

-- �ڷ� ���� (UPDATE ���̺�� SET �÷��� ='~' WHERE �⺻Ű = ; 
UPDATE professor SET major = 'ȭ�а���' WHERE pnumber =401;
UPDATE professor SET major = '������а���' WHERE pnumber =501;
UPDATE professor SET major = '������а���' WHERE pnumber =601;

-- �ڷ� ����
DELETE FROM professor 
WHERE pnumber = 301; -- ���� ���Ἲ�� ���� �ڽ��� ���� ���ִ� �ڷ�� �θ� �ڷᰡ ���� �ȵ� (�ڽ��� ���� �θ�� ������ �ȵ�)  

-- Ŀ�� �Ϸ� �ؾ� ����� (�۾������� �Ϸ�� ����, Ʈ������)
COMMIT;
