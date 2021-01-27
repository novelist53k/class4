<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        border-radius: 8px;
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
    .joinForm > .userPw, .pwCheck {
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
  .gender {
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
   .userMonth,.userYear,.userDay{    display: inline;
    width: 150px;
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
  .likeActor, .likeDirector,.likeGenre{
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
    }


</style>
<section>


<div class="container-fluid text-left">
  <div class="semi-back">
  <div class="mypage-back">
  <h2>수정하기</h2>  
  <br>
  <br>


<div>
      <form action="modify" class="joinForm" method="POST">
        <br>
        <label for="id" class="joinLabel">ID</label><br>
       	<input type="text" class="joinId" name="userId" id="userId" value="${login.userId }" readonly><br>   
       		     
        <label for="password" class="joinLabel pwlabel">PASSWORD</label><br>
        <input type="password" class="userPw" name="userPw" id="userPw">
        <label for="pwCheck" class="joinLabel">PASSWORD 확인</label><br>
        <input type="password" class="pwCheck" name="pwCheck" id="pwCheck" ><br>
        <label for="pwCheck" class="joinLabel">이름</label><br>
        <input type="text" class="pwCheck" id="userName" name="userName">            
        <br>
        <label for="gender" class="joinLabel">성별</label>
                
        <select name="userGender" id="userGender" class="gender">
	      <option value="man" >남자</option>
          <option value="woman">여자</option>
        </select>  
        
        <label for="gender" class="joinLabel"> 생년월일</label><br>
            <select name="userYear" id="userYear" class="userYear">
           		<c:forEach begin="1930" end="2015" var="i" >
           		
           		<option>${i }
           		
           		</c:forEach>
           		</select> 
           	<select name="userMonth" id="userMonth" class="userMonth">
           	<c:forEach begin="1" end="12" var="i">
           		<c:choose>
           			<c:when test="${i<10 }">
           				<option>0${i}
           			</c:when>
           			<c:otherwise>
           				<option>${i }
           			</c:otherwise>
           		</c:choose>  
           	</c:forEach>
           	</select> 
            <select name="userDay" id="userDay" class="userDay">
           	<c:forEach begin="1" end="31" var="i">
           		<c:choose>
           			<c:when test="${i<10 }">
           				<option>0${i}
           			</c:when>
           			<c:otherwise>
           				<option>${i }
           			</c:otherwise>
           		</c:choose>       		
           		
           	</c:forEach>
            
            </select>
        <br>
        <label for="email" class="joinLabel">EMAIL</label><br>
        <input type="text" class="email1" name="userEmail1"> @ 
       
       
        <select id="userEmail2" name="userEmail2" class="email2"  onchange="email(this)">          
          <option  value="gmail.com" >gmail.com</option>
          <option  value="naver.com" >naver.com</option>
          <option  value="hanmail.net" >hanmail.net</option>               
        </select>
       
       
       
        <br>
          <label for="joinLabel addr-num">주소</label>
          <input type="text" class="postNum" id="addrZipNum" name="addrZipNum" >
          <button type="button" class="btn btn-primary addrBtn" onclick="goPopup()">주소찾기</button>
        <div class="form-group">
          <input type="text" class="form-control" id="addrBasic" name="addrBasic">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="addrDetail" name="addrDetail">
        </div>
        <br>
        <div class="actorSection">
          <label for="likeActor" class="joinLabel pwlabel">관심있는 배우</label><br>
                          
             <c:forEach var="vo" items="${userActorInfo}">
             	<input class="likeActor" id="likeActor" name="likeActor" value="${vo.actorName}" >
                                   
             </c:forEach>     
        </div>
        
        <button type="button" class="add btn-primary" onclick="addActor()">+</button>
        <button type="button" class="minus btn-primary" onclick="minusActor()">-</button>
        <br>
        <br>
        <div class="diretorSection">
        <label for="likeDirector" class="joinLabel pwlabel">관심있는 감독</label><br>
        	 <c:forEach var="vo" items="${userDirectorInfo}">
             	<input class="likeDirector" id="likeDirector" name="likeDirector" value="${vo.directorName }" >
                                   
             </c:forEach>
      </div>
        <button type="button" class="add btn-primary" onclick="addDirector()">+</button>
        <button type="button" class="minus btn-primary" onclick="minusDirector()">-</button>
        
        <div class="genre">
    	    <c:set var="i" value="0" />

			<c:set var="j" value="4" />

		
          <label class="joinLabel">선호하는 장르</label><br>
          
          	<c:forEach var="vo" items="${genreList}">
          	
        	  <label class="joinLabel checkboxLabel"><input type="checkbox" class="checkbox-genre"  name="genrelist" value="${vo}"/>${vo}</label>
        	</c:forEach>
             
        	
          
        
        
        </div>
        <br>
                
        <button type="submit" class="btn joinbtn " style="padding: 15px;">확인</button>
        <button type="button" class="btn btn-default" style="padding: 15px;" onclick="location='mypage'">취소</button>
      </form>
    </div>
</div>
</div>
</div>
</section>
<script>
//패스워드 옵션
	

var pw = document.getElementById("userPw");
    pw.onkeyup = function(){
        var regex = /^[A-Za-z0-9+]{8,16}$/;
         if(regex.test(document.getElementById("userPw").value )) {
            document.getElementById("userPw").style.borderColor = "green";
            document.getElementById("msgPw").innerHTML = "사용가능합니다";
        } else {
            document.getElementById("userPw").style.borderColor = "red";
            document.getElementById("msgPw").innerHTML = "";
        }
    }
    //패스워드 체크
    var pwConfirm = document.getElementById("pwCheck");
    pwConfirm.onkeyup = function() {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if(document.getElementById("pwCheck").value == document.getElementById("userPw").value ) {
            document.getElementById("pwCheck").style.borderColor = "green";
            document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
        } else {
            document.getElementById("pwCheck").style.borderColor = "red";
            document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
        }
    }
var count =0;
var count1 =0;
var actorName =null;
var directorName = null;
  
//선호 감독, 배우 +,- 버튼
  function addDirector(){
  var input = document.createElement("input")
  var add = document.querySelector(".diretorSection").appendChild(input)
  input.setAttribute('class','likeDirector')
  input.setAttribute('name','likeDirector')
  input.setAttribute('id','likeDirector')
  input.setAttribute('placeholder','이름을 입력하세요')
  directorName = $(".likeDirector").val();
  autocomplete1(directorName);
  
  
  }
  function addActor(){
  var input = document.createElement("input")
  var add = document.querySelector(".actorSection").appendChild(input)
  
  input.setAttribute('class','likeActor')  
  input.setAttribute('name','likeActor')
  input.setAttribute('id','likeActor')
  input.setAttribute('placeholder','이름을 입력하세요') 
  actorName = $(".likeActor").val();
  autocomplete(actorName);   
  }
  
  
  function autocomplete(a){
	  count = $(".likeActor").length-1;
  $(".likeActor").autocomplete({
		 
		 source : function( request, response ) {
       $.ajax({
              type: 'POST',
              url: "autocomplete",
              dataType: 'json',
              data: "actorName="+$(".likeActor")[count].value,
              success: function(data) {
                  var result = data;
                  response(result);     
  					
                  
                  
              },
              error : function(data) {
              	
              	
              	console.log("에러발생");
              }
						
					});
       }				
	});
  }
  function autocomplete1(a){
	  count1 = $(".likeDirector").length-1;
  $(".likeDirector").autocomplete({
		 
		 source : function( request, response ) {
       $.ajax({
              type: 'POST',
              url: "autocomplete1",
              dataType: 'json',
              data: "directorName="+$(".likeDirector")[count1].value,
              success: function(data) {
                  var result = data;
                  response(result);     
  					
                  
                  
              },
              error : function(data) {
              	
              	
              	console.log("에러발생");
              }
						
					});
       }				
	});
  }
  function minusActor() {
    var inp = document.querySelector(".actorSection");
    
    if(inp.children.length > 2){
    	inp.removeChild(inp.children[inp.children.length-1])
    }
  }
  function minusDirector() {
    var inp = document.querySelector(".diretorSection");
    if(inp.children.length > 2){inp.removeChild(inp.children[inp.children.length-1])}
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