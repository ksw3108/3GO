<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="member.beans.*" %>
<%@ page import="member.service.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	RegisterService service = RegisterService.getInstance();
	List<Register> rList = service.selectInfo(id);
	if(rList.size()==0){
		System.out.println("로그인 실패!");
%>
<script type="text/javascript">
	alert("로그인 실패!");
	history.go(-1);
</script>

<%
	} else if((id.equals(rList.get(0).getM_id())) && (pw.equals(rList.get(0).getM_pass()))) {
			
		System.out.println(rList.get(0).getM_id()+"님이 로그인");
		
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		response.sendRedirect("loginMain.jsp");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>똥</title>
</head>
<body>
	<%=rList.get(0).getM_id()%>님, 로그인 성공!
</body>
</html>
<%} else{ System.out.println("로그인 실패!");%>
<script type="text/javascript">
	alert("로그인 실패!");
	history.go(-1);
</script>
<%
	}
%>