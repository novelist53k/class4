<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <form class="movie_list_tab" id = "tab-menu" name = "releaseForm" action="movieList">
    
        <ul class="outbox">
              <li class="left-inbox"><a class="curm" href="movieCurrent">현재개봉작</a></li>
              <li class="right-inbox"><a class="expm" href="movieExpected">개봉예정작</a></li>
        </ul>
    </form>
	
      <section class = "movie_list_area">
        <div class = "box_list_movie">
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
        
        <form action="movieList" name="pageForm">
		    		
                    <div class="text-center">
                    <hr>
                    <ul class="pagination pagination-sm">
                        <!-- 3.이전버튼활성화여부 -->
                        <c:if test="${pageVO.prev }">
                        <li>
                        	<a href="#" data-page="${pageVO.startPage-1 }">이전</a>
                        </li>
                        </c:if>
                        <!-- 1.페이지네이션 번호 처리 -->
                        <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
                        <li class="${num == pageVO.pageNum ? 'active' : '' }">
                        	<a href="#" data-page="${num }" >${num }</a>
                        </li>
                        </c:forEach>	
                        
                        <!-- 2.다음버튼활성화여부 -->
                        <c:if test="${pageVO.next }">
                        <li>
                        	<a href="#" data-page="${pageVO.endPage+1 }">다음</a>
                        </li>
                        </c:if>
                    </ul>
                    
                    </div>
                   	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
		    		</form>		    		

    		  <input type="button" value="영화등록" class="btn-regist">
     </section>
     
	
    <script>
   
	//페이징
   	var pagination = document.querySelector(".pagination");
   	pagination.onclick = function(){
   		event.preventDefault();
   		if(event.target.tagName !== "A") return;
   		
   		var pageNum = event.target.dataset.page;
   		document.pageForm.pageNum.value = pageNum;
   		document.pageForm.submit();
  	 	}
   	
   	//개봉작별로 style변화주기
  
   var rightbox = document.querySelector(".right-inbox");
   var expm = document.querySelector(".expm");
   		rightbox.style.border = "1px solid #23527c";
   		expm.style.color = "#23527c";
   		expm.style.fontWeight = "bold"; 
   	</script>
