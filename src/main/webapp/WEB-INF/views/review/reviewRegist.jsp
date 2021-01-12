<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
	<link rel ="stylesheet " href ="../resource /css /bootstrap.min.css ">
	
	<!--jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src ="https: //ajax.googleapis.com /ajax /libs /jquery /1.11.2/jquery.min.js "></script>
	
	<!--합쳐지고 최소화된 최신 자바스크립트 --> 
	<script src="../resource /js /bootstrap.min.js "> </script>
	
	* {
	box-sizing: border-box;
}


/*css 폰트 url(css에서는 <style> 입력 안함)*/
@import url('https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap');

body, html{
    font-family: 'East Sea Dokdo', cursive;
}

ul,li{
    list-style: none;
}


/* 리뷰 상세 포스터 */
section {
	/* margin-top: 30px; */
	/* margin-left: 330px; */
	padding: 20px;
	background-color: rgb(238, 230, 230);
	width: 996px;
	margin: 30px auto;
}

.my-header {
	position: fixed; /*boby기준으로 헤더 고정*/
	top: 0;
	left: 0;
	width: 100%;
	background-color: rgb(27, 27, 27);
	z-index: 50; /*z축으로 50*/
	color: white;
}

.my-header a {
	color: white;
	font-size: 15px;
}

.my-header a img {
	background-color: white;
	width: 30px;
	height: 30px;
}

.navbar {
	margin-bottom: 0;
}

.navbar-brand {
	padding: 10px 20px;
}

.nav {
	font-size: 15px;
}

hr {
	margin-top: 20px;
	margin-bottom: 20px;
	border-top: 1px solid black;
}

.movie-img {
	width: 20%;
	height: 90%;
	position: absolute;
	float: left;
	background: radial-gradient(#131111, #999999) fixed;
	z-index: 1;
}

.bno {
	position: absolute;
	top: 5px;
	left: 12px;
	z-index: 5;
	font-size: 30px;
	font-weight: bold;
	color: black;
}

.movie-img img {
	width: 90%;
	height: 100%;
	z-index: 0;
}

.review-content {
	display: inline-block;
	position: relative;
	background-color: blanchedalmond;
	padding: 10px;
	left: 120px;
	width: 80%;
	border-radius: 10px;
}

.wrap {
	background-color: rgb(27, 27, 27);
	overflow: hidden;
	margin: 10px;
	padding: 10px;
	border: 1px solid;
	position: relative;
	width: 600px;
	/* flex-basis: 1000px; */
	flex-shrink: 0;
	margin: 0 auto;
}

/* 댓글 */

.reply-wrap{
    position: relative;
}

.reply-btn{
    position: absolute;
    right: 10px;
    top : 10px;
}

</style>  	
	
<section>
	<lable style="font-size: 40px;">영화 리뷰 작성 페이지</lable>
	<div class=wrap>
		<div class="movie-img">
			<img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">

		</div>
		<div class="review-content">
			<p>제목 : 무슨 내용인지 모르겠음</p>
			<p>내용 : 제 취향은 아닌듯 합니다.</p>
			<p>작성자 : 콩나드라</p>
			<p>평점 4.0/4.5</p>
			<p>2020-12-10</p>
		</div>
	</div>

	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" rows="10" name='content'></textarea>
	</div>
	<div class="btns" style="text-align: right;">
		<button type="submit" class="list-modify">작성</button>
		<button class="list-delete">취소</button>
	</div>
</section>