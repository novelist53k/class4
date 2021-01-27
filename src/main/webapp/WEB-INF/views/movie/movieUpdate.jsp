<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section class="movie_regist_update_area">
        <h2>[수정]</h2><br><br>
        <form action="modify" method="post" name="regForm">
        <table class="up">

            <tr>
                <td>줄거리</td>
                <td class="td2"><input type="text" id="subhead" name="subhead" value="${info.subhead }"></td>
            </tr>

            <tr>
                <td>내용</td>
                <td class="td2"><input type="text" class="summary" id="content" name="content" value="${info.content }"></td>
            </tr>

            <tr>
                <td>포스터</td>
                <td class="td2"><input type="file" id="file" name="file"></td>
                <!-- <td><button type="button" class="upload btn btn-default" id="upload" name="upload">확인</button></td> -->
                <td><button type="button" class="upload btn btn-default" id="upload" name="upload">확인</button></td>
            </tr>

            <tr>
                <td>예고편</td>
                <td class="td2"><input type="text" placeholder="youtube 동영상 소스코드 주소만 입력" id="trailer" name="trailer"></td>
            </tr>

            
         
        </table>       
        	<input type="hidden" name="cd" value="">
        </form>
        <button type="button" style="width: 80px; height: 30px;" class="btn3">등록하기</button>
        <button type="button" style="width: 80px; height: 30px;" class="modify">수정하기</button>

		
        <br><br><br><br>
         <input type="hidden"  id="title" value="${info.title }">
        

    </section>
           
    <script>
    $("#upload").click(function(){
    	console.log(1)
 		var file = $("#file").val();
 		var title = $("#title").val();
 		
 		var file = file.substring(file.lastIndexOf('.')+1, file.length).toLowerCase();
 		if(file !="jpg" && file !="png"&&file!="jpeg" && file!="gif"){
 			alert("이미지파일만 등록 가능");
 			return;
 		}
 		var data = $("#file")
 		console.log(data);
 		console.log(data[0]);
 		console.log(data[0].files);
 		console.log(data[0].files[0]);
 		
 		var formData = new FormData();
 		formData.append("file",data[0].files[0]);
 		formData.append("title",title);
 		
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
 				alert("업로드 실패");
 			}
 		}) //ajax
    });
    
    </script>
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    /*  $("#upload").click(function(){
 		console.log(1)
 		var cd = $("#movieCd").val();
		document.regForm.cd.value=cd;
 		document.regForm.submit();
 		});
     
   	  	var btn3 = document.querySelector(".btn3");
     	btn3.onclick = function(){
     		location.href = "movieRegist";
     		
     	}
     	
     	//파일비동기 전송시 반드시 필요한 FormData()객체 생성
		var data = $("#file").val();
		
		/* console.log(data)
		console.log(data[0])
		console.log(data[0].files) //파일태그에 담긴 파일을 확인하는 키값
		console.log(data[0].files[0]) */
		/* var formData = new FormData();
		formData.append("file" , data[0].files[0]); //file이름으로 file데이터저장
		$.ajax({
			type : "POST",
			url : "upload",
			processData : false, //폼형식이  &변수=값의 형태로 변경되는 것을 막는다.
			contentType : false, //false로 지정하면 기본으로 "multipart/form-data" 으로 선언됨
			data : formData, //폼데이터객체
			success : function(result){
				if(result === 'success'){
					alert("됨");
					 $("#file").val(""); //파일데이터 초기화
					$("#content").val(""); //content 초기화
					$(".fileDiv").css("display","none"); //미리보기 숨기기
					getList(); //목록 호출 
				}else{
					alert("업로드에 실패했습니다. 관리자에게 문의하세요");
				}
			
			},
			error : function(status, error){}
			
		});//end ajax */
	//등록end */

