<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = "";
	
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	} else {
		session.invalidate();
		response.sendRedirect("../main/IndexUS.jsp");
	}
	System.out.println(session.getAttribute("id"));
%>

<!DOCTYPE html>
<head>
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
	    function mouseOver_food(){
	        document.getElementById("food_menu_img").src ="../images/home/FoodMenu2.png";
	    }
	    function mouseOut_food(){
	        document.getElementById("food_menu_img").src ="../images/home/FoodMenu.png";
	    }
   
    </script>
</head>
<header id="header">
	<!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88
									821</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i>
									info@domain.com</a></li>
						</ul>
					</div>
				</div>
				<form action="login/loginConfirm.jsp" method="post" name="frm">
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<!-- <li class="logout"><a href="#"><i class="fa fa-sign-out"></i></a></li> -->
								<li><a href="#" class="userLog"><i class="fa fa-user"> <%= id %>, Welcome! </i></a></li>
								<li class="logout"><a href="#" class="LogOut" onclick="javascript:logout();"><i class="fa fa-sign-out"> LogOut </i></a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--/header_top-->
	
	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="../index/IndexUS.jsp"><img src="../images/home/IndexName.png" alt="" /></a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							<li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
							<li><a href="../cart.jsp"><i class="fa fa-shopping-cart"></i>Cart</a></li>
							<li><a href="../search/mainSearch.jsp"><i class="fa fa-crosshairs"></i>DetailSearch</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

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
							<li><a href="../index/IndexUS.jsp"> <img src="../images/home/HomeMenu.png" alt="" id='home_menu_img' onmouseover='javascript:mouseOver_home();' onmouseout='javascript:mouseOut_home();'/> </a></li>
							<li class="dropdown"><a href="../tour/TourInfo.jsp"> <img src="../images/home/TourMenu.png" alt="" id='tour_menu_img' onmouseover='javascript:mouseOver_tour();' onmouseout='javascript:mouseOut_tour();'/> <i class="fa fa-angle-down"></i></a>
                                   <ul role="menu" class="sub-menu">
                                       <li><a href="../tour/TourInfo.jsp"> Tour Info </a></li>
									<li><a href="../tour/FestivalInfo.jsp"> Festival Info </a></li> 
                                   </ul>
                               </li> 
							<li class="dropdown"><a href="../food/FoodInfo.jsp"> <img src="../images/home/FoodMenu.png" alt="" id='food_menu_img' onmouseover='javascript:mouseOver_food();' onmouseout='javascript:mouseOut_food();'/> <i class="fa fa-angle-down"></i></a>
                                   <ul role="menu" class="sub-menu">
                                       <li><a href="../food/FoodInfo.jsp"> Food Info </a></li>
									<li><a href="../food/EveryWhere.jsp"> EveryWhere </a></li>
                                   </ul>
                               </li>
                               <li class="dropdown"><a href="../stay/StayInfo.jsp"> <img src="../images/home/StayMenu.png" alt="" id='stay_menu_img' onmouseover='javascript:mouseOver_stay();' onmouseout='javascript:mouseOut_stay();'/> <i class="fa fa-angle-down"></i></a>
                                   <ul role="menu" class="sub-menu">
                                       <li><a href="../stay/StayInfo.jsp"> Stay Info </a></li>
									<li><a href="../stay/blog-single.jsp">Blog Single</a></li>
                                   </ul>
                               </li> 
                               <li class="dropdown"><a href="../community/list.jsp"> <img src="../images/home/CommunityMenu.png" alt="" id='comm_menu_img' onmouseover='javascript:mouseOver_comm();' onmouseout='javascript:mouseOut_comm();'/> <i class="fa fa-angle-down"></i></a>
                                   <ul role="menu" class="sub-menu">
                                       <li><a href="../community/Meeting.jsp"> Meeting </a></li>
									<li><a href="../community/list.jsp"> Review </a></li>
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
</header>
<!--/header-->
<script type="text/javascript">
    function logout(){
    	 var con = confirm("접속을 종료하시겠습니까?");
    	 if(con == true){
    		 history.go(-1);
    		 location.href="../main/IndexUS.jsp";
    	  	 //logout을 위해 세션을 제거하는 페이지 호출
    	 }else{}
   	}
</script>