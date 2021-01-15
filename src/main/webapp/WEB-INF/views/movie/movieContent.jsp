<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <section class="movie_content_area">

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
    
    
    <!-- 관리자 아이디로 로그인시에만 보이게 하기 -->
    <div class="btn-box" style="float: right;">
      <input type="button" value="등록">
      <input type="button" value="수정">
      <input type="button" value="삭제">
    </div>
  </section>
