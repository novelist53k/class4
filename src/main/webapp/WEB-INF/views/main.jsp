<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<style type="text/css">
		.sliderTitle{ margin-top:10px; color:white;}
	</style>
	<section class="main_area">
        <div class="slider_title">
            <h2 style="color:white;">NEW & UPCOMING MOVIES</h2><!-- 비로그인 시-->
            <h2 style="color:white;">추천영화</h2><!-- 로그인 시-->
            <hr>
        </div>
        
        <!-- 최신작 -->
        <div class="slider_area_no_login">
            <h3 class="sliderTitle">최신영화</h3>
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
            <h3 class="sliderTitle"">개봉예정작</h3>
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

        <!-- 로그인 시만 보이되 테스트시에는 조건 적용 X-->
        
        <!-- 선호하는 배우가 출연한 영화, 선호하는 배우 미선택시 안 보이게 -->
	    <div id="actorSlider" class="slider_area_login">
	    	<h3 id="userLikeActor" class="sliderTitle">""님이 선호하는 배우가 출연한 영화 ▼</h3>
	    	<hr>
	    </div>
        
        <!-- 선호하는 감독의 영화, 선호하는 감독 미선택시 안 보이게 -->
	    <div id="directorSlider" class="slider_area_login">
	    	<h3 id="userLikeDirector" class="sliderTitle">""님이 선호하는 감독의 영화 ▼</h3>
	    	<hr>
	    </div>
        
        <!-- 선호하는 장르의 영화, 선호하는 장르 미선택시 안 보이게 -->
	    <div id="genreSlider" class="slider_area_login">
	        <h3 id="userLikeGenre" class="sliderTitle">""님이 선호하는 장르별 영화 ▼</h3>
	        <hr>
        </div>
        
        <!-- 연령별 선호 영화 -->
        <div id="ageSlider">
        	<h3 id="ageGroupLike" class="sliderTitle">
        		<span id = "10">10대가 선호하는 영화 ▼</span> / 
        		<span id = "20">20대가 선호하는 영화 ▼</span> / 
        		<span id = "30">30대가 선호하는 영화 ▼</span> /       		
        		<span id = "40">40대가 선호하는 영화 ▼</span>
        	</h3>
        	<hr>
        </div>
        
        <!-- 성별별 선호 영화 -->
        <div id="genderSlider">
        	<h3 id="genderGroupLike" class="sliderTitle">
        		<span id="male">남성들이 선호하는 영화 ▼</span> / 
        		<span id="female">여성들이 선호하는 영화 ▼</span>
        	</h3>
        </div>
        
        
        
        
        
		<hr>
    </section>
    
    
    <script>
	    document.getElementById("userLikeActor").onclick = function() {
	    	getUserActorML();
	    }
	
		// 유저가 선호하는 배우가 출연한 영화를 가져오는 함수
		function getUserActorML() {
			
			id = "qwer";	// 테스트용 임시 아이디
			console.log(id);
	
			$.getJSON(
				"userLikeActor/" + id,
				function(dataList) {
					console.log(dataList);
					
					var str = "";
					
					str += '<h3 id="userLikeActor" style="text-align:center; margin-top:10px; color:white;">""님이 선호하는 배우가 출연한 영화</h3>';
					str += '<div class="swiper-container">';
	                str += '<div class="swiper-wrapper">';
	             	// for(var i = 0; i < dataList.length; ++i) {
		            for(var i = 0; i < 16; ++i) {
			            str += '<div class="swiper-slide">'
			            str += '<img src="${pageContext.request.contextPath}/resources/img/current/${userLikeActorVO.poster}" class = "img_g">'
			            str += '</div>';    	
		            }
	                str += '</div>';
	                str += '<div class="swiper-button-next"></div>';
	                str += '<div class="swiper-button-prev"></div>';
	
	                str += '<div class="swiper-pagination"></div>';
	            	str += '</div>';
	
		            document.getElementById("actorSlider").innerHTML = str;
	        		
				}
			);
			
			
		}
    

    
	    document.getElementById("userLikeDirector").onclick = function() {
	    	getUserDirectorML();
	    };
	
		// 유저가 선호하는 감독의 영화를 가져오는 함수
		function getUserDirectorML() {
			
			id = "qwer";	// 테스트용 임시 아이디
			console.log(id);
	
			$.getJSON(
				"userLikeDirector/" + id,
				function(dataList) {
					console.log(dataList);
					
					var str = "";
					
					str += '<h3 id="userLikeDirector" style="text-align:center; margin-top:10px; color:white;">""님이 선호하는 감독의 영화</h3>';
					str += '<div class="swiper-container">';
	                str += '<div class="swiper-wrapper">';
	             	// for(var i = 0; i < dataList.length; ++i) {
		            for(var i = 0; i < 16; ++i) {
			            str += '<div class="swiper-slide">'
			            str += '<img src="${pageContext.request.contextPath}/resources/img/current/${userLikeDirectorVO.poster}" class = "img_g">'
			            str += '</div>';    	
		            }
	                str += '</div>';
	                str += '<div class="swiper-button-next"></div>';
	                str += '<div class="swiper-button-prev"></div>';

	                str += '<div class="swiper-pagination"></div>';
	            	str += '</div>';
	
		            document.getElementById("directorSlider").innerHTML = str;
	        		
				}
			);
			
			
		}

    
    
	    document.getElementById("userLikeGenre").onclick = function() {
	    	getUgMovieList();
	    };
    
		// 유저가 선호하는 장르별 영화 함수
		function getUgMovieList() {
			
			id = "qwer";	// 테스트용 임시 아이디
			console.log(id);

			$.getJSON(
				"userLikeGenre/" + id,
				function(dataList) {
					console.log(dataList);
					
					var str = "";
					
					str += '<h3 id="userLikeGenre" style="text-align:center; margin-top:10px; color:white;">""님이 선호하는 장르의 영화</h3>'
		            str += '<div class="swiper-container">';
		            str += '<div class="swiper-wrapper">';
		            
		            // for(var i = 0; i < dataList.length; ++i) {
		            for(var i = 0; i < 16; ++i) {
			            str += '<div class="swiper-slide">'
			            str += '<img src="${pageContext.request.contextPath}/resources/img/current/${userLikeGenreVO.poster}" class = "img_g">'
			            str += '</div>';    	
		            }
		            str += '</div>';		            
		            str += '<div class="swiper-button-next"></div>';
		            str += '<div class="swiper-button-prev"></div>';
		            str += '<div class="swiper-pagination"></div>';
		            str += '</div>';

		            document.getElementById("genreSlider").innerHTML = str;
	        		
				}
			);
			
			
		}

				

		document.getElementById("ageGroupLike").onclick = function() {
	    	getMovieListByAge(event.target.id);
	    };
    
		// 나이에 따른 영화 선호도
		function getMovieListByAge(age) {
			console.log(3);
			console.log(age);
			
			$.getJSON(
					"userLikeByAge/" + age,
					function(dataList) {
						console.log(dataList);
						console.log("나이");
						
						var str = "";
						
						str += '<h3 id="ageGroupLike" class="sliderTitle">';
			        	str += '<span id="10">10대가 선호하는 영화' + (age == 10 ? ' ● ' : '▼') + '</span> / '; 
			        	str += '<span id="20">20대가 선호하는 영화' + (age == 20 ? ' ● ' : '▼') + '</span> / ';
			        	str += '<span id="30">30대가 선호하는 영화' + (age == 30 ? ' ● ' : '▼') + '</span> / '; 
			        	str += '<span id="40">40대가 선호하는 영화' + (age == 40 ? ' ● ' : '▼') + '</span>';
			        	str += '</h3>';
			            str += '<div class="swiper-container">';
			            str += '<div class="swiper-wrapper">';
			            
			            // for(var i = 0; i < dataList.length; ++i) {
			            for(var i = 0; i < 16; ++i) {
				            str += '<div class="swiper-slide">'
				            str += '<img src="${pageContext.request.contextPath}/resources/img/current/${userLikeGenreVO.poster}" class = "img_g">'
				            str += '</div>';
			            }
			            str += '</div>';		            
			            str += '<div class="swiper-button-next"></div>';
			            str += '<div class="swiper-button-prev"></div>';
			            str += '<div class="swiper-pagination"></div>';
			            str += '</div>';

			            document.getElementById("ageSlider").innerHTML = str;
		        	}
			);
		}
					
		
		
					
		document.getElementById("genderGroupLike").onclick = function() {
	    	getMovieListByGender(event.target.id);
	    };
    
		// 성별에 따른 영화 선호도
		function getMovieListByGender(gender) {
			console.log(gender);
			
			$.getJSON(
					"userLikeGenre/" + gender,
					function(dataList) {
						console.log(dataList);
						console.log("성별");
						
						
						var str = "";
						
						str += '<h3 id="genderGroupLike" class="sliderTitle">';
			        	str += '<span id="male">남성들이 선호하는 영화' + (gender == 'male' ? ' ● ' : '▼') + '</span> /'; 
			        	str += '<span id="female">여성들이 선호하는 영화' + (gender == 'female' ? ' ● ' : '▼') + '</span>';
			        	str += '</h3>';
			            str += '<div class="swiper-container">';
			            str += '<div class="swiper-wrapper">';
			            
			            // for(var i = 0; i < dataList.length; ++i) {
			            for(var i = 0; i < 16; ++i) {
				            str += '<div class="swiper-slide">'
				            str += '<img src="${pageContext.request.contextPath}/resources/img/current/${userLikeGenreVO.poster}" class = "img_g">'
				            str += '</div>';
			            }
			            str += '</div>';		            
			            str += '<div class="swiper-button-next"></div>';
			            str += '<div class="swiper-button-prev"></div>';
			            str += '<div class="swiper-pagination"></div>';
			            str += '</div>';

			            document.getElementById("genderSlider").innerHTML = str;
		        	}
			);
		}
					


		
		// swiper 슬라이더
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
    