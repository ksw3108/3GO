<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<title> 모임 </title>
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
</style>
</head>
<body>
	<div id="link" align="center"> 
		<div class="wrapper">
			<div id="ei-slider" class="ei-slider">
					<ul class="ei-slider-large" style="margin-bottom:10px;">
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
					<div style="height: 430px;">
					<ul>
						<li>
							<table cellspacing="0" cellpadding="0" border="0" class="meet_board" style="width:1050px;">
								<colgroup>
									<col width="70">
									<col width="*">
									<col width="70">
									<col width="122">
									<col width="49">
								</colgroup>
								<tr>
									<td colspan="5" class="board-line"></td>
								</tr>
								<tr class="bg-color" align="center">
									<td class="p11">글번호</td>
									<td class="p11">제목</td>
									<td class="p11">작성자<span style="padding:0 25px 0 0;"></span></td>
									<td class="p11">작성일<span style="padding:0 15px 0 0;"></span></td>
									<td class="p11">조회수</td>
								</tr>
								<tr>
									<td colspan="5" class="board-line1"></td>
								</tr>
						</table>
					</li>
				</ul>

				<ul>
					<li>
					<table cellspacing="0" cellpadding="0" border="0" class="meet_board" style="width:1050px;">
						<colgroup>
							<col width="70">
							<col width="*">
							<col width="70">
							<col width="122">
							<col width="49">
						</colgroup>
							<%
								if( mList.size() == 0) {
							%>
							<tr>
								<td colspan="5" class="p11"><center>등록된 게시물이 없습니다.</center></td>
							</tr>
							<tr>
								<td colspan="5" class="board-line1"></td>
							</tr>
							<% } else {
									for( int i=0; i<mList.size(); i++) {
							%>
							<tr align="center" class="bg-color">
								<td class="p11"><%= mList.get(i).getm_board_no() %></td>
								<td align="left" class="p11"><a href="../group/view.jsp?group_no=<%= mList.get(i).getGroup_no()%>&m_board_no=<%= mList.get(i).getm_board_no()%>">
									<%= mList.get(i).getm_board_title() %>
									<% if(rService.getReplyCount(mList.get(i).getGroup_no())!=0) { %>
										[<%= rService.getReplyCount(mList.get(i).getGroup_no()) %>]
									<% } else {} %>
								</a></td>
								<td class="p11"><%= service1.getMeetingId(mList.get(i).getM_no()) %><span style="padding:0 25px 0 0;"></span></td>
								<td class="p11"><%= mList.get(i).getm_board_date() %><span style="padding:0 15px 0 0;"></span></td>
								<td class="p11"><%= mList.get(i).getm_board_count() %></td>
							</tr>
							<tr>
								<td colspan="5" class="board-line1"></td>
							</tr>
							<%}
							}%>
						</table>
					</li>
				</ul>
				
				<br/>
				
				<ul style="margin-left: 85%;">
					<li>
						<center>
							<table cellspacing="0" cellpadding="0" border="0" class="meet_board">
								<tr>
									<td align="center">
										<%
											for( int i=1; i<=service1.getTotalPage(Integer.parseInt(b_r_k_no), Integer.parseInt(t_no),
												Integer.parseInt(s_no), Integer.parseInt(c_no)); i++) {
										%> <a href="../group/group.jsp?mPage=<%= i %>" >[<%= i %>]</a>
										<%
											}
								 		%>
									</td>
								</tr>
								<tr>
									<td>
										<a class="gwrite" href='../group/insertForm.jsp'><button>글쓰기</button></a>
										<a class="glist" href="../group/group.jsp"><button>목록보기</button></a>
									</td>
								</tr>
							</table>	
						</center>
					</li>
				</ul>
				</div>
				<ul style="margin-top: -39.5px; margin-bottom: 0px;">
					<li>
						<jsp:include page="../main/mainfooter.jsp"/>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="../group/js/jquery.eislideshow.js"></script>
    <script type="text/javascript" src="../group/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript">
		$(function() {
			$('#ei-slider').eislideshow({
				easing		: 'easeOutExpo',
				titleeasing	: 'easeOutExpo',
				titlespeed	: 1200
            });
		});
	</script>
</body>
</html>