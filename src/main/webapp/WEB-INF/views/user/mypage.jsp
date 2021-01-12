<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    body{
        position: relative;
        margin-bottom: 30px;
        
        
    }
    
    .semi-back{
        
        margin: 0 auto;       
        margin-bottom: -80px;
        width: 80%;
        background-color: rgba(0, 0, 0, 0.856);
        padding:100px;
        line-height: auto;

    }
    .mypage-back{
      background-color: white;
      border-radius: 7px;
      padding: 50px;
    }
    .joinArea{
        margin: 0 auto;
        padding: 50px;
        width: 1200px;
        line-height: normal;
        background-color: white;
        opacity: 0.9;
        border-radius: 8px;
    }
    .input-group{
        margin-top: 150px;
        margin: 0 auto;
        width: 60%;
        padding-top: 8px;
        
    }
    .box{width: 250px;
        
          border-bottom: 1px solid #E1E1E1;
          border-top:1px solid #E1E1E1;
          margin: 50px auto;
          margin-top: -10px;
          text-align: center;
          padding: 20px 40px;
          font-size: 30px;
          
        }
    .myInform{
       margin: 0 auto;
       border: 2px solid grey;
       border-radius: 8px;
       width: 80%;
       margin-top: 50px ;
       margin-bottom: 50px;
       padding: 100px;
       height: fit-content;
       
    }
    .joinbtn{
        background-color: black;
        color: white;
    }
    .genre{
        
        margin-top: 8px;
        border: 1px solid rgba(128, 128, 128, 0.253);
        border-radius: 4px;
        padding: 0;
    }
    .joinForm > .password, .pwCheck {
      display: block;
      width: 55%;
      height: 34px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .mypageInput{
      
      display: block;
      position: relative;
      width: 80%;
      height: 34px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
      
    }
    .email1, .email2 {
      display: inline-block;
      width: 275px;
      height: 34px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-bottom: 25px;
    }
    .checkBtn{
      position: relative;
      right: -252px;
      top: -34px;
      height: 34px;
    }
    .joinLabel{
      display: inline-block;
      max-width: 100%;
      font-weight: 700;
      
    }
    .likeActor, .likeDirector{
      display: block;
      position: relative;
      width: 100%;
      height: 34px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
      
    }
    

    .myReview{
      overflow: hidden;
    }
   .poster{
     width: 150px;
     height: 170px;
     float: left;
     border: black 3px solid;
   }
   .reviewBox{
     width: 80%;
     height: 170px;
     border: 3px solid black;
     
   }
   .reviewBox > div{
     margin: 0 auto;
     
   }
   .myrvContent{
     overflow: hidden;
   }
   .delUser{
     border: black 1px solid;
     padding: 10px;
     border-radius: 5px;
   }
  .myInform > input{
    display: block;
      width: 30%;
      height: 34px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
  }
  .reviewBoxin{
    padding: 30px;
    float: left;
  }
  .reviewBoxin > div{
    margin-bottom: 10px;
    font-size: large;
    
  }
  
   
   

  .joinForm{
       margin: 0 auto;
       border: 2px solid grey;
       border-radius: 8px;
       width: 80%;
       margin-top: 50px ;
       margin-bottom: 50px;
       padding: 150px;
       height: fit-content;
       text-align: left;
       
    }


  .joinId{
    
    display: block;
    position: relative;
    width: 47%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    
  }
  .gender, .age {
    display: block;
    width: 250px;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 25px;
  }
  .likeActor, .likeDirector{
    display: block;
    position: relative;
    width: 47%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    
  }
  .add{
    margin: 0;
    width: 50px;
    height: 34px;
    font-size: 20px;
  }
  .minus{
      margin: -4px;
      width: 50px;
      height: 34px; 
      font-size: 20px;
  }
  .genre{
      padding: 15px;
   }
  
  .checkboxLabel{
    display: inline-block;
    width: 24%;
  }
  .genre input[type="checkbox"]{
    display: block;
     height: 25px;
     width: 15px;
     padding: 15px;
     line-height: 35px;
     margin-bottom: 15px;
     border:1px solid #555;
     border-radius: 7px;
  }
  .genre input[type="checkbox"]:checked{
    height: 25px;
    width: 15px;
    padding: 15px;
    line-height: 25px;
    margin-bottom: 15px;
    border:1px solid #555;
    background-color: #337ab7;
  } 
  
  .checkBtn, .add, .minus{
    border-radius: 6px;
    border: 1px solid #ccc;
  }
  .postNum{
    display: block;
    position: relative;
    width: 47%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .addrBtn{
      margin-bottom:15px;
    }
</style>
<section>


<div class="container-fluid text-left">
  <div class="semi-back">
  <div class="mypage-back">
  <h2>마이페이지</h2>
  <p>---님 환영합니다</p>
  <br>
  <br>

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#myInfo">내정보</a></li>
    <li><a data-toggle="tab" href="#menu1">내가 쓴 리뷰</a></li>
    <li><a data-toggle="tab" href="#menu2">회원탈퇴</a></li>
  </ul>

  <div class="tab-content">
    <div id="myInfo" class="myInfo tab-pane fade in active">
      <form action="#" class="joinForm" method="GET">
        <br>
        <label for="id" class="joinLabel">ID</label><br>
        <input type="text" class="joinId" name="id" id="id" readonly>
        <br>
        <br>
        <label for="password" class="joinLabel pwlabel">PASSWORD</label><br>
        <input type="password" class="password" name="password" id="password"><br>
        <label for="pwCheck" class="joinLabel">PASSWORD 확인</label><br>
        <input type="password" class="pwCheck" name="pwCheck" id="pwCheck" ><br>
        
        <label for="gender" class="joinLabel">성별</label>
        <select name="gender" id="gender" class="gender">
          <option value="man">남자</option>
          <option value="woman">여자</option>
        </select> 
        <label for="gender" class="joinLabel"> 나이</label>
        <select name="age" id="age" class="age">
          <script language="JavaScript">
          for(i=7; i<100;i++){
          document.write("<option value='"+i+" '>"+i+"</option>")
          
          }
        </script>
        
        </select>
        <br>
        <label for="email" class="joinLabel">EMAIL</label><br>
        <input type="text" class="email1" name="email1"> @ <select id="email2" class="email2" onchange="email(this)">
          <option class="option" value="choice">선택</option>
          <option class="option" value="gmail.com">gmail.com</option>
          <option class="option" value="naver.com" >naver.com</option>
          <option class="option" value="hanmail.net" >hanmail.net</option>
          <option class="option" value="etc">직접입력</option>
        </select>
        <br>
          <label for="joinLabel addr-num">주소</label>
          <input type="text" class="postNum" id="addrZipNum" placeholder="우편번호" readonly>
          <button type="button" class="btn btn-primary addrBtn" onclick="goPopup()">주소찾기</button>
        <div class="form-group">
          <input type="text" class="form-control" id="addrBasic" placeholder="기본주소">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="addrDetail" placeholder="상세주소">
        </div>
        <br>
        <div class="actorSection">
          <label for="likeActor" class="joinLabel pwlabel">관심있는 배우</label><br>
        </div>
        <button type="button" class="add btn-primary" onclick="addActor()">+</button>
        <button type="button" class="minus btn-primary" onclick="minusActor()">-</button>
        <br>
        <br>
        <div class="diretorSection">
        <label for="likeDirector" class="joinLabel pwlabel">관심있는 감독</label><br>
      </div>
        <button type="button" class="add btn-primary" onclick="addDirector()">+</button>
        <button type="button" class="minus btn-primary" onclick="minusDirector()">-</button>
        <div class="genre">
          <label class="joinLabel">선호하는 장르</label><br>
          <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre" value="action"> 액션</label>
          <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre" value="romence"> 로맨스</label>
          <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre" value="animation"> 애니메이션</label>
          <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre" value="SF"> SF</label>
          <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre" value="comedy"> 코미디</label>
          <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre" value="horror"> 공포</label>
          <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre" value="thiler"> 스릴러</label>
          <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre" value="documentry"> 다큐멘터리</label>
        
        </div>
        <br>
                
        <button type="submit" class="btn joinbtn " style="padding: 15px;">수정</button>
        <button type="button" class="btn btn-default" style="padding: 15px;" onclick="location=''">취소</button>
      </form>
    </div>
    <div id="menu1" class="tab-pane fade">
      <br>
      <ul class="mypageReview">
        <div class="myReview">
          <div class="reviewPoster"><img src="img/1.jpg" class="poster"></div>
          <div class="reviewBox">
            <div class="reviewBoxin">
              <div class="myrvTitle">제목: <a href="">하.. 속옷갈아 입었네요</a></div>
              <div class="myrvScore">평점: </div>
              <div class="myrvRegdate">2020-01-11</div>
          </div>
          </div>
        </div>
      </ul>
    </div>
    <div id="menu2" class="tab-pane fade">
      <br>
      <BUtton class="delUser btn-danger">회원탈퇴</BUtton>
    </div>
    
  </div>
</div>
</div>
</div>
      
    
  
</div>

</section>

<script>
  var pw = document.getElementById("password");
        pw.onkeyup = function(){
            var regex = /^[A-Za-z0-9+]{8,16}$/;
             if(regex.test(document.getElementById("password").value )) {
                document.getElementById("password").style.borderColor = "green";
                document.getElementById("msgPw").innerHTML = "사용가능합니다";
            } else {
                document.getElementById("password").style.borderColor = "red";
                document.getElementById("msgPw").innerHTML = "";
            }
        }
        //패스워드 체크
        var pwConfirm = document.getElementById("pwCheck");
        pwConfirm.onkeyup = function() {
            var regex = /^[A-Za-z0-9+]{8,16}$/;
            if(document.getElementById("pwCheck").value == document.getElementById("password").value ) {
                document.getElementById("pwCheck").style.borderColor = "green";
                document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
            } else {
                document.getElementById("pwCheck").style.borderColor = "red";
                document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
            }
        } 
   
  function addDirector(){
  var input = document.createElement("input")
  var add = document.querySelector(".diretorSection").appendChild(input)
  input.setAttribute('class','likeDirector')
  }
  function addActor(){
  var input = document.createElement("input")
  var add = document.querySelector(".actorSection").appendChild(input)
  input.setAttribute('class','likeActor')
  }
  function minusActor() {
    var inp = document.querySelector(".actorSection");
    inp.removeChild(inp.children[2])
  }
  function minusDirector() {
    var inp = document.querySelector(".diretorSection");
    inp.removeChild(inp.children[2])
  }
    


</script>