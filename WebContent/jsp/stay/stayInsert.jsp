<%@ page import="stay.model.*" %>
<%@ page import="stay.service.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- ���� ȭ�鿡�� ���� property�� tour Ÿ������ ��üȭ -->
<jsp:useBean id="Stay" class="stay.model.StayBean">
	<jsp:setProperty name = "Stay" property="*"/>
</jsp:useBean>

<%
	InsertService service = InsertService.getInstance();
	service.insert(Stay);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - ������ �Է�</title>
</head>
<body>

	���ο� ������ �Է��� �Ϸ�Ǿ����ϴ�.

</body>
</html>