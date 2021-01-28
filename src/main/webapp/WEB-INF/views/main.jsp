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
            <h3 class="sliderTitle"><a href="movie/movieCurrent">최신영화</a></h3>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                	<c:forEach var="RecentVO" items="${mainRecentlyList}">
                    	<div class="swiper-slide">
                    		<a href="movie/movieContent?movieCd=${RecentVO.movieCd}" title="${RecentVO.title }">
                    			<img src="${pageContext.request.contextPath }/resources/img/poster/${RecentVO.poster == null ? 'b.png' : RecentVO.poster}" class = "img_g">
                    		</a>
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
            <h3 class="sliderTitle"><a href="movie/movieExpectced">개봉예정작</a></h3>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach var="CommingSoonVO" items="${mainCommingSoonList}">
                    	<div class="swiper-slide">
                    		<a href="movie/movieContent?movieCd=${CommingSoonVO.movieCd}" title="${CommingSoonVO.title }">
                    			<img src="${pageContext.request.contextPath }/resources/img/current/${RecentVO.poster == null ? 'b.png' : RecentVO.poster}" class = "img_g">
                    		</a>
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
        
        <!-- 유저가 선호하는 배우 목록 -->
        <c:if test="${wTRActor != 0 }">
	        <div class="slider_area_no_login">
	            <h3 class="sliderTitle">"${sessionScope.login.userId }"님이 선호하는 배우가 출연한 영화</h3>
	            <div class="swiper-container">
	                <div class="swiper-wrapper">
	                    <c:forEach var="UserLikeActorVO" items="${userLikeActorList}">
	                    	<div class="swiper-slide">
	                    		<a href="movie/movieContent?movieCd=${UserLikeActorVO.movieCd}" title="${UserLikeActorVO.title }">
	                    			<img src="${pageContext.request.contextPath }/resources/img/poster/${UserLikeActorVO.poster == null ? 'b.png' : UserLikeActorVO.poster}" class = "img_g">
	                    		</a>
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
        
        <!-- 유저가 선호하는 배우 목록 -->
        <c:if test="${wTRDirector != 0 }">
	        <div class="slider_area_no_login">
	            <h3 class="sliderTitle">"${sessionScope.login.userId }"님이 선호하는 감독의 영화</h3>
	            <div class="swiper-container">
	                <div class="swiper-wrapper">
	                    <c:forEach var="UserLikeDirectorVO" items="${userLikeDirectorList}">
	                    	<div class="swiper-slide">
	                    		<a href="movie/movieContent?movieCd=${UserLikeDirectorVO.movieCd}" title="${UserLikeDirectorVO.title }">
	                    			<img src="${pageContext.request.contextPath }/resources/img/poster/${UserLikeDirectorVO.poster == null ? 'b.png' : UserLikeDirectorVO.poster}" class = "img_g">
	                    		</a>
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
        
         <!-- 유저가 선호하는 장르 목록 -->
        <c:if test="${wTRGenre != 0 }">
	        <div class="slider_area_no_login">
	            <h3 class="sliderTitle">"${sessionScope.login.userId }"님이 선호하는 감독의 영화</h3>
	            <div class="swiper-container">
	                <div class="swiper-wrapper">
	                    <c:forEach var="UserLikeGenreVO" items="${userLikeGenreList}">
	                    	<div class="swiper-slide">
	                    		<a href="movie/movieContent?movieCd=${UserLikeGenreVO.movieCd}" title="${UserLikeGenreVO.title }">
	                    			<img src="${pageContext.request.contextPath }/resources/img/poster/${UserLikeGenreVO.poster == null ? 'b.png' : UserLikeGendreVO.poster}" class = "img_g">
	                    		</a>
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
        
        <!-- 성별별 선호영화 -->
        <c:if test="${listByGender != null }">
	        <div class="slider_area_no_login">
	            <h3 class="sliderTitle">${sessionScope.login.userGender eq 'woman' ? '여자' : '남자' }들이 선호하는 영화</h3>
	            <div class="swiper-container">
	                <div class="swiper-wrapper">
	                    <c:forEach var="BgVO" items="${listByGender}">
	                    	<div class="swiper-slide">
	                    		<a href="movie/movieContent?movieCd=${BgVO.movieCd}" title="${BgVO.title }">
	                    			<img src="${pageContext.request.contextPath }/resources/img/poster/${BgVO.poster == null ? 'b.png' : BgVO.poster}" class = "img_g">
	                    		</a>
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
        
        <!-- 연령별 선호영화 -->
        <c:if test="${listByAge != null }">
	        <div class="slider_area_no_login">
	            <h3 class="sliderTitle">20대가 선호하는 영화</h3>
	            <div class="swiper-container">
	                <div class="swiper-wrapper">
	                    <c:forEach var="BaVO" items="${listByAge}">
	                    	<div class="swiper-slide">
	                    		<a href="movie/movieContent?movieCd=${BaVO.movieCd}" title="${BaVO.title }">
	                    			<img src="${pageContext.request.contextPath }/resources/img/poster/${BaVO.poster == null ? 'b.png' : BaVO.poster}" class = "img_g">
	                    		</a>
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
        
        
        
        
        
        
        
        
        
        
        <!-- 비동기는 나중에 처리 -->

        <!-- 로그인 시만 보이되 테스트시에는 조건 적용 X-->
        
        <!-- 선호하는 배우가 출연한 영화, 선호하는 배우 미선택시 안 보이게 -->
	    <%--
	    <div id="actorSlider" class="slider_area_login" style='${wTRActor == -1 ? "" : "visibility:hidden"}'>
		    <h3 id="userLikeActor" class="sliderTitle">${sessionScope.login.userId }님이 선호하는 배우가 출연한 영화 ▼</h3>
		    <hr>
	    </div>
        
        <!-- 선호하는 감독의 영화, 선호하는 감독 미선택시 안 보이게 -->
	    <div id="directorSlider" class="slider_area_login" style='${wTRDirector == -1 ? "" : "visibility:hidden"}'>
		    <h3 id="userLikeDirector" class="sliderTitle">${sessionScope.login.userId }님이 선호하는 감독의 영화 ▼</h3>
		    <hr>
	    </div>
        
        <!-- 선호하는 장르의 영화, 선호하는 장르 미선택시 안 보이게 -->
	    <div id="genreSlider" class="slider_area_login" style='${wTRGenre == -1 ? "" : "visibility:hidden"}'>
		    <h3 id="userLikeGenre" class="sliderTitle">${sessionScope.login.userId }님이 선호하는 장르별 영화 ▼</h3>
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
        		<span id="man">남성들이 선호하는 영화 ▼</span> / 
        		<span id="women">여성들이 선호하는 영화 ▼</span>
        	</h3>
        </div>
        --%>
        
    </section>
    
    
    <script>
    	/*
	    document.getElementById("userLikeActor").onclick = function() {
	    	getUserActorML();
	    };
	
		// 유저가 선호하는 배우가 출연한 영화를 가져오는 함수
		function getUserActorML() {
	
			$.getJSON(
				"userLikeActor",
				function(dataList) {
					var str = "";
					
					if(dataList.length == 0) {
						str = '<h3 id="userLikeActor" style="text-align:center; margin-top:10px; color:white;">데이터베이스 자료부족으로 요청하신 배우에 관한 자료를 불러오지 못했습니다</h3>';
						document.getElementById("actorSlider").innerHTML = str;
						return;
					}
					
					
					str += '<h3 id="userLikeActor" style="text-align:center; margin-top:10px; color:white;">"${sessionScope.login.userId }"님이 선호하는 배우가 출연한 영화</h3>';
					str += '<div class="swiper-container" swiper-container-initialized swiper-container-horizontal>';
	                str += '<div class="swiper-wrapper">';
	             	for(var i = 0; i < dataList.length; ++i) {

			            str += '<div class="swiper-slide">';
			            str += '<a href="movie/movieContent?movieCd=' + dataList[i].movieCd + '>"';
			            
			            if(dataList[i].grade == '청소년 관람불가' && dataList[i].poster == null) {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'a.jpg' + '" class = "img_g">';
			            }
			            else if(dataList[i].grade != '청소년 관람불가' && dataList[i].poster == null) {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'b.png' + '" class = "img_g">';
			            }
			            else {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + dataList[i].poster + '" class = "img_g">';    	
			            }
			            str += '</a>';
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
			
			slide();
			
		}
    

    
	    document.getElementById("userLikeDirector").onclick = function() {
	    	getUserDirectorML();
	    };
	
		// 유저가 선호하는 감독의 영화를 가져오는 함수
		function getUserDirectorML() {
	
			$.getJSON(
				"userLikeDirector/",
				function(dataList) {
					var str = "";
					
					if(dataList.length == 0) {
						str = '<h3 id="userLikeDirector" style="text-align:center; margin-top:10px; color:white;">데이터베이스 자료부족으로 요청하신 감독에 관한 자료를 불러오지 못했습니다</h3>';
						document.getElementById("directorSlider").innerHTML = str;
						return;
					}
					
					
					str += '<h3 id="userLikeDirector" style="text-align:center; margin-top:10px; color:white;">"${sessionScope.login.userId }"님이 선호하는 감독의 영화</h3>';
					str += '<div class="swiper-container">';
	                str += '<div class="swiper-wrapper">';
	             	for(var i = 0; i < dataList.length; ++i) {
	             		console.log(dataList[i] != null ? dataList[i].movieCd : '1');
			            str += '<div class="swiper-slide">';
			            str += '<a href="movie/movieContent?movieCd=' + dataList[i].movieCd + '>" style="z-index:50"';
			            if(dataList[i].grade == '청소년 관람불가' && dataList[i].poster == null) {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'a.jpg' + '" class = "img_g">';
			            }
			            else if(dataList[i].grade != '청소년 관람불가' && dataList[i].poster == null) {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'b.png' + '" class = "img_g">';
			            }
			            else {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + dataList[i].poster + '" class = "img_g">';    	
			            }
			            str += '</a>';
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
			
			slide();
		}

    
    
	    document.getElementById("userLikeGenre").onclick = function() {
	    	getUgMovieList();
	    };
    
		// 유저가 선호하는 장르별 영화 함수
		function getUgMovieList() {

			$.getJSON(
				"userLikeGenre",
				function(dataList) {
					var str = "";
					
					if(dataList.length == 0) {
						str = '<h3 id="userLikeGenre" style="text-align:center; margin-top:10px; color:white;">데이터베이스 자료부족으로 요청하신 장르에 관한 자료를 불러오지 못했습니다</h3>';
						document.getElementById("genreSlider").innerHTML = str;
						return;
					}
					
					
					str += '<h3 id="userLikeGenre" style="text-align:center; margin-top:10px; color:white;">"${sessionScope.login.userId }"님이 선호하는 장르의 영화</h3>'
		            str += '<div class="swiper-container">';
		            str += '<div class="swiper-wrapper">';
		            
	             	for(var i = 0; i < dataList.length; ++i) {

			            str += '<div class="swiper-slide">';
			            str += '<a href="movie/movieContent?movieCd=' + dataList[i].movieCd + '>"';
			            if(dataList[i].grade == '청소년 관람불가' && dataList[i].poster == null) {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'a.jpg' + '" class = "img_g">';
			            }
			            else if(dataList[i].grade != '청소년 관람불가' && dataList[i].poster == null) {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'b.png' + '" class = "img_g">';
			            }
			            else {
			            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + dataList[i].poster + '" class = "img_g">';    	
			            }
			            str += '</a>';
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
			
			slide();
		}

				

		document.getElementById("ageGroupLike").onclick = function() {
	    	getMovieListByAge(event.target.id);
	    };
    
		// 나이에 따른 영화 선호도
		function getMovieListByAge(age) {
			console.log(age);
			
			$.getJSON(
					"userLikeByAge/" + age,
					function(dataList) {
						var str = "";
						
						if(dataList.length == 0) {
							str = '<h3 id="ageGroupLike" style="text-align:center; margin-top:10px; color:white;">데이터베이스 자료부족으로 요청하신 연령대에 관한 자료를 불러오지 못했습니다</h3>';
							document.getElementById("ageSlider").innerHTML = str;
							return;
						}
						
						
						str += '<h3 id="ageGroupLike" class="sliderTitle">';
			        	str += '<span id="10">10대가 선호하는 영화' + (age == 10 ? ' ● ' : '▼') + '</span> / '; 
			        	str += '<span id="20">20대가 선호하는 영화' + (age == 20 ? ' ● ' : '▼') + '</span> / ';
			        	str += '<span id="30">30대가 선호하는 영화' + (age == 30 ? ' ● ' : '▼') + '</span> / '; 
			        	str += '<span id="40">40대가 선호하는 영화' + (age == 40 ? ' ● ' : '▼') + '</span>';
			        	str += '</h3>';
			        	str += '<div class="swiper-container" swiper-container-initialized swiper-container-horizontal>';
			            str += '<div class="swiper-wrapper">';
			            
		             	for(var i = 0; i < dataList.length; ++i) {
				            str += '<div class="swiper-slide">';
				            str += '<a href="movie/movieContent?movieCd=' + dataList[i].movieCd + '>"';
				            if(dataList[i].grade == '청소년 관람불가' && dataList[i].poster == null) {
				            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'a.jpg' + '" class = "img_g">';
				            }
				            else if(dataList[i].grade != '청소년 관람불가' && dataList[i].poster == null) {
				            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'b.png' + '" class = "img_g">';
				            }
				            else {
				            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + dataList[i].poster + '" class = "img_g">';    	
				            }
				            str += '</a>';
				            str += '</div>';    	
			            }
			            str += '</div>';		            
			            str += '<div class="swiper-button-next"></div>';
			            str += '<div class="swiper-button-prev"></div>';
			            str += '<div class="swiper-pagination"></div>';
			            str += '</div>';

			            document.getElementById("ageSlider").innerHTML = str;
			            
			            document.getElementById("ageGroupLike").onclick = function() {
			    	    	getMovieListByAge(event.target.id);
			    	    };
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
					"userLikeByGender/" + gender,
					function(dataList) {
						
						var str = "";
						
						if(dataList.length == 0) {
							str = '<h3 id="genderGroupLike" style="text-align:center; margin-top:10px; color:white;">데이터베이스 자료부족으로 요청하신 성별에 관한 자료를 불러오지 못했습니다</h3>';
							document.getElementById("genderSlider").innerHTML = str;
							return;
						}
						
						str += '<h3 id="genderGroupLike" class="sliderTitle">';
			        	str += '<span id="man">남성들이 선호하는 영화' + (gender == 'man' ? ' ● ' : '▼') + '</span> /'; 
			        	str += '<span id="women">여성들이 선호하는 영화' + (gender == 'women' ? ' ● ' : '▼') + '</span>';
			        	str += '</h3>';
			            str += '<div class="swiper-container">';
			            str += '<div class="swiper-wrapper">';
			            
		             	for(var i = 0; i < dataList.length; ++i) {
				            str += '<div class="swiper-slide">';
				            str += '<a href="movie/movieContent?movieCd=' + dataList[i].movieCd + '>"';
				            if(dataList[i].grade == '청소년 관람불가' && dataList[i].poster == null) {
				            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'a.jpg' + '" class = "img_g">';
				            }
				            else if(dataList[i].grade != '청소년 관람불가' && dataList[i].poster == null) {
				            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + 'b.png' + '" class = "img_g">';
				            }
				            else {
				            	str += '<img src="${pageContext.request.contextPath}/resources/img/poster/' + dataList[i].poster + '" class = "img_g">';    	
				            }
				            str += '</a>';
				            str += '</div>';    	
			            }
			            str += '</div>';		            
			            str += '<div class="swiper-button-next"></div>';
			            str += '<div class="swiper-button-prev"></div>';
			            str += '<div class="swiper-pagination"></div>';
			            str += '</div>';

			            document.getElementById("genderSlider").innerHTML = str;
			            
			            document.getElementById("genderGroupLike").onclick = function() {
			    	    	getMovieListByGender(event.target.id);
			    	    };
			    	    slide();
		        	}
			);
		}
		*/


		
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
    