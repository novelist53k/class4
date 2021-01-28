<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
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

section {

    padding: 20px 60px;
    width: 996px;
    height: 700px;
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


/* 리뷰 내용 작성 */
.content{
    width: 600px;
    margin: 5px auto;
}

.review_bno{
    position: absolute;
    top: 0;
    left: 0;
    color:white;
}

.writer{
	position: absolute;
	top : 110px;	
}
.day{
	position: absolute;
	top : 130px;
}

.wrap>input, .review-content>input, .review-content>label>input{
	border: none;
	background-color: whitesmoke;
}
input:focus{
	outline:none;
}


</style>



<section>
    <label style="font-size: 40px; font-weight: bold;">영화 리뷰 수정 페이지</label>
    <hr style="border-bottom: 3px solid black; margin: 10px 0;">
    
    <form action="reviewModify" method = "post" name="reviewModify">
	    <div class = wrap>
	    	<input name="bno" type="text" class="review_bno" value="${vo.bno }">
	        <div class = "movie-img">
	            <img src="${pageContext.request.contextPath }/resources/img/poster/${movieInfo.poster == null ? 'b.png' : movieInfo.poster}" alt="영화포스터">
	            
	        </div>    
	        <div class = "review-content">
		          <label><input type="text" name="movieTitle" value="${vo.movieTitle }" readonly="readonly"></label><br>
		          <!-- <p class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></p>
		          <p class = "score" style="display: inline-block;">5</p><br> -->
		          <input type = "text" class = "writer" name="writer" value = "${vo.writer}" readonly="readonly">
		          <div class = "day">	        		 
		           		<fmt:formatDate value="${vo.updateDate }" pattern="yyyy-MM-dd HH:mm"/>
	        	</div>
	        </div>
	    </div>
	    
	    <div class="content form-group">
	        <label>내용(100글자 이내)</label>
	        <textarea class="content form-control" rows="10" name='content' id="updateContent">${vo.content }</textarea>
	        <div class="btns" style="text-align: right;">
	            <button type = "button" class="list-modify" id="modifyBtn">수정</button>
	            <button type = "button" class = "list-cancel" id="cancelBtn">취소</button>
	        </div>    
	    </div>
    </form>
</section>
	


<script>
	/* 수정 버튼 */
	var modifyBtn = document.getElementById("modifyBtn");
	modifyBtn.onclick = function () {	
		if(document.reviewModify.content.value === ''){
			alert("내용을 입력해 주세요.");
			document.reviewModify.content.focus();
			return;
		}else{
			document.reviewModify.action = "reviewModify";
			document.reviewModify.submit();
		}
	}
	
	var cancelBtn = document.getElementById("cancelBtn");
	cancelBtn.onclick = function () {
		location.href = 'reviewList';
	}
	
	
	/*굴자수 제한*/
	$(document).ready(function() {
		$("#updateContent").keyup(function() {
			var inputLength = $(this).val().length;
			if(inputLength > 100) {
				$(this).val($(this).val().substring(0,100));
				alert("더이상 입력 할 수 없습니다.");
			}
		});
	});
	
	
	
</script>


