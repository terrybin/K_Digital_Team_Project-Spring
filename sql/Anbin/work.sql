DROP TABLE WORK;
CREATE TABLE WORK
(
    WORKID          NUMBER              NOT NULL
        CONSTRAINT WORK_PK
            PRIMARY KEY,
    ADMIN           NUMBER DEFAULT 0,
    IP              VARCHAR2(20),
    USERNAME        VARCHAR2(20)        NOT NULL,
    SUBJECT         VARCHAR2(100)       NOT NULL,
    CONTENT         VARCHAR2(2000)      NOT NULL,
    PRIORITY        NUMBER DEFAULT 4,
    CURRENTPROGRESS NUMBER DEFAULT 1,
    WORKPROGRESS    NUMBER DEFAULT 0,
    STARTDATE       DATE   DEFAULT NULL NOT NULL,
    DEADLINE        DATE   DEFAULT NULL NOT NULL,
    WRITEDATE       DATE   DEFAULT SYSDATE,
    UPDATEDATE      DATE,
    USERID          NUMBER,
    DELETEDATE      DATE
)
/

ALTER TABLE WORK
    ADD CONSTRAINT WORK_FK FOREIGN KEY (USERID) REFERENCES USERINFO (USERID);

DELETE FROM WORK;
DROP SEQUENCE WORK_WORKID_SEQ;
CREATE SEQUENCE WORK_WORKID_SEQ;
COMMIT;

INSERT INTO WORK(WORKID,ADMIN ,IP ,USERNAME ,SUBJECT,CONTENT
                    ,PRIORITY ,CURRENTPROGRESS,WORKPROGRESS,STARTDATE ,DEADLINE)
        VALUES (WORK_WORKID_SEQ.NEXTVAL, 0, '0.0.0.0', '둘리', '좋지', '한대 말아줘'
                 , 3, 2, 9,'2022-11-08', '2022-11-22');
INSERT INTO WORK(WORKID,ADMIN ,IP ,USERNAME, SUBJECT,CONTENT
                    ,PRIORITY ,CURRENTPROGRESS,WORKPROGRESS,STARTDATE ,DEADLINE)
        VALUES (WORK_WORKID_SEQ.NEXTVAL, 0, '0.0.0.0', '도우너', '왜이렇게 죽상이야?', '떨 한대 할래?'
                 , 4, 1, 10,'2022-11-08', '2022-11-22');
INSERT INTO WORK(WORKID,ADMIN ,IP ,USERNAME ,SUBJECT,CONTENT
                    ,PRIORITY ,CURRENTPROGRESS,WORKPROGRESS,STARTDATE ,DEADLINE)
        VALUES (WORK_WORKID_SEQ.NEXTVAL, 0, '0.0.0.0', '둘리', '밥줘', '초능력 맛좀 볼래??'
                 , 3, 2, 9,'2022-11-08', '2022-11-22');
INSERT INTO WORK(WORKID,ADMIN ,IP ,USERNAME ,SUBJECT,CONTENT
                    ,PRIORITY ,CURRENTPROGRESS,WORKPROGRESS,STARTDATE ,DEADLINE)
        VALUES (WORK_WORKID_SEQ.NEXTVAL, 0, '0.0.0.0', '마이콜', '받으세요', '고길동씨'
                 , 2, 3, 10,'2022-11-08', '2022-11-22');
INSERT INTO WORK(WORKID,ADMIN ,IP ,USERNAME ,SUBJECT,CONTENT
                    ,PRIORITY ,CURRENTPROGRESS,WORKPROGRESS,STARTDATE ,DEADLINE)
        VALUES (WORK_WORKID_SEQ.NEXTVAL, 0, '0.0.0.0', '고길동', '오랜 모멸과 핍박의 시간...', '검성 고길동으로 돌아갈떄다.'
                 , 2, 2, 0,'2022-11-08', '2022-11-22');

INSERT INTO WORK(WORKID,ADMIN ,IP ,USERNAME ,SUBJECT,CONTENT
                    ,PRIORITY ,CURRENTPROGRESS,WORKPROGRESS,STARTDATE ,DEADLINE,WRITEDATE ,UPDATEDATE)
        VALUES (WORK_WORKID_SEQ.NEXTVAL, 0, '0.0.0.0', '고길동',  '오랜 모멸과 핍박의 시간...', '검성 고길동으로 돌아갈떄다.'
                 , 1, 2, 3,'2022-11-08', '2022-11-22', '2019-11-22', '2022-11-22');
INSERT INTO WORK(WORKID,ADMIN ,IP ,USERNAME ,SUBJECT,CONTENT
                    ,PRIORITY ,CURRENTPROGRESS,WORKPROGRESS,STARTDATE ,DEADLINE,WRITEDATE ,UPDATEDATE)
        VALUES (WORK_WORKID_SEQ.NEXTVAL, 0, '0.0.0.0', '고길동', '오랜 모멸과 핍박의 시간...', '검성 고길동으로 돌아갈떄다.'
                 , 1, 2, 2,'2022-11-08', '2022-11-22', '2020-11-22', '2022-11-22');
INSERT INTO WORK(WORKID,ADMIN ,IP ,USERNAME, SUBJECT,CONTENT
                    ,PRIORITY ,CURRENTPROGRESS,WORKPROGRESS,STARTDATE ,DEADLINE,WRITEDATE ,UPDATEDATE)
        VALUES (WORK_WORKID_SEQ.NEXTVAL, 0, '0.0.0.0', '고길동', '오랜 모멸과 핍박의 시간...', '검성 고길동으로 돌아갈떄다.'
                 , 1, 2, 1,'2022-11-08', '2022-11-22', '2021-11-22', '2022-11-22');


SELECT COUNT(*)  FROM WORK;
SELECT * FROM WORK WHERE PRIORITY = 1 ORDER BY WORKID DESC;

UPDATE WORK SET SUBJECT = '1', CONTENT = '2', PRIORITY = 3,
        CURRENTPROGRESS = 3, WORKPROGRESS = 3,
        STARTDATE = SYSDATE, DEADLINE = SYSDATE, IP = '1',
        UPDATEDATE = SYSDATE
        WHERE WORKID = 252;
        COMMIT;