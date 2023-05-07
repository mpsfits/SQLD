
-- ROWNUM ������ ���س��� ����Ŭ�� �����÷� (SUDO COLUMN) ���� �÷� ����...
CREATE TABLE ex_score(
    name VARCHAR2(10),
    score NUMBER
);

INSERT INTO ex_score VALUES ('�ֿ�', 94);
INSERT INTO ex_score VALUES ('������', 100);
INSERT INTO ex_score VALUES ('������', 97);
INSERT INTO ex_score VALUES ('������', 77);
INSERT INTO ex_score VALUES ('�̼���', 87);
INSERT INTO ex_score VALUES ('�ڵ���', 91);
INSERT INTO ex_score VALUES ('����ȣ', 66);
INSERT INTO ex_score VALUES ('��ä��', 85);
INSERT INTO ex_score VALUES ('������', 80);

SELECT * FROM ex_score;

COMMIT;

-- ������ ���� ������ 5�� �˻��ϱ� (�߸��� ���)
-- �� 77���� 5���ΰ�? 
SELECT ROWNUM, NAME, SCORE
    FROM ex_score 
WHERE ROWNUM <=5
ORDER BY score DESC;

-- ������ ���� ������ 5�� �˻��ϱ� (�ùٸ� ���)
-- �������� (�ζ��� ��)
-- ��ü ���� �� 5���� ����  
SELECT * FROM(
SELECT ROWNUM, NAME, SCORE
    FROM ex_score 
ORDER BY score DESC
) WHERE ROWNUM <=5;

-- �Խñ��� ROWNUM�� ����Ͽ� ������ ���� (10�� �˻�)
-- ROWNUM�� �ݵ�� 1�� �����ؾ� �� 
SELECT ROWNUM, bno, title, content, regdate
FROM board
-- WHERE ROWNUM >0 AND ROWNUM <= 10;
-- WHERE ROWNUM >10 AND ROWNUM <= 20; ������ ROWNUM�� �ݵ�� 1�� �����ؾ� �� 

-- �Խñ��� ������ ó�� (11~20�� �˻�)
--SELECT ROWNUM ��Ī ��� �ؾ� ������ ����!!
SELECT * FROM
(SELECT ROWNUM rn, bno, title, content, regdate
    FROM board)
WHERE rn >10 AND rn <= 20;  --rn �̶�� ��Ī ���

-- INDEX ���� ����
-- �����Ͱ� ���鸸������ �þ�� ORDER BY �ð��� ���� �ɸ�
-- �׷��� INDEX ����Ѵ�.
SELECT * FROM board ORDER BY regdate DESC; -- �Խñ��� �ֽ� ���� ���� ����

-- �ε��� : �����Ͱ� ���鸸������ �þ �� ����ϸ� �ð��� ª�� �ɸ�
-- CREATE INDEX �ε��� �̸� ON ���̺�� (�÷���)
-- �ۼ����� '������'�� �̸��� �ε����� �����
DROP INDEX idx_admin;

SELECT * FROM board WHERE writer ='������';  -- �ȵɼ��ִ� FULL SCAN���� �ٲ� �� �� �־� RANGE SCAN�ȳ���

CREATE INDEX idx_writer ON board(writer); -- �ȸ�������� DROP �ε��� ����

-- ��Ʈ ���� - �ǹ� ���
-- /*+ INDEX (���̺�� �ε�����) */
-- ��Ʈ ����ϸ� �� ��Ȯ��
SELECT /*+ INDEX(board idx_writer) */ * FROM board 
WHERE writer ='������'; 

-- ��Ƽ������ ���� ��ȹ ���� - ��ü ��ȸ �ڵ�
SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST'));

















