SHOW USER;

CREATE USER c##sqld IDENTIFIED BY sqld -- ��� sqld
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, DBA TO c##sqld;