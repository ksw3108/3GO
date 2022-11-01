<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Food Infomation | Seoul </title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">
    <!-- [if lt IE 9] -->
    <script src="../js/html5shiv.js"></script>
    <script src="../js/respond.min.js"></script>
    <!-- [endif] -->       
    <link rel="shortcut icon" href="../images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">
        <style type="text/css">
    	.logo img{width:160px; margin-left:30px;} 
    	#home_menu_img{margin-left:30px; width:70px;}
    	#tour_menu_img{width:60px;}
    	#food_menu_img{width:65px;}
    	#stay_menu_img{width:55px;}
    	#comm_menu_img{width:140px;}
    
    </style>
    <script type="text/javascript">
	    function mouseOver_home(){
	        document.getElementById("home_menu_img").src ="../images/home/HomeMenu2.png";
	    }
	    function mouseOut_home(){
	        document.getElementById("home_menu_img").src ="../images/home/HomeMenu.png";
	    }
	    function mouseOver_tour(){
	        document.getElementById("tour_menu_img").src ="../images/home/TourMenu2.png";
	    }
	    function mouseOut_tour(){
	        document.getElementById("tour_menu_img").src ="../images/home/TourMenu.png";
	    }
	    function mouseOver_stay(){
	        document.getElementById("stay_menu_img").src ="../images/home/StayMenu2.png";
	    }
	    function mouseOut_stay(){
	        document.getElementById("stay_menu_img").src ="../images/home/StayMenu.png";
	    }
	    function mouseOver_comm(){
	        document.getElementById("comm_menu_img").src ="../images/home/CommunityMenu2.png";
	    }
	    function mouseOut_comm(){
	        document.getElementById("comm_menu_img").src ="../images/home/CommunityMenu.png";
	    }
   
    </script>
</head>
<body>

<header id="header"><!--header-->
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="../IndexUS.html"><img src="../images/home/IndexName.png" alt="" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									Language
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="../IndexKR.html"> KR </a></li>
									<li><a href="../IndexUS.html"> US </a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="../Join.html"><i class="fa fa-user"></i> Account </a></li>
								<li><a href="../Login.html"><i class="fa fa-lock"></i> Login </a></li>
								<li><a href="../Wishlist.html"><i class="fa fa-shopping-cart"></i> Wishlist </a></li>
								<li><a href="../Contact-Us.html"><i class="fa fa-lock"></i> Contact </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="../IndexUS.html"> <img src="../images/home/HomeMenu.png" alt="" id='home_menu_img' onmouseover='javascript:mouseOver_home();' onmouseout='javascript:mouseOut_home();'/> </a></li>
								<li class="dropdown"><a href="../Tour/TourInfo.jsp"> <img src="../images/home/TourMenu.png" alt="" id='tour_menu_img' onmouseover='javascript:mouseOver_tour();' onmouseout='javascript:mouseOut_tour();'/> <i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="../tour/TourInfo.html"> Tour Info </a></li>
										<li><a href="../tour/FestivalInfo.html"> Festival Info </a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="FoodInfo.jsp" class="active"> <img src="../images/home/FoodMenu2.png" alt="" id='food_menu_img' /> <i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="../food/FoodInfo.html"> Food Info </a></li>
										<li><a href="../food/EveryWhere.html"> EveryWhere </a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="../Stay/StayInfo.jsp"> <img src="../images/home/StayMenu.png" alt="" id='stay_menu_img' onmouseover='javascript:mouseOver_stay();' onmouseout='javascript:mouseOut_stay();'/> <i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="../stay/StayInfo.html"> Stay Info </a></li>
										<li><a href="../stay/blog-single.html">Blog Single</a></li>
                                    </ul>
                                </li> 
                                <li class="dropdown"><a href="../community/Board.html"> <img src="../images/home/CommunityMenu.png" alt="" id='comm_menu_img' onmouseover='javascript:mouseOver_comm();' onmouseout='javascript:mouseOut_comm();'/> <i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="../community/Meeting.html"> Meeting </a></li>
										<li><a href="../community/Review.html"> Review </a></li>
                                    </ul>
                                </li> 
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	
	  <script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.scrollUp.min.js"></script>
	<script src="../js/price-range.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/main.js"></script>

</body>
</html>