<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<style type="text/css">
	
        *{margin:0; padding: 0; list-style: none; }
        header .header {
            box-sizing: border-box;
        }
       
        
        .header > ul {
            overflow:hidden;
            background-color: black;
            margin:0;
        }
        .logo > li {
            height:100px;
            line-height:100px;
            float:left;
            padding: 0px 20px;
            
        }

        .header .logo > li a {
            text-decoration: none; color:white;
        }

        .header .menu > li {
            height:100px;
            line-height:100px;
            float:right;
            word-spacing:30px;
            padding: 0px 20px;
        }

        .dropdown-menu>li>a {
            display: block;
            padding: 3px 20px;
            clear: both;
            font-weight: 400;
            line-height: 1.42857143;
            color: #333;
            white-space: nowrap;
        }
        .navbar-collapse{
        background-color:black;}

        .header .menu .main-search .search-text {
            height : 40%;
            line-height: 30%;
            border-radius: 50px;
            padding: 12px 24px;
       		position: relative;
        }

        .header .main-search .search-btn {
            height : 40px;
            width:40px;
            right:108px;
            border-radius: 10px;
            top:31px;
            
            position: absolute;
        }

        .header .menu li a {text-decoration: none; color:white;} 
        
         .loginId, .loginPw{   
      display: block;
      position: relative;
      width: 47%;
      height: 34px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
      
    }  
    .login{
    	padding: 6px;
    	margin: 15px;
    }
    .dropdown-menu{
    	background-color: black;
    	
    	z-index: 1000;
    	
    }
    .dropdown-toggle{
    	margin-top:27px;
    	margin-right:25px;
    }
    .nav>li>a:hover{
    	background-color:black;
    }
    .nav>li>a:active{
    	background-color:black;
    }
    .nav .open>a, .nav .open>a:focus, .nav .open>a:hover{	background-color:black;
    }
    .menu{
    	z-index:9999;
    }
    .search-btn{
    }
     
    
        
    </style>
	
    <header>
    	  <nav class="navbar navbar-default" >
            <div class="container-fluid">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" height="80px">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" style="padding:0">
                    <img src="img/horizontal_on_white_by_logaster.png" width="210" height="50px"alt="">
                </a>
              </div>
          
              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                  <li><a href="#" class="menu">메인</a></li>
                  <li><a href="#" class="menu">영화</a></li>
                  <li><a href="#" class="menu">리뷰</a></li>
                  <li><a href="#" class="menu">영화관</a></li>
                  <li><a href="#" class="menu">다운로드</a></li>
                </ul>
                
                  <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                      <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-primary">검색</button>
                    <ul class="nav navbar-nav navbar-right">
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">회원 <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="join">회원가입</a></li>
                          <li><a href="#" data-toggle="modal" data-target="#myModal">로그인</a></li>
                        
                        </ul>
                      </li>
                  </ul>
                  </form>
                
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
          </nav>
          <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">로그인</h4>
                        </div>
                        <div class="modal-body">
                            아이디 <input type="text" class="loginId" id="loginId"><br>
                            비밀번호 <input type="text" class="loginPw" id="loginPw">
                        </div>
                        <div class="modal-footer">
                        	
                            <button type="button" class="btn btn-primary" id="loginBtn" data-dismiss="modal">Login</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
    </header>
    <script>
    	$("#loginBtn").click(function(){
    		var loginId = $("#loginId").val();
    		var loginPw = $("#loginPw").val();
    		console.log(loginId)
    		console.log(loginPw)
    	})
    	
    	
    	</script>
    	
    	
    	

    	
    	
   </script>