<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="review.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	//String b_r_k_no = request.getParameter("b_r_k_no");
	//String m_id = request.getParameter("m_id");
	//String b_r_k_no="1";

	String m_no = "1"; //request.getParameter("m_no");//세션으로 회원번호를 받아온다

	ReviewListService service = ReviewListService.getInstance();
	String id = service.getReviewId(Integer.parseInt(m_no));
%>

<link href="./bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	function saveBoard() {
		//window.open("BoardSave.jsp");
		var frmObj = document.frm;
		frmObj.submit();
	}
	
</script>
</head>
<body>

	<form action="insert.jsp" name='frm' enctype="multipart/form-data"
		method='post' align="center">
		<h3>게시판 글 쓰기</h3>
		<input type="hidden" name="b_r_k_no" value="1" />
		<table width="1000" align="center">
			<tr>
				<td width="15%"></td>
				<td width="70%">
					<table class="table table-condensed">
						<tr>
							<td></td>
							<th >작성자</th>
							<td align="left"><input type='text' name="m_id"
								value="<%=id%>" class="form-control col-lg-2" data-rule-required="true"  colspan="2" /></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<th>구분</th>
							<td align="left"  colspan="2"><select name="kind" id="kind" >
									<option value="1">여행지</option>
									<option value="2">숙박지</option>
									<option value="3">맛집</option>
							</select></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<th>사진올리기</th>
							<td align="left">
								<p>*사진은 최대 3개까지 업로드 가능합니다.</p>
								<p><input type="file" name="b_file1" accept="image/*" /></p>
								<p><input id="2" type="file" name="b_file2" accept="image/*" /></p>
								<p><input id="3" type="file" name="b_file3" accept="image/*" /></p>
							</td>
							<td></td>
						</tr>						
						<tr>
							<td></td>
							<th>제 목</th>
							<td align="left"><input type='text' name="b_title" class="form-control col-lg-2" data-rule-required="true"></td>
							<td colspan="2"></td>						
						</tr>
						<tr>
							<td></td>
							<th>내 용</th>
							<td align="left"><textarea name="b_content" rows='10'
									cols='40' class="form-control col-lg-2" data-rule-required="true"></textarea></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
								<th>패스워드<br />(수정/삭제시 필요)
							</th>
							<td align="left"><input type='password'  name="b_password" class="form-control col-lg-2" data-rule-required="true" ></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2" align="center"><input type='button'
								value='작성' class="btn btn-default"
								onclick="javascript:saveBoard()" /> <input type='reset'
								class="btn btn-default" value='취소' /></td>
							<td colspan="2"></td>
						</tr>
					</table>
				</td>
				<td></td>
			</tr>
		</table>

	</form>
</body>
</html>