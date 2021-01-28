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
                <td class="td1">줄거리</td>
                <td class="td2"><input type="text" id="subhead" name="subhead" value="${info.subhead }"></td>
            </tr>

            <tr>
                <td class="td1">내용</td>
                <td class="td2"><input type="text" class="summary" id="content" name="content" value="${info.content }"></td>
            </tr>

            <tr>
                <td class="td1">예고편</td>
                <td class="td2"><input type="text" placeholder="youtube 동영상 소스코드 주소만 입력" id="trailer" name="trailer"></td>
                
            </tr>
            
            <tr>
              <td class="td3">
              <input class="btn" type="button" id="modify" value=등록></td>
            </tr>
            
            </table>       
	        
            
          </form>
          

        <br><br><br><br><br>
         

    </section>
         
    <script>
    $("#modify").click(function(){
    	
 		document.regForm.submit();
    })
    
    
   
   
    </script>
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
   
