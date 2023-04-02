-- �⺻Ű ���� ���� --constraint ��������
CREATE TABLE login(
    id VARCHAR2(10),
    passwd VARCHAR2(10) NOT NULL,
    PRIMARY KEY(id)
);

-- �ڷ� ����
INSERT INTO login VALUES ('sky2023', '1234abc');
INSERT INTO login VALUES ('sky2023', '1234789'); -- ����ũ ���� �⺻Ű�� ���� ������ ���Ἲ ���� / ��ü���Ἲ (cf. ���迡�� ���Ἲ�� �������Ἲ)
INSERT INTO login VALUES ('moon', '12345678', '�����ٶ󸶹ٻ�'); -- 3����Ʈ /-> 30���� �ٲ�
INSERT INTO login (id, passwd, name, create_date)
VALUES ('moon4', 'qwer', 'abc', SYSDATE); --���̶�
INSERT INTO login (id, passwd, name, create_date)
VALUES ('moon5', 'abc', 'abc', SYSDATE); --���̶�

-- �ڷ� �˻�
SELECT * FROM login; 
SELECT id, name FROM login;


-- �ڷ� ���� (UPDATE ���̺� �̸� SET �÷��Ӽ� WHERE ��)
-- �̸��� 'abc'�� �ڷḦ 'def'�� �����ϱ�
UPDATE login 
SET name = 'def'
WHERE id = 'moon3';

-- �ڷ���� (DELET FROM ���̺��̸� WHERE��) �⺻Ű�� Ư���ϸ� 
DELETE from login; -- ���� ���� Ŀ�� �� �ϱ��� ���� �����ϸ鼭 Ŀ���� �� : delete �� ROLLBACK; 

ROLLBACK;


-- �����ϱ� (ASC, DESC) ���������� ��� NULL �� ���� ������ ��
-- ó������ : 1. FROM�� 2. WHERE�� 3. SELECT�� 4. ORDER BY�� (���� ������)
SELECT * 
FROM login 
ORDER BY create_date; -- ASC ����Ʈ

SELECT * FROM login ORDER BY create_date DESC; -- �������� �� NULL ����

-- Ư�� �ڷ� �˻� (WHERE��)
-- id�� 'moon'�� �ڷ� �˻� ���� �⺻Ű�� ã�� : ��ɾ� ���� �߿� ���̺��� ã�� FROM -> WHERE ���� ã�� -> SELECT cf) ���� ������ 

SELECT * 
from login 
WHERE id = 'moon'; -- ���� �⺻Ű�� ã��


-- Į�� �߰� (�Ӽ��� ���� �߰�) : ������� �����ϴ� ��쵵 �� �� �ְ�, 
ALTER TABLE login ADD name VARCHAR2(20);
ALTER TABLE login ADD create_date DATE;

-- �÷� ����
ALTER TABLE login MODIFY name VARCHAR2(30);

-- ���̺��� ��������
DESC login;


