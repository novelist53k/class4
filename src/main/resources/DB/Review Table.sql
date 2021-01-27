--리뷰 테이블
CREATE TABLE REVIEW(
    bno number, 
    mno number not null,
    writer varchar2(50) not null,
    movietitle varchar2(50) not null,
    content varchar2(1000),
    regdate TIMESTAMP DEFAULT sysdate,
    updatedate TIMESTAMP DEFAULT sysdate
);

ALTER TABLE REVIEW ADD CONSTRAINT bno_PK PRIMARY key(bno);

CREATE SEQUENCE seq_bno INCREMENT by 1 START with 1 nocache;
--댓글 테이블
CREATE TABLE REPLY(
    rno number,
    id varchar2(50) not null,
    bno number not null,
    content varchar(500),
    regdate TIMESTAMP DEFAULT sysdate,
    updatedate TIMESTAMP DEFAULT sysdate
);

ALTER TABLE REPLY ADD CONSTRAINT rno_PK PRIMARY key(rno);
CREATE SEQUENCE seq_rno INCREMENT by 1 START with 1 nocache;

