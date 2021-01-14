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
    background: radial-gradient( rgba(193, 193, 193), rgba(47, 47, 47, 0.8) );
    /* background: radial-gradient( rgb(253, 119, 119,.3), rgb(250, 63, 63,.8) ); */
    
}
.movie-img{
    width: 19%;
    height: 90%;
    position: absolute;
    float: left;
    
}
.bno{
    position: absolute;
    top: 5px;
    left: 12px;
    z-index: 5;
    font-size: 30px;
    font-weight: bold;
    color: black;
}
.movie-img img{
    width: 100%;
    height: 100%;
}
.review-content {
    display: inline-block;
    position: relative;
    background-color: black;
    padding:10px;
    left: 120px;
    width: 80%;
    /* border: 1px solid rgb(214, 213, 213); */
    border-radius: 5px;
    color: rgb(214, 213, 213);
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
    background: linear-gradient( to left, rgba(193, 193, 193), black );
}
/* 검색 */
.search input {
    height: 30px;   
}    
.search{
    position: relative;
    top: 20px;
    text-align: right;
}
.search .btn {
    background-color: white;
    border: 1px solid black;
    color: black;
}
/* 사이드 */
.side {position: fixed; left: 170px; top: 300px; z-index: 10;}
.side li {
    background-color: #e40c0c; 
    text-align: center; 
    padding: 5px 10px; 
    border: 1px solid black; 
    color: rgb(235, 230, 230); 
    font-size: 25px;}
.side li a {
    text-decoration: none;
    color: black;
    font-size: 25px;    
    display: block;
}
.side .theater{
    background-color: whitesmoke;
}
/* 페이징 */
.page_wrap{
    margin-top: 5px;
    text-align: center;
    font-size: 15;
}

.page_nation{
    display: inline-block;
}

.page_nation a{
    display: block;
    margin: 0 3px;
    float: left;
    border: 1px solid black;
    width: 25px;
    height: 25px;
    line-height: 25px;
    background-color:#fff;
    font-size: 15px;
    color:#999999;
    text-decoration: none;

}

.page_nation img{
    vertical-align: 0%;
}


.page_nation arrow{
    border: 1px solid #ccc;
}

.page_nation .active{
    background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
/* 위로 가기 버튼 */
.top {
	position: fixed;
	right: 300px;
	bottom: 300px;
}
</style>

<section>
        <div class = "search">
            <select style="height: 30px;">
		        <option value="장르">장르</option>
		        <option value="영화제목">영화제목</option>
		        <option value="감독">감독</option>
		        <option value="배우">배우</option>
		    </select>
		    <input type="text">
		    <button class="btn btn-primary">검색</button>
		</div>
		
		<div class = "review-main">
		    <label style="font-size: 40px;">영화 리뷰</label>
		    <hr>
		    <div class = wrap>
		        <span class = "bno">
		            <em>1</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음;;;;;;;;;;;;;;;;asdasdsadas</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		    
		    <div class = wrap>
		        <span class = "bno">
		            <em>2</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		
		    <div class = wrap>
		        <span class = "bno">
		            <em>3</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		
		    <div class = wrap>
		        <span class = "bno">
		            <em>4</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		
		    <div class = wrap>
		        <span class = "bno">
		            <em>5</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		
		    <div class = wrap>
		        <span class = "bno">
		            <em>6</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		
		    <div class = wrap>
		        <span class = "bno">
		            <em>7</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		
		    <div class = wrap>
		        <span class = "bno">
		            <em>8</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		
		    <div class = wrap>
		        <span class = "bno">
		            <em>9</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		
		    <div class = wrap>
		        <span class = "bno">
		            <em>10</em>
		        </span>
		        <div class = "movie-img">
		            <img src="${pageContext.request.contextPath}/resources/img/movie_image.jpg" alt="영화포스터">
		            
		        </div>    
		        <div class = "review-content">
		            <p>제목 : 무슨 내용인지 모르겠음</p>
		            <p>내용 : 제 취향은 아닌듯 합니다.</p>
		            <p>작성자 : 콩나드라</p>
		            <p>평점 4.0/4.5</p>
		            <p>2020-12-10</p>
		        </div>
		    </div>
		    <div class = "page_wrap">
		        <div class ="page_nation">
		            <a href="#" class = "arrow"><img src="${pageContext.request.contextPath }/resources/img/page_pprev.png"></a>
		            <a href="#" class = "arrow"><img src="${pageContext.request.contextPath }/resources/img/page_prev.png"></a>
		            <a href="#" class="active">1</a>
		            <a href="#">2</a>
		            <a href="#">3</a>
		            <a href="#">4</a>
		            <a href="#">5</a>
		            <a href="#">6</a>
		            <a href="#">7</a>
		            <a href="#">8</a>
		            <a href="#">9</a>
		            <a href="#">10</a>
		            <a href="#" class = "arrow"><img src="${pageContext.request.contextPath }/resources/img/page_next.png"></a>
		            <a href="#" class = "arrow"><img src="${pageContext.request.contextPath }/resources/img/page_nnext.png"></a>
		        </div>
		    </div>
		    
		    <!-- TOP(위로 가기 버튼) -->
		    <div class = "top">
		        <a href="#" ><img src="${pageContext.request.contextPath }/resources/img/btn_top.png" alt="top-btn"></a>
		        
		    </div> 
		    
		    <!-- 사이드 -->
		    <aside class="side">    
		        <ul class="side-list">
		            <li>영화관 찾기</li>
		            <li class = "theater"><a href="">CGV</a></li>
		            <li class = "theater"><a href="">롯데시네마</a></li>
		            <li class = "theater"><a href="">메가박스</a></li>
		        </ul>    
		    </aside>
		    
</section>