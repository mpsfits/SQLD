--member ���̺� ����
CREATE TABLE member(
  name varchar2(20),
  age number(3),
  phone varchar2(15)
);
-- �ڷ� �߰�(INSERT ���̺� �̸� INTO VALUES (��))
INSERT INTO member VALUES ('ȫ�浿', 31, '010-1234-5678');
INSERT INTO member VALUES ('����', 17, '010-1234-6789');

-- �ڷ� �˻� (SELECT �Ӽ��̸� �Ǵ� ���̸� FROM ���̺��̸�)
SELECT * FROM member;
SELECT name, phone FROM member;

-- Ư���� �ڷ� �˻� (Where ������)
SELECT * FROM member WHERE name ='ȫ�浿';

-- �ڷ���� (UPDATE ���̺� SET �Ӽ�����)
UPDATE member SET name ='ȫ���' WHERE name ='ȫ�浿';

SELECT * FROM member;

-- �ڷ� ���� (DELETE FROM ���̺� �̸� WHERE��)
DELETE FROM member WHERE name ='ȫ���';

ROLLBACK;

COMMIT;

--drop ���̺� ����
DROP TABLE member;