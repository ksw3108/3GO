<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="review.model.*,review.service.*"%>
<%
	// 1. 수정할 레코드의 게시글번호를 넘거받기
	String b_no = request.getParameter("b_no");
	boolean isModify = true;
	// 2. Service에 getArticleById()함수를 호출하여 그 게시글번호의 레코드를 검색
	ReviewBean rec = ReviewViewService.getInstance().getReviewById(b_no, isModify);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 수정하기</title>
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


<link href="./bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	function openWindow(){
		var b_no=document.frm.b_no.value;
		var b_password = document.frm.b_password.value;
		var b_title =  document.frm.b_title.value;
		var b_content= document.frm.b_content.value;
        window.open("modify.jsp?b_no="+b_no+"&b_password="+b_password+"&=b_title"+b_title+"&=b_content"+b_content,"modify","width=200, height=200");
        return false;
	}
</script>
</head>
<body>
	<jsp:include page="../main/mainheader.jsp"/>
	<form name='frm' method='post' action="review/modify.jsp" align="center">		
		<h4>게시판 글 수정하기</h4>
		<br />
		<input type="hidden" name="b_no" value="<%= b_no %>"/>
		<table width="1000" align="center">
			<tr>
				<td width="15%"></td>
				<td width="70%">
					<table class="table table-condensed">

						<tr>
							<td></td>
							<th>제 목</th>
							<td align="left"><input type='text' name="b_title"
								class="form-control col-lg-2" data-rule-required="true"
								value="<%=rec.getB_title()%>"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
							<th>내 용</th>
							<td align="left"><textarea name="b_content" rows='10'
									cols='40' class="form-control col-lg-2"
									data-rule-required="true"><%=rec.getB_content()%></textarea></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
							<th>패스워드<br />(수정/삭제시 필요)
							</th>
							<td align="left"><input type='password' name="b_password"
								class="form-control col-lg-2" data-rule-required="true"></td>
							<td colspan="2"></td>
						</tr>

					</table>
				</td>
				<td></td>
			</tr>
			<tr></tr>
		</table>

		<input type='submit' value='수정하기' class="btn btn-default"> <input type='button'
			value='목록보기' onclick="javascript:openWindow()" class="btn btn-default">
	</form>
	<jsp:include page="../main/mainfooter.jsp"/>
</body>
</html>