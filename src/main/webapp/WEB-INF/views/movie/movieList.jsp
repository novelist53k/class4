<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <style type="text/css">
   
    *{margin: 0; padding: 0;}
    ul, li{list-style: none;}
     /* 헤더 */
     .navbar-collapse{
      float: right;
      
    }
    .navbar-nav>li>.menu{
      margin-top: 9px;
    }
   
    .navbar-default{
      background-color: black;
    }
    .navbar-nav li{
      margin-top: 8px;
    }
    .form-control{
      margin-top: 15px;
    }
    
    .navbar-nav{
      padding-top: px;
    }
    .form-group{
      position: relative;
      margin-right: 10px;
    }

    .icon-container{
      position: absolute;
      top: 25px;
      right: 10px;
      color: #6078EA;
    }


    /* 영화리스트 */
    #content{text-align: center; margin: 0 auto; width: 60%; }
        .img_g{width: 220px;}
        .list_movie{overflow: hidden;}
        .list_movie li{width: 220px; float: left;position: relative; margin: 20px; }
        .list_movie li:hover .desc_movie{opacity: 1;}
       /*  body{background-color: rgb(27, 27, 27);} */
        .desc_movie{   
            text-decoration: none;
            position: absolute;
            top: 0%; 
            left: 0%; 
            width: 220px; 
            height: 313px;
            color: black;
            background-color: white;
            opacity: 0;
            padding-top: 100px;
          
        }
        .content-box{
          width: 174px; 
          height: 168px;
          display: inline-block;
          font-size: 16px;
        }
        .content-box>p{
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }
        #tab-menu{
          width: 100%;
          height: 70px;
          }
        
        
        .bot{
            text-align: center;
        }
        .btnbox{
            width: 40%;
            margin: 0 auto;
        }  
        .more-btn {
        background-color: #e2c37ec9; 
        border: none;
        color: white;
        padding: 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        cursor: pointer;
        }
        .outbox{
            width:370px;
            margin: 0 auto; 
            text-align: center; 
            overflow: hidden;
            }
        .inbox {
            float: left;
            margin: 25px 15px;
            padding: 8px;
            width: 150px;
            border: 0.2px solid #d3d2d2da;
        }
        .inbox> a{
            text-decoration: none;
            color: #d3d2d2da;
            font-size: large;
        } 
        .inbox:hover a{
          color: rgb(53, 53, 136);
          font-weight: bold;
        }
        .inbox:active{
          border: 1px solid rgb(53, 53, 136);

        }
    </style>
</head>
<body>
 
    
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
            <!-- 로고 이미지 -->
              <img src="${pageContext.request.contextPath }/resources/img/horizontal_on_white_by_logaster.png" width="210" height="50px"alt="">
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
                <div class="icon-container">
                  <span type="button" class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </div>
              </div>
              
              <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">회원 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#myModal">로그인</a></li>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="#">회원탈퇴</a></li>
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
                <table>
                  <tr>
                    <td style="text-align: center;">ID</td>
                    <td><input type="text" class="loginId" id="loginId"></td>
                  </tr>
                  <tr>
                    <td>PW</td>
                    <td><input type="text" class="loginPw" id="loginPw"></td>
                  </tr>
                </table>
                  
                  
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



    <div id = tab-menu>
        <ul class="outbox">
              <li class="inbox"><a href="#">현재개봉작</a></li>
              <li class="inbox"><a href="#">개봉예정작</a></li>
        </ul>
    </div>       


      <section id = "content">
        <div>
            <ul class="list_movie">
                <li>
                    <div class="info_movie">
                        <span class="thumb_movie">
                            <img src="${pageContext.request.contextPath }/resources/img/resi.png" alt="" class = "img_g">
                        </span>
                        <div class="wrap_desc">
                            <div class="desc_movie">
                              <div class="content-box">
                                <b>전 세계 베스트셀러 [돌아온 래시] 원작 &nbsp;</b><br>
                                <b>영화 역사상 가장 유명한 명견 ‘래시’가 전하는 2021년 새해 첫 감동!&nbsp;</b><br>
                                <p>서로의 가장 소중한 친구인 12살 소년 플로와 천재견 래시.아버지가 실직해 작은 집으로 이사하자 플로는 더 이상 반려견을 키울 수 없게 되고,래시는 다른 사람의 저택에 맡겨진다.갑작스러운 이별로 래시와 플로가 서로를 그리워하던 어느 날,돈에 눈이 먼 저택의 직원이 래시를 팔아 넘기려 하고, 래시는 이를 피해 도망친다.이 소식을 들은 플로는 래시를 찾기 위해 용감한 모험을 떠나는데…&nbsp;</p>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="wrap_movie">
                        <div class="info_tit">
                        <em class="ico_movie ico_allrating">전체관람가</em><br>
                        <a href="#" class="name_movie" style="text-decoration: none; color :black; font-weight: 700">래시 컴 홈</a>
                    </div>
                        <span class="info_grade">
                            <a href="#" class="link_grade" data-tiara-layer="point" data-tiara-ordnum="1">
                            </a>
                        </span>
                        <span class="info_state">21.01.07 개봉</span>
                    </div>
                </li>
            </ul>
        </div>
     </section>

     <div class="bot">
        <div class="btn-box">
            <button type="button" class="more-btn">더보기</p>
        </div>
     </div>
    
      

</body>
</html>