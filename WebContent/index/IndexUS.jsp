<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	
	if( id != null ) {
		session.setAttribute("id", id);
	} else {
		session.invalidate();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	
	<section id="slider">
		<!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0"
								class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1>
										<span>E</span> - Tour
									</h1>
									<h2>거제도 - 바람의 언덕</h2>
									<p> 내 생애 봄날 촬영지이며 </p>
									<p> 멋진 뷰를 자랑하는 바람의 언덕 </p>
									<button type="button" class="btn btn-default get">
										Click</button>
								</div>
								<div class="col-sm-6">
									<img src="../images/home/girl1.jpg" class="girl img-responsive"
										alt="" />
									<!-- <img src="images/home/pricing.png"  class="pricing" alt="" />  -->
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1>
										<span>E</span> - Food
									</h1>
									<h2>Black Stone - Steak</h2>
									<p> 최고의 재료만을 사용하여 만든 </p>
									<p> 환상적인 맛의 Steak! </p>
									<button type="button" class="btn btn-default get">
										Click</button>
								</div>
								<div class="col-sm-6">
									<img src="../images/home/girl2.jpg" class="girl img-responsive"
										alt="" />
									<!-- <img src="images/home/pricing.png"  class="pricing" alt="" />  -->
								</div>
							</div>

							<div class="item">
								<div class="col-sm-6">
									<h1>
										<span>E</span> - Stay
									</h1>
									<h2>하얏트 호텔</h2>
									<p> 최고의 서비스를 제공하여 </p>
									<p> 최상의 만족감을 느낄 수 있는 하얏트 호텔 </p>
									<button type="button" class="btn btn-default get">
										Click</button>
								</div>
								<div class="col-sm-6">
									<img src="../images/home/girl3.jpg" class="girl img-responsive"
										alt="" />
									<!-- <img src="images/home/pricing.png"  class="pricing" alt="" />  -->
								</div>
							</div>

						</div>

						<a href="#slider-carousel" class="left control-carousel hidden-xs"
							data-slide="prev"> <i class="fa fa-angle-left"></i>
						</a> <a href="#slider-carousel"
							class="right control-carousel hidden-xs" data-slide="next"> <i
							class="fa fa-angle-right"></i>
						</a>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!--/slider-->

	<br />
	<br />
	
	<jsp:include page="../main/mainRaking.jsp"/>
	<jsp:include page="../main/mainfooter.jsp"/>
		
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.scrollUp.min.js"></script>
	<script src="../js/price-range.js"></script>
	<script src="../js/jquery.prettyPhoto.js"></script>
	<script src="../js/main.js"></script>
</body>
</html>