-- NTILE() �Լ� : �־��� ����ŭ ����� N����� �� �����࿡ �ش�Ǵ� ����� ���Ѵ�.
CREATE TABLE exam_score(
    �̸� VARCHAR(20),
    ���� NUMBER,
    ���� NUMBER,
    ���� NUMBER
);

INSERT INTO exam_score VALUES ('�����', 116, 77, 75);
INSERT INTO exam_score VALUES ('�ں���', 101, 69, 80);
INSERT INTO exam_score VALUES ('������', 118, 62, 60);
INSERT INTO exam_score VALUES ('���ϴ�', 100, 72, 70);
INSERT INTO exam_score VALUES ('��ȿ��', 100, 77, 55);
INSERT INTO exam_score VALUES ('���缮', 78, 66, 61);
INSERT INTO exam_score VALUES ('�ŵ���', 85, 72, 75);
INSERT INTO exam_score VALUES ('������', 99, 70, 53);
INSERT INTO exam_score VALUES ('������', 105, 75, 69);
INSERT INTO exam_score VALUES ('�赿��', 117, 68, 73);

SELECT * FROM exam_score;

-- ���� ��� �˻�
SELECT �̸�, 
       ����,
       NTILE(8) OVER (ORDER BY ���� DESC) ������  -- RANK OVER ������ �Լ� 
FROM exam_score;

-- '������'�� ���� 9���� ���
SELECT �̸�, 
       ����,
       NTILE(8) OVER (ORDER BY ���� DESC) ������  -- RANK OVER ������ �Լ� 
FROM exam_score
WHERE �̸� <> '������';  --�������� �ƴѰ�

-- ��ü ���� ��� �˻�
SELECT �̸�, 
       ����,
       NTILE(8) OVER (ORDER BY ���� DESC) ������,  -- RANK OVER ������ �Լ� 
       ����,
       NTILE(8) OVER (ORDER BY ���� DESC) ���е��,
       ����,
       NTILE(8) OVER (ORDER BY ���� DESC) ������
FROM exam_score;

-- ���� �˻�
-- �Լ��̸� (�Ű�����) : NTILE() �Լ��� ������ ()�� ���� /order by�� �Լ��� �ƴ�
-- RANK() : �ŰԺ����� ���� �Լ���
SELECT �̸�, 
       ����,
       RANK() OVER (ORDER BY ���� DESC) RANK,
       DENSE_RANK() OVER (ORDER BY ���� DESC) DENSE_RANK,
       ROW_NUMBER() OVER (ORDER BY ���� DESC) ROW_NUMBER_RANK  -- RANK()�Ű����� ���� OVER ������ �Լ� 
FROM exam_score;

-- ������ ���ϱ�
-- �ֹ����̺� 
CREATE TABLE t_order(
    order_date DATE,
    order_cnt  NUMBER
);

INSERT INTO t_order VALUES ('20210801', 10);
INSERT INTO t_order VALUES ('20210802', 12);
INSERT INTO t_order VALUES ('20210803', 6);
INSERT INTO t_order VALUES ('20210804', 8);
INSERT INTO t_order VALUES ('20210805', 10);

SELECT * FROM t_order;


-- �ֹ��Ϻ� �ֹ������� ���� �հ�
SELECT order_date, 
       order_cnt,
       SUM(order_cnt) OVER(ORDER BY order_date) AS SUM
    FROM t_order;

-- �ֹ��Ϻ� �ֹ������� �����հ� (��������)
-- WINDOWING ()���ÿ�� : ROWS RANGE 
-- UNBOUNDED PRECEDING (ù ��), UNBOUNDED FOLLOWING (��������)
-- CURRENT ROW (���� ��ġ�� ��������)

-- SELECT WINDOW_FUNCTION (ARGUMENTS) �Ű�����
-- OVER (PARTITION BY Į��
-- OVER BY WINDOWING��)
        
-- ��Ƽ�Ǻ��� ���� ������ ����� ���� �ȴ� ��찡 �ִ�. 

SELECT order_date, 
       order_cnt,
       SUM(order_cnt) OVER(ORDER BY order_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS SUM
    FROM t_order;

-- �ֹ��Ϻ� �ֹ������� �����հ� (��������)

SELECT order_date, 
       order_cnt,
       SUM(order_cnt) OVER(ORDER BY order_date
            ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS SUM
    FROM t_order;


DROP TABLE exam_score;


















