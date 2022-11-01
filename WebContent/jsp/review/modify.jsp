<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="review.model.*,review.service.*" %> 
<%	
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="rec" class = "review.model.ReviewBean">
	<jsp:setProperty name = "rec" property="*"/>
</jsp:useBean>    
<%
	// 2. Service에 update() 호출하여 결과 행 수 받아오기
	int result =  ReviewModifyService.getInstance().update(rec); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% if( result != 0) { %>
			성공적으로 수정이 완료되었습니다! <br/>
			
	<% } else { %>
			암호가 잘못 입력되었습니다!
	<% } %>
	<br/>	
	
</body>
</html>