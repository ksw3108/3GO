<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="review.model.*,review.service.*" %> 
<%
	// 1. 삭제할 레코드의 게시글번호 넘겨받기
	String b_no = request.getParameter("b_no");
	
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 게시글 삭제하기 </title>
	 <link href="review/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/prettyPhoto.css" rel="stylesheet">
	<link href="../css/price-range.css" rel="stylesheet">
	<link href="../css/animate.css" rel="stylesheet">
	<link href="../css/map.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">
	<!-- [if lt IE 9] -->
	<script src="../js/html5shiv.js"></script>
	<script src="../js/respond.min.js"></script>
	<!-- [endif] -->
	<link rel="shortcut icon" href="../images/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144"
		href="../images/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114"
		href="../images/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72"
		href="../images/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed"
		href="../images/ico/apple-touch-icon-57-precomposed.png">

</head>
<body>
<jsp:include page="../main/mainheader.jsp"/>
<form method="post" action="review/delete.jsp" align="center">
	
	<table align="center" class= "table table-condensed">
		<th>삭제할 글암호를 입력하세요</th>
		<tr>
			<td><input type="b_password" name="b_password"></td>			
		</tr>
		<tr>
			<td><input type="submit" value="삭제하기">
			<input type="hidden" name = "b_no" value ="<%=b_no %>"  />	
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../main/mainfooter.jsp"/>
</body>
</html>