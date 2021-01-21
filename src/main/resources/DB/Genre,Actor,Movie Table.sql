-- 장르
create table genre(
    gno number(10) primary key,
    genre varchar2(50) not null
);
create SEQUENCE genre_seq increment by 1 start with 1 nocache;

insert into genre values(genre_seq.nextval, '애니메이션'); 
insert into genre values(genre_seq.nextval, '드라마'); 
insert into genre values(genre_seq.nextval, '가족'); 
insert into genre values(genre_seq.nextval, '미스터리'); 
insert into genre values(genre_seq.nextval, '범죄'); 
insert into genre values(genre_seq.nextval, '다큐멘터리'); 
insert into genre values(genre_seq.nextval, '스릴러'); 
insert into genre values(genre_seq.nextval, '공포'); 
insert into genre values(genre_seq.nextval, '판타지'); 
insert into genre values(genre_seq.nextval, '액션'); 
insert into genre values(genre_seq.nextval, '로맨스'); 
insert into genre values(genre_seq.nextval, 'SF'); 


-- 감독
create table director(
    dno number(10) primary key,
    directorName varchar2(50) not null
);
create SEQUENCE director_seq increment by 1 start with 1 nocache;


-- 배우
create table actor(
    ano number(10) primary key,
    actorName varchar2(50) not null
);
create SEQUENCE actor_seq increment by 1 start with 1 nocache;
