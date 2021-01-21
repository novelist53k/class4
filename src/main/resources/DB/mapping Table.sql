-- 유저, 장르 매핑 테이블
CREATE TABLE userGenre(
    ugno NUMBER(10),
    ugId varchar2(50) not null,
    gno number(10)
);
alter table userGenre add CONSTRAINTS ug_pk PRIMARY KEY (ugno);
create SEQUENCE userGenre_seq increment by 1 start with 1 nocache;


-- 유저, 배우 매핑 테이블
create table userActor(
    uano NUMBER(10),
    actor varchar2(50),
    uaId varchar2(50)
);
alter table userActor add CONSTRAINTS ua_pk PRIMARY KEY (uano);
create SEQUENCE userActor_seq increment by 1 start with 1 nocache;


-- 유저, 감독 매핑 테이블
create table userDirector(
    udno NUMBER(10),
    director varchar2(50),
    udId varchar2(50)
);
alter table userDirector add CONSTRAINTS ud_pk PRIMARY KEY (udno);
create SEQUENCE userDirector_seq increment by 1 start with 1 nocache;


-- 영화, 감독 매핑 테이블
create table movieDirector(
    mdno NUMBER(10),
    dno NUMBER(10),
    mno NUMBER(10)
);
alter table movieDirector add CONSTRAINTS md_pk PRIMARY KEY (mdno);
create SEQUENCE movieDirector_seq increment by 1 start with 1 nocache;


-- 영화, 배우 매핑 테이블
create table movieActor(
    mano NUMBER(10),
    ano NUMBER(10),
    mno NUMBER(10)
);
alter table movieActor add CONSTRAINTS ma_pk PRIMARY KEY (mano);
create SEQUENCE movieActor_seq increment by 1 start with 1 nocache;


-- 영화, 장르 매핑 테이블
create table movieGenre(
    mgno NUMBER(10),
    gno NUMBER(10),
    mno NUMBER(10)
);
alter table movieGenre add CONSTRAINTS mg_pk PRIMARY KEY (mgno);
create SEQUENCE movieGenre_seq increment by 1 start with 1 nocache;











