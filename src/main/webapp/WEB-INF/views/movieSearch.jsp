<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<style type="text/css">
		.sliderTitle{ margin-top:10px; color:white;}
	</style>
	
      <section class = "movie_list_area">
        <div class = "box_list_movie">
            <ul class="list_movie">
            
            	<c:forEach var="vo" items="${list }">
                <li>
                    <div class="info_movie">
                        <span class="thumb_movie">
                        	<c:choose>
                        	<c:when test="${vo.grade eq '청소년관람불가' && vo.poster eq null}">
                            <img src="${pageContext.request.contextPath }/resources/img/poster/a.jpg" class = "img_g">
                            </c:when>
                        	<c:when test="${vo.grade ne '청소년관람불가' && vo.poster eq null}">
                            <img src="${pageContext.request.contextPath }/resources/img/poster/b.png" class = "img_g">
                            </c:when>
                            <c:otherwise>
                            <img src="${pageContext.request.contextPath }/resources/img/poster/${vo.poster}" class = "img_g">
                            </c:otherwise>
                            </c:choose>
                        </span>
                        <div class="wrap_desc">
                            <div class="desc_movie">
                              <div class="content-box">
                               <b>${vo.subhead }</b><br>
                               <p>${vo.content }</p>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="wrap_movie">
                        <div class="info_tit">
                         <em class="ico_movie ico_allrating">${vo.grade }</em><br>
                       <a href="movie/movieContent?movieCd=${vo.movieCd }" class="name_movie" style="text-decoration: none; color :black; font-weight: 700">${vo.title }</a>
                    </div>
                        <span class="info_state"><fmt:formatDate value="${vo.openDt }" pattern="yyyy/MM/dd"/><b>개봉</b></span>
                    </div>
                </li>
               </c:forEach>
                
            </ul>
        </div>
        
        <hr>
        <h3 class="sliderTitle">
        	<a href="#" style="${sessionScope.login == null ? 'visibility:hidden' : ''}">이런 영화는 어떠신가요?(사용자 검색기록을 통해 자주 사용된 단어로 영화를 가져옵니다)</a>
        </h3>
        
        <ul id="searchAnalysis" class="list_movie" >
        </ul>

     </section>
     
	
    <script>


   	//개봉작별로 style변화주기
   var leftbox = document.querySelector(".left-inbox");
   var curm = document.querySelector(".curm");
   		leftbox.style.border = "1px solid #23527c";
   		curm.style.color = "#23527c";
   		curm.style.fontWeight = "bold"; 
   		
 
   	</script>