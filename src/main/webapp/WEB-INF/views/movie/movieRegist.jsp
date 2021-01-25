<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section class="movie_regist">
    <form action="regist" method="post"  class="registForm">
         <h2>[등록]</h2><br><br>
        <table>
            <tr>
                <td class="td1">인증 key</td>
                <td class="td2"><input type="text" id="key" name="key" value="7e7efe4ec48bc16bff2f86fbc588f9ca" readonly></td>
            </tr>
            <tr>
                <td class="td1">조회페이지</td>
                <td class="td2"><input type="text" name="curPage" value=""></td>
            </tr>
            <tr>
                <td class="td1">조회개수</td>
                <td class="td2"><input type="text" name="itemPerPage" value=""></td>
            </tr>
            <tr>
                <td class="td1">조회 시작 개봉연도</td>
                <td class="td2"><input style="width: 50%;" type="text" id="openStartDt"name="openStartDt" value=""></td>
				<td>~</td>
	            <td class="td1">조회 종료 개봉연도</td>
                <td class="td2"><input style="width: 50%;" type="text" id="openEndDt" name="openEndDt" value=""></td>
            </tr>
            
        </table>  
        
        <button  style="width: 80px; height: 30px;" id="registBtn">등록하기</button>
        <br><br><br><br>
    </form>
    </section>
    <script>
    $("#registBtn").click(function(){
    	
    	if($("#key").val() == ''){
    		alert("key값은 필수 입니다")
    		return;
    	} else if($("#openStartDt").val() == '' || $("#openEndDt").val()==''){
    		alert("연도는 필수 값입니다")
    		return;
    	}else{
    		$("#registBtn").submit();
    	}
    });
    	
    
    </script>
    
    