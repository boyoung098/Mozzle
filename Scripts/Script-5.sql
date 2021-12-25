SELECT POST_ID, MOZZLE_ID, USER_ID, TITLE, CONTENT, REFER, STEP, "DEPTH", REGDATE
FROM MOZZLE_POST
WHERE MOZZLE_ID = '1' AND USER_ID='reuser05';
SELECT * FROM USERS u ;
SELECT * FROM MOZZLE m ;

SELECT * FROM USER_MOZZLE um ;

INSERT INTO ADMIN.NOTIFICATION
(NOTICE_ID, USER_ID, MOZZLE_ID, "TYPE", NOTICE_TIME, READ_CHECKED, DELFLAG)
VALUES(NOTIFICATION_SEQ.NEXTVAL, 'qkrekfthsus', 247, '가입',  SYSDATE, 'N', 'N');

INSERT INTO ADMIN.NOTIFICATION
(NOTICE_ID, USER_ID, MOZZLE_ID, "TYPE", NOTICE_TIME, READ_CHECKED, DELFLAG)
VALUES(NOTIFICATION_SEQ.NEXTVAL, 'qkrekfthsus', 1, '탈퇴',  SYSDATE, 'N', 'N');

INSERT INTO ADMIN.NOTIFICATION
(NOTICE_ID, USER_ID, MOZZLE_ID, "TYPE", NOTICE_TIME, READ_CHECKED, DELFLAG)
VALUES(NOTIFICATION_SEQ.NEXTVAL, 'user01', 247, '가입',  SYSDATE, 'N', 'N');

INSERT INTO ADMIN.NOTIFICATION
(NOTICE_ID, USER_ID, MOZZLE_ID, "TYPE", NOTICE_TIME, READ_CHECKED, DELFLAG)
VALUES(NOTIFICATION_SEQ.NEXTVAL, 'user01', 1, '가입',  SYSDATE, 'N', 'N');

SELECT n.NOTICE_ID, n.MOZZLE_ID, n."TYPE", n.READ_CHECKED, m.IMAGE_SAVED 
FROM NOTIFICATION n INNER JOIN MOZZLE m 
ON n.MOZZLE_ID = m.MOZZLE_ID 
WHERE n.USER_ID = 'qkrekfthsus' AND n.DELFLAG ='N'
ORDER BY n.NOTICE_TIME DESC;

SELECT um.MOZZLE_ID, m.MOZZLE_NAME FROM USER_MOZZLE um INNER JOIN MOZZLE m 
ON um.MOZZLE_ID = m.MOZZLE_ID 
WHERE USER_ID = 'user01' AND AUTH_CODE = 1;

SELECT * FROM MOZZLE m2 ;

SELECT * FROM USERS u ;MOZZLE m 