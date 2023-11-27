<%@page import="com.login.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
   // 화면이 모두 불러들여져 오면 실행합니다.
   window.onload = function()  {
	   // 화면에 있는 요소를 선택해서 변수에 저장
	   let listBtn = document.querySelector('#listBtn');
	   // 리스트버튼이 화면에 존재하면, 이벤트를 추가 
	   if(listBtn != null) {
		   listBtn.onclick = function() {
			   // 리스트 페이지로 이동
			   location.href = '/list';
		   }
	   }
	   
	   // 삭제 버튼을 클릭하면 '정말 삭제 하시겠습니까?' 확인후
	   // 삭제컨트롤러를 호출합니다.
	   // 삭제 성공 -> 리스트페이지 호출
	   // 삭제 실패 -> '삭제중 예외가 발생되었습니다.' 메세지 출력후 -> 상세페이지(뒤로가기)
	   
	   let deleteBtn = document.querySelector('#deleteBtn');
	   if(deleteBtn != null) {
		   // 삭제버튼에 이벤트를 추가
		   deleteBtn.addEventListener('click', function() {
				deleteFnc();
			   
		   });
	   }
	   let editBtn = document.querySelector('#editBtn');
   } 
   function deleteFnc() {
	   // 컨펌창 : 확인, 취소 버튼이 출력
       // 확인 : true를 반환, 취소 = false를 반환		 
	     if(confirm('정말 삭제 하시겠습니까?')) {
	      alert('확인 클릭');				   
		  // 버튼을 클릭하면 삭제 컨트롤러를 요청
		   viewForm.action='/delete';
		   viewForm.submit();			   
			 } else {
			   // alert('취소 클릭');
		  }
   }
</script>
<h2>상세보기</h2>
요청 게시글 번호 : <%=request.getParameter("num")%>
<br>boardDto : <%=request.getAttribute("boardDto") %>
<br>
<form method="post" name="viewForm">
    <input type="hidden" name="num" value="<%=request.getParameter("num")%>">
</form>
<button id="listBtn">리스트</button>
<!-- 글의 작성자만 수정, 삭제가 가능합니다.
  게시글의 id가 로그인한 id와 동일하다면 수정, 삭제 버튼 보여주기
 -->
<%
   if(request.getAttribute("boardDto")!=null) {
	   BoardDto dto = (BoardDto)request.getAttribute("boardDto");
	    String userId= "";
	    if(session.getAttribute("userId") != null) {
	    	userId = session.getAttribute("userId").toString();
	        if(userId.equals(dto.getId())) {	        	
				out.print("<button id='deleteBtn'>삭제</button>&nbsp;");
			    out.print("<button id='editBtn'>수정</button>");
	        }
    }
%>


<ul>
    <li>제목 : <%=dto.getTitle()%></li>
    <li>내용 : <%=dto.getContent()%></li>
    <li>작성자 : <%=dto.getId()%></li>
    <li>작성일 : <%=dto.getPostdate()%></li>
    <li>조회수 : <%=dto.getVisitcount()%></li>
    
</ul>
<% } %>
</body>
</html>