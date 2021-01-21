create table users(
    userId varchar2(50) not null,
    userPw varchar2(50) not null,
    userName varchar2(50) not null,    
    userGender varchar2(20),
    userAge NUMBER,
    userEmail1 varchar2(50),
    userEmail2 varchar2(300),    
    addrBasic varchar2(300),
    addrDetail varchar2(300),
    addrZipNum varchar2(50),
    regdate date default sysdate
);
alter table users add CONSTRAINT userid_pk PRIMARY KEY (userId);


