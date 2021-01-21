<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
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
    margin: 0 auto;
    
}

/* 리뷰 상세 */

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

.review_bno{
    position: absolute;
    top: 0;
    left: 0;
    color: whitesmoke;
}

.day{
	position: absolute;
	top : 130px;
}

/* 댓글 프로필 이미지 */

.profile-img img{
    width: 55px;
    margin-right: 5px;
    float: left;
}

/*댓글 */
.form-control {
    margin-top: 0;
}


.reply-content textarea{
    width: 815px;
}

.reply-wrap{
    position: relative;
    margin-top: 20px;
}
reply_rno{
	position: absolute;
	top : 0;
	left : 0;
}

.reply-btn{
    position: absolute;
    right: 10px;
    top : 25px;
}





</style>    
    
<section>
    <lable style="font-size: 40px; font-weight: bold;">영화 리뷰 상세페이지</lable>
    <hr style="border-bottom: 3px solid black; margin: 10px 0;">
    <div class = wrap>
    	<span class="review_bno">${vo.bno }</span>
        <div class = "movie-img">
            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
        </div>    
        <div class = "review-content">
        	<label>${vo.movieTitle }</label>
            <p class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></p>
            <p class = "score" style="display: inline-block;">5</p>
            <p>${vo.writer }</p>
			<div class = "day">	        		 
           		<fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd HH:ss"/>
        	</div>
        </div>
    </div>

    <div class="content form-group">
        <label>내용</label>
        <textarea class="form-control" rows="10" name="content">${vo.content }</textarea>
        <div class="btns" style="text-align: right; margin-top: 5px;">
            <button class = "list-btn" onclick="location.href='reviewList'">목록</button>
            <button type = "submit" class = "list-modify" onclick="location.herf='reviewUpdate?bno=${vo.bno}&writer=${vo.writer }'">수정</button>
            <button class = "list-delete">삭제</button>
        </div>    
        <label>댓글</label>
        <div class="reply-wrap">
        	<c:forEach var="ReplyVO" items="${listR }">
        	<span class="reply_rno">${ReplyVO.rno }</span>
            <div class="profile-img">
                <img src="${pageContext.request.contextPath}/resources/img/default_profile.gif" alt="profile">
            </div>
            <div class="reply-content">
                <textarea class="form-control" rows="2" id="reply" readonly>${ReplyVO.content }</textarea>
            </div>
            <div class="reply-btn">
                <button type = "submit" class = "list-modify">수정</button>
                <button class = "list-delete">삭제</button>
            </div>
            </c:forEach>
        </div>


        <div class = "more-btn" >
            <button type="button" id="more_repl" style="width: 100%; margin-top: 10px; background-color: rgb(37,37,37); color: white;" onclick="moreRepl()">댓글 더보기</button>
        </div>
    </div>
    
    <script>
    
    
    
    	/* function moreRepl(){
    		
    		$ajax({
    			type : "post",
    			url : "../review/reviewContent",
    			data : JSON.stringfy({""}),
    			contentType : "application/json; charset=utf-8",
    			
    		
    			
    			
    		})
    	} */
    
    	
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</section>