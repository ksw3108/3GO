<%@ page import="food.model.*" %>
<%@ page import="food.service.*" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");

	FoodListService service = FoodListService.getInstance();
	List<FoodBean> tList = service.selectAllCook();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체 맛집 추출</title>
</head>
<body>



</body>
</html>