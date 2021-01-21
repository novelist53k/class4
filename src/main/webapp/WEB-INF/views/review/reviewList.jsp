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

ul, ol {
    list-style: none;
}
/* 리뷰 상세 포스터 */
section {

    padding: 20px 60px;
    width: 996px;
    height: 1150px;
    margin: 0 auto;
}

.box_profile{
    position: relative;
}


.profile_img img{
    width: 60px;
    height: 60px;
    float: left;
    margin: 0 26px 0 20px;
}

.profile_mask img{
    display: block;
    position: absolute;
    top: px;
    left: 20px;
    width: 60px;
    height: 61px;
    /* background: 0 0 no-repeat; */
}

.writer_info{
    position: relative;
}

.writer_info .writer_etc{
    position: absolute;
    bottom: -130px;
    left: 110px;
}



.review_list{
    border-top: 1px solid rgb(162, 162, 162) ;
    height: 770px;
    padding: 0px;
    
    
}

.box-comment{
    margin-left: 110px;
}

.box-comment a{
    color: black;
    text-decoration: none;
}

.review_main ul li.review_comment:nth-child(2n+1){
    border-right: 1px solid rgb(174, 174, 174);
    border-bottom: 1px solid rgb(174, 174, 174);
    width: 50%;
    height: 200px;
    padding: 20px 0;
    

}

.review_main ul li.review_comment{
    border-right: none;
    border-bottom: 1px solid rgb(174, 174, 174);
    width: 50%;
    height: 200px;
    padding: 20px 0;
    float: left;
    word-break: break-all;
    
}

.review_comment{
    position: relative;
}

.review_bno{
    position: absolute;
    top: 0;
    left: 0;
    color:white;
}



/* 검색 */
.search input {
    height: 30px;   
}    
.search{
    position: relative;
    top: 30px;
    text-align: right;
}
.search .btn {
    background-color: white;
    border: 1px solid black;
    color: black;
    height: 30px;
}


/* 사이드 */


@media screen and (max-width: 1200px) {
    #right_banner {
      display: none;
    }
  }

.side {position: fixed; 
        right: 100px; 
        bottom: 100px;
        font-size: 15px; 
        z-index: 10;

    }

.side li {
    background-color: #e40c0c; 
    text-align: center; 
    padding: 5px 10px; 
    border: 1px solid black; 
    color: rgb(235, 230, 230); 
}

.side li a {
    text-decoration: none;
    color: black;    
    display: block;
    height: 20px;
    line-height: 20px;
    border: 0px;
}

.side .theater{
    background-color: whitesmoke;
    width: 100%;
    height: 30px;

}
.side .top{
    border: 0px;
    background-color: white;
}

.side .top img{
    width: 50px;
}

/* 페이징 */

 .pagination_box{
    margin-top: 15px;
    text-align: center;
    font-size: 15px;
    margin: 0;

}

.pagination{
    margin-top: 10px;
    
}

.pagination > .active > a {
    position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: black;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
}

.pagination > .active > a:hover{
	
	background: #ddd;
	border: 1px #ddd;
	color: black;
	cursor: pointer;
}

</style>

<section>
		<form action="reviewList">
	        <div class = "search">
	            <select class="search-select" name="searchType" style="height: 30px;">
	            	<option value="total" ${pageVO.cri.searchType eq 'total' ? 'selected' : ''}>전체</option>
	                <option value="title" ${pageVO.cri.searchType eq 'title' ? 'selected' : ''}>영화제목</option>
	                <option value="writer" ${pageVO.cri.searchType eq 'writer' ? 'selected' : ''}>작성자</option>
	            </select>
	            <input type="text" name="searchName" value="${pageVO.cri.searchName}"> 
	            <button type="submit" class="btn btn-primary">검색</button>
	        </div>
	        
	        <input type="hidden" name="pageNum" value="1"> 
            <input type="hidden" name="amount" value="${pageVO.amount }">
	        
        </form>
        <!--리뷰 -->
        <div class = "review_main">
            <lable style="font-size: 40px; font-weight: bold;">영화 리뷰</lable>
            <hr style="border-bottom: 3px solid black; margin: 10px 0;">
			
            <ul class="review_list" id="movie_review_list">
            	<c:forEach var="vo" items="${list }">
                <li class="review_comment">
                	<span class="review_bno">${vo.bno }</span>
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>${vo.movieTitle }</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>${vo.writer }</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">
                                	<fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd HH:ss"/> 
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <p><a href="reviewContent?bno=${vo.bno }">${vo.content }</a></p>

                    </div>
                </li>
                </c:forEach>
                <%-- <li class="review_comment">
                	<span class="review_bno">2</span>
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>볼때마다 느낌과 감동이 새롭네요. 이전에 볼때는 아주 잘 만든 공상과학영화라며 감상했는데, 오늘 보니 현재 코로나시대여서 그런지 현실감이 더욱 와닿고 곧 닥칠 미래인것처럼 다기옵니다.</p></a>
                    </div>
                </li> --%>
            </ul>
         </div>
                  
		  <!-- 페이징 -->
		  <form action="reviewList" name="pageForm">  
		    <div class = "pagination_box">
		        <ul class="pagination">
		        	<!--이전 버튼 -->
		        	<c:if test="${pageVO.prev }">
		            <li class="page-item">
			            <a class="page-link" href="#" aria-label="Previous" data-page="${pageVO.startPage - 1}" >
			                <span aria-hidden="true">&laquo;</span>
			                <span class="sr-only">Previous</span>
			            </a>
		            </li>
		            </c:if>
		            <!--1. 페이지네이션 번호 처리  -->
		            <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage}"> 
		            <li class="page-item ${num == pageVO.pageNum ? 'active' : '' }">
		            	<a class="page-link" href="#" data-page = "${num }">${num }</a>
	            	</li>
		            </c:forEach>
		            
					<c:if test="${pageVO.next }">	
		            <li class="page-item">
			            <a class="page-link" href="#" aria-label="Next" data-page="${pageVO.endPage + 1 }">
			                <span aria-hidden="true">&raquo;</span>	
			                <span class="sr-only">Next</span>
			            </a>
		            </li>
		            </c:if>
		        </ul>
		    </div>
		      <!-- 폼형식으로 보내는데 숨겨서 보낼값 hidden으로 표시 -->
            <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
            <input type="hidden" name="amount" value="${pageVO.cri.amount }">
            <input type="hidden" name="searchType" value="${pageVO.cri.searchType }">
            <input type="hidden" name="searchName" value="${pageVO.cri.searchName }">
		    
         </form>
        </section>

        
        <!-- 사이드 -->
        <aside class="side" id="right_banner">    
            <ul class="side-list">
                <li>영화관 찾기</li>
                <li class = "theater"><a href="https://www.cgv.co.kr/">CGV</a></li>
                <li class = "theater"><a href="https://www.lottecinema.co.kr/NLCHS">롯데시네마</a></li>
                <li class = "theater"><a href="https://www.megabox.co.kr/">메가박스</a></li>
                <li class = "top"><a href="#" ><img src="${pageContext.request.contextPath }/resources/img/btn_top2.png" alt="top-btn"></a></li>
            </ul>       
       </aside>
           
       <script>
       
            var pagination = document.querySelector(".pagination");
            pagination.onclick = function () {
				event.preventDefault(); //고유이벤트 중단
				if(event.target.tagName !== 'A') return; //중단
				
				var pageNum = event.target.dataset.page; //클릭한 타겟의 데이터셋값
				document.pageForm.pageNum.value = pageNum; //히든폼에 pageNum 타켓값을 저장
				
				document.pageForm.submit();
			}
       
       
       
       </script>   
           
           
           
           
           
           
