<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <section class="movie_regist_update_area">
      <form action="modify" method="post" name="regForm">
        <h2>[수정]</h2><br><br>
        <table class="up">
        
           <tr>
        		<td class="td1">영화코드</td>
        		<td class="td2"><input type="text" id="movieCd" name="movieCd" value="${info.movieCd }"  readonly></td>
        	</tr>
        	 <tr>
        		<td class="td1">제목</td>
        		<td class="td2"><input type="text" id="title" name="title" value="${info.title }"  readonly></td>
        	</tr>
            
            <tr>
              <td class="td1" style="margin-top: 100px; padding-top:48px">포스터</td>
              <td class="td2 post" style="margin-top: 50px;"><input type="file" id="file" name="file">
                <button type="button" class="upload btn btn-default" id="upload" name="upload">확인</button></td>
              </tr>  
              
               <tr>
              <td class="td3">
              <input class="btn" type="button" id="goback" value=등록></td>
            </tr>	
            </table>       
            
          </form>
          

        <br><br><br><br><br>
         
	         

    </section>
           
    <script>
    $("#goback").click(function(){
    	var cd = $("#movieCd").val()
 		location.href="movieCurrent";
    })
    
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
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
   
