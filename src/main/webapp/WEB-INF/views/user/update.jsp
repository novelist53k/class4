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
       		<input type="text" class="joinId" name="id" id="id" value="${login.userId }" readonly><br>
       
        
        
        
        <label for="password" class="joinLabel pwlabel">PASSWORD</label><br>
        <input type="password" class="password" name="password" id="password"><br>
        <label for="pwCheck" class="joinLabel">PASSWORD 확인</label><br>
        <input type="password" class="pwCheck" name="pwCheck" id="pwCheck" ><br>
        <label for="pwCheck" class="joinLabel">이름</label><br>
        <input type="text" class="pwCheck" id="userName" name="userName"  >            
        <br>
        <label for="gender" class="joinLabel">성별</label>
                
        <select name="gender" id="gender" class="gender">
	      <option value="man" >남자</option>
          <option value="woman">여자</option>
        </select>  
        
        <label for="gender" class="joinLabel"> 나이</label>
        <select name="age" id="age" class="age">
        <c:forEach begin="7" end="100" var="i">
             	<option value="${i}" >${i}
                                   
             </c:forEach>
        
        </select>
        <br>
        <label for="email" class="joinLabel">EMAIL</label><br>
        <input type="text" class="email1" name="email1"> @ 
       
       
        <select id="email2" class="email2"  onchange="email(this)">          
          <option  value="gmail.com" >gmail.com</option>
          <option  value="naver.com" >naver.com</option>
          <option  value="hanmail.net" >hanmail.net</option>               
        </select>
       
       
       
        <br>
          <label for="joinLabel addr-num">주소</label>
          <input type="text" class="postNum" id="addrZipNum" >
          <button type="button" class="btn btn-primary addrBtn" onclick="goPopup()">주소찾기</button>
        <div class="form-group">
          <input type="text" class="form-control" id="addrBasic" >
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="addrDetail" >
        </div>
        <br>
        <div class="actorSection">
          <label for="likeActor" class="joinLabel pwlabel">관심있는 배우</label><br>
                          
             <c:forEach var="vo" items="${userActorInfo.actorlist }">
             	<input class="likeActor" id="likeActor" name="likeActor" value="${vo.actor }" readonly>
                                   
             </c:forEach>                         
                                   	
          
        </div>
        
        
        
        <button type="button" class="add btn-primary" onclick="addActor()">+</button>
        <button type="button" class="minus btn-primary" onclick="minusActor()">-</button>
        <br>
        <br>
        <div class="diretorSection">
        <label for="likeDirector" class="joinLabel pwlabel">관심있는 감독</label><br>
        	 <c:forEach var="vo" items="${userDirectorInfo.directorlist }">
             	<input class="likeDirector" id="likeDirector" name="likeDirector" value="${vo.director }" readonly>
                                   
             </c:forEach>
      </div>
        <button type="button" class="add btn-primary" onclick="addDirector()">+</button>
        <button type="button" class="minus btn-primary" onclick="minusDirector()">-</button>
        <div class="genre">
    	    <c:set var="i" value="0" />

			<c:set var="j" value="4" />



			
          <label class="joinLabel">선호하는 장르</label><br>
          <c:forEach var="vo" items="${userGenreInfo.usergenrelist}">
                  <input class="likeGenre" id="likeGenre" name="likeGenre" value="${vo.gno }">
        	</c:forEach>
           <table>
           <colgroup>

       		<col width="150px" />
			<col width="150px" />
        	<col width="150px" />

    		</colgroup>
           <tbody>
           
        	<c:forEach var="vo1" items="${userGenreInfo.usergenrelist}">
            <c:if test="${i%j == 0 }">
                <tr>
            </c:if>                  
	        	<td> <label><input type="checkbox" class="genreLike" id="genreLike" name="genreLike" value="${vo1.gno }" > ${vo1.ugno }</label></td>                    
            <c:if test="${i%j == j-1 }">
                </tr>
            </c:if>
            <c:set var="i" value="${i+1 }" />
        </c:forEach>

    </tbody>




           
           
           </table>    
           	  
        
        </div>
        <br>
                
        <button type="submit" class="btn joinbtn " style="padding: 15px;">수정</button>
        <button type="button" class="btn btn-default" style="padding: 15px;" onclick="location='mypage'">취소</button>
      </form>
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