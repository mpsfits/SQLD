-- 계정, 유저,  스키마 (데이터베이스)
-- 시스템에 제어 DCL 테이블을 많이 만드는 거 아니다...  

SHOW USER;

-- 계정 만들기
CREATE USER c##sqld IDENTIFIED BY sqld --계정, 비밀번호 (회원 가입시 아이디와 비번)
DEFAULT TABLESPACE USERS --계정의 공간 (저장공간)
TEMPORARY TABLESPACE TEMP; -- c##sqld 

--권한부여
GRANT CONNECT, DBA TO c##sqld; -- c##sqld 에게 DBadmin 관리자 권한 연결 부여 오라클에서만 사용하므로 기억해두기


