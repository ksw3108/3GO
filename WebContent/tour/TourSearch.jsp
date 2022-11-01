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
							<option value='0'>��������</option>
							<option value='0'>��ü</option>
							<option value='1'>������</option>
							<option value='2'>������</option>
							<option value='3'>���ϱ�</option>
							<option value='4'>������</option>
							<option value='5'>���Ǳ�</option>
							<option value='6'>������</option>
							<option value='7'>���α�</option>
							<option value='8'>��õ��</option>
							<option value='9'>�����</option>
							<option value='10'>������</option>
							<option value='11'>���빮��</option>
							<option value='12'>���۱�</option>
							<option value='13'>������</option>
							<option value='14'>���빮��</option>
							<option value='15'>���ʱ�</option>
							<option value='16'>������</option>
							<option value='17'>���ϱ�</option>
							<option value='18'>���ı�</option>
							<option value='19'>��õ��</option>
							<option value='20'>��������</option>
							<option value='21'>��걸</option>
							<option value='22'>���α�</option>
							<option value='23'>�߶���</option>
					</select></td>
					<td class='sub_select'>
						<ul>
							<li><input type='checkbox' id='all_tour' value="0"
								name='tour' checked /> <label for='all_tour'> ��ü </label></li>
							<li><input type='checkbox' id='nature_tour' value='1'
								name='tour' /> <label for='nature_tour'> �ڿ� </label></li>
							<li><input type='checkbox' id='culture_tour' value='2'
								name='tour' /> <label for='culture_tour'> ��ȭ�ü� </label></li>
							<li><input type='checkbox' id='leports_tour' value='3'
								name='tour' /> <label for='leports_tour'> ������ </label></li>
							<li><input type='checkbox' id='history_tour' value='4'
								name='tour' /> <label for='history_tour'> ���� </label></li>
						</ul>
					</td>
					<td>
						<button type='submit' class='btn'>��ȸ</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
</body>
</html>