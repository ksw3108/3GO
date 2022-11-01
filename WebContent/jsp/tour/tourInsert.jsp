<%@ page import="tour.model.*" %>
<%@ page import="tour.service.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- 이전 화면에서 얻어온 property를 tour 타입으로 객체화 -->
<jsp:useBean id="Tour" class="tour.model.TourBean">
	<jsp:setProperty name = "Tour" property="*"/>
</jsp:useBean>

<%
	InsertService service = InsertService.getInstance();
	service.insert(Tour);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 - 여행지 입력</title>
</head>
<body>

	새로운 여행지 입력이 완료되었습니다.

</body>
</html>