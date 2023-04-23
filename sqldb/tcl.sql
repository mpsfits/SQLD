-- TCL (트랜젝션) 
CREATE TABLE tcl_test(
    c1 NUMBER (2),
    c2 NUMBER (3)
);

SAVEPOINT t1; -- t1저장하라
INSERT INTO tcl_test VALUES (10,100); -- t1
SAVEPOINT t2; -- t2저장하라
INSERT INTO tcl_test VALUES (20,200); -- t2
ROLLBACK TO t2;   -- 취소 단, t2는 저장하지 마라 
COMMIT; -- 연속성되어 t1까지 저장
SELECT * FROM tcl_test; -- t1만 보여줌


SELECT * FROM tcl_test;

-- DROP TABLE tcl_test; 테이블 삭제