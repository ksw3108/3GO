<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.beans.*" %>
<%@ page import="member.service.*" %>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="regist" class="member.beans.Register">
	<jsp:setProperty name="regist" property="*" />
</jsp:useBean>

<%
	RegisterDao dao = RegisterDao.getInstance();
	dao.insertMember(regist);
%>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">    
    <link rel="shortcut icon" href="../images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>똥</title>
</head>
<body>
	<jsp:include page="../main/mainheader.jsp" />
	
	<br/><br/>
	<form action="../IndexUS.html" method="post">
	<center>
		<button class="btn" id="moveMain">
		<h1> 회원가입 완료! </h1>
		<h2> <%=regist.getM_name() %>님 환영합니다!!!! </h2>
		<h5> 클릭시 메인페이지로 이동합니다. </h5> 
		</button>
	</center>
	</form>
	<br/><br/><br/><br/>

	<jsp:include page="../main/mainfooter.jsp" />

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
	<script src="../js/jquery.scrollUp.min.js"></script>
	<script src="../js/price-range.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>