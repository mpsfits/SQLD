-- TCL (Ʈ������) 
CREATE TABLE tcl_test(
    c1 NUMBER (2),
    c2 NUMBER (3)
);

SAVEPOINT t1; -- t1�����϶�
INSERT INTO tcl_test VALUES (10,100); -- t1
SAVEPOINT t2; -- t2�����϶�
INSERT INTO tcl_test VALUES (20,200); -- t2
ROLLBACK TO t2;   -- ��� ��, t2�� �������� ���� 
COMMIT; -- ���Ӽ��Ǿ� t1���� ����
SELECT * FROM tcl_test; -- t1�� ������


SELECT * FROM tcl_test;

-- DROP TABLE tcl_test; ���̺� ����