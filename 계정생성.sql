ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

DROP USER jjang052 CASCADE;

CREATE USER jjang052 IDENTIFIED BY 1234;

GRANT resource,CREATE SESSION, CREATE TABLE TO jjang052;

ALTER USER jjang052 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;