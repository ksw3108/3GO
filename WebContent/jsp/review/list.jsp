<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="review.model.*,review.service.*"%>
<%@ page import="java.util.List"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<%
	//���������� �Խñ� ����� ĳ���� ��� ���ο� ���� �߰��Ǵ��� ������ ��Ͽ� �� ���� �� �ֱ� ������ ����
	response.setHeader("Pragma", "No-cache"); // HTTP 1.0 version
	response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 version
	response.setHeader("Cache-Control", "no-store"); // �Ϻ� ���̾����� ���� ����
	response.setDateHeader("Expires", 1L); // ���� �ð� �������� �������� ���������ν� �������� ĳ������ �ʵ��� ����
%>

<%
	String pNum = request.getParameter("mPage");
	String b_r_k_no = "1";//request.getParameter("b_r_k_no");
	String t_no = "0";//request.getParameter("t_no");
	String s_no = "0";//request.getParameter("s_no");
	String c_no = "0";//request.getParameter("c_no");
	// Service�� getArticleList()�Լ��� ȣ���Ͽ� ��ü �޼��� ���ڵ� �˻� 
	ReviewListService service = ReviewListService.getInstance();
	List<ReviewBean> mList = service.getReviewList(pNum, Integer.parseInt(b_r_k_no), Integer.parseInt(t_no),
			Integer.parseInt(s_no), Integer.parseInt(c_no));
	ReviewReplyService rService = ReviewReplyService.getInstance();
	
	System.out.println("aaaaaaaaaaaaa");
	String id = null;
	if(session.getAttribute("id") != "") {
		id = (String)session.getAttribute("id");
	} else {
		session.invalidate();
		//response.sendRedirect("../main/.jsp");
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<title>Home | Map's</title>
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
	<script src="../js/html5shiv.js"></script>
	<script src="../js/respond.min.js"></script>
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.scrollUp.min.js"></script>
	<script src="../js/price-range.js"></script>
	<script src="../js/jquery.prettyPhoto.js"></script>
	<script src="../js/main.js"></script>
	<script src="../js/search.js"></script>
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
<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ���) -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
	<%if(id!=null) {%>
		<jsp:include page="../../main/mainheaderlogin.jsp"/>
	<%}else{ %>
		<jsp:include page="../../main/mainheader.jsp"/>
	<%} %>


	<h3 face="����, ����ü" size="2" color="#0088FF" align="center">�Խ��� ���
	</h3>
	<table width="1050" border="0" height="800" align="center">
		<tr>
			<td></td>
			<td>
				<table width="1050" border="0" height="800" align="center"
					class="table table-condensed">
					<tr>
						<td height="50" width="10%">&nbsp;</td>
						<td height="50" width="79%">
							<table width="100%" border="0" height="303">
								<tr valign="middle">
									<td colspan="5">
										<table width="100%" border="0">
											<tr class="trstyle">
												<td width="9%" align="center" valign="middle" height="25">�۹�ȣ</td>
												<td width="57%" valign="middle" align="center" height="25">��
													&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ��</td>
												<td width="12%" align="center" valign="middle" height="25">�ۼ���</td>
												<td width="12%" align="center" valign="middle" height="25">�ۼ���</td>
												<td width="10%" align="center" valign="middle" height="25">��ȸ��</td>
											</tr>

											<%
												if (mList == null) {
											%>
											<tr>
												<td colspan="6">��ϵ� �Խù��� �����ϴ�.</td>
											</tr>
											<hr />
											<%
												} else {
													for (int i = 0; i < mList.size(); i++) {
											%>

											<tr class="textstyle">
												<td width="7%" align="center" valign="middle" height="25">
													<%=mList.get(i).getB_no()%>
												</td>
												<td width="49%" align="left" valign="middle" height="25">
													<a
													href="view.jsp?group_no=<%=mList.get(i).getGroup_no()%>&b_no=<%=mList.get(i).getB_no()%>">
														<%=mList.get(i).getB_title()%>
														<%if(rService.getReplyCount(mList.get(i).getGroup_no())!=0){ %>
															[<%=rService.getReplyCount(mList.get(i).getGroup_no()) %>]
														<%}else{} %>
													</a>
												</td>
												<td width="14%" align="center" valign="middle" height="25">
													<%=service.getReviewId(mList.get(i).getM_no())%></td>
												<td width="14%" align="center" valign="middle" height="25">
													<%=mList.get(i).getB_date()%>
												</td>
												<td width="8%" align="center" valign="middle" height="25">
													<%=mList.get(i).getB_count()%>
												</td>
											</tr>
											<%
												}
												} // end else
											%>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td></td>
						<td align="center">
							<%
								for (int i = 1; i <= service.getTotalPage(Integer.parseInt(b_r_k_no), Integer.parseInt(t_no),
										Integer.parseInt(s_no), Integer.parseInt(c_no)); i++) {
							%> <a href="list.jsp?mPage=<%=i%>">[<%=i%>]</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%
							 	}
							 %> <a href='insertForm.jsp'>�۾��� </a>
						</td>
						<td></td>
					</tr>
				</table>
			</td>
			<td></td>
		</tr>
	</table>

</body>
</html>