<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="review.model.*,review.service.*" %> 
<%	
	request.setCharacterEncoding("EUC-KR");
%>
<%
	// 1. ������ ���ڵ��� �Խñ۹�ȣ�� ��й�ȣ�� �Ѱܹޱ�
	String b_no = request.getParameter("b_no");
	String password = request.getParameter("b_password");
	// 2. Service�� delete() ȣ���Ͽ� ��� �� �� �޾ƿ���
	int rec = ReviewDeleteService.getInstance().delete(b_no, password);
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
			���� �����Ͽ����ϴ�.
			<a href="list.jsp">[�� ������� ���ư���]</a>
	<% } else { %>
			��ȣ�� ���� �ʾ� ������ ���еǾ����ϴ�.
	<% } %>
</body>
</html>