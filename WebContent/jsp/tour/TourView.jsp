<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="tour.model.*" %>
<%@ page import="tour.service.*" %>  
<%
	request.setCharacterEncoding("EUC-KR");
	String t_no = request.getParameter("t_no");
	TourViewService service = TourViewService.getInstance();
	TourBean tour = service.selectTour(t_no);
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>여행지 원하는 1행만 추출</title>
</head>
<body>

</body>
</html>