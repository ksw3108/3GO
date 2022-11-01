<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="meeting.model.*,meeting.service.*"%>
<%
	// 1. 수정할 레코드의 게시글번호를 넘거받기
	String m_board_no = request.getParameter("b_no");
	boolean isModify = true;
	// 2. Service에 getArticleById()함수를 호출하여 그 게시글번호의 레코드를 검색
	MeetingBean rec = MeetingViewService.getInstance().getMeetingById(m_board_no, isModify);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 수정하기</title>
<link href="./bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	function openWindow(){
		var m_board_no=document.frm.m_board_no.value;
		var m_board_pass = document.frm.m_board_pass.value;
		var m_board_title =  document.frm.m_board_title.value;
		var m_board_content= document.frm.m_board_content.value;
        window.open("modify.jsp?m_board_no="+m_board_no+"&m_board_pass="+m_board_pass+"&=m_board_title"+m_board_title+"&=m_board_content"+m_board_content,"modify","width=200, height=200");
        return false;
	}
</script>
</head>
<body>
	
	<form name='frm' method='post' action="modify.jsp" align="center">		
		<h4>게시판 글 수정하기</h4>
		<br />
		<input type="hidden" name="m_board_no" value="<%= m_board_no %>"/>
		<table width="1000" align="center">
			<tr>
				<td width="15%"></td>
				<td width="70%">
					<table class="table table-condensed">

						<tr>
							<td></td>
							<th>제 목</th>
							<td align="left"><input type='text' name="m_board_title"
								class="form-control col-lg-2" data-rule-required="true"
								value="<%=rec.getm_board_title()%>"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
							<th>내 용</th>
							<td align="left"><textarea name="m_board_content" rows='10'
									cols='40' class="form-control col-lg-2"
									data-rule-required="true"><%=rec.getm_board_content()%></textarea></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
							<th>패스워드<br />(수정/삭제시 필요)
							</th>
							<td align="left"><input type='password' name="m_board_pass"
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

</body>
</html>