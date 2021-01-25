====================== 영화정보 ===============================
create table movie(
	
    moviecd varchar2(100) not null,  --영화코드
    title varchar2(200) not null, --영화제목
    ftitle varchar2(80), --영화제목 외국어
    grade varchar2(50), --시청등급
    openDt date  --개봉일
--    subhead varchar2(2000),  --줄거리제목
--    content varchar2(3000),   --줄거리
--    poster varchar2(500),  --포스터
--    trailer varchar2(2000)  --예고편
);
alter table movie add CONSTRAINT info_pk primary key (moviecd);


============= 영화부수자료 ===============
create table moviesub(
    sno number(10) not null,  --영화순번
    title varchar2(200) not null, --영화제목
    subhead varchar2(2000),  --줄거리제목
    content varchar2(3000),   --줄거리
    poster varchar2(500),  --포스터
    trailer varchar2(2000)  --예고편
);
alter table moviesub add CONSTRAINT sub_pk primary key (sno);

--============= 영화리스트 ===============
--create table movielist(
--	
--    moviecd varchar2(100) not null,  --영화코드
--    title varchar2(200) not null, --영화제목
--    ftitle varchar2(80), --영화제목 외국어
--    grade varchar2(50), --시청등급
--    openDt date,  --개봉일
--    subhead varchar2(2000),  --줄거리제목
--    content varchar2(3000),   --줄거리
--    poster varchar2(500),  --포스터
--    trailer varchar2(2000)  --예고편
--);
--alter table movielist add CONSTRAINT list_pk primary key (moviecd);