<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="tour.model.*" %>
<%@ page import="tour.service.*" %>
<%@ page import="java.util.List" %> 
<%
	request.setCharacterEncoding("EUC-KR");
	/*
		�� ���������� ��ȸ��/�ֽż� ��ư�� ���� id�� 1, 2�� value�� ����
		1�̸� ��ȸ����, 2�� �ֽż����� ����
	*/
	String num = request.getParameter("id");
	TourSeqService service = TourSeqService.getInstance();
	List<TourBean> tList = service.selectTourList(num);
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ��������</title>
</head>
<body>

</body>
</html>