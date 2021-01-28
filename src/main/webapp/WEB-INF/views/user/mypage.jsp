<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
    body{
        position: relative;
        margin-bottom: 30px;
        
        
    }
    
    .semi-back{
        
        margin: 0 auto;      
        margin-top:30px; 
        margin-bottom: -80px;
        width: 80%;
        background-color: rgba(0, 0, 0, 0.856);
        padding:100px;
        line-height: auto;
        border-radius: 8px;

    }
    .mypage-back{
       margin: 0 auto;
        padding: 50px;
        width: 1200px;
        line-height: normal;
        background-color: white;
        opacity:1;
        /* border-radius: 8px;
        background-image:url(${pageContext.request.contextPath}/resources/img/paper.jpg);
       background-repeat:no-repeat;
       background-size:120%; */
    }
    .joinArea{
        
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
     margin-left:70px;
     border: grey 1px solid;
     
   }
   .reviewBox{
     width: 60%;
     height: 170px;
     margin:0 auto;
     margin-top:15px;
     border: 1px solid grey;
     
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
  .userYear,.userMonth,.userDay{
    display: block;
    width: 140px;
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
    
    
    
    .profile{
       float:right;       
       border: 1px solid grey;
       width:150px;  
       height:150px;
       
    }
    .profile img{
       height: 150px;
       width: 150px;
       
    }
    .profile input{width: 150px;}
    
    .upload{
    width:150px;}
    .genreLike{
       display:box;
       width: 24%;
    }
    .myInfo{
    
    }
    .joinForm{
       border-radius: 7px;
       background-color:white;
       
    }
  
    .link{
       overflow: hidden;
    }
    #upload{
	position: absolute;
    bottom: 935px;
    left: 1091px;
	    
    }
    


</style>
<section>


<div class="container-fluid text-left">
  <div class="semi-back">
  <div class="mypage-back">
  <h2 class="Mypagetitle">마이페이지</h2>
  <p>${login.userName }님 환영합니다</p>
  <br>
  <br>

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#myInfo">내정보</a></li>
    <li><a data-toggle="tab" href="#myreviewTab" class="tab2">내리뷰</a></li>    
    <li><a data-toggle="tab" href="#deleteTab">탈퇴하기</a></li>
  </ul>

  <div class="tab-content">
    <div id="myInfo" class="myInfo tab-pane fade in active">
      <form action="" class="joinForm" method="POST">
        <br>
           <h4>아이디</h4><br>
             <h4>${login.userId }</h4><hr>
           
           <div class="profile" >
              <div>
                 <c:choose>
                 <c:when test="${login.fileRealName eq null }">
                    <img alt="" src="${pageContext.request.contextPath}/resources/img/default_profile.gif">
                 </c:when>
                 <c:otherwise>
                    <img alt="" src="${pageContext.request.contextPath}/resources/img/profile/${login.userId }/${login.fileRealName }">
                 </c:otherwise>
                 </c:choose>
                 <input type="file" name="file" id="file">
                 <button type="button" class="upload btn btn-default" id="upload" name="upload">확인</button>
              </div>
              
           </div>
        
        
        
       
        <h4>이름</h4><br>
        <h4>${login.userName}</h4>            
        <hr>
        <h4>성별</h4><br>
        <h4>${login.userGender == "man"?'남성':'여성' }</h4>
        <hr>
        
        <h4>생년월일</h4><br>
           <h4>${fn:substring(login.userAge,0,4)}년 ${fn:substring(login.userAge,5,7)}월 ${fn:substring(login.userAge,8,10)}일</h4><hr>
           
            
            
       
       <h4> 이메일</h4><br>
        <h4>${login.userEmail1 } @ ${login.userEmail2 }</h4><hr>
       
       
       
        <br>
          <h4>주소</h4><br>
          <h4>${login.addrZipNum } ${login.addrBasic } ${login.addrDetail }</h4>
        <hr>
        <div class="actorSection">
          <h4>좋아하는 배우</h4><br>                          
             <c:forEach var="vo" items="${userActorInfo}">
                <h4>${vo.actorName}</h4>                                   
             </c:forEach>                         
                                      
          
        </div><hr>
        <div class="diretorSection">
        <h4>좋아하는 감독</h4><br>
            <c:forEach var="vo" items="${userDirectorInfo}">
                <h4>${vo.directorName}</h4>                                   
             </c:forEach>
         </div><hr>
       
        <div class="genre1">

          <h4>좋아하는 장르</h4><br>
          <c:forEach var="vo" items="${userGenreInfo}">
                 <span style="margin: 10px; ">${vo.genre }</span>  
           </c:forEach>   
        </div>
        <hr>
                
        <button type="button" class="btn joinbtn" onclick="location.href='update'" style="padding: 15px;">수정</button>
        
      </form>
    </div>
    <div id="myreviewTab" name="myreviewTab" class="tab-pane fade">
      <br>
      <ul class="mypageReview" >
        <div class="myReview">
        <table class="table table-striped table-hover">
        <thead>
           <tr>
              <th>번호</th>
              <th class="board-title">영화</th>
              <th>내용</th>
              <th>등록일</th>              
           </tr>
        </thead>   
        <tbody>
            <c:forEach var="vo" items="${userReview}">
           
           <tr>
              <td><a class="link" href="${pageContext.request.contextPath}/review/reviewContent?bno=${vo.bno}"> ${vo.bno }</a></td>
              <td><a class="link" href="${pageContext.request.contextPath}/review/reviewContent?bno=${vo.bno}"> ${vo.movieTitle}</a></td>
              <td style="overflow:hidden;"><a class="link" style="overflow:hidden;" href="${pageContext.request.contextPath}/review/reviewContent?bno=${vo.bno}" >${vo.content }</a></td>
              <td> ${fn:substring(vo.regDate,0,16)}</td>            
           </tr>
           
            </c:forEach>
        </tbody>
      </table>
       </div>
     </ul>          
   </div>
      


    <div id="deleteTab" class="tab-pane fade">
      <br>
      <Button class="delUser btn-danger" id="delUser" data-toggle="modal" data-target="#myModal1">ARE YOU SURE?</BUtton>
    </div>
  </div>
</div>
</div>
</div>

<!-- 회원탈퇴 모달 -->
<div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog">
                
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"></h4>
                        </div>
                        <div class="modal-body">
                            <form action="delUser" method="post">
                            비밀번호 확인 <input type="text" class="checkPw" id="checkPw" name="checkPw">
                            
                            <button type="submit" class="btn btn-primary" id="delcheck" name="delcheck">확인</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                            </form>
                        </div>
                       
                    </div>
                </div>
</div> 
            
  


</section>
<script>

   /* $("#delcheck").click(function(){
      var checkPw = $("#checkPw").val()
      console.log("확인누름")
      console.log(checkPw)
      
      $.ajax({
         type : "POST",
           url : "delUser",
           data : JSON.stringify({"checkPw": checkPw}),
           contentType : "application/json; charset=utf-8",
           success : function(data){
              console.log(data)
              if(data == 0){
                                   
                 alert("정상적으로 탈퇴 됐습니다.")
                 location.href="/user/join";
                 
              }else{
                 alert("잘못 입력되었습니다.")
                 $("#checkPw").val(" ")
                 return;
              }
           },
           error : function(status, error){}   
         
         
      })
   }) */

   
   $("#upload").click(function(){
      console.log("업로드 클릭")
   
      var file = $("#file").val();
      var user = "${sessionScope.login.userId}";
      console.log(user);
      
      var file = file.substring(file.lastIndexOf('.')+1, file.length).toLowerCase();
      if(file !="jpg" && file !="png"&&file!="jpeg" && file!="gif"){
         alert("이미지파일만 등록 가능");
         return;
      }else if(user==''){
         alert("로그인 필요");
         return;
      }
      var data = $("#file")
      console.log(data);
      console.log(data[0]);
      console.log(data[0].files);
      console.log(data[0].files[0]);
      
      var formData = new FormData();
      formData.append("file",data[0].files[0]);
      
      $.ajax({
         url:"upload",
         processData: false,
         contentType: false,
         data: formData,
         type:"POST",
         success: function(result){
            console.log(result);
            alert("업로드 성공")
         },
         error:function(status, er){
            alert("업로드 실패")
         }
      })
      
      
   })
function readURL(input) {
           if (input.files && input.files[0]) {
              
               var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
               //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
              reader.readAsDataURL(input.files[0]); 
               //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
               $(".fileDiv").css("display", "block");
               
               reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                   $('#fileImg').attr("src", event.target.result); 
                   console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
              }
           }
       }
      $("#file").change(function() {
           readURL(this); //this는 #file자신 태그를 의미
           
       });


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
  
   //주소찾기
  function goPopup(){
          var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
          
       }
       function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
          document.getElementById("addrBasic").value = roadAddrPart1;
          document.getElementById("addrDetail").value = addrDetail;
          document.getElementById("addrZipNum").value = zipNo;
       }
    


</script>