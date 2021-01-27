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
    margin: 0 auto;

    
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

.movie-mno{
    position: absolute;
    top: 0;
    left: 0;
    color: whitesmoke;
}

.wrap>input, .review-content>input, .review-content>label>input{
	border: none;
	background-color: whitesmoke;
}
input:focus{
	outline:none;
}


/* 리뷰 내용 작성 */
.content{
    width: 600px;
    margin: 5px auto;
}

.btns{
	width: 84%;
}

</style>  	
	
<section>
    <label style="font-size: 40px; font-weight: bold;">영화 리뷰 작성 페이지</label>
    <hr style="border-bottom: 3px solid black; margin: 10px 0;">
    
    <form action="reviewRegistForm" method="post" name="registForm">
	    <div class = "wrap">
	    	<input name="mno" type="text" class="movie-mno" value="${movieInfoVO.movieCd == null ? } " readonly="readonly">
	        <div class = "movie-img">
	            <img src="${pageContext.request.contextPath }/resources/img/movie_image.jpg" alt="영화포스터">
	        </div>    
	        <div class = "review-content">
	          <label><input type="text" name="movieTitle" value="${movieInfoVO.title }" readonly="readonly"></label><br>
	          <input type="text" class = "writer" name ="writer" value ="${login.userId }" readonly="readonly">
	        </div>
	    </div>
	    
	    <div class="content form-group">
	        <label>내용</label>
	        <textarea class="content form-control" rows="10" name='content' id='msgContent' placeholder="영화를 어떻게 보셨나요?"></textarea>
	    </div>
	    <div class="btns" style="text-align: right;">
            <button type = "button" class = "list-modify" onclick="regist()">작성</button>
            <button type = "button" class = "list-delete" onclick="location.href= '../movie/movieContent'">취소</button>
	    </div>
    </form>    
</section>

<script>
	//글 등록
	function regist() {
		
		if(document.registForm.content.value === ''){
			document.getElementById("msgContent").innerHTML = "내용을 입력해주세요!!";
			document.registForm.content.focus();
			return;
		}else{
			document.registForm.submit();
		}
		
	}


</script>





