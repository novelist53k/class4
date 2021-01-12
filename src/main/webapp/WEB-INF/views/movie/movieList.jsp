<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
     
    *{margin: 0; padding: 0;}
    ul, li{list-style: none;}
    
  
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
        .btn {
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
            <button type="button" class="btn">더보기</p>
        </div>
     </div>
	
	
	
</body>
</html>