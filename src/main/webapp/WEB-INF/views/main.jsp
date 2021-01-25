<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<section class="main_area">
        <div class="slider_title">
            <h2 style="color:white;">NEW & UPCOMING MOVIES</h2><!-- 비로그인 시-->
            <h2 style="color:white;">추천영화</h2><!-- 로그인 시-->
            <hr>
        </div>
        
        <!-- 비로그인 시-->
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
        <div class="slider_area_no_login">
            <h3 style="text-align:center; margin-top:10px; color:white;">개봉예정작</h3>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                </div>
            
                <!-- 네비게이션 -->
                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
            
                <!-- 페이징 -->
                <div class="swiper-pagination"></div>
            </div>
        </div>

        <!-- 로그인 시-->
        <div class="slider_area_login">
            <h3 style="text-align:center; margin-top:10px; color:white;">장르별 추천영화</h3>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                </div>
            
                <!-- 네비게이션 -->
                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
            
                <!-- 페이징 -->
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="slider_area_login">
            <h3 style="text-align:center; margin-top:10px; color:white;">감독별 추천영화</h3>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                </div>
            
                <!-- 네비게이션 -->
                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
            
                <!-- 페이징 -->
                <div class="swiper-pagination"></div>
            </div>
        </div>

        <div class="slider_area_login">
            <h3 style="text-align:center; margin-top:10px; color:white;">배우별 추천영화</h3>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/poster.jpg"></div>
                </div>
            
                <!-- 네비게이션 -->
                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
            
                <!-- 페이징 -->
                <div class="swiper-pagination"></div>
            </div>
        </div>
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
    