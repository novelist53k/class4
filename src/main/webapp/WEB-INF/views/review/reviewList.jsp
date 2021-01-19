<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
<link rel ="stylesheet " href ="../resource /css /bootstrap.min.css ">
	
	<!--jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src ="https: //ajax.googleapis.com /ajax /libs /jquery /1.11.2/jquery.min.js "></script>
	
	<!--합쳐지고 최소화된 최신 자바스크립트 --> 
	<script src="../resource /js /bootstrap.min.js "> </script>
	
* {
box-sizing: border-box;

}

ul,ol {
    list-style: none;
}
/* 리뷰 상세 포스터 */
section {

    padding: 20px 60px;
    width: 996px;
    height: 1150px;
    
}

.box_profile{
    position: relative;
}


.profile_img img{
    width: 60px;
    height: 60px;
    float: left;
    margin: 0 26px 0 20px;
}

.profile_mask img{
    display: block;
    position: absolute;
    top: px;
    left: 20px;
    width: 60px;
    height: 61px;
    /* background: 0 0 no-repeat; */
}

.writer_info{
    position: relative;
}

.writer_info .writer_etc{
    position: absolute;
    bottom: -130px;
    left: 110px;
}



.review_list{
    border-top: 1px solid rgb(162, 162, 162) ;
    height: 770px;
    padding: 0px;
    
    
}

.box-comment{
    margin-left: 110px;
}

.box-comment a{
    color: black;
    text-decoration: none;
}

.review_main ul li.review_comment:nth-child(2n+1){
    border-right: 1px solid rgb(174, 174, 174);
    border-bottom: 1px solid rgb(174, 174, 174);
    width: 50%;
    height: 200px;
    padding: 20px 0;
    

}

.review_main ul li.review_comment{
    border-right: none;
    border-bottom: 1px solid rgb(174, 174, 174);
    width: 50%;
    height: 200px;
    padding: 20px 0;
    float: left;
    word-break: break-all;
    
}



/* 검색 */
.search input {
    height: 30px;   
}    
.search{
    position: relative;
    top: 30px;
    text-align: right;
}
.search .btn {
    background-color: white;
    border: 1px solid black;
    color: black;
    height: 30px;
}


/* 사이드 */


@media screen and (max-width: 1200px) {
    #right_banner {
      display: none;
    }
  }

.side {position: fixed; 
        right: 100px; 
        bottom: 100px;
        font-size: 15px; 
        z-index: 10;

    }

.side li {
    background-color: #e40c0c; 
    text-align: center; 
    padding: 5px 10px; 
    border: 1px solid black; 
    color: rgb(235, 230, 230); 
}

.side li a {
    text-decoration: none;
    color: black;    
    display: block;
    height: 20px;
    line-height: 20px;
}

.side .theater{
    background-color: whitesmoke;
    width: 100%;
    height: 30px;

}
.side .top{
    border: 0px;
    background-color: white;
}

.side .top img{
    width: 50px;
}

/* 페이징 */

.page_wrap{
    margin-top: 15px;
    text-align: center;
    font-size: 15px;
}

.page_nation{
    display: inline-block;
}

.page_nation a{
    display: block;
    margin: 0 3px;
    float: left;
    border: 1px solid black;
    width: 25px;
    height: 25px;
    line-height: 25px;
    background-color:#fff;
    font-size: 15px;
    color:#999999;
    text-decoration: none;

}

.page_nation img{
    vertical-align: 10%;
}


.page_nation arrow{
    border: 1px solid #ccc;
}

.page_nation .active{
    background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}

</style>

<section>
        <div class = "search">
            <select style="height: 30px;">
                <option value="장르">장르</option>
                <option value="영화제목">영화제목</option>
                <option value="감독">감독</option>
                <option value="배우">배우</option>
            </select>
            <input type="text">
            <button class="btn btn-primary">검색</button>
        </div>
        
        <!--리뷰 -->
        <div class = "review_main">
            <lable style="font-size: 40px; font-weight: bold;">영화 리뷰</lable>
            <hr style="border-bottom: 3px solid black; margin: 10px 0;">

            <ul class="review_list" id="movie_review_list">
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>원더우먼</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>볼때마다 느낌과 감동이 새롭네요. 이전에 볼때는 아주 잘 만든 공상과학영화라며 감상했는데, 오늘 보니 현재 코로나시대여서 그런지 현실감이 더욱 와닿고 곧 닥칠 미래인것처럼 다기옵니다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>                                <span class = "score">5</span><br>
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name"> 
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
                <li class="review_comment">
                    <div class="box_profile">
                        <span class="profile_img">
                            <img src="${pageContext.request.contextPath }/resources/img/default_profile.gif" alt="프로필 이미지">
                        </span>
                        <span class="profile_mask">
                            <img src="${pageContext.request.contextPath }/resources/img/bg_photocircle.png" alt="원형 프레임">
                        </span>
                    </div>
                    <div class="box_contents">
                        <ul class="writer_info">
                            <li class = "movie_title">
                                <label>영화제목</label>
                                <span class = "point glyphicon glyphicon glyphicon-star" aria-hidden="true" style="color: rgb(233, 49, 49);"></span>
                                <span class = "score">5</span><br>
                            </li>
                            <li class="writer_name">
                                <p>김민건</p>
                            </li>
                            <li class="writer_etc">
                                <span class = "day">2021.01.07</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box-comment">
                        <a href="#"><p>감동은 나에게 다가와 감동란이 되었다.</p></a>

                    </div>
                </li>
            </ul>
         </div>
         
        </section>

        
        <!-- 사이드 -->
        <aside class="side" id="right_banner">    
            <ul class="side-list">
                <li>영화관 찾기</li>
                <li class = "theater"><a href="https://www.cgv.co.kr/">CGV</a></li>
                <li class = "theater"><a href="https://www.lottecinema.co.kr/NLCHS">롯데시네마</a></li>
                <li class = "theater"><a href="https://www.megabox.co.kr/">메가박스</a></li>
                <li class = "top"><a href="#" ><img src="img/btn_top2.png" alt="top-btn"></a></li>
            </ul>       
           </aside>

    <!-- 페이징 -->
    <div class = "page_wrap">
       <div class ="page_nation">
           <a href="#" class = "arrow"><img src="${pageContext.request.contextPath }/resources/img/page_pprev.png"></a>
           <a href="#" class = "arrow"><img src="${pageContext.request.contextPath }/resources/img/page_prev.png"></a>
           <a href="#" class="active">1</a>
           <a href="#">2</a>
           <a href="#">3</a>
           <a href="#">4</a>
           <a href="#">5</a>
           <a href="#">6</a>
           <a href="#">7</a>
           <a href="#">8</a>
           <a href="#">9</a>
           <a href="#">10</a>
           <a href="#" class = "arrow"><img src="${pageContext.request.contextPath }/resources/img/page_next.png"></a>
           <a href="#" class = "arrow"><img src="${pageContext.request.contextPath }/resources/img/page_nnext.png"></a>
       </div>
   </div>