<%@page import="com.login.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- 버튼 이벤트 추가 --> 
  <script type="text/javascript">
    window.onload = function(){
	
		  // 로그아웃 버튼 처리
		   let logoutBtn = document.querySelector("#logoutBtn")
		   if(logoutBtn != null) {
		           logoutBtn.onclick = function() {
			       // 로그아웃 처리 -> 로그인 페이지로 이동
			       location.href="/logoutAction";
	           	 }
			}
			// 로그인 버튼 처리
			let loginBtn = document.querySelector("#loginBtn");
			if(loginBtn != null) {
			    loginBtn.addEventListener('click', function() {
				location.href="login.jsp";					
			});
	}
}

</script>

<%
     Object user_id = session.getAttribute("user_id");
     if(user_id != null && !"".equals(user_id)) {
           // 로그인한 사용자 -> 로그아웃 버튼 출력 -> 세션을 만료시키고 로그인 페이지로 이동
%>    
     <%= session.getAttribute("user_id")%>님 환영합니다.<br>      
	     <button id="logoutBtn" class="btn btn-dark">로그아웃</button>
	     
<%    } else {
	     // 로그인하지 않은 사용자 -> 로그인버튼 출력 -> 로그인 페이지로 이동
%>	     
	      <button id='loginBtn' class="btn btn-dark">로그인</button>
<% } %>

   

<h2>게시글 목록 조회</h2>
<table class="table">
  <thead>
     <tr>
	      <th scope="col">번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">내용</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	      <th scope="col">조회수</th>  
     </tr>
     </thead>
     <tbody>
     <!-- 게시글의 수만큼 반복 시작 -->
			<%
			   if(request.getAttribute("list") == null) {
				   out.print("<td colspan='4'>게시글이 존재하지 않습니다.</td>");
				   
			   } else {
				   List<BoardDto> list = (List<BoardDto>)request.getAttribute("list");
				   for(BoardDto dto : list) {
					   
			%>
			
		    <tr>
		        <th scope="row"><%= dto.getNum() %></th>
				<td><a href="/boardView?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a></td>
				<td><%= dto.getContent() %></td>
				<td><%= dto.getId() %></td>
				<td><%= dto.getPostdate() %></td>
				<td><%= dto.getVisitcount()%></td>
			</tr>	
		    <!-- 반복문 끝 -->	   
<% 	   }
       }%>   
  </tbody>
</table>


<%--
<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<!-- 게시글의 수만큼 반복시작 -->
		<%
			if(request.getAttribute("list") == null){
				out.print("<td colspan='6'>게시글이 존재하지 않습니다.</td>");
			} else {
				List<BoardDto> list = (List<BoardDto>)request.getAttribute("list");
				for(BoardDto dto : list){
		%>
		<tr>
			<td><%= dto.getNum() %></td>
			<td><a href="/boardView?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a></td>
			<td><%= dto.getContent() %></td>
			<td><%= dto.getId() %></td>
			<td><%= dto.getPostdate() %></td>
			<td><%= dto.getVisitcount()%></td>
		</tr>
		<%		}
			} %>
</table> --%>

<%@include file="PageNavi.jsp" %>
</body>
</html>