--일정리스트
SELECT S.SCHEDULE_ID,S.WRITER,S.TITLE,S.CONTENT,
		S.SCHEDULE_DATE ,S.REGDATE, si.LOCATION_NAME, si.ADDRESS, si.ADDRESS2, si.PHONE
		FROM SCHEDULES S
		INNER JOIN SCHEDULE_INFO si
		ON S.LOCATION_CODE = si.LOCATION_CODE;
INSERT INTO SCHEDULES
	(SCHEDULE_ID, MOZZLE_ID, WRITER, TITLE, CONTENT, SCHEDULE_DATE, REGDATE, LOCATION_CODE)
	VALUES(SCHEDULE_SEQ.NEXTVAL, 1 , '작성자1', 'TITLE1', 'CONTENT1', '202112251207', SYSDATE, 21)
	
	
--일정등록
INSERT INTO SCHEDULE_INFO
	(LOCATION_CODE ,LOCATION_NAME ,ADDRESS ,ADDRESS2 ,PHONE ,LOGUI ,LAT)
	VALUES(SCHEDULE_INFO_SEQ.NEXTVAL,'경기도','주소1','주소2','010-1111-1111',37.567896,126.9786567);
INSERT INTO SCHEDULE_INFO
	(LOCATION_CODE ,LOCATION_NAME ,ADDRESS ,ADDRESS2 ,PHONE ,LOGUI ,LAT)
	VALUES(SCHEDULE_INFO_SEQ.NEXTVAL,'부천시','주소1','주소2','010-2222-2222',37.567896,126.9786567);
INSERT INTO SCHEDULE_INFO
	(LOCATION_CODE ,LOCATION_NAME ,ADDRESS ,ADDRESS2 ,PHONE ,LOGUI ,LAT)
	VALUES(SCHEDULE_INFO_SEQ.NEXTVAL,'수원시','주소1','주소2','010-3333-3333',37.567896,126.9786567);
INSERT INTO SCHEDULE_INFO
	(LOCATION_CODE ,LOCATION_NAME ,ADDRESS ,ADDRESS2 ,PHONE ,LOGUI ,LAT)
	VALUES(SCHEDULE_INFO_SEQ.NEXTVAL,'서울','주소1','주소2','010-9999-9999',37.567896,126.9786567);
INSERT INTO SCHEDULE_INFO
	(LOCATION_CODE ,LOCATION_NAME ,ADDRESS ,ADDRESS2 ,PHONE ,LOGUI ,LAT)
	VALUES(SCHEDULE_INFO_SEQ.NEXTVAL,'인천','주소1','주소2','010-6666-6666',37.567896,126.9786567);
INSERT INTO SCHEDULE_INFO
	(LOCATION_CODE ,LOCATION_NAME ,ADDRESS ,ADDRESS2 ,PHONE ,LOGUI ,LAT)
	VALUES(SCHEDULE_INFO_SEQ.NEXTVAL,'제주도','주소1','주소2','010-1207-1207',37.567896,126.9786567);

-- 여기서부터는 SCHEDULES 
INSERT INTO SCHEDULES
	(SCHEDULE_ID, MOZZLE_ID, WRITER, TITLE, CONTENT, SCHEDULE_DATE, REGDATE, LOCATION_CODE)
	VALUES(SCHEDULE_SEQ.NEXTVAL, 1 , '작성자1', 'TITLE1', 'CONTENT1', '202112251207', SYSDATE, 21);
INSERT INTO SCHEDULES
	(SCHEDULE_ID, MOZZLE_ID, WRITER, TITLE, CONTENT, SCHEDULE_DATE, REGDATE, LOCATION_CODE)
	VALUES(SCHEDULE_SEQ.NEXTVAL, 2 , '작성자2', 'TITLE2', 'CONTENT2', '202112251207', SYSDATE, 22);



CREATE SEQUENCE SCHEDULE_SEQ;

SELECT * FROM SCHEDULE_INFO;
SELECT * FROM SCHEDULES s ;





--일정 상세
SELECT S.SCHEDULE_ID,S.WRITER,S.TITLE,S.CONTENT,
		S.SCHEDULE_DATE ,S.REGDATE, si.LOCATION_NAME, si.ADDRESS, si.ADDRESS2, si.PHONE
		FROM SCHEDULES S
		INNER JOIN SCHEDULE_INFO si
		ON S.LOCATION_CODE = si.LOCATION_CODE
		WHERE SCHEDULE_ID = 6;

SELECT * FROM SCHEDULES s ;

--일정삭제(delete)
  DELETE FROM SCHEDULES
   WHERE SCHEDULE_ID = 4;
   
  
  
  
  

--일정목록조회
SELECT s.SCHEDULE_ID ,s.MOZZLE_ID ,s.WRITER ,s.TITLE ,s.CONTENT ,s.SCHEDULE_DATE ,s.REGDATE ,si.LOCATION_NAME, si.ADDRESS, si.ADDRESS2, si.PHONE
FROM SCHEDULES s
INNER JOIN SCHEDULE_INFO si
ON S.LOCATION_CODE = si.LOCATION_CODE
WHERE MOZZLE_ID = 1 AND SUBSTR(SCHEDULE_DATE,1,8) = '20211225'
ORDER BY SCHEDULE_DATE;

--상세검색
SELECT s.SCHEDULE_ID ,s.MOZZLE_ID ,s.WRITER ,s.TITLE ,s.CONTENT ,s.SCHEDULE_DATE ,s.REGDATE ,si.LOCATION_NAME, si.ADDRESS, si.ADDRESS2, si.PHONE
FROM SCHEDULES s
INNER JOIN SCHEDULE_INFO si
ON S.LOCATION_CODE = si.LOCATION_CODE
WHERE SCHEDULE_ID = 13;


--일정변경
UPDATE SCHEDULES
SET TITLE='변경된TITLE',CONTENT='변경된CONTENT',SCHEDULE_DATE='202112191207',REGDATE =SYSDATE
WHERE SCHEDULE_ID = 13;

--일정개수
SELECT COUNT(*)
FROM SCHEDULES
WHERE MOZZLE_ID 2 AND SUBSTR(SCHEDULE_DATE,1,8) = '20211225';
  