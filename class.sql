--�а�, �л�, ���̺� �����
CREATE TABLE class(
    --�÷��̸�, �ڷ���
    cname VARCHAR2(30),     --�а���(�⺻Ű)
    ctel VARCHAR2(20),      --�а� ��ȭ��ȣ
    rocation VARCHAR2(20),  --���繫��
    PRIMARY KEY(cname)
);

-- �а� �ڷ� ����
INSERT INTO class VALUES ('����Ʈ�����а�', '02-1234-1234', 'B�� 3��');
INSERT INTO class VALUES ('ȭ�а��а�', '02-1234-4567', 'B�� 4��');
INSERT INTO class VALUES ('�������ڰ��а�', '02-1234-5678', 'B�� 5��');
-- INSERT INTO class VALUES ('ȭ�а��а�', '02-1111-2222', 'B�� 6��'); ���Ἲ ���� ���� �� �⺻Ű ���� (�⺻Ű�� �ߺ��Ǹ� �ȵ�)

-- �ڷ� ����
DELETE FROM class WHERE cname ='�������ڰ���'; -- �������ڰ����̶�� �� �Ἥ ���̺� �ڷᰡ �־����� ������

-- �а� �ڷ� �˻�
SELECT * FROM class;

-- �а��� �������ڰ��а��� ��ȭ��ȣ�� �˻��Ͻÿ�
SELECT cname as �а��̸�, ctel as �а���ȭ��ȣ from class WHERE cname = '�������ڰ���';