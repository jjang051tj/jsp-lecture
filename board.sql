-- no  primary
-- userId unique , 
-- userName
-- title
-- content
-- hit
-- regdate 

DROP TABLE board;

CREATE TABLE board(
   NO NUMBER PRIMARY KEY ,
   userid varchar2(100) , 
   username varchar2(100) , 
   title varchar2(100) , 
   content varchar2(1000) , 
   hit NUMBER ,
   regdate DATE
);
CREATE SEQUENCE seq_board
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
MINVALUE 1
nocycle 
cache 20;

INSERT INTO board 
VALUES(seq_board.nextval , 'thejoeun1', '이한새' , '너무춥다' , '12월에 더 춥다는데,, ' ,0,sysdate);

SELECT * FROM board WHERE NO=4;