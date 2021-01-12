<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<style type="text/css">
        *{margin:0; padding: 0; list-style: none;}
        header .header {
            box-sizing: border-box;
        }
        .header > ul {
            overflow:hidden;
            background-color: rgb(27, 27, 27);
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

        .header .menu .main-search .search-text {
            height : 40%;
            line-height: 30%;
            border-radius: 50px;
            padding: 12px 24px;
        }

        .header .main-search .search-btn {
            height : 40%;
            width:50px;
            line-height: 30%;
            border-radius: 30%;
        }

        .header .menu li a {text-decoration: none; color:white;}   
        
    </style>
	
    <header>
    	<nav class="header">
            <ul>
                <div class="logo">
                    <li><a href="">로고</a></li>
                </div>
                <div class="menu">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Login <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="">마이페이지</a></li>
                                <li><button type="button" class="btn btn-info btn-lg login" data-toggle="modal" data-target="#myModal">Login</button></li>
                            </ul>
                        </li>
                    </ul>
                    
                    <li class="main-search"> 
                        <input class="search-text" type="text" placeholder="Search">
                        <button type="button" class="search-btn btn btn-primary" placeholer="Search Keyword">검색</button>
                    </li>
                    <li><a href="">영화관</a></li>
                    <li><a href="">리뷰</a></li>
                    <li><a href="">영화</a></li>
                </div>

            </ul>

            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">로그인</h4>
                        </div>
                        <div class="modal-body">
                            ID :<input type="text"><br>
                            PW :<input type="text">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Join</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Login</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>