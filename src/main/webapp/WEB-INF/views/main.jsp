<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<section class="main_area">
        <div class="slider_title">
            <h2 style="color:white;">NEW & UPCOMING MOVIES</h2><!-- 비로그인 시-->
            <h2 style="color:white;">추천영화</h2><!-- 로그인 시-->
            <hr>
        </div>
        
        <!-- 최신작 -->
        <div class="slider_area_no_login">
            <h3 style="text-align:center; margin-top:10px; color:white;">최신영화</h3>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                	<c:forEach var="RecentVO" items="${mainRecentlyMovie}">
                    	<div class="swiper-slide">
                    		<img src="${pageContext.request.contextPath }/resources/img/current/${RecentVO.poster}" class = "img_g">
                    	</div>
                	</c:forEach>
                </div>
            
                <!-- 네비게이션 -->
                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
            
                <!-- 페이징 -->
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <!-- 개봉예정작 -->
        <div class="slider_area_no_login">
            <h3 style="text-align:center; margin-top:10px; color:white;">개봉예정작</h3>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach var="CommingSoonVO" items="${mainCommingSoonList}">
                    	<div class="swiper-slide">
                    		<img src="${pageContext.request.contextPath }/resources/img/current/${CommingSoonVO.poster}" class = "img_g">
                    	</div>
                	</c:forEach>
                </div>
            
                <!-- 네비게이션 -->
                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
            
                <!-- 페이징 -->
                <div class="swiper-pagination"></div>
            </div>
        </div>

        <!-- 로그인 시만 보임-->
        <!-- 선호하는 배우가 출연한 영화, 선호하는 배우 미선택시 안 보이게 -->
        <c:if test="${login !=null }">
        <c:if test="${UserLikeActorList.size() != 0 }">
	        <div class="slider_area_login">
	            <h3 style="text-align:center; margin-top:10px; color:white;">${login.userName }님이 선호하는 배우가 출연한 영화</h3>
	            <div class="swiper-container">
	                <div class="swiper-wrapper">
	                    <c:forEach var="UserLikeActorVO" items="${userLikeActorList}">
	                    	<div class="swiper-slide">
	                    		<img src="${pageContext.request.contextPath }/resources/img/current/${UserLikeActorVO.poster}" class = "img_g">
	                    	</div>
	                	</c:forEach>
	                </div>
	            
	                <!-- 네비게이션 -->
	                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	            
	                <!-- 페이징 -->
	                <div class="swiper-pagination"></div>
	            </div>
	        </div>
        </c:if>
        </c:if>
        
        <!-- 선호하는 감독의 영화, 선호하는 감독 미선택시 안 보이게 -->
        <c:if test="${login !=null }">
        <c:if test="${UserLikeDirectorList.size() != 0 }">
	        <div class="slider_area_login">
	            <h3 style="text-align:center; margin-top:10px; color:white;">${login.userName }님이 선호하는 배우가 출연한 영화</h3>
	            <div class="swiper-container">
	                <div class="swiper-wrapper">
	                    <c:forEach var="userLikeDirectorVO" items="${UserLikeDirectorList}">
	                    	<div class="swiper-slide">
	                    		<img src="${pageContext.request.contextPath }/resources/img/current/${UserLikeDirectorVO.poster}" class = "img_g">
	                    	</div>
	                	</c:forEach>
	                </div>
	            
	                <!-- 네비게이션 -->
	                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	            
	                <!-- 페이징 -->
	                <div class="swiper-pagination"></div>
	            </div>
	        </div>
        </c:if>
         </c:if>
        
        <!-- 선호하는 장르의 영화, 선호하는 장르 미선택시 안 보이게 -->
        <c:if test="${mainCommingSoonList.size() != 0 }">
	        <div class="slider_area_login">
	            <h3 style="text-align:center; margin-top:10px; color:white;">""님이 선호하는 배우가 출연한 영화</h3>
	            <div class="swiper-container">
	                <div class="swiper-wrapper">
	                    <c:forEach var="userLikeGenreVO" items="${userLikeGenreList}">
	                    	<div class="swiper-slide">
	                    		<img src="${pageContext.request.contextPath}/resources/img/current/${userLikeGenreVO.poster}" class = "img_g">
	                    	</div>
	                	</c:forEach>
	                </div>
	            
	                <!-- 네비게이션 -->
	                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	            
	                <!-- 페이징 -->
	                <div class="swiper-pagination"></div>
	            </div>
	        </div>
        </c:if>
        
		<hr>
    </section>
    
    <script>
    
    	new Swiper('.swiper-container', {

	        slidesPerView : 6, // 동시에 보여줄 슬라이드 갯수
	        spaceBetween : 30, // 슬라이드간 간격
	        slidesPerGroup : 6, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	
	        // 그룹수가 맞지 않을 경우 빈칸으로 메우기
	        // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	        loopFillGroupWithBlank : true,
	
	        loop : true, // 무한 반복
	
	        pagination : { // 페이징
	            el : '.swiper-pagination',
	            clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	        },
	        navigation : { // 네비게이션
	            nextEl : '.swiper-button-next', // 다음 버튼 클래스명
	            prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	        },
        });
	</script>
    