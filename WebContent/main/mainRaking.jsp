<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="search.beans.*" %>
<%@ page import="search.service.*" %>
 
<%
	request.setCharacterEncoding("EUC-KR");
	
	searchService service = searchService.getInstance();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Roboto+Condensed);
a {
	font-family: 'Roboto Condensed', sans-serif;
	font-size: 15px;
	text-decoration: none;
}
 img {
	border-radius : 10px; 	
}
 
.links {
	*zoom: 1;
	padding: 50px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	text-align: center;
	background: #313131;
}
.links:before, .links:after {
	content: "";
	display: table;
}
.links:after {
	clear: both;
}
.link-effect-6 button {
	color: rgba(0, 0, 0, 0.4);
	font-weight: 700;
	text-shadow: none;
	margin: 0 10px;
}
.link-effect-6 button::before {
	color: #797878;
	content: attr(data-hover);
	position: absolute;
	-webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
	-moz-transition: -moz-transform 0.3s, opacity 0.3s;
	transition: transform 0.3s, opacity 0.3s;
}
.link-effect-6 button:hover::before {
	-webkit-transform: scale(0.9);
	-moz-transform: scale(0.9);
	transform: scale(0.9);
	opacity: 0;
}

.link-effect-14 button {
	color: black;
	margin: 0 20px;
	padding: 10px 20px;
	position: relative;
	overflow: hidden;
	display: inline-block;
	-moz-transition: ease-out 0.3s;
	-o-transition: ease-out 0.3s;
	-webkit-transition: ease-out 0.3s;
	transition: ease-out 0.3s;
}
.link-effect-14 button span::before {
	width: 5px;
	height: 5px;
	background: transparent;
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	border-top: 2px solid gray;
	border-left: 2px solid gray;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	-webkit-transition: 0.3s;
	transition: 0.3s;
	opacity: 0;
}
.link-effect-14 button span::after {
	width: 5px;
	height: 5px;
	background: transparent;
	content: "";
	position: absolute;
	right: 0;
	bottom: 0;
	border-right: 2px solid gray;
	border-bottom: 2px solid gray;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	-webkit-transition: 0.3s;
	transition: 0.3s;
	opacity: 0;
}
.link-effect-14 button::before {
	width: 5px;
	height: 5px;
	background: transparent;
	content: "";
	position: absolute;
	right: 0;
	top: 0;
	border-right: 2px solid gray;
	border-top: 2px solid gray;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	-webkit-transition: 0.3s;
	transition: 0.3s;
	opacity: 0;
}
.link-effect-14 button::after {
	width: 5px;
	height: 5px;
	background: transparent;
	content: "";
	position: absolute;
	left: 0;
	bottom: 0;
	border-left: 2px solid gray;
	border-bottom: 2px solid gray;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	-webkit-transition: 0.3s;
	transition: 0.3s;
	opacity: 0;
}
.link-effect-14 button:hover {
	color: gray;
}
.link-effect-14 button:hover::before {
	opacity: 1;
	right: 5px;
	top: 5px;
}
.link-effect-14 button:hover::after {
	opacity: 1;
	left: 5px;
	bottom: 5px;
}
.link-effect-14 button:hover span::before {
	opacity: 1;
	left: 5px;
	top: 5px;
}
.link-effect-14 button:hover span::after {
	opacity: 1;
	right: 5px;
	bottom: 5px;
}

.col-sm-12 .seoulMap ul {
	position: relative;
	width: 569px;
	height: 460px;
	background: url(./images/seoul/seoul3.png) no-repeat;
}
.col-sm-12 .seoulMap button {
	background-color: Transparent;
	background-repeat:no-repeat;
	border: none;
	cursor:pointer;
	overflow: hidden;
}
.col-sm-12 .seoulSearch button {
	background-color: Transparent;
	background-repeat:no-repeat;
	border: none;
	cursor:pointer;
	overflow: hidden;
}

.seoulMap ul li {
	position: absolute;
}

.seoulMap .icon1 {	/* 강남 */
	left: 371px;
    top: 348px;
}
.seoulMap .icon2 {	/* 강동 */
	left: 480px;
    top: 243px;
}
.seoulMap .icon3 {	/* 강북 */
	left: 304px;
    top: 100px;
}
.seoulMap .icon4 {	/* 강서 */
	left: 45px;
    top: 225px;
}
.seoulMap .icon5 {	/* 관악 */
	left: 220px;
    top: 395px;
}
.seoulMap .icon6 {	/* 광진 */
	left: 405px;
    top: 253px;
}
.seoulMap .icon7 {	/* 구로 */
	left: 75px;
    top: 346px;
}
.seoulMap .icon8 {	/* 금천 */
	left: 153px;
    top: 405px;
}
.seoulMap .icon9 {	/* 노원 */
	left: 390px;
    top: 90px;
}
.seoulMap .icon10 {	/* 도봉 */
	left: 335px;
    top: 50px;
}
.seoulMap .icon11 {	/* 동대문 */
	left: 353px;
    top: 197px;
}
.seoulMap .icon12 {	/* 동작 */
	left: 220px;
    top: 327px;
}
.seoulMap .icon13 {	/* 마포 */
	left: 156px;
    top: 234px;
}
.seoulMap .icon14 {	/* 서대문 */
	left: 193px;
    top: 207px;
}
.seoulMap .icon15 {	/* 서초 */
	left: 302px;
    top: 363px;
}
.seoulMap .icon16 {	/* 성동 */
	left: 345px;
    top: 243px;
}
.seoulMap .icon17 {	/* 성북 */
	left: 310px;
    top: 160px;
}
.seoulMap .icon18 {	/* 송파 */
	left: 440px;
    top: 320px;
}
.seoulMap .icon19 {	/* 양천 */
	left: 87px;
    top: 305px;
}
.seoulMap .icon20 {	/* 영등포 */
	left: 160px;
    top: 290px;
}
.seoulMap .icon21 {	/* 용산 */
	left: 265px;
    top: 280px;
}
.seoulMap .icon22 {	/* 은평 */
	left: 193px;
    top: 120px;
}
.seoulMap .icon23 {	/* 종로 */
	left: 264px;
    top: 195px;
}
.seoulMap .icon24 {	/* 중구 */
	left: 280px;
    top: 230px;
}
.seoulMap .icon25 {	/* 중랑 */
	left: 415px;
    top: 165px;
}

.lcate {
	position: relative;
	padding: 30px 0;
	overflow: hidden;
}
.lcate .seoulMap {
	float: left;
}
.lcate .seoulSearch {
	position : absolute;
    float: left;
    width: 540px;
    left: 570px;
    top : 130px;
}
.lcate .seoulSearch ul {
	overflow: hidden;
}
.lcate .seoulSearch > ul > li:first-child {
	margin-top: 0;
}
.lcate .seoulSearch ul b {
	float: left;
    width: 110px;
    margin-top: 9px;
}

.lcate .tour:before {
	background: url(http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel_plus/find_category_1.png) no-repeat;
}
.lcate .food:before {
	background: url(http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel_plus/find_category_2.png) no-repeat;
}
.lcate .stay:before {
	background: url(http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel_plus/find_category_3.png) no-repeat;
}

.lcate .icon:before {
    content: "";
    display: inline-block;
    vertical-align: middle;
    width: 30px;
    height: 30px;
    margin-right: 7px;
}

.lcate .seoulSearch ul ul {
	float: left;
}

.seoulSearch ul li {
	float: left;
}
.seoulSearch button {
    padding: 5px;
    margin: 5px;
    font-weight: 600;
    border: 1px solid #8eafd2;
    border-radius: 3px;
    
}

ul, ol {
    list-style: none;
    list-style-image: none;
}
.col-sm-12 .tourRank {
	width: 1125px;
}
.col-sm-12 .tourRank ul li {
	margin: 10px;
	float: left;
	padding: 14px;
	border-radius:10px;
}
.col-sm-12 .tourRank ul li img {
	width: 163px;
	height: 112px;
	border-radius:10px;
}
.col-sm-12 .foodRank {
	width: 1125px;
}
.col-sm-12 .foodRank ul li {
	margin: 10px;
	float: left;
	padding: 14px;
	border-radius:10px;
}
.col-sm-12 .foodRank ul li img {
	width: 163px;
	height: 112px;
	border-radius:10px;
}
.col-sm-12 .stayRank {
	width: 1125px;
}
.col-sm-12 .stayRank ul li {
	margin: 10px;
	float: left;
	padding: 14px;
	border-radius:10px;
}
.col-sm-12 .stayRank ul li img {
	width: 163px;
	height: 112px;
	border-radius:10px;
}
</style>
<script type="text/javascript">
function onOver(elem){
	elem.style.backgroundColor="#F5A9A9";
	//document.getElementById('muover').style.background = "#F5A9A9";
}
function onOut(elem){
	elem.style.backgroundColor="#ffffff";
	//document.getElementById('muover').style.background = "#ffffff";
}
function rank(elem){
	
}
</script>
</head>
<body>
	<div id="links">
		<div class="link-effect-6" id="link-effect-6">
			<div class="container">
				<div class="row">
					<div class="col-sm-12" align="center">
						<div class="tourRank">
							<h2 class="title text-center"> Tour <strong> Top 5 </strong></h2>
							<form action="#" name="frm" method="get">
							<ul class="tourRanking">							
								<%
									for(int i=0; i<5; i++){
										List <searchTour> tList = service.getSearchTourRank(i);
								%>
								<li onmouseover="javascript:onOver(this);" onmouseout="javascript:onOut(this);" onclick="javascript:rank(this);">
									<a href="../tour/searchTour.jsp?tour_no=<%= tList.get(i).getT_no() %>">
									<img src="<%= tList.get(i).getImage() + "1.jpg" %>" />
									<h6><%= tList.get(i).getBoard_kind() %></h6>
									<h5><%= tList.get(i).getT_name() %></h5>
									</a>
								</li>
								<%
									}
								%>
							</ul>
							</form>
						</div>
					</div>
					<br/>
					<br/>
					<div class="col-sm-12" align="center">
						<div class="foodRank">
							<h2 class="title text-center"> Food <strong> Top 5 </strong></h2>
							<form action="#" name="frm" method="get">
							<ul class="foodRanking">
								<%
									for(int i=0; i<5; i++){
										List <searchCook> fList = service.getSearchFoodRank(i);
								%>
								<li onmouseover="javascript:onOver(this);" onmouseout="javascript:onOut(this);">
									<a href="../food/searchFood.jsp?food_no=<%= fList.get(i).getF_no() %>">
									<img src="<%= fList.get(i).getImage() + "1.jpg" %>" />
									<h6><%= fList.get(i).getF_kind() %></h6>
									<h5><%= fList.get(i).getF_name() %></h5>
									</a>
								</li>
								<%
									}
								%>
							</ul>
							</form>
						</div>
					</div>
					<br/>
					<br/>
					<div class="col-sm-12" align="center">
						<div class="stayRank">
							<h2 class="title text-center"> Stay <strong> Top 5 </strong></h2>
							<form action="#" name="frm" method="get">
							<ul class="stayRanking">
								<%
									for(int i=0; i<5; i++){
										List <searchStay> sList = service.getSearchStayRank(i);
								%>
								<li onmouseover="javascript:onOver(this);" onmouseout="javascript:onOut(this);">
									<a href="../stay/searchStay.jsp?stay_no=<%= sList.get(i).getS_no() %>">
									<img src="<%= sList.get(i).getImage() + "1.jpg" %>" />
									<h6><%= sList.get(i).getBoard_kind() %></h6>
									<h5><%= sList.get(i).getS_name() %></h5>
									</a>
								</li>
								<%
									}
								%>
							</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>