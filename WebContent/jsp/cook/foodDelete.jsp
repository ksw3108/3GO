<%@ page import="food.model.*" %>
<%@ page import="food.service.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String cookNo = request.getParameter("c_no");

	DeleteService service = DeleteService.getInstance();
	int count = service.delete(Integer.parseInt(cookNo));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - ���� ����</title>
</head>
<body>
	<%if(count==0){%>
		������ ������ �������� �ʽ��ϴ�.
	<%} else{%>		
		<%=count %>���� ���� ������ �Ϸ�Ǿ����ϴ�.
	<%} %>

</body>
</html>