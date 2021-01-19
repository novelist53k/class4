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

ul,ol{
    list-style: none;
}
/* 리뷰 상세 포스터 */
section {

    padding: 20px 60px;
    width: 996px;
    height: 1150px;

    
}
.movie-img{
    width: 19%;
    height: 90%;
    position: absolute;
    float: left;
    
}


.movie-img img{
    width: 100%;
    height: 100%;
}

.review-content {
    display: inline-block;
    position: relative;
    padding:10px;
    left: 120px;
    width: 80%;
    height: 150px;
    /* border: 1px solid rgb(214, 213, 213); */
    border-radius: 5px;

}

.wrap{
    background-color: whitesmoke;
    overflow: hidden;
    margin: 10px;
    padding: 10px;
    border: 1px;
    position: relative;
    width: 600px;
    /* flex-basis: 1000px; */
    flex-shrink: 0;
    margin: 0 auto;

}



/* 리뷰 내용 작성 */
.content{
    width: 600px;
    margin: 5px auto;
}

/* 댓글 프로필 이미지 */

.profile-img img{
    width: 55px;
    margin-right: 5px;
    float: left;
}

/* 댓글 */
.form-control {
    margin-top: 0;
}


.reply-content textarea{
    width: 90%;
}

.reply-wrap{
    position: relative;
    margin-top: 20px;
}

.reply-btn{
    position: absolute;
    right: 10px;
    top : 10px;
}
</style>  	
	
<section>
    <lable style="font-size: 40px; font-weight: bold;">영화 리뷰 작성 페이지</lable>
    <hr style="border-bottom: 3px solid black; margin: 10px 0;">
    <div class = wrap>
        <div class = "movie-img">
            <img src="${pageContext.request.contextPath }/resources/img/movie_image.jpg" alt="영화포스터">
            
        </div>    
        <div class = "review-content">
          <p>트라이얼 오브 더 시카코 7</p>
          <p>2020.10.09 (금) 16:45 ~ 18:38</p>
        </div>
    </div>
    
    <div class="content form-group">
        <label>제목</label>
        <textarea class="content form-control" rows = "1" name="title" placeholder="제목을 입력해주세요"></textarea>


        <label>내용</label>
        <textarea class="content form-control" rows="10" name='content' placeholder="영화를 어떻게 보셨나요?"></textarea>
    </div>
    <div class="btns" style="text-align: right;">
            <button type = "submit" class = "list-modify">작성</button>
            <button class = "list-delete">취소</button>
    </div>    
</section>

<footer>