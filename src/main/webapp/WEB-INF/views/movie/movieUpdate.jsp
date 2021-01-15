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
     *{margin:0; padding: 0; list-style: none;}
        header .header {
            box-sizing: border-box;
        }
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

    /* 영화업데이트 */
        .registForm{
            background: linear-gradient(45deg, rgb(241, 241, 241), rgb(110, 109, 109));
        }
        *{margin: 0; padding: 0;}
        ul, li{list-style: none;}
        table{
            width: 80%;
        }
        .registForm{
            width: 60%;
            margin: 0 auto;
            border: 1px solid;
            text-align: center;
        }
        .registForm h2{
            float: left;
        }
        input{
            border-radius: 7px;
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .content{
            height: 200px;

        }
        .td2{
            width: 60%;
        }
        .summary{
            height: 400px;
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

    <section>
    <form action="#" class="registForm">
        <h2>[수정]</h2><br><br>
        <table>
            <tr>
                <td>제목</td>
                <td class="td2"><input type="text"></td>
            </tr>
            <tr>
                <td>영문제목</td>
                <td class="td2"><input type="text"></td>
            </tr>
            <tr>
                <td>장르</td>
                <td class="td2"><input type="text" placeholder="'/' 로 구분"></td>
            </tr>
            <tr>
                <td>관람등급</td>
                <td class="td2">
                    <select style="width: 50%; height: 40px;" name="grade" id="">
                        <option value="전체관람가">전체관람가</option>
                        <option value="12세관람가">12세관람가</option>
                        <option value="15세관람가">15세관람가</option>
                        <option value="청소년관람불가">청소년관람불가</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>개봉일</td>
                <td class="td2"><input style="width: 50%;" type="date"></td>
            </tr>
            <tr>
                <td>감독</td>
                <td class="td2"><input type="text"></td>
            </tr>
            <tr>
                <td>출연진</td>
                <td class="td2"><input type="text" placeholder="',' 로 구분"></td>
            </tr>
            <tr>
                <td>타이틀</td>
                <td class="td2"><input type="text"></td>
            </tr>

            <tr>
                <td>줄거리</td>
                <td class="td2"><input type="text" class="summary"></td>
            </tr>

            <tr>
                <td>포스터</td>
                <td class="td2"><input type="file" id="file" name="poster"></td>
            </tr>

            <tr>
                <td>예고편</td>
                <td class="td2"><input type="text" placeholder="youtube 동영상 소스코드 주소만 입력"></td>
            </tr>
            
            
        </table>    
        <button type="submit" style="width: 80px; height: 30px;">수정하기</button>
        <button type="submit" style="width: 80px; height: 30px;">삭제하기</button>

        <br><br><br><br>
    </form>
    </section>
            

</body>
</html>