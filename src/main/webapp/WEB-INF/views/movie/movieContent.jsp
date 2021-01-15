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
    * {
      margin: 0;
      padding: 0;
    }
    a{
      text-decoration: none;
    }
    ul,
    li {
      list-style: none;
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

    /* 영화정보 */
    .container {
      width: 80%;
    }

    .outter {
      overflow: hidden;
      float: left;
      border: 1px solid;
      width: 100%;
      overflow: hidden;
    }

    .mid1 {
      float: left;
      width: 200px; 
      height: 306px;
      text-align: center;
    }

    .photo-box {
      width: 200px; 
      height: 306px;
      padding: 0;
      margin: 0 auto;
    }

    .mid2 {
      float: left;
      width: 700px;
      padding-top: 20px;
    }

    .info-box{
      padding-left:20px;
    }
    .content-box {
      width: 90%;
      height: auto;
    }

    .content-box > b{
      font-size: 18px;
    }

    .content-box> p{
      font-size: 15px;
    }

    .videobox {
      margin: 0 auto;
      width: 900px;
      height: 580px
    }

    .t {
      width: 80%;
      text-align: center;
      margin: 0 auto;
    }

    .t1 {
      width: 10%;
      text-align: center;
      border-bottom: 1px solid;
      font-size: smaller;
      text-align: center;
    }

    .t2 {
      width: 50%;
      text-align: center;
      border-bottom: 1px solid;
      font-size: smaller;
    }

    .t3 {
      width: 20%;
      text-align: center;
      border-bottom: 1px solid;
      font-size: smaller;
      text-align: center;
    }

    .b1{
      text-align: center;
    }

    .b2{
      text-align: left;
    }
    .text1{
      display: inline-block;
      width: 300px;
      white-space: nowrap;
      overflow: hidden;
     text-overflow: ellipsis;}

    .b3{
      text-align: center;
    }

    .pagination {
      display: inline-block;
      margin: 0 auto;
    }

    .pagination a {
      color: black;
      float: left;
      padding: 8px 16px;
      text-decoration: none;
    }
    .page-form{
      width: 100%;
      text-align: center;
    }

    .head-box{
      overflow: hidden;
      position: relative;
    }
    .rev-head{
      display: inline-block;
    }

    .head-box> a{
      text-decoration: none;
      color: black;
    }
    .right-regist{
      display: inline-block;
      text-decoration: none;
      margin-top: 40px;
      margin-right: 100px;
      float: right;
    }

    .mov-date{
      padding-right:10px ;
      border-right: 1px solid rgba(145, 142, 142, 0.431);
    }
    
    .mov-grade{
      padding-left: 10px;
    }
    
    .mov-dit{
      padding-right: 10px;
    }
    .mov-theat{
      padding-left: 10px;
    }

    .nav-tabs{
      width: 80%;
      margin: 0 auto;
    }
    .tab-content{
      width: 80%;
      margin: 0 auto;
    }

    .rev-searbox{
      float: right;
      overflow: hidden;
      width: 320px;
    }

    .rev-left{
      padding-left: 200px;
      position: absolute;
      top: 90px;
      left: 0px;
      }

      .serach-writer{
        margin-left: 10px;
      }
     
      .glyphicon-star{
        padding-left: 3px;
      }
      .mov-sec{
        overflow: hidden;
      }
     .mov-score{
        color: rgb(233, 49, 49);
        font-size: 15.5px;
       font-weight: bolder;
     }
     
     .rev-star{
       padding-left: 4px;
       border-left: 1px solid rgba(145, 142, 142, 0.431);
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

    <div class="container">
      <div class="outter">

        <div class="mid1">
          <div class="photo-box">
            <img src="${pageContext.request.contextPath }/resources/img/wonder.png" style="width: 200px; height: 306px;">
          </div>
        </div>

        <div class="mid2">
          <div class="info-box">
            <span class="mov-title"><b>원더우먼</b></span>
            <div class="mov-sec">
              <span class="mov-ftitle"><h4>Wonder Woman</h4></span>
              <div class="star-box">
                <span class="star-icon">평점
                  <span class="glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                  <span class="mov-score">5</span>
                </span>
              </div>
            </div>
            <span class="mov-genre">액션/어드벤처</span>
            <div class="date-grade">
              <span class="mov-date">2021.01.03</span>
              <span class="mov-grade">전체관람가</span>
            </div>
            <div class="mov-maker"> 
              <!-- 네이버 포털 검색 -->
              감독 <span class="mov-dit"><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=메간 폭스">메간 폭스</a></span>
              
              주연 <span class="mov-act">
                <a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=메간 폭스">
                  제레미레이너
                </a>
              </span>
            </div>

          </div>
            <hr>
            <div class="mov-theat" style="padding-bottom: 10px;">
              <a href="https://www.megabox.co.kr/">
                <img src="${pageContext.request.contextPath }/resources/img/mega.png" width="100px" >
              </a>
              <a href="https://www.cgv.co.kr/">
                <img src="${pageContext.request.contextPath }/resources/img/cgv.png" width="100px" >
              </a>
              <a href="https://www.lottecinema.co.kr/NLCHS">
                <img src="${pageContext.request.contextPath }/resources/img/lotte.jpg" width="100px" >
              </a>
            </div>
          </div>
        </div>

      </div>
      <br><br><br>



      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#info">주요정보</a></li>
        <li><a data-toggle="tab" href="#menu1">예고편</a></li>
        <li><a data-toggle="tab" href="#menu2">리뷰</a></li>
      </ul>

      <div class="tab-content">
        <div id="info" class="tab-pane fade in active">
          <h3 style="font-weight: bold;">줄거리</h3>
          <div class="content-box">
            <b class="title">세상이 기다린 히어로, 희망이 되다!</b> <br>
            <p>
            1984년 모든 것이 활기찬 시대, 다이애나 프린스는 고고학자로서 인간들 사이에서 조용히 살고 있다.
            단지 원더 우먼으로서 위기에 처한 사람을 구할 때만 빼고는. 그런 다이애나 앞에 거짓말처럼 죽었던 스티브 트레버가 나타나고, 거부할 수 없는 적마저 함께 찾아오는데…
            지나친 풍요로움이 과잉이 되어 또 다시 위협받는 인류, 위태로운 세상에 오직 원더 우먼만이 희망이다! 그 어떤 적도 피하지 않는다!
            </p>

          </div>

        </div>
        <div id="menu1" class="tab-pane fade">
          <h3 style="font-weight: bold;">예고편</h3>
          <br><br><br>
          <div class="videobox">
            <!-- 예고편 소스코드 videobox안에 값 넣기-->
            <iframe width="900" height="580" src="https://www.youtube.com/embed/AAPAGnERPjw" frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen></iframe>
          </div>
        </div>
        <div id="menu2" autoplay class="tab-pane fade">
          <div class="head-box">
            

            <h3 class="rev-head" style="font-weight: bold;">리뷰</h3>
            <div class="rev-left">
              <table>
                <tr>
                  <td>찾기</td>
                  <td><input type="text" class="serach-writer" placeholder="글쓴이..."><button>검색</button></td>
                </tr>
              </table>
            </div>
            <div class="rev-right">
              <a href="#" class="right-regist" style="color: black;">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color: black;"></span>
                글쓰기</a>
            </div>
            
          </div>
          <table class="t">
            <thead>
              <tr>
                <th class="t1">번호</th>
                <th class="t2">감상평</th>
                <th class="t3">글쓴이·날짜</th>
              </tr>
            </thead>

            <tbody>
              <tr style="border-bottom: 0.1px solid rgba(145, 142, 142, 0.431);">
                <td class="b1">#</td>
                <td class="b2">
                  <div class="rev-head">
                    <b style="font-weight: bold;">영화제목</b>
                    <span class="rev-star">별점
                      <span class="glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                      <span class="rev-score">5</span>
                    </span>
                  </div>
                  <br>
                  <span class="text1">주저리주저리주저리주저리주저리주저리주저리주주저리주저리주저리주저리주저리주저리주저리주저리주저리주주저리주저리</span>
                  <br>
                  <span class="writer">작성자</span> 
                  <span class="regdate">작성일</span>
                  <span class="recom">추천</span>
                  <a href="#"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" style="color: black;"></span></a>
                </td>
                <td class="b3">작성일</td>
              </tr>
             
            </tbody>
            
          </table>
          <form class="page-form">
            <div class="pagination">
              <a href="#">&laquo;</a>
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
              <a href="#">6</a>
              <a href="#">&raquo;</a>
            </div>  
          </form>
        </div>
        
      </div>
    </div>
    
    
    <!-- 관리자 아이디로 로그인시에만 보이게 하기 -->
    <div class="btn-box" style="float: right;">
      <input type="button" value="등록">
      <input type="button" value="수정">
      <input type="button" value="삭제">
    </div>
  </section>

</body>

</html>