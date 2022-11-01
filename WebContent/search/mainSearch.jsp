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
	String id = null;
	if(session.getAttribute("id") != "") {
		id = (String)session.getAttribute("id");
	} else {
		session.invalidate();
		//response.sendRedirect("../main/.jsp");
	}	
%>
<body>
	<%if(id!=null) {%>
		<jsp:include page="../main/mainheaderlogin.jsp"/>
	<%}else{ %>
		<jsp:include page="../main/mainheader.jsp"/>
	<%} %>

	<section id="links">
		<!--slider-->
		<nav class="link-effect-6" id="link-effect-6">
			<div class="container">
				<div class="row">
					<form action="afterSearch.jsp" name="afterfrm" method="post">
						<div class="col-sm-12">
							<h2 class="title text-center">
								Seoul <strong> Map's </strong>
							</h2>
							<div class="lcate">
								<div class="seoulMap">
									<ul id="setHiddenButtons1">
										<li class="icon">
											<p class="categoryResult">
												<span class="category"> 띠리링띠리링~ </span>
											</p>
										</li>
										<li class="icon1">
											<button value="1" name="areaCode" type="button"
												class="go-button" data-hover="강남">강남</button> <input
											type="hidden" name="areaCode" value="1" />
										</li>
										<li class="icon2">
											<button value="2" name="areaCode" type="button"
												class="go-button" data-hover="강동">강동</button> <input
											type="hidden" name="areaCode" value="2" />
										</li>
										<li class="icon3">
											<button value="3" name="areaCode" type="button"
												class="go-button" data-hover="강북">강북</button> <input
											type="hidden" name="areaCode" value="3" />
										</li>
										<li class="icon4">
											<button value="4" name="areaCode" type="button"
												class="go-button" data-hover="강서">강서</button> <input
											type="hidden" name="areaCode" value="4" />
										</li>
										<li class="icon5">
											<button value="5" name="areaCode" type="button"
												class="go-button" data-hover="관악">관악</button> <input
											type="hidden" name="areaCode" value="5" />
										</li>
										<li class="icon6">
											<button value="6" name="areaCode" type="button"
												class="go-button" data-hover="광진">광진</button> <input
											type="hidden" name="areaCode" value="6" />
										</li>
										<li class="icon7">
											<button value="7" name="areaCode" type="button"
												class="go-button" data-hover="구로">구로</button> <input
											type="hidden" name="areaCode" value="7" />
										</li>
										<li class="icon8">
											<button value="8" name="areaCode" type="button"
												class="go-button" data-hover="금천">금천</button> <input
											type="hidden" name="areaCode" value="8" />
										</li>
										<li class="icon9">
											<button value="9" name="areaCode" type="button"
												class="go-button" data-hover="노원">노원</button> <input
											type="hidden" name="areaCode" value="9" />
										</li>
										<li class="icon10">
											<button value="10" name="areaCode" type="button"
												class="go-button" data-hover="도봉">도봉</button> <input
											type="hidden" name="areaCode" value="10" />
										</li>
										<li class="icon11">
											<button value="11" name="areaCode" type="button"
												class="go-button" data-hover="동대문">동대문</button> <input
											type="hidden" name="areaCode" value="11" />
										</li>
										<li class="icon12">
											<button value="12" name="areaCode" type="button"
												class="go-button" data-hover="동작">동작</button> <input
											type="hidden" name="areaCode" value="12" />
										</li>
										<li class="icon13">
											<button value="13" name="areaCode" type="button"
												class="go-button" data-hover="마포">마포</button> <input
											type="hidden" name="areaCode" value="13" />
										</li>
										<li class="icon14">
											<button value="14" name="areaCode" type="button"
												class="go-button" data-hover="서대문">서대문</button> <input
											type="hidden" name="areaCode" value="14" />
										</li>
										<li class="icon15">
											<button value="15" name="areaCode" type="button"
												class="go-button" data-hover="서초">서초</button> <input
											type="hidden" name="areaCode" value="15" />
										</li>
										<li class="icon16">
											<button value="16" name="areaCode" type="button"
												class="go-button" data-hover="성동">성동</button> <input
											type="hidden" name="areaCode" value="16" />
										</li>
										<li class="icon17">
											<button value="17" name="areaCode" type="button"
												class="go-button" data-hover="성북">성북</button> <input
											type="hidden" name="areaCode" value="17" />
										</li>
										<li class="icon18">
											<button value="18" name="areaCode" type="button"
												class="go-button" data-hover="송파">송파</button> <input
											type="hidden" name="areaCode" value="18" />
										</li>
										<li class="icon19">
											<button value="19" name="areaCode" type="button"
												class="go-button" data-hover="양천">양천</button> <input
											type="hidden" name="areaCode" value="19" />
										</li>
										<li class="icon20">
											<button value="20" name="areaCode" type="button"
												class="go-button" data-hover="영등포">영등포</button> <input
											type="hidden" name="areaCode" value="20" />
										</li>
										<li class="icon21">
											<button value="21" name="areaCode" type="button"
												class="go-button" data-hover="용산">용산</button> <input
											type="hidden" name="areaCode" value="21" />
										</li>
										<li class="icon22">
											<button value="22" name="areaCode" type="button"
												class="go-button" data-hover="은평">은평</button> <input
											type="hidden" name="areaCode" value="22" />
										</li>
										<li class="icon23">
											<button value="23" name="areaCode" type="button"
												class="go-button" data-hover="종로">종로</button> <input
											type="hidden" name="areaCode" value="23" />
										</li>
										<li class="icon24">
											<button value="24" name="areaCode" type="button"
												class="go-button" data-hover="중구">중구</button> <input
											type="hidden" name="areaCode" value="24" />
										</li>
										<li class="icon25">
											<button value="25" name="areaCode" type="button"
												class="go-button" data-hover="중랑">중랑</button> <input
											type="hidden" name="areaCode" value="25" />
										</li>
									</ul>
								</div>
								<div class="seoulSearch">
									<ul>
										<li><b class="icon tour"> 관광명소 </b> <br />
											<ul data-type="multiple" id="setHiddenButtons2">
												<li>
													<button name="catAll1" class="go-button-ov1" type="button"
														value="all" style="color: white;">전체</button> <input
													type="hidden" name="catAll1" value="all">
												</li>
												<li>
													<button name="cate1" class="go-button-ov1" type="button"
														value="1" style="color: white;">자연관광</button> <input
													type="hidden" name="cate1" value="1">
												</li>
												<li>
													<button name="cate1" class="go-button-ov1" type="button"
														value="2" style="color: white;">역사관광</button> <input
													type="hidden" name="cate1" value="2">
												</li>
												<li>
													<button name="cate1" class="go-button-ov1" type="button"
														value="3" style="color: white;">체험관광</button> <input
													type="hidden" name="cate1" value="3">
												</li>
												<li>
													<button name="cate1" class="go-button-ov1" type="button"
														value="4" style="color: white;">테마관광</button> <input
													type="hidden" name="cate1" value="4">
												</li>
												<li>
													<button name="cate1" class="go-button-ov1" type="button"
														value="5" style="color: white;">문화시설</button> <input
													type="hidden" name="cate1" value="5">
												</li>
												<li>
													<button name="cate1" class="go-button-ov1" type="button"
														value="6" style="color: white;">쇼핑</button> <input
													type="hidden" name="cate1" value="6">
												</li>
												<li>
													<button name="cate1" class="go-button-ov1" type="button"
														value="7" style="color: white;">레포츠</button> <input
													type="hidden" name="cate1" value="7">
												</li>
											</ul></li>
										<li><b class="icon food">음식점</b> <br />
											<ul data-type="multiple" id="setHiddenButtons4">
												<li>
													<button name="catAll3" class="go-button-ov2" type="button"
														value="all" style="color: white;">전체</button> <input
													type="hidden" name="catAll3" value="all">
												</li>
												<li>
													<button name="cate3" class="go-button-ov2" type="button"
														value="1" style="color: white;">한식</button>

												</li>
												<li>
													<button name="cate3" class="go-button-ov2" type="button"
														value="2" style="color: white;">양식</button>

												</li>
												<li>
													<button name="cate3" class="go-button-ov2" type="button"
														value="3" style="color: white;">일식</button>

												</li>
												<li>
													<button name="cate3" class="go-button-ov2" type="button"
														value="4" style="color: white;">중식</button>

												</li>
												<li>
													<button name="cate3" class="go-button-ov2" type="button"
														value="5" style="color: white;">분식</button>

												</li>
												<li>
													<button name="cate3" class="go-button-ov2" type="button"
														value="6" style="color: white;">채식</button>

												</li>
												<li>
													<button name="cate3" class="go-button-ov2" type="button"
														value="7" style="color: white;">카페/전통찻집</button>

												</li>
											</ul></li>
										<li><b class="icon stay">숙박</b> <br />
											<ul data-type="multiple" id="setHiddenButtons5">
												<li>
													<button name="catAll2" class="go-button-ov3" type="button"
														value="all" style="color: white;">전체</button> <input
													type="hidden" name="catAll2" value="all">
												</li>
												<li>
													<button name="cate2" class="go-button-ov3" type="button"
														value="1" style="color: white;">호텔</button>

												</li>
												<li>
													<button name="cate2" class="go-button-ov3" type="button"
														value="2" style="color: white;">콘도</button>

												</li>
												<li>
													<button name="cate2" class="go-button-ov3" type="button"
														value="3" style="color: white;">펜션</button>

												</li>
												<li>
													<button name="cate2" class="go-button-ov3" type="button"
														value="4" style="color: white;">여관&amp;모텔</button>

												</li>
												<li>
													<button name="cate2" class="go-button-ov3" type="button"
														value="5" style="color: white;">민박</button>

												</li>
												<li>
													<button name="cate2" class="go-button-ov3" type="button"
														value="6" style="color: white;">한옥스테이</button>

												</li>
												<li>
													<button name="cate2" class="go-button-ov3" type="button"
														value="7" style="color: white;">게스트하우스</button>

												</li>
											</ul></li>
									</ul>
								</div>
								<div>
									<input type="hidden" value="0" name="mapHidden"
										class="mapHidden" id="mapHidden" size="4" /> <input
										type="hidden" value="0" name="temaHidden1" class="temaHidden1"
										id="temaHidden1" size="4" /> <input type="hidden" value="0"
										name="temaHidden2" class="temaHidden2" id="temaHidden2"
										size="4" /> <input type="hidden" value="0" name="temaHidden3"
										class="temaHidden3" id="temaHidden3" size="4" />
								</div>
							</div>

							<div class="searchBtn">
								<a href="#" class="btn btn-search" id="btn-search"
									onclick="searchbtn()"> 검색하기<i class="fa fa-check spaceLeft"></i></a>

								<a href="#" class="btn btn-refresh" id="btn-refresh"> 초기화<i
									class="fa fa-check spaceLeft"></i></a>
							</div>

							<br /> <br /> <br />
						</div>
					</form>
				</div>
			</div>
		</nav>
	</section>

	<jsp:include page="../main/mainfooter.jsp" />

</body>
</html>