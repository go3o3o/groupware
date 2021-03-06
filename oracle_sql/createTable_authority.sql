-- Check user name is MS_AUTHORITY
SHOW USER;

CREATE TABLE AUTHORITY (
	EMP_NO VARCHAR2(14),		-- 사원번호 FK
	AUT_NOTICE NUMBER(1),		-- 공지사항 권한 여부
	AUT_HR NUMBER(1),			-- 인사시스템 권한 여부
	AUT_DEPT NUMBER(1),			-- 부서관리 권한 여부
	AUT_IN DATE,				-- 입력일자 
	AUT_UP DATE,				-- 수정일자
	AUT_DE DATE,				-- 삭제일자 
	CONSTRAINT AUT_FK_EMP FOREIGN KEY(EMP_NO) REFERENCES MS_ADMIN.EMPLOYEE(EMP_NO)
);

GRANT SELECT ON AUTHORITY TO MS_ADMIN;
GRANT INSERT ON AUTHORITY TO MS_ADMIN;