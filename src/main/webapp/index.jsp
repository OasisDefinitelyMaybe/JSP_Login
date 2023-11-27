<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>HelloJSP</h2>
서블릿에서 저장한 문자열 : <%=request.getAttribute("str") %>
<br>서블릿에서 저장한 DB에서 조회한 시간 : <%=request.getAttribute("time") %>
</body>
</html>