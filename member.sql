--  table 만들어보기

DROP TABLE MEMBER;

CREATE TABLE MEMBER (
   no         number,
   userId     varchar2(100) PRIMARY KEY,
   userPw     varchar2(100),
   userName   varchar2(100),
   userEmail  varchar2(100) unique,
   zipcode    number,
   address    varchar2(300),
   tel        varchar2(13),
   regDate DATE
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
								'제목을 씁니다.'|| MOD(i,10), 
								'내용을 씁니다.'|| MOD(i,10),
								0,
								sysdate);
	END LOOP;
END;
SELECT * FROM BOARD b ;
commit;


-- 전체 갯수
SELECT count(*) FROM board;












