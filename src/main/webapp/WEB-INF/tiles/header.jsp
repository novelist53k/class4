<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<style>
		.userId, .userPw{
      display: inline-block;
      width: 275px;
      height: 34px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-bottom: 25px;
    }
	</style>
    <header>
    	<nav class="navbar navbar-default" >
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" style="padding:0">
                        <img src="${pageContext.request.contextPath}/resources/img/horizontal_on_white_by_logaster.png" width="210" height="50px"alt="">
                    </a>
                </div>
          
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <!-- 메뉴 -->
                    <ul class="nav navbar-nav">

                        <li><a href="${pageContext.request.contextPath }" class="menu">메인</a></li>
                        <li><a href="${pageContext.request.contextPath }/movie/movieCurrent" class="menu">영화</a></li>
                        <li><a href="${pageContext.request.contextPath }/review/reviewList" class="menu">리뷰</a></li>
                        <li><a href="${pageContext.request.contextPath }/theater/theater" class="menu">영화관</a></li>
                        <li><a href="https://serieson.naver.com/movie/home.nhn" class="menu">다운로드</a></li>                      
                    </ul>
                  
                    <form name="movieSearchForm" action="${pageContext.request.contextPath}/search" class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" name="keyword" class="form-control" placeholder="Search">
                            <div class="icon-container">
	                        	<span id="searchMovieBtn" class="glyphicon glyphicon-search" aria-hidden="true"></span>                            	
                            </div>
                        </div>
      
                        <!-- user 토글 -->
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">회원 <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                        <c:choose>
                    		<c:when test="${login eq NULL }">
                                    <li><a href="${pageContext.request.contextPath }/user/join">회원가입</a></li>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
                    		</c:when>
                    		<c:otherwise>
                                  	<li><a href="${pageContext.request.contextPath }/user/mypage">마이페이지</a></li>
	                    			<li><a href="${pageContext.request.contextPath }/user/logout">로그아웃</a></li>
                    		</c:otherwise>
                    	</c:choose>
                                </ul>                      
                            </li>
                        </ul>
                    </form>
                
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->

            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">로그인</h4>
                        </div>
                        <div class="modal-body">
                            <label>아이디</label><br><input type="text" id="loginId" name="userId" class="userId"><br>
                            <label>비밀번호</label><br><input type="password" id="loginPw" name="userPw" class="userPw">
                        </div>
                        <div class="modal-footer">                            
                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="login" name="login">Login</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        
    </header>
    <script>
    	$("#login").click(function(){
    		console.log("login버튼 누름")
    		var userId = $("#loginId").val();
    		var userPw = $("#loginPw").val();
    		console.log(userId);
    		console.log(userPw);
    		$.ajax({
    			type : "POST",
    			url : "${pageContext.request.contextPath }/user/login",
    			data : JSON.stringify({"userId":userId,"userPw":userPw}),
    			contentType : "application/json; charset=utf-8",
    			success : function(data){
    					if(data===1){
    						console.log("로그인");
    						alert("로그인 성공");
    						location.href="${pageContext.request.contextPath }";
    					}else{
    						alert("없는 회원입니다")
    					}
    					
    				
    			},
    			error : function(status, error){}	
    		})
    	});
    	
    	$("#searchMovieBtn").click(function() {
    		// console.dir(document.movieSearchForm);
    		document.movieSearchForm.submit();
    	});
    	
    </script>
    	