<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="review.service.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "meet.beans.*,meet.service.*" %>
<%@ page import = "meeting.model.*,meeting.service.*" %>
<%@ page import = "review.model.*, review.service.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
	
	meetService service = meetService.getInstance();
	
	List<meet> tList = service.getMeetSearch();
	/* System.out.println(tList.size()); */
%>
<%
	String userid = null;
	if(session.getAttribute("id") != "") {
		userid = (String)session.getAttribute("id");
	} else {
		session.invalidate();
		//response.sendRedirect("../main/.jsp");
	}	
%>
<%
	//웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	response.setHeader("Pragma", "No-cache"); // HTTP 1.0 version
	response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 version
	response.setHeader("Cache-Control", "no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L); // 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
%>
<%
	String pNum = request.getParameter("mPage");
	String b_r_k_no = "1";//request.getParameter("b_r_k_no");
	String t_no = "0";//request.getParameter("t_no");
	String s_no = "0";//request.getParameter("s_no");
	String c_no = "0";//request.getParameter("c_no");
	// Service에 getArticleList()함수를 호출하여 전체 메세지 레코드 검색 
	MeetingListService service1 = MeetingListService.getInstance();
	List<MeetingBean> mList = service1.getMeetingList(pNum, Integer.parseInt(b_r_k_no), Integer.parseInt(t_no), Integer.parseInt(s_no), Integer.parseInt(c_no));
	MeetingReplyService rService = MeetingReplyService.getInstance();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	//String b_r_k_no = request.getParameter("b_r_k_no");
	//String m_id = request.getParameter("m_id");
	//String b_r_k_no="1";

	String m_no = "1"; //request.getParameter("m_no");//세션으로 회원번호를 받아온다

	ReviewListService service2 = ReviewListService.getInstance();
	String id = service2.getReviewId(Integer.parseInt(m_no));
%>

<link href="../group/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	function saveBoard() {
		//window.open("BoardSave.jsp");		
		var frmObj = document.frm;
		frmObj.submit();
	}
	
</script>
<link rel="stylesheet" type="text/css" href="../group/css/style.css" />
<link rel="stylesheet" type="text/css" href="../group/css/demo.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Playfair+Display:400italic' rel='stylesheet' type='text/css' />
<noscript>
	<link rel="stylesheet" type="text/css" href="../group/css/noscript.css" />
</noscript>
<style type="text/css">
/* 	html {
		background: url(http://tong.visitkorea.or.kr/img/vk/kor/bz15/where/where_pattern.gif);
    	background-image: url("http://tong.visitkorea.or.kr/img/vk/kor/bz15/where/where_pattern.gif");
	} */
	#footer {
		margin-left : -427px;
		width : 1903px;
	}
	
	.enter_meet {
		cursor: pointer;
		border : 1px solid #b7b7b7;
		border-radius : 3px;
		background : #fff;
		color : #182950;
		font-weight: bold;
		text-align : center;
		height : 22px;
	}
	
	.small_img {
		width : 150px;
		height : 59px;
		left: 0px;
	}
	
/* 	#footer {
		margin-left : -427px;
		margin-right : auto;
		width : 1903px;
	} */
	#footer {
		margin-left : 0px;
	}
</style>
</head>
<body>

<%if(userid!=null) {%>
		<jsp:include page="../main/mainheaderlogin.jsp"/>
	<%}else{ %>
		<jsp:include page="../main/mainheader.jsp"/>
<%} %>

	<div id="link" align="center"> 
		<div class="wrapper">
			<div id="ei-slider" class="ei-slider">
				<ul class="ei-slider-large">
					<%
						for(int i=0; i<tList.size(); i++) {
					%>
					<li>
						<img class="large_img" src="<%= tList.get(i).getImage() %>" />
						<div class="ei-title">
							<h3><strong>장소 : <%= tList.get(i).getM_place() %>&nbsp | &nbsp날짜 : <%= tList.get(i).getM_date() %>&nbsp | &nbsp인원 : <%= tList.get(i).getM_people() %>/<%= tList.get(i).getM_max() %></strong>&nbsp&nbsp <button type="button" class="enter_meet">신청</button></h3>
						</div>
					</li>
					<% } %>
				</ul>
				<ul class="ei-slider-thumbs" style="margin-top:-10px;">
                       <li class="ei-slider-element">Current</li>
                       <%
                       	for(int i=0; i<tList.size(); i++) {
                       %>
                       <li>
                       	<a href="#"></a>
                       	<img class="small_img" src="<%= tList.get(i).getImage() %>"/>
                       </li>
                       <% } %>
				</ul>
			</div>
		</div>
	</div>
	
	<form action="insert.jsp" name='frm' method='post' enctype="multipart/form-data" align="center">
		<h3>게시판 글 쓰기</h3>
		<input type="hidden" name="b_r_k_no" value="1" />
		<table width="1000" align="center">
			<tr>
				<td width="15%"></td>
				<td width="70%">
					<table class="table table-condensed">
						<tr>
							<td></td>
							<th >작성자</th>
							<td align="left"><input type='text' name="m_id"
								value="<%= userid %>" class="form-control col-lg-2" data-rule-required="true"  colspan="2" /></td>
							<td></td>
						</tr>
							
						<tr>
							<td></td>
							<th>제 목</th>
							<td align="left"><input type='text' name="m_board_title" class="form-control col-lg-2" data-rule-required="true"></td>
							<td colspan="2"></td>						
						</tr>
						<tr>
							<td></td>
							<th>내 용</th>
							<td align="left"><textarea name="m_board_content" rows='10'
									cols='40' class="form-control col-lg-2" data-rule-required="true"></textarea></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
								<th>패스워드<br />(수정/삭제시 필요)
							</th>
							<td align="left"><input type='password'  name="m_board_pass" class="form-control col-lg-2" data-rule-required="true" ></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2" align="center"><input type='submit'
								value='작성' class="btn btn-default"
								onclick="javascript:saveBoard()" /> <input type='reset'
								class="btn btn-default" value='취소' /></td>
							<td colspan="2"></td>
						</tr>
					</table>
				</td>
				<td></td>
			</tr>
		</table>
	</form>
	
<jsp:include page="../main/mainfooter.jsp"/>
	
</body>
</html>