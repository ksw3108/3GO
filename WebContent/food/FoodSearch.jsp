<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.search {
	width:1145px; 
	margin-bottom:20px; 
	background-color:#F2F2F2;
}
.sub_select {
	width:1000px;
}
.search li {
	float:left; 
	margin-right:40px;
}
#all_food {
	margin-left:20px;
}
form { 
	margin-bottom:0;
	padding-bottom:0;
}
</style>
</head>
<body>
<div align="center">
	<form action='FoodSearchList.jsp' method='get'>
		<div class='search'>
			<table>
				<tr>
					<td> 
						<select class='area_select' name='area_select' id='area_select'>
							<option value='0'> �������� </option>
							<option value='0'> ��ü </option>
							<option value='1'> ������ </option>
							<option value='2'> ������ </option>
							<option value='3'> ���ϱ� </option>
							<option value='4'> ������ </option>
							<option value='5'> ���Ǳ� </option>
							<option value='6'> ������ </option>
							<option value='7'> ���α� </option>
							<option value='8'> ��õ�� </option>
							<option value='9'> ����� </option>
							<option value='10'> ������ </option>
							<option value='11'> ���빮�� </option>
							<option value='12'> ���۱� </option>
							<option value='13'> ������ </option>
							<option value='14'> ���빮�� </option>
							<option value='15'> ���ʱ� </option>
							<option value='16'> ������ </option>
							<option value='17'> ���ϱ� </option>
							<option value='18'> ���ı� </option>
							<option value='19'> ��õ�� </option>
							<option value='20'> �������� </option>
							<option value='21'> ��걸 </option>
							<option value='22'> ���α� </option>
							<option value='23'> �߶��� </option>
						</select>
					</td>
					<td class='sub_select'>
						<ul>
							<li><input type='checkbox' id='all_food' value="0" name='food' checked/><label for='all_food'>  ��ü </label></li>
							<li><input type='checkbox' id='korea_food' value='1' name='food'/><label for='korea_food'>  �ѽ� </label></li>
							<li><input type='checkbox' id='china_food' value='2'name='food'/><label for='china_food'> �߽� </label> </li>
							<li><input type='checkbox' id='japan_food' value='3'name='food'/><label for='japan_food'> �Ͻ� </label></li>
							<li><input type='checkbox' id='meet_food' value='4'name='food'/><label for='meet_food'> ��� </label></li>
							<li><input type='checkbox' id='flour_food' value='5'name='food'/><label for='flour_food'> �н� </label></li>
							<li><input type='checkbox' id='vegetable_food' value='6'name='food'/><label for='vegetable_food'> ä�� </label></li>
							<li><input type='checkbox' id='meat_food' value='7'name='food'/><label for='meat_food'> ���� </label></li>
							<li><input type='checkbox' id='caffee' value='8'name='food'/><label for='caffee'> ī��/�������� </label></li>
							<li><input type='checkbox' id='restaurant' value='9'name='food'/><label for='restaurant'> ������� </label></li>
						</ul>	
					</td>
					<td>
						<button type='submit' class='btn' >��ȸ</button>
					</td>
				</tr>
			</table>
		 </div>
	</form>
</div>
</body>
</html>