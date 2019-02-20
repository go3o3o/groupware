-- Check user name is MS_ADMIN
SHOW USER;

@createTable_company.sql 
@createTable_document.sql 
@createTable_board.sql 

SELECT * FROM TAB;
PURGE RECYCLEBIN;

GRANT REFERENCES ON EMPLOYEE TO SYSTEM; 

SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'COMPANY';
SELECT * FROM SYSTEM.AUTHORITY;
