<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="movie_list_tab" id = tab-menu>
        <ul class="outbox">
              <li class="inbox"><a href="#">현재개봉작</a></li>
              <li class="inbox"><a href="#">개봉예정작</a></li>
        </ul>
    </div>

      <section class = "movie_list_area">
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

     <div class="bot movie_list_btn">
        <div class="btn-box">
            <button type="button" class="more-btn">더보기</button>
        </div>
     </div>
