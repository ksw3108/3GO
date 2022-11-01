<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.List" %>
    <%@ page import="threego.beans.*, threego.service.*" %>
    <%
	request.setCharacterEncoding("EUC-KR");

	int num = Integer.parseInt(request.getParameter("stay_no"));
	
	SearchService service = SearchService.getInstance();
	
	//System.out.println(num);
%>
<%
	List <StayRec> sList = service.getSearchStay(num);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%= sList.get(0).getS_name() %></title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="../css/search.css" rel="stylesheet">
<link href="../css/rank.css" rel="stylesheet">
<style type="text/css">
	.viewType2 .cnt_head {
		width : 1100px;
	}
	
	.cnt_head {
		position : relative;
		width : 900px;
		margin : 0 auto;
	}
	
	.cnt_head.where h3 {
		margin-bottom : 15px;
		padding : 0 0 0 40px;
		background : none;
		text-align : left;
	}
	
	.cnt_head h3 {
		margin : 40px 0 25px;
		color : #000;
		font-size : 29px;
	}
	
	.cnt_head.where ul {
		position : absolute;
		top : 10px;
		right : 0;
		width : auto;
		margin-bottom : 0;
	}
	
	.cnt_head ul {
		text-align : center;
	}
	
	.cnt_head ul li.look {
		background-position : -19px -74px;
	}
	
	.cnt_head ul li:first-child {
		margin-left : 0;
	}
	
	.cnt_head ul li {
		display : inline-block;
		padding-left : 20px;
		font-size : 15px;
		color : #666;
		background : url(http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel/trv_list/cnt_ico.png) no-repeat -17px -9px;
	}
	
	.cnt_head ul li.likebutton {
		/* padding-left : 0; */
		padding-right : 25px;
		background : transparent;
	}
	
	.likebutton button {
		display : inline-block;
		height : 27px;
		padding : 0 10px 0 30px;
		vertical-align : middle;
		text-align : center;
		border-radius : 3px;
		border : 1px solid #b7b7b7;
		background : #fff
				url(http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel/trv_list/view/fuct_ico.png) 
				no-repeat 12px -196px;
		color : #d50811;
	}
</style>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="../js/jquery.reslider.js"></script>
<script>
            $(function(){
                $('.jquery-reslider').reSlider({
                    speed:1000,  //페이드속도
                    delay:5000,  //자동전환 속도
                    imgCount:4,  //이미지갯수
                    dots:true,   //하단 페이지 버튼
                    autoPlay:false//자동재생
                })
            })
</script>
</head>
<body>

<div class="viewType2">
<div class="doc">
	<div class="cnt_head where">
		<h3 id="content_title"><%= sList.get(0).getS_name() %></h3>
		<ul>
			<li class="look">조회 : <%= sList.get(0).getS_rank() %></li>
			<li class="likebutton"><button onclick="increaseCMSLikeCount('2384239'); return false;" id="likebtn" class="go-button" type="button">0</button></li>
		</ul>
	</div>

	<div class="thumbWrap">
		<figure>
			<div class="grap">
				<div class="obj" align="center">
					<img src=".<%= sList.get(0).getImage() %>" alt="" class="item" style="display: none; height: 100%;">
					<img src=".<%= sList.get(0).getImage() %>" alt="" class="item" style="display: none; height: 100%;">
					<img src=".<%= sList.get(0).getImage() %>" alt="" class="item" style="display: block; height: 100%;">
					<img src=".<%= sList.get(0).getImage() %>" alt="" class="item" style="display: none; height: 100%;">
					<img src=".<%= sList.get(0).getImage() %>" alt="" class="item" style="display: none; height: 100%;">
				</div>

				<!-- <div class="control">
					<button rel="prev" type="button" class="go-button go-ir">이전</button>
					<button rel="stop" type="button" class="go-button go-ir">멈춤</button>
					<button rel="play" type="button" class="go-button go-ir" style="display: none;">시작</button>
					<button rel="next" type="button" class="go-button go-ir">다음</button>
				</div> -->
				<div class="slider">
					<div class="jquery-reslider">
						<div class="slider-direction slider-direction-next"></div>
	                    <div class="slider-direction slider-direction-prev"></div>
	
	                    <div class="slider-dots">
	                      <ul>
	
	                      </ul>
	                    </div>
					</div>
				</div>
			</div>

			<figcaption>
				<ul>
					<li>
						<b>위치</b> 
						<span><%= sList.get(0).getS_addr() %></span>
					</li>
					<li>
						<b>문의/안내</b>
						<span><%= sList.get(0).getS_tel() %></span>
					</li>
				</ul>
			</figcaption>

			<div class="buttonSet">
				<a href="#con_sect4" class="tourInfo">주변관광정보</a>
				<a class="siteLink" href="<%= sList.get(0).getSite_addr() %>" target="_blank" title="새창으로 열림">지자체 홈페이지 바로가기</a>
				<a href="#searchLoad" onclick="fncSearchLoad(); return false;" target="_blank" class="viewMap">찾아오시는길</a>
			</div>
		</figure>
	</div>
</div>
</div>


</body>
</html>