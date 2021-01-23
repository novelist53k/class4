-- 장르
create table genre(
    genre varchar2(50) priMary key
);
-- 감독
create table director(
    dno varchar2(50) primary key,
    directorName varchar2(50) not null
);

-- 배우
create table actor(
    ano varchar2(50) primary key,
    actorName varchar2(50) not null
);
