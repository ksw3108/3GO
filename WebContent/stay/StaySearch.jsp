<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

   <style type="text/css">
  		.search {width:1145px; margin-bottom:200px; margin-left:387px; background-color:#F2F2F2;}
    	.sub_select {width:1000px;}
    	.search li {float:left; margin-right:80px;}
    	#all_stay {margin-left:20px;}
    	form{margin-bottom:0; padding-bottom:0;}
    
    </style>
    


</head>
<body>

<form action='StaySearchList.jsp' method='get'>
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
					<li> <input type='checkbox' id='all_stay' value="0" name='stay' checked/> <label for='all_stay'>  ��ü </label> </li>
					<li> <input type='checkbox' id='hotel_stay' value='1' name='stay'/> <label for='hotel_stay'>  ȣ�� </label> </li>
					<li> <input type='checkbox' id='motel_stay' value='2'name='stay'/> <label for='motel_stay'> ���� </label>  </li>
					<li> <input type='checkbox' id='minback_stay' value='3'name='stay'/> <label for='minback_stay'> �ι� </label> </li>
					<li> <input type='checkbox' id='guest_stay' value='4'name='stay'/> <label for='guest_stay'> �Խ�Ʈ�Ͽ콺 </label> </li>	
				</ul>	
			</td>
			<td>
				<button type='submit' class='btn' >��ȸ</button>
			</td>
		</tr>
	</table>
	 </div>
	
	 </form>
	 

</body>
</html>