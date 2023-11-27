<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<!-- 
 get방식 : queryString을 이용해 데이터를 전달 (주소를 이용)
 post방식 : body영역을 통해 데이터를 전달 
 -->
 <%= "1".equals(request.getParameter("isError"))? "아이디 비밀번호를 확인해주세요" : "" %>
<form action="/loginAction" method="post">
<div class='loginbox'>
        <div id='login'>
            <input type="text" name="id" id="id" placeholder='ID를 입력해주세요.' value="test">
            <input type="password" name="pw" id="pw" placeholder='PW를 입력해주세요.' value="1234">
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
    </div>
</form> 
    
</body>
</html>