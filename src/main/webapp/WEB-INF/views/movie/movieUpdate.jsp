<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section class="movie_regist_update_area">
    <form action="shoot" class="registForm" name="registForm" method="post">
        <h2>[수정]</h2><br><br>
        <table>
            <tr>
                <td>제목</td>
                <td class="td2"><input type="text" readonly value="${list.title }"></td>
            </tr>
            <tr>
                <td>영문제목</td>
                <td class="td2"><input type="text" readonly value="${list.ftitle }"></td>
            </tr>
            <tr>
                <td>장르</td>
                <td class="td2"><input type="text" readonly value="#"></td>
            </tr>
            <tr>
                <td>관람등급</td>
                <td class="td2" readonly value="#">
                    <!-- <select style="width: 50%; height: 40px;" name="grade" id="">
                        <option value="전체관람가">전체관람가</option>
                        <option value="12세관람가">12세관람가</option>
                        <option value="15세관람가">15세관람가</option>
                        <option value="청소년관람불가">청소년관람불가</option>
                    </select> -->
                </td>
            </tr>
            <tr>
                <td>개봉일</td>
                <td class="td2"><input style="width: 50%;" type="date" readonly value="#"></td>
            </tr>
            <tr>
                <td>감독</td>
                <td class="td2"><input type="text" readonly value="#"></td>
            </tr>
            <tr>
                <td>출연진</td>
                <td class="td2"><input type="text" readonly value="#"></td>
            </tr>
            <tr>
                <td>타이틀</td>
                <td class="td2"><input type="text" id="subhead" name="subhead"></td>
            </tr>

            <tr>
                <td>줄거리</td>
                <td class="td2"><input type="text" class="summary" id="content" name="content"></td>
            </tr>

            <tr>
                <td>포스터</td>
                <td class="td2"><input type="file" id="file" name="poster"></td>
            </tr>

            <tr>
                <td>예고편</td>
                <td class="td2"><input type="text" placeholder="youtube 동영상 소스코드 주소만 입력" id="trailer" name="trailer"></td>
            </tr>
            
            
        </table>       
        <button type="button" style="width: 80px; height: 30px;" class="btn3">등록하기</button>
        <button type="button" style="width: 80px; height: 30px;" class="upbtn">수정하기</button>

        <br><br><br><br>
    </form>
    </section>
           
     <script>
     	
     	var btn3 = document.querySelector(".btn3");
     	btn3.onclick = function(){
     		location.href = "movieRegist"
     	
     		
     	}
     
     	var upbtn = document.querySelector(".upbtn");
     	
     	upbtn.onclick = function(){
     		
     		document.registForm.submit();
     	}
     	
     	//파일비동기 전송시 반드시 필요한 FormData()객체 생성
		var data = $("#file")
		console.log(data)
		console.log(data[0])
		console.log(data[0].files) //파일태그에 담긴 파일을 확인하는 키값
		console.log(data[0].files[0])
		
		var content = $("#content").val();
		
		var formData = new FormData();
		formData.append("file" , data[0].files[0]); //file이름으로 file데이터저장
		formData.append("content", content);
			
		$.ajax({
			type : "POST",
			url : "upload",
			processData : false, //폼형식이  &변수=값의 형태로 변경되는 것을 막는다.
			contentType : false, //false로 지정하면 기본으로 "multipart/form-data" 으로 선언됨
			data : formData, //폼데이터객체
			success : function(result){
				if(result === 'success'){
					alert("됨");
					/* $("#file").val(""); //파일데이터 초기화
					$("#content").val(""); //content 초기화
					$(".fileDiv").css("display","none"); //미리보기 숨기기
					getList(); //목록 호출 */
				}else{
					alert("업로드에 실패했습니다. 관리자에게 문의하세요");
				}
			
			},
			error : function(status, error){}
			
		});//end ajax
	};//등록end
     </script>
