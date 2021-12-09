-- 게시판
SELECT POST_ID, MOZZLE_ID, USER_ID, TITLE, CONTENT, REFER, STEP, "DEPTH", REGDATE
FROM MOZZLE_POST
ORDER BY  POST_ID DESC;

SELECT POST_ID, MOZZLE_ID, USER_ID, TITLE, CONTENT, REFER, STEP, "DEPTH", REGDATE
FROM MOZZLE_POST
WHERE TITLE LIKE '%가입%' AND CONTENT LIKE '%가입%';


CREATE SEQUENCE MOZZLE_POST_SEQ START WITH 1 INCREMENT BY 1;

INSERT INTO MOZZLE_POST
(POST_ID, MOZZLE_ID, USER_ID, TITLE, CONTENT, REFER, STEP, "DEPTH", REGDATE)
VALUES(MOZZLE_POST_SEQ.NEXTVAL, '1', 'user04', '오늘은 수요일이에요', '시간이 너무 빨리가고 있어!!!!', (SELECT NVL(MAX(POST_ID),0)+1 FROM MOZZLE_POST) , 0, 0, SYSDATE);

INSERT INTO MOZZLE_POST
(POST_ID, MOZZLE_ID, USER_ID, TITLE, CONTENT, REFER, STEP, "DEPTH", REGDATE)
VALUES(MOZZLE_POST_SEQ.NEXTVAL, '1', 'user01', '가입했어요!', '오늘 날씨가 정말 좋은거 같아요 여행하기 좋은거 같습니다', 0, 0, 0, SYSDATE);

UPDATE MOZZLE_POST
SET TITLE='수정했어요', CONTENT='내용 추가로 수정했습니다'
WHERE POST_ID='5'AND MOZZLE_ID ='1';

DELETE FROM MOZZLE_POST
WHERE POST_ID='8'AND MOZZLE_ID ='1' AND USER_ID='reuser02';

--댓글
INSERT INTO MOZZLE_POST
(POST_ID, MOZZLE_ID, USER_ID, TITLE, CONTENT, REFER, STEP, "DEPTH", REGDATE)
VALUES(MOZZLE_POST_SEQ.NEXTVAL, '1', 'reuser05', '금요일 답글', '수요일 답글입니다', 
(SELECT REFER FROM MOZZLE_POST WHERE POST_ID='5'), (SELECT STEP+1 FROM MOZZLE_POST WHERE POST_ID='5'), (SELECT "DEPTH"+1 FROM MOZZLE_POST WHERE POST_ID='5'), SYSDATE);

UPDATE MOZZLE_POST
SET TITLE='댓글 달아요', CONTENT='댓글 내용 추가로 수정했습니다'
WHERE POST_ID='9'AND MOZZLE_ID ='1' AND USER_ID='reuser02';


--북마크
SELECT SEQ, USER_ID, POST_ID
FROM BOOKMARK;

--북마크 추가
INSERT INTO BOOKMARK
(SEQ, USER_ID, POST_ID)
VALUES(BOOKMARK_SEQ.NEXTVAL, 'user02', '5');

DELETE FROM BOOKMARK
WHERE SEQ='5' AND USER_ID='user02';


CREATE SEQUENCE BOOKMARK_SEQ START WITH 1 INCREMENT BY 1;

--북마크 표시
SELECT M.POST_ID, M.MOZZLE_ID, M.USER_ID, M.TITLE, 
M.CONTENT, M.REGDATE 
FROM MOZZLE_POST M RIGHT OUTER JOIN BOOKMARK B 
ON M.POST_ID = B.POST_ID;

--신고
SELECT REPORT_ID, POST_ID, REPORT_TIME, REPORTER, REASON
FROM POST_REPORT;


INSERT INTO POST_REPORT
(REPORT_ID, POST_ID, REPORT_TIME, REPORTER, REASON)
VALUES(POST_REPORT_SEQ.NEXTVAL, '11', TO_CHAR(SYSDATE, 'YYYY.MM.DD'), 'user05', '내용이 다름');


CREATE SEQUENCE POST_REPORT_SEQ START WITH 1 INCREMENT BY 1;







