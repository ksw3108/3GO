<%@ page import="tour.model.*" %>
<%@ page import="tour.service.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String tourNo = request.getParameter("t_no");

	DeleteService service = DeleteService.getInstance();
	int count = service.delete(Integer.parseInt(tourNo));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 - 여행지 삭제</title>
</head>
<body>
	<%if(count==0){%>
		삭제할 여행지가 존재하지 않습니다.
	<%} else{%>		
		<%=count %>행의 여행지 삭제가 완료되었습니다.
	<%} %>

</body>
</html>