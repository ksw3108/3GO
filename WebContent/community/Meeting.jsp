<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	String id = null;
	if(session.getAttribute("id") != "") {
		id = (String)session.getAttribute("id");
	} else {
		session.invalidate();
		//response.sendRedirect("../main/.jsp");
	}	
%>
</head>
<body>
	<%if(id!=null) {%>
		<jsp:include page="../main/mainheaderlogin.jsp"/>
	<%}else{ %>
		<jsp:include page="../main/mainheader.jsp"/>
	<%} %>
	<jsp:include page="../group/group.jsp"/>
</body>
</html>