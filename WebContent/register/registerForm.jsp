<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">    
    <link rel="shortcut icon" href="../images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<jsp:include page="../main/mainheader.jsp" />

	
	<article class="container">
		<div class="col-md-12">
			<div class="page-header">
				<h1>
					회원가입
				</h1>
			</div>
			<form class="form-horizontal" method="post" action="register.jsp" name="frm">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">아이디</label>
					<div class="col-sm-6">
						<input class="form-control" id="m_id" name="m_id" type="text"
							placeholder="아이디">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="m_pass" name="m_pass" type="password"
							placeholder="비밀번호">
						<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="m_name" name="m_name" type="text"
							placeholder="이름">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="tel" class="form-control" id="m_phone" name="m_phone"
								placeholder="- 없이 입력해 주세요" size="100"/> 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputAdress">주소
						</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="m_addr" name="m_addr" type="text"
								placeholder="주소" size="100"/>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">이메일
						</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="m_email" name="m_email" type="email"
								placeholder="이메일" size="100"/>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputAgree">약관
						동의</label>
					<div class="col-sm-6" data-toggle="buttons">
						<label class="btn btn-warning active"> <input id="agree"
							type="checkbox" autocomplete="off" chacked> <span
							class="fa fa-check"></span>
						</label> <a href="#">이용약관</a> 에 동의 합니다.
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<a href="#" class="btn btn-join" onclick="javascript:formChk()">
							회원가입<i class="fa fa-check spaceLeft"></i></a>
					</div>
				</div>
			</form>
		</div>
	</article>
	
	<jsp:include page="../main/mainfooter.jsp" />
	

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../js/Form.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
	<script src="../js/jquery.scrollUp.min.js"></script>
	<script src="../js/price-range.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>
