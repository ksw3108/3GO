<%@ page import="food.model.*" %>
<%@ page import="food.service.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- 이전 화면에서 얻어온 property를 tour 타입으로 객체화 -->
<jsp:useBean id="Food" class="food.model.FoodBean">
	<jsp:setProperty name = "Food" property="*"/>
</jsp:useBean>


<%
	ModifyService service = ModifyService.getInstance();
	int count = service.update(Food);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 - 맛집 수정</title>
</head>
<body>

	맛집 수정이 완료되었습니다.

</body>
</html>