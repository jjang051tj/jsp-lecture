--  table 만들어보기

DROP TABLE MEMBER;

CREATE TABLE MEMBER (
   no                     number,
   userId                 varchar2(100) PRIMARY KEY,
   userPw                 varchar2(100),
   userName               varchar2(100),
   userEmail              varchar2(100) unique,
   zipcode                number,
   address                varchar2(300),
   tel                    varchar2(13),
   originalProfile        varchar2(500),
   renameProfile          varchar2(500),
   regDate                DATE
);
SELECT * FROM "MEMBER" ;

SELECT count(*) AS count FROM MEMBER WHERE userid='jjang051';

ROLLBACK;

SELECT * FROM MEMBER WHERE userid='jjang051';


update member set userName = 'abcd',userEmail = 'fjdkfjkd@fdsfhjk.com' 
where userId = 'jjang051' and userPw = '1234';

--시퀀스
CREATE SEQUENCE seq_member
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999999999
NOCYCLE
CACHE 20;

INSERT INTO MEMBER VALUES 
	(seq_member.nextval,'jjang052','1234','장성호',
	'jjang052@hanmail.net',12345,'운정','010-1111-1111',sysdate
	);



UPDATE MEMBER SET username = '아무개';

ROLLBACK;

INSERT INTO MEMBER VALUES ('jjang051','1234','장성호',sysdate);


DELETE FROM "MEMBER" m WHERE userId = 'hong' AND userPw = '1234';


ROLLBACK;

SELECT * FROM board;

----------------------
DECLARE
	i NUMBER;
BEGIN
	FOR	i IN 1..150 LOOP
		--INSERT INTO board VALUES ()
		INSERT INTO board VALUES(seq_board.nextval , 
								'jjang051', 
								'장성호' || MOD(i,10), 
								'제목을 씁니다.'|| i, 
								'내용을 씁니다.'|| i,
								0,
								sysdate);
	END LOOP;
END;
SELECT * FROM BOARD b ;
commit;


-- 전체 갯수 150
SELECT count(*) FROM board;
-- 한페이지에 보여질 게시글 수 10
-- 페이지네이션의 수 15 
-- 페이지네이션에서 한번에 보여질 페이지 수 3
-- 전체 페이지의 수 5
-- 페이지네이션의 수 15 / 페이지네이션에서 한번에 보여질 페이지 수 3
-- 만약 나우어 떨어지면 갯수 그대로 쓰면 됨
-- 그렇지 않으면 올려줘야 한다.

-- 
SELECT * FROM (
SELECT rownum AS num, b01.* FROM 
	(SELECT * FROM board ORDER BY NO desc) b01
) WHERE num BETWEEN 1 AND 10;

WHERE rownum BETWEEN 1 AND 10;

SELECT * FROM (
	SELECT rownum AS num ,b01.* FROM 
		(SELECT * FROM board ORDER BY NO DESC) b01
	) 
WHERE num BETWEEN 1 AND 10;


DROP TABLE faq;


CREATE TABLE faq (
	NO NUMBER PRIMARY KEY,
	question varchar2(1000),
	answer varchar2(4000),
	regdate date
);

CREATE SEQUENCE faq_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999999999
NOCYCLE
CACHE 20;


SELECT * FROM faq;
INSERT INTO faq values(faq_seq.nextval,'오늘 점심 뭐에요','안가르쳐줘',sysdate);

ROLLBACK;



DELETE FROM MEMBER;
COMMIT;
SELECT * FROM MEMBER;


SELECT * FROM board where title LIKE '%ck%';




---------------------
DROP TABLE visual;

CREATE TABLE visual(
   NO NUMBER PRIMARY KEY,
   mainTxt varchar2(500),
   subTxt varchar2(500),
   originalvisual varchar2(500),
   renamevisual varchar2(500),
   isshow varchar2(10),
   regDate date
);

SELECT * FROM visual;


CREATE SEQUENCE seq_visual
INCREMENT BY 1
START WITH 1
MAXVALUE 99999999
MINVALUE 1
nocycle
cache 20;



INSERT INTO visual
VALUES (seq_visual.nextval, 'maintxt', 'subtxt','orgVs','reVs');

SELECT * FROM visual;

ROLLBACK;

SELECT * FROM visual WHERE NO IN (3,4,5);

UPDATE visual SET isShow = 'blind' WHERE NO IN (9,10);

UPDATE visual SET isShow = 'show';
COMMIT;

--replyboard sql

-- no,title,content,userId,userName,password,regroup,relevel,restep,hit,regdate,available

DROP TABLE replyboard;

CREATE TABLE replyboard (
	NO         NUMBER PRIMARY KEY,
	title      varchar2(500) NOT NULL,
	content    varchar2(3500) NOT NULL,
	userid     varchar2(100) NOT NULL,
	username   varchar2(100),
	password   varchar2(100) NOT NULL,
	regroup    NUMBER,
	relevel    NUMBER,
	restep     NUMBER,
	hit        NUMBER DEFAULT 0,
	regdate    DATE,
	available  NUMBER ,
	parentid   NUMBER DEFAULT 0
);

CREATE SEQUENCE seq_reply_board
INCREMENT BY 1
START WITH 1
MAXVALUE 99999999
MINVALUE 1
nocycle
cache 20;

SELECT * FROM replyboard ORDER BY regdate;

SELECT * FROM replyboard ORDER BY regroup DESC, relevel asc;

UPDATE replyboard SET relevel = relevel+1 WHERE regroup=3 AND relevel >= 0;

DELETE FROM replyboard WHERE NO IN (10);

COMMIT;

SELECT nvl(max(regroup),0) AS max FROM replyboard;  --제일 큰 숫자 찾아서 1더하면 된다.

DELETE FROM replyboard;


SELECT rownum AS num, b01.* from
 (SELECT * FROM replyboard ORDER BY regroup DESC , relevel ASC) b01; 


SELECT * FROM replyboard;
DELETE FROM REPLYBOARD  WHERE regroup = 3;
ROLLBACK;

DELETE FROM replyboard WHERE password = '1111' AND NO = 16;
DELETE FROM replyboard WHERE regroup = 3;

-- 1. 쓴 글이 원글이면 
DELETE FROM replyboard WHERE password = '1234' AND NO = 28;
DELETE FROM replyboard WHERE parentId=28;

--2. 쓴 글이 답들이면
DELETE FROM replyboard WHERE password = '1234' AND NO = 31;

COMMIT;

SELECT * FROM REPLYBOARD r ;

DELETE FROM replyboard;

DELETE FROM replyboard WHERE parentId=80;

SELECT * FROM MEMBER;


ROLLBACK;

SELECT * FROM 
(SELECT rownum AS num ,b01.* from
	(SELECT * FROM replyboard ORDER BY regroup DESC, relevel ASC) b01)
WHERE num = 1;


DECLARE
	i NUMBER;
BEGIN
	FOR	i IN 1..150 LOOP
		--INSERT INTO board VALUES ()
		INSERT INTO replyboard VALUES(
								seq_reply_board.nextval , 
								'제목을 씁니다.'|| i, 
								'내용을 씁니다.'|| i,
								'jjang051',
								'장성호' || MOD(i,10),
								'1234',
								i,
								0,
								0,
								0,
								sysdate,
								1,
								0
							);
	END LOOP;
END;

rollback;


SELECT * FROM replyboard b ;
commit;

SELECT * FROM "MEMBER" m ;

DELETE FROM "MEMBER" m ;



SELECT * FROM replyboard;


select * from
        (select rownum as num , b01.* from
            (select * from replyboard order by regroup desc, relevel asc) b01)
        where num > 0 and num < 10;
        
      
       
SELECT * FROM replyboard;       

COMMIT;

select * FROM "MEMBER"; 

