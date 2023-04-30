-- ������ �Ϸù�ȣ - ������ ������ ����� �����Ͽ� �� 10�� 1������ / �� 5�� ������
-- ��ȸ�Ǵ� ��� ����
-- �ζ��� ��� ���������� �ؾ� ��
-- �ǹ����� ��� p.160 ������ 
-- �Խ��� ���� �� ���

-- �Խ��� ���̺� ����
CREATE TABLE board(
    bno NUMBER(5) PRIMARY KEY,      -- �۹�ȣ
    title VARCHAR2(200) NOT NULL,   -- ������ ���ڼ��� �ȸ´°� �����Ƿ� �־���� �� VARCHAR2(200
    writer VARCHAR2(20) NOT NULL,   --�۾���
    content VARCHAR2(2000) NOT NULL, -- �۳���
    regdate DATE DEFAULT SYSDATE     -- �ۼ��� -- sysdate �ڵ����� �����ǹǷ� �����Ϳ��� �Ƚᵵ ��)
);

CREATE SEQUENCE seq; -- �䰰�� ��ü, ������ ����

INSERT INTO board (bno, title, writer, content)
VALUES (seq.NEXTVAL, '�����λ�', '��ȸ��', '�ȳ��ϼ���, �����λ� �帳�ϴ�');
INSERT INTO board (bno, title, writer, content)
VALUES (seq.NEXTVAL, '��������', '������', '���������� �˷� �帳�ϴ�');
INSERT INTO board (bno, title, writer, content)
VALUES (seq.NEXTVAL, '���� �Ϸ�', '��ȸ��', '���� �Ϸ� �Ǽ���');


-- ������ ��ͺ��� : ���ϱ޼��� ���� : INSERT ~ INTO ~ (SELECT FROM ~)
INSERT INTO board (bno, title, writer, content)
(SELECT seq.NEXTVAL, title, writer, content FROM board);


-- 4�� �Խñ� �����ϱ�  ��ȣ�� �������� ����  ROWNUM �ʿ�
DELETE FROM board WHERE bno = 4;


--ROWNUM ��� : ROWNUM�� �ݵ�� 1�� ���� �� : ��ø���� inline �� �ʿ�
SELECT ROWNUM, bno, title, content
FROM board
-- WHERE ROWNUM > 10 AND ROWNUM <= 20 ; --  ROWNUM�� �ݵ�� 1�� ���� �� �˻� �ȵ�
WHERE ROWNUM > 1 AND ROWNUM <= 10;

-- �ζ��κ� �μ�����
-- ��Ī�� ����ϸ� �˻��� ��

SELECT *
FROM 
    (SELECT ROWNUM rn, bno, title, content -- ROWNUM�� ��Ī�� ����ϸ� �˻��� ��
     FROM board)
WHERE rn > 20 AND rn <= 30;

-- ROWID : ������Ʈ��ȣ, ��� ���Ϲ�ȣ, ��Ϲ�ȣ, �����͹�ȣ�� ������
-- �����͸� ������ �� �ִ� ������ ����
SELECT ROWID, bno, title FROM board;

SELECT * 
FROM board 
WHERE ROWID ='AAAStUAAHAAAAGcAAB';

SELECT * FROM board 
WHERE writer = '������';

--�ε��� ����
-- �ε��� ���� ��ĵ RANGE SCAN
CREATE INDEX idx_admin ON board(writer);

-- �ε��� ����
DROP INDEX idx_admin;

















-- �ε��� ����











