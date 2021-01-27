--리뷰 테이블
CREATE TABLE REVIEW(
    bno number, 
    mno varchar2(50) not null,
    writer varchar2(50) not null,
    movietitle varchar2(50) not null,
    content varchar2(1000),
    FILEREALNAME varchar2(200),
    regdate TIMESTAMP DEFAULT sysdate,
    updatedate TIMESTAMP DEFAULT sysdate
);

ALTER TABLE REVIEW ADD CONSTRAINT bno_PK PRIMARY key(bno);

CREATE SEQUENCE bno_seq INCREMENT by 1 START with 1 nocache;
