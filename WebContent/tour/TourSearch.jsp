<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">
/* .search {width:1145px; margin-bottom:200px; margin-left:387px; background-color:#F2F2F2;}
.sub_select {width:1000px;}
.search li {float:left; margin-right:80px;}
#all_tour {margin-left:20px;}
form{margin-bottom:0; padding-bottom:0;} */
.search {
	width: 1145px;
	margin-bottom: 20px;
	background-color: #F2F2F2;
}

.sub_select {
	width: 1000px;
}

.search li {
	float: left;
	margin-right: 40px;
}

#all_tour {
	margin-left: 20px;
}

form {
	margin-bottom: 0;
	padding-bottom: 0;
}
</style>



</head>
<body>
<div align="center">
	<form action='TourSearchList.jsp' method='get'>
		<div class='search'>
			<table>
				<tr>
					<td><select class='area_select' name='area_select'
						id='area_select'>
							<option value='0'>지역선택</option>
							<option value='0'>전체</option>
							<option value='1'>강남구</option>
							<option value='2'>강동구</option>
							<option value='3'>강북구</option>
							<option value='4'>강서구</option>
							<option value='5'>관악구</option>
							<option value='6'>광진구</option>
							<option value='7'>구로구</option>
							<option value='8'>금천구</option>
							<option value='9'>노원구</option>
							<option value='10'>도봉구</option>
							<option value='11'>동대문구</option>
							<option value='12'>동작구</option>
							<option value='13'>마포구</option>
							<option value='14'>서대문구</option>
							<option value='15'>서초구</option>
							<option value='16'>성동구</option>
							<option value='17'>성북구</option>
							<option value='18'>송파구</option>
							<option value='19'>양천구</option>
							<option value='20'>영등포구</option>
							<option value='21'>용산구</option>
							<option value='22'>종로구</option>
							<option value='23'>중랑구</option>
					</select></td>
					<td class='sub_select'>
						<ul>
							<li><input type='checkbox' id='all_tour' value="0"
								name='tour' checked /> <label for='all_tour'> 전체 </label></li>
							<li><input type='checkbox' id='nature_tour' value='1'
								name='tour' /> <label for='nature_tour'> 자연 </label></li>
							<li><input type='checkbox' id='culture_tour' value='2'
								name='tour' /> <label for='culture_tour'> 문화시설 </label></li>
							<li><input type='checkbox' id='leports_tour' value='3'
								name='tour' /> <label for='leports_tour'> 레포츠 </label></li>
							<li><input type='checkbox' id='history_tour' value='4'
								name='tour' /> <label for='history_tour'> 역사 </label></li>
						</ul>
					</td>
					<td>
						<button type='submit' class='btn'>조회</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
</body>
</html>