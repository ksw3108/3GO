<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import="java.util.List" %>
    <%@ page import="threego.beans.*, threego.service.*" %>
    
    <%
    
	request.setCharacterEncoding("EUC-KR");
	
	SearchService service = SearchService.getInstance();
    String area_select = "0";
    String[] stay = {"0"};
    	
    
     List <StayRec> mList = service.getArticleList_Stay(area_select, stay);

     int count=-1;
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Stay Information | Map's</title>
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
<style type="text/css">

	.search_view {margin-left:390px; margin-top:-180px;}
	.table_striping {
	background-color : #dddddd;
	color : #666666
}	
.text {font-family:"Algerian";}
.search_view #text_box {width:225px;}

</style>

<script type="text/javascript">
function onOver(elem){
	elem.style.backgroundColor='#F5A9A9';
	/* document.getElementById('culum').style.backgroundColor = "#ffffff"; */
}
function onOut(elem){
	elem.style.backgroundColor='#ffffff';
	/* document.getElementById('culum').style.backgroundColor = "#000000"; */
}


</script>


</head>
<body>
<jsp:include page="../main/mainheader.jsp"/>
<jsp:include page="StaySearch.jsp"/>

<!-- *********************************************************** -->
<div style="height:620px;">
<table class='search_view'>
<% if( mList == null ) { %>
      <tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
      <tr>
   <% } else { %>

	
      <%  for(int i=0; i<mList.size(); i++) {%>
       		<%  count++;%>
       				<%if (count!=5){ %>
       				
					<td id='text_box' align='center' >
					<a href="StayInfoFile.jsp?stay_no=<%=mList.get(i).getS_no()%>">
					<table class='search_view_two' align='center' onmouseover="javascript:onOver(this);" onmouseout="javascript:onOut(this);">
					<tr>
					<td> <img alt="" src="<%=mList.get(i).getImage() %>" width="180px" height="120px"/> </td>
					</tr>
					<tr>
					<td width=" class='text'180px" > <br/>
						<%= mList.get(i).getBoard_kind()%>  <br/>
						<%= mList.get(i).getS_name()%>
					</td>
					</tr>
					</table>
					</a>
			         </td>
			         <%} else if(count==5){ 
			        	 count =0;%>

         			</tr>
         			<tr>
         			<td id='text_box' align='center'>
         			<a href="StayInfoFile.jsp?Stay_no=<%=mList.get(i).getS_no()%>">
         			<table class='search_view_two' align='center' onmouseover="javascript:onOver(this);" onmouseout="javascript:onOut(this);">
					<tr>
					<td><img alt="" src="<%=mList.get(i).getImage() %>" width="180px" height="120px"/> </td>
					</tr>
					<tr>
					<td width="180px" class='text'> <br/>
						<%= mList.get(i).getBoard_kind()%>  <br/>
						<%= mList.get(i).getS_name()%>
					</td>
					</tr>
					</table>
					</a>
			         </td>
			         
         
         <% } %>
         
        <% } %>
	

<% } // end else %>

</table>
</div>
<!-- ************************************************* -->

<jsp:include page="../main/mainfooter.jsp"/>

</body>
</html>