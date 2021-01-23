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
                <td class="td2"><input type="file" id="file" id="poster" name="poster"></td>
            </tr>

            <tr>
                <td>예고편</td>
                <td class="td2"><input type="text" placeholder="youtube 동영상 소스코드 주소만 입력" id="trailer" name="trailer"></td>
            </tr>
            
            
        </table>    
        <button type="button" style="width: 80px; height: 30px;" class="upbtn">수정하기</button>

        <br><br><br><br>
    </form>
    </section>
           
     <script>
     	var upbtn = document.querySelector(".upbtn");
     	
     	upbtn.onclick = function(){
     		
     		document.registForm.submit();
     	}
     	
     </script>
