<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style>
		.loginPw, .loginId{
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
                        <li><a href="${pageContext.request.contextPath }/movie/movieList" class="menu">영화</a></li>
                        <li><a href="${pageContext.request.contextPath }/review/reviewList" class="menu">리뷰</a></li>
                        <li><a href="${pageContext.request.contextPath }/theater/theater" class="menu">영화관</a></li>
                        <li><a href="#" class="menu">다운로드</a></li>
                    </ul>
                  
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                            <div class="icon-container">
                                <span type="button" class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            </div>
                        </div>
      
                        <!-- user 토글 -->
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">회원 <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="${pageContext.request.contextPath }/user/join">회원가입</a></li>
                                    <li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
                                  	<li><a href="${pageContext.request.contextPath }/user/mypage">마이페이지</a></li>
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
                            ID  :<input type="text" id="loginId" name="userId" class="userId"><br>
                            PW :<input type="text" id="loginPw" name="userPw" class="userPw">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Join</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="login" name="login">Login</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                        <p></p>
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
    			url : "login",
    			data : JSON.stringify({"userId":userId,"userPw":userPw}),
    			contentType : "application/json; charset=utf-8",
    			success : function(data){
    					if(data===1){
    						console.log("로그인");
    						location.href="${pageContext.request.contextPath }/user/mypage";
    					}else{
    						alert("없는 회원입니다")
    					}
    					
    				
    			},
    			error : function(status, error){}	
    		})
    	})
    
    </script>
    	