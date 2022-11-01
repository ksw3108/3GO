<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="meeting.model.*,meeting.service.*" %> 
<%	
	request.setCharacterEncoding("EUC-KR");
%>
<%
	// 1. 삭제할 레코드의 게시글번호와 비밀번호를 넘겨받기
	String b_no = request.getParameter("m_board_no");
	String password = request.getParameter("m_board_pass");
	
	/* System.out.println(b_no); */
	
	// 2. Service에 delete() 호출하여 결과 행 수 받아오기
	int rec = MeetingDeleteService.getInstance().delete(b_no, password);
	int result = rec; 
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% if( result != 0) { %>
			글을 삭제하였습니다.
			<a href="group.jsp">[글 목록으로 돌아가기]</a>
	<% } else { %>
			암호가 맞지 않아 삭제가 실패되었습니다.
	<% } %>
</body>
</html>