-- ����, ����,  ��Ű�� (�����ͺ��̽�)
-- �ý��ۿ� ���� DCL ���̺��� ���� ����� �� �ƴϴ�...  

SHOW USER;

-- ���� �����
CREATE USER c##sqld IDENTIFIED BY sqld --����, ��й�ȣ (ȸ�� ���Խ� ���̵�� ���)
DEFAULT TABLESPACE USERS --������ ���� (�������)
TEMPORARY TABLESPACE TEMP; -- c##sqld 

--���Ѻο�
GRANT CONNECT, DBA TO c##sqld; -- c##sqld ���� DBadmin ������ ���� ���� �ο� ����Ŭ������ ����ϹǷ� ����صα�


