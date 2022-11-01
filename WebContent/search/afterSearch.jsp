<%@page import="search.beans.searchCook"%>
<%@page import="search.beans.searchTour"%>
<%@page import="search.beans.searchStay"%>
<%@page import="java.util.List"%>
<%@page import="search.service.searchService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | Seoul</title>
<style type="text/css">
img {
	border-radius: 10px 10px 0 0 / 10px 10px 0 0;
}
</style>
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
</head>
<%
	String id = (String) session.getAttribute("id");

	String map = (String) request.getParameter("mapHidden");
	String tour = (String) request.getParameter("temaHidden1");
	String cook = (String) request.getParameter("temaHidden2");
	String stay = (String) request.getParameter("temaHidden3");

	searchService service = searchService.getInstance();
	List<Object> total = service.getSearchMain(map, tour, cook, stay);

	int tSize = 0;
	int cSize = 0;
	int sSize = 0;
	
	List<searchTour> tList = null;
	List<searchCook> cList = null;
	List<searchStay> sList = null;
	
	if (Integer.parseInt(tour) != 0) {
		tList = (List<searchTour>) total.get(0);
		tSize = tList.size();
	}

	if (Integer.parseInt(cook) != 0) {
		cList = (List<searchCook>) total.get(1);
		cSize = cList.size();
	}

	if (Integer.parseInt(stay) != 0) {
		sList = (List<searchStay>) total.get(2);
		sSize = sList.size();
	}

	int totalSize = tSize + cSize + sSize;
%>

<body>
	<jsp:include page="../main/mainheader.jsp" />
	<jsp:include page="./search.jsp" />
	
	<ul class="photoList">
	<% for(int i=0; i<total.size(); i++) { %>
		<% if(i==0 && Integer.parseInt(tour)!=0) {%>
		<% for(int j=0; j<tList.size(); j++) { %>
		<li	><a href="#" onclick="window.open('../tour/searchTour.jsp?tour_no=<%= tList.get(j).getT_no() %>'); return false"> <img src="<%= tList.get(j).getImage() + "1.jpg" %>"
				alt="이미지1" width=90% height=90% /> <br />
				<table class="sel_table" width=180px>
					<tr>
						<td align=center><font color="#000000"><%= tList.get(j).getT_name() %></font></td>
					</tr>
					<tr>
						<td align=center><font color="#000000"><%= tList.get(j).getT_addr() %></font></td>
					</tr>
					<tr>
						<td align=center><font color="#000000"><%= tList.get(j).getT_tel() %></font></td>
					</tr>
				</table>
			</a>
		</li>
		<% } %>
		<% } else if(i==1 && Integer.parseInt(cook)!=0) { %>
		<% for(int j=0; j<cList.size(); j++) { %>
		<li><a href="#" onclick="window.open('../food/searchFood.jsp?food_no=<%= cList.get(j).getF_no() %>'); return false"> <img src="<%= cList.get(j).getImage() + "1.jpg" %>"
				alt="이미지1" width=90% height=90% /> <br />
				<table class="sel_table" width=180px>
					<tr>
						<td align=center><font color="#000000"><%= cList.get(j).getF_name() %></font></td>
					</tr>
					<tr>
						<td align=center><font color="#000000"><%= cList.get(j).getF_addr() %></font></td>
					</tr>
					<tr>
						<td align=center><font color="#000000"><%= cList.get(j).getF_tel() %></font></td>
					</tr>
				</table>
			</a>
		</li>
		<% } %>
		<% } else if(i==2 && Integer.parseInt(stay)!=0) { %>
		<% for(int j=0; j<sList.size(); j++) { %>
		<li><a href="#" onclick="window.open('../stay/searchStay.jsp?stay_no=<%= sList.get(j).getS_no() %>'); return false"> <img src="<%= sList.get(j).getImage() + "1.jpg" %>"
				alt="이미지1" width=90% height=90% /> <br />
				<table class="sel_table" width=180px>
					<tr>
						<td align=center><font color="#000000"><%= sList.get(j).getS_name() %></font></td>
					</tr>
					<tr>
						<td align=center><font color="#000000"><%= sList.get(j).getS_addr() %></font></td>
					</tr>
					<tr>
						<td align=center><font color="#000000"><%= sList.get(j).getS_tel() %></font></td>
					</tr>
				</table>
			</a>
		</li>
		<% } %>
		<% } %>
	<% } %>
	</ul>
	
	<br/><br/><br/>
	<jsp:include page="../main/mainfooter.jsp" />

</body>
</html>