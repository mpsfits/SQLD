-- ���� ����
CREATE TABLE ex3(
    column1   VARCHAR2(10),
    column2   VARCHAR2(10) NOT NULL
);

-- ���� �Է� �� Ȭ����ǥ 
-- INSERT INTO ex3 VALUES ('HELLO', '');
-- INSERT INTO ex3 VALUES ('', '�ȳ�');
-- INSERT INTO ex3(column1) VALUES ('HELLO', 'good'); ���� ���� �ʹ� ����
INSERT INTO ex3 VALUES ('HELLO'); -- ���� ���� ������� �ʴ�.

SELECT * FROM ex3;

