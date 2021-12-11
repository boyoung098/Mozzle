-- 캘린더 테이블 생성
CREATE TABLE SCHEDULES(
	SCHEDULES_ID NUMBER NOT NULL,
	MOZZLE_ID VARCHAR2(20) NOT NULL,
	WRITER VARCHAR2(200) NOT NULL,
	SCHEDULES_TITLE VARCHAR2(200) NOT NULL,
	SCHEDULES_CONTENT VARCHAR2(2000),
	SCHEDULES_LOCATION VARCHAR2(2000),
	SCHEDULES_DATE VARCHAR2(2000),
	SCHEDULES_REGDATE DATE NOT NULL,
	SCHEDULES_DELFLAG CHAR(1) NOT NULL
);    
--시퀀스
CREATE SEQUENCE SCHEDULES_ID_SEQ START WITH 1 INCREMENT BY 1;
DROP TABLE SCHEDULES;
DROP SEQUENCE SCHEDULES_ID_SEQ;
--제약조건
--PK
ALTER TABLE SCHEDULES ADD CONSTRAINT SCHEDULES_PK PRIMARY KEY(SCHEDULES_ID);
ALTER TABLE SCHEDULES DROP CONSTRAINT SCHEDULES_PK;
--FK
ALTER TABLE SCHEDULES ADD CONSTRAINT MOZZLE_ID_FK FOREIGN KEY(MOZZLE_ID) REFERENCES MOZZLE(MOZZLE_ID);

--시퀀스/모즐아이디(숫자) 작성자 타이틀 내용 날짜 SYSDATE 위치 DELFLAG
INSERT INTO SCHEDULES (SCHEDULES_ID,MOZZLE_ID,
	WRITER,SCHEDULES_TITLE,SCHEDULES_CONTENT,
	SCHEDULES_LOCATION,
	SCHEDULES_DATE,SCHEDULES_REGDATE,
	SCHEDULES_DELFLAG) 
	VALUES(SCHEDULES_ID_SEQ.NEXTVAL,'ID',
		'작성자4','테스트','내용4',
		'위치4',TO_DATE('2021-11-28','yyyy-MM-dd'),SYSDATE,
		'N');

--업데이트
UPDATE SCHEDULES
SET SCHEDULES_CONTENT='수정된컨텐츠',SCHEDULES_LOCATION='수정된위치',
SCHEDULES_DATE = TO_DATE('2021-11-28','yyyy-MM-dd')
WHERE SCHEDULES_ID = '2';

--일정검색
SELECT SCHEDULES_ID,WRITER,SCHEDULES_TITLE,SCHEDULES_CONTENT,
SCHEDULES_LOCATION,SCHEDULES_DATE,SCHEDULES_REGDATE,SCHEDULES_DELFLAG FROM SCHEDULES
WHERE SCHEDULES_TITLE LIKE '%테%';

--전체검색
SELECT SCHEDULES_ID,WRITER,SCHEDULES_TITLE,SCHEDULES_CONTENT,
SCHEDULES_LOCATION,SCHEDULES_DATE,SCHEDULES_REGDATE,SCHEDULES_DELFLAG FROM SCHEDULES

--일정삭제 (UPDATE DELFALG Y로 변경)
UPDATE SCHEDULES  SET SCHEDULES_DELFLAG ='Y'
   WHERE SCHEDULES_ID = '2';
--일정삭제(완전삭제)
DELETE FROM SCHEDULES
   WHERE SCHEDULES_ID = '4';

SELECT * FROM SCHEDULES;