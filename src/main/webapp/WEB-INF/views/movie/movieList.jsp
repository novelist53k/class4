<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <div class="movie_list_tab" id = tab-menu>
        <ul class="outbox">
              <li class="left-inbox"><a href="#">현재개봉작</a></li>
              <li class="right-inbox"><a href="#">개봉예정작</a></li>
        </ul>
    </div>
	
      <section class = "movie_list_area">
        <div>
            <ul class="list_movie">
            
            	<c:forEach var="vo" items="${list }">
                <li>
                    <div class="info_movie">
                        <span class="thumb_movie">
                            <img src="${pageContext.request.contextPath }/resources/img/current/${vo.poster}" class = "img_g">
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
                       <a href="#" class="name_movie" style="text-decoration: none; color :black; font-weight: 700">${vo.title }</a>
                    </div>
                        <span class="info_state"><fmt:formatDate value="${vo.regdate }" pattern="yyyy년MM월dd일"/> <b>개봉</b></span>
                    </div>
                </li>
               </c:forEach>
                
            </ul>
        </div>
        
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
        
      <input type="button" value="영화등록" class="btn-regist">
     </section>

    <script>
   
    </script>
