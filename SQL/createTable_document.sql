
-- 15. 전자결재 문서구분 테이블 생성
CREATE TABLE ED_TYPE (
	DT_NO NUMBER(2),				-- 문서구분번호 PK
	DT_NM VARCHAR2(10),				-- 문서구분명
	CONSTRAINT DT_PK PRIMARY KEY(DT_NO)
);

-- 17. 전자결재 상태 테이블 생성
CREATE TABLE ED_STATUS (
	ED_ST_NO NUMBER(2),				-- 상태번호 PK
	ED_ST_NM VARCHAR2(8),			-- 상태명
	CONSTRAINT ED_ST_PK PRIMARY KEY(ED_ST_NO)
);

--  16. 전자결재 테이블 생성
CREATE TABLE DOCUMENT (
	ED_NO VARCHAR2(14),				-- 전자결재번호 PK
	EMP_NO VARCHAR2(14),			-- 현결재자 사원번호 FK
	DT_NO NUMBER(2),				-- 문서구분번호 FK
	ED_ST_NO NUMBER(2),				-- 상태번호 FK
	ED_TITLE VARCHAR2(100),			-- 문서제목
	ED_CONTENT VARCHAR2(4000),		-- 문서내용
	ED_FILE VARCHAR2(200),			-- 파일첨부
	ED_EMER NUMBER(1),				-- 긴급여부
	ED_DIRECT NUMBER(1),			-- 전결여부
	ED_OPEN NUMBER(2),				-- 공개구분
	PER_LINE_CNT NUMBER,			-- 결재선 총 라인수
	PER_CUR_NO NUMBER,				-- 현결재자 라인
	ED_IN DATE,						-- 작성일자
	IS_PER NUMBER(1),				-- 승인요청 여부
	CONSTRAINT ED_PK PRIMARY KEY(ED_NO),		
	CONSTRAINT ED_FK_EMP FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
	CONSTRAINT ED_FK_DT FOREIGN KEY(DT_NO) REFERENCES ED_TYPE(DT_NO),
	CONSTRAINT ED_FK_ED_ST FOREIGN KEY(ED_ST_NO) REFERENCES ED_STATUS(ED_ST_NO)
);

-- 전자결재번호 생성용 시퀀스
CREATE SEQUENCE ED_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 100000000;

-- 18. 전자결재라인 테이블 생성
CREATE TABLE ED_PERMISSION (
	PER_SEQ NUMBER,					-- 전자결재라인 시퀀스 PK
	ED_NO VARCHAR2(14),				-- 전자결재번호 FK
	PER_NO VARCHAR2(14),			-- 결재자 사원번호
	PER_FOCUS NUMBER(1),			-- 지정라인
	IS_PER NUMBER(1),				-- 승인요청여부
	PER_RESULT NUMBER(1),			-- 승인결과
	PER_DT DATE,					-- 승인일자
	PER_COMMENT VARCHAR2(1000),		-- 코멘트
	CONSTRAINT PER_PK PRIMARY KEY(PER_SEQ),
	CONSTRAINT PER_FK_ED FOREIGN KEY(ED_NO) REFERENCES DOCUMENT(ED_NO)
);

-- 전자결재라인 시퀀스 생성
CREATE SEQUENCE PER_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 100000000;

-- 19. 전자결재참조 테이블 생성
CREATE TABLE ED_REFERENCE (
	REF_SEQ NUMBER,					-- 전자결재참조 시퀀스
	ED_NO VARCHAR2(14),				-- 전자결재번호 FK
	REF_NO VARCHAR2(14),			-- 참조자 번호
	CONSTRAINT REF_PK PRIMARY KEY(REF_SEQ),
	CONSTRAINT REF_FK_ED FOREIGN KEY(ED_NO) REFERENCES DOCUMENT(ED_NO)
);

-- 전자결재참조 시퀀스 생성
CREATE SEQUENCE REF_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 100000000;
