<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section class="movie_regist_update_area">
    <form action="#" class="registForm">
        <h2>[수정]</h2><br><br>
        <table>
            <tr>
                <td>제목</td>
                <td class="td2"><input type="text"></td>
            </tr>
            <tr>
                <td>영문제목</td>
                <td class="td2"><input type="text"></td>
            </tr>
            <tr>
                <td>장르</td>
                <td class="td2"><input type="text" placeholder="'/' 로 구분"></td>
            </tr>
            <tr>
                <td>관람등급</td>
                <td class="td2">
                    <select style="width: 50%; height: 40px;" name="grade" id="">
                        <option value="전체관람가">전체관람가</option>
                        <option value="12세관람가">12세관람가</option>
                        <option value="15세관람가">15세관람가</option>
                        <option value="청소년관람불가">청소년관람불가</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>개봉일</td>
                <td class="td2"><input style="width: 50%;" type="date"></td>
            </tr>
            <tr>
                <td>감독</td>
                <td class="td2"><input type="text"></td>
            </tr>
            <tr>
                <td>출연진</td>
                <td class="td2"><input type="text" placeholder="',' 로 구분"></td>
            </tr>
            <tr>
                <td>타이틀</td>
                <td class="td2"><input type="text"></td>
            </tr>

            <tr>
                <td>줄거리</td>
                <td class="td2"><input type="text" class="summary"></td>
            </tr>

            <tr>
                <td>포스터</td>
                <td class="td2"><input type="file" id="file" name="poster"></td>
            </tr>

            <tr>
                <td>예고편</td>
                <td class="td2"><input type="text" placeholder="youtube 동영상 소스코드 주소만 입력"></td>
            </tr>
            
            
        </table>    
        <button type="submit" style="width: 80px; height: 30px;">수정하기</button>
        <button type="submit" style="width: 80px; height: 30px;">삭제하기</button>

        <br><br><br><br>
    </form>
    </section>
            
