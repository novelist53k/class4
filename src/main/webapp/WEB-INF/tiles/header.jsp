<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<style type="text/css">
     .navbar-collapse{
    	float: right;
    }
    .navbar-nav>li>.menu{
      margin-top: 4px;
    }
    .dropdown{
      padding-bottom: 10px;
    }
    .navbar-default{
      background-color: black;
    }
    .navbar-nav li{
      margin-top: 8px;
    }
    .form-control{
      margin-top: 8px;
    }
    .btn-default{
      margin-right: 10px;
      margin-top: 8px ;
    }  
    .navbar-nav{
      padding-top: px;
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
                    <button type="submit" class="btn btn-default">검색</button>
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
                            ID :<input type="text" class="loginId" id="loginId"><br>
                            PW :<input type="text" class="loginPw" id="loginPw">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Join</button>
                            <button type="button" class="btn btn-default" id="loginBtn" data-dismiss="modal">Login</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
    </header>