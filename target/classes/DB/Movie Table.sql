====================== 현재개봉영화 ===============================
create table cmovie(
    cmno number(10),  --영화순번
    title varchar2(200) not null, --영화제목
    ftitle varchar2(50) not null, --영화제목 외국어
    grade varchar2(50) not null, --시청등급
    regdate date default sysdate,  --개봉일
    subhead varchar2(2000),  --줄거리제목
    content varchar2(2000),   --줄거리
    poster varchar2(500),  --포스터
    trailer varchar2(2000)  --예고편
);
alter table cmovie add CONSTRAINT movie_pk primary key (cmno);
create SEQUENCE cmovie_seq increment by 1 start with 1 nocache;

select count(*) from cmovie;

drop table cmovie;
select * from cmovie order by cmno asc;
====================== 개봉예정영화 ===============================
create table emovie(
    emno number(10),  --영화순번
    title varchar2(200) not null, --영화제목
    ftitle varchar2(50) not null, --영화제목 외국어
    grade varchar2(50) not null, --시청등급
    regdate date default sysdate,  --개봉일
    subhead varchar2(2000),  --줄거리제목
    content varchar2(2000),   --줄거리
    poster varchar2(500),  --포스터
    trailer varchar2(2000)  --예고편
);
alter table emovie add CONSTRAINT movie_pk primary key (emno);
create SEQUENCE emovie_seq increment by 1 start with 1 nocache;

select count(*) from emovie;

drop table emovie;
select * from emovie order by emno asc;