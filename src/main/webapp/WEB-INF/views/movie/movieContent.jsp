<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    .container {
      width: 80%;
      border: 1px solid;
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
      width: 180px;
      height: 240px;
      border: 1px solid green;
      text-align: center;
    }

    .photo-box {
      width: 180px;
      height: 240px;
      border: 1px solid blue;
      padding: 0;
      margin: 0 auto;
    }

    .mid2 {
      float: left;
      width: 700px;
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
    tbody>tr>td {
      border-bottom: 0.1px solid rgba(145, 142, 142, 0.431);
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

    
  </style>
</head>
<body>
	<section>

    <div class="container">
      <div class="outter">

        <div class="mid1">
          <div class="photo-box">
            <img src="img/wonder.png" style="width: 180px; height: 240px;">
          </div>
        </div>

        <div class="mid2">
          <div class="info-box">
            <b>원더우먼</b>
            <h4>Wonder Woman</h4><br>
            <p>a</p>
            <p>b</p>
            <p>c</p>
            <p>d</p>
            <hr>

            <input type="button" class="theater" value="메가박스">
            <input type="button" class="theater" value="CGV">
            <input type="button" class="theater" value="롯데시네마">
          </div>
        </div>

      </div>


      <br /><br /><br />
      <br /><br /><br />
      <br /><br /><br />
      <br /><br /><br />
      <br /><br /><br />



      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#info">주요정보</a></li>
        <li><a data-toggle="tab" href="#menu1">예고편</a></li>
        <li><a data-toggle="tab" href="#menu2">리뷰</a></li>
      </ul>

      <div class="tab-content">
        <div id="info" class="tab-pane fade in active">
          <h3 style="font-weight: bold;">줄거리</h3>
          <div class="content-box">
            <b>세상이 기다린 히어로, 희망이 되다!</b> <br>
            <p>1984년 모든 것이 활기찬 시대, 다이애나 프린스는 고고학자로서 인간들 사이에서 조용히 살고 있다. 단지 원더 우먼으로서 위기에 처한 사람을 구할 때만 빼고는. 그런 다이애나 앞에 거짓말처럼 죽었던 스티브 트레버가 나타나고, 거부할 수 없는 적마저 함께 찾아오는데…
            	지나친 풍요로움이 과잉이 되어 또 다시 위협받는 인류, 위태로운 세상에 오직 원더 우먼만이 희망이다! 그 어떤 적도 피하지 않는다!</p>
          </div>

        </div>
        <div id="menu1" class="tab-pane fade">
          <h3 style="font-weight: bold;">예고편</h3>
          <br><br><br>
          <div class="videobox">
            <iframe width="900" height="580" src="https://www.youtube.com/embed/AAPAGnERPjw" frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen></iframe>
          </div>
        </div>
        <div id="menu2" autoplay class="tab-pane fade">
          <div class="head-box">
            <h3 class="rev-head" style="font-weight: bold;">리뷰</h3>
            <a href="#" class="right-regist"><span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color: black;"></span>글쓰기</a>
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
              <tr>
                <td class="b1">#</td>
                <td class="b2">
                  <b style="font-weight: bold;">영화제목</b><br>
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
  </section>
</body>
</html>