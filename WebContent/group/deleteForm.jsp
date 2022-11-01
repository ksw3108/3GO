<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="meeting.model.*,meeting.service.*" %> 
<%
	// 1. 삭제할 레코드의 게시글번호 넘겨받기
	String m_board_no = request.getParameter("b_no");
	
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 게시글 삭제하기 </title>
</head>
<body>

<form method="post" action="delete.jsp" align="center">
	
	<table align="center" class= "table table-condensed">
		<th>삭제할 글암호를 입력하세요</th>
		<tr>
			<td><input type="password" name="m_board_pass"></td>			
		</tr>
		<tr>
			<td>
				<input type="submit" value="삭제하기">
				<input type="hidden" name = "m_board_no" value ="<%=m_board_no %>"  />	
			</td>
		</tr>
	</table>
</form>

</body>
</html>