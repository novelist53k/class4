<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    form{
          background: linear-gradient(45deg, rgb(241, 241, 241), rgb(110, 109, 109));
        }
        *{margin: 0; padding: 0;}
        ul, li{list-style: none;}
        table{
            width: 80%;
        }
        form{
            width: 60%;
            margin: 0 auto;
            border: 1px solid;
            text-align: center;
        }
        form h2{
            float: left;
        }
        input{
            border-radius: 7px;
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .content{
            height: 200px;

        }
        .td2{
            width: 60%;
        }
        .summary{
            height: 400px;
        }
    </style>
</head>
<body>
	<form action="#">
        <h2>[영화 등록]</h2><br><br>
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
                <td class="td2"><input type="text" placeholder="',' 로 구분"></td>
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
        <button type="submit" style="width: 80px; height: 30px;">등록하기</button>
        <br><br><br><br>
        
    </form>
</body>
</html>