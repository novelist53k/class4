#====================== 영화정보 ===============================
# oracle number -> int
# oracle varchar2 -> varchar
# oracle date -> timestamp
# 시퀀스 없음 -> auto_increment


create table MOVIE(
	
    moviecd varchar(100) primary key,  #영화코드
    title varchar(200) not null, #영화제목
    ftitle varchar(80), #영화제목 외국어
    grade varchar(50), #시청등급
    opendt timestamp  #개봉일
--    subhead varchar2(2000),  --줄거리제목
--    content varchar2(3000),   --줄거리
--    poster varchar2(500),  --포스터
--    trailer varchar2(2000)  --예고편
);


#============= 영화부수자료 ===============
create table MOVIESUB(
    sno int(10) primary key auto_increment,  #영화순번
    title varchar(200) not null, #영화제목
    subhead varchar(2000),  #줄거리제목
    content varchar(3000),   #줄거리
    poster varchar(500),  #포스터
    trailer varchar(2000)  #예고편
);

