<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="tour.model.*" %>
<%@ page import="tour.service.*" %>
<%@ page import="java.util.List" %> 
<%
	request.setCharacterEncoding("EUC-KR");
	/*
		전 페이지에서 조회수/최신순 버튼은 각각 id에 1, 2를 value로 가짐
		1이면 조회수순, 2면 최신순으로 정렬
	*/
	String num = request.getParameter("id");
	TourSeqService service = TourSeqService.getInstance();
	List<TourBean> tList = service.selectTourList(num);
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>여행지 순차정렬</title>
</head>
<body>

</body>
</html>