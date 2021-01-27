<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <section class="movie_content_area">
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <% pageContext.setAttribute("replaceChar", "\n"); %>
 <%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="container">
      <div class="outter">
  
        <div class="mid1">
          <div class="photo-box">
            <img src="${pageContext.request.contextPath }/resources/img/poster/${info.poster}" style="width: 200px; height: 306px;">
          <button type="button" class="phobtn">사진등록</button>
          </div>
        </div>

        <div class="mid2">
          <div class="info-box">
            <span class="mov-title">
           	<b>${info.title }</b>
             <!-- 관리자 아이디로 로그인시에만 보이게 하기 -->
            
           
            <div class="btn-box">
      				<button type="button" class="updbtn">수정</button>
      				<!-- <button type="button" class="delbtn">삭제</button> -->
      		</div>
      		</span>
            <div class="mov-sec">
            
              <span class="mov-ftitle"><h4>${info.ftitle }</h4></span>
              <div class="star-box">
                <span class="star-icon">평점
                  <span class="glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                  <span class="mov-score">5</span>
                </span>
              </div>
            </div>
            <c:forEach var="genre" items="${genre }">
            <span class="mov-genre">${genre}</span>
            </c:forEach>
            
            <div class="date-grade">
              <span class="mov-date"><fmt:formatDate value="${info.openDt }" pattern="yyyy년 MM월 dd일"/> 개봉</span>
              <span class="mov-grade">${info.grade }</span>
            </div>
            <div class="mov-maker"> 
              <!-- 네이버 포털 검색 -->
          	    감독
              <c:forEach var="director" items="${directorList }">
               <span class="mov-dit"><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query='${director }">${director }</a></span>
           </c:forEach>
             	 주연
      	  <c:forEach var="actor" items="${actorList }">
      	  	<span class="mov-act"><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query='${actor }">${actor }</a></span>
          </c:forEach>
                
                
                 
                
             
            </div>

          </div>
            <hr>
            <div class="mov-theat" style="padding-bottom: 10px;">
              <a href="https://www.megabox.co.kr/">
                <img src="${pageContext.request.contextPath }/resources/img/mega.png" width="100px" >
              </a>
              <a href="https://www.cgv.co.kr/">
                <img src="${pageContext.request.contextPath }/resources/img/cgv.png" width="100px" >
              </a>
              <a href="https://www.lottecinema.co.kr/NLCHS">
                <img src="${pageContext.request.contextPath }/resources/img/lotte.jpg" width="100px" >
              </a>
            </div>
          </div>
        </div>

      </div>
      <br><br><br>



      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#info">주요정보</a></li>
        <li><a data-toggle="tab" href="#menu1">예고편</a></li>
        <li><a data-toggle="tab" href="#menu2">리뷰</a></li>
      </ul>

      <div class="tab-content">
        <div id="info" class="tab-pane fade in active">
          <h3 style="font-weight: bold;">줄거리</h3>
          <div class="content-box">
            <b class="title">${info.subhead }</b> <br>
            <p> ${fn:replace(info.content, replaceChar, "<br/>") }</p>
            
          </div>

        </div>
        <div id="menu1" class="tab-pane fade">
          <h3 style="font-weight: bold;">예고편</h3>
          <br><br><br>
          <div class="videobox">
            <!-- 예고편 소스코드 videobox안에 값 넣기-->
            ${info.trailer }
            <!-- <iframe width="900" height="580" src="https://www.youtube.com/embed/AAPAGnERPjw" frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen></iframe> -->
          </div>
        </div>
        
        <div id="menu2" autoplay class="tab-pane fade">
          <div class="head-box">
            

       
            <div class="rev-left">
              <table>
                <tr>
                  <td>찾기</td>
                  <td><input type="text" class="serach-writer" placeholder="글쓴이..."><button>검색</button></td>
                </tr>
              </table>
            </div>
            <div class="rev-right">
              <a href="../review/reviewRegist?mno=${info.movieCd }" class="right-regist" style="color: black;">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color: black;"></span>
              	  글쓰기</a>
            </div>
            
          </div>
          <table class="t">
            <thead style="margin-top:50px;">
              <tr>
                <th class="t1">번호</th>
<!--                 <th class="t2">감상평</th> -->
                <th class="t3">글쓴이·날짜</th>
              </tr>
            </thead>

            <tbody>
              <tr style="border-bottom: 0.1px solid rgba(145, 142, 142, 0.431);">
                <td class="b1">#</td>
                <td class="b2">
                  <div class="rev-head">
                    <b style="font-weight: bold;">영화제목</b>
                    <span class="rev-star">별점
                      <span class="glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                      <span class="rev-score">5</span>
                    </span>
                  </div>
                  <br>
                  <span class="text1">주저리주저리주저리주저리주저리주저리주저리주주저리주저리주저리주저리주저리주저리주저리주저리주저리주주저리주저리</span>
                  <br>
                  <span class="recom">추천</span>
                  <a href="#"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" style="color: black;"></span></a>
                </td>
                <td class="b3">작성일</td>
              </tr>
             
            </tbody>
            
          </table>

          <form class="page-form">
            <div class="pagination">
              <a href="#">&laquo;</a>
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
              <a href="#">6</a>
              <a href="#">&raquo;</a>
            </div>
          </form>
        </div>
           	<input type="hidden"  id="movieCd" value="${info.movieCd }">
        <form action="update" name="regForm" method="post">
        	<input type="hidden" name="cd" value="">
         </form>  
          <form action="phobtn" name="phoForm" method="post">
        	<input type="hidden" name="cd" value="">
         </form>
      </div>

  </section>
<script>
	$(".regbtn").click(function(){
		location.href="movieRegist";
	});
	
	$(".updbtn").click(function(){
		console.log(1)
		var cd = $("#movieCd").val();
		document.regForm.cd.value=cd;
		document.regForm.submit();
	});
	
	$(".phobtn").click(function(){
		var cd = $("#movieCd").val();
		document.phoForm.cd.value=cd;
		document.phoForm.submit();
	});
	
	
</script>