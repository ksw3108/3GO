<%@ page import="tour.model.*" %>
<%@ page import="tour.service.*" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");

	TourListService service = TourListService.getInstance();
	List<TourBean> tList = service.selectAllTour();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체 여행지 추출</title>
</head>
<body>



</body>
</html>