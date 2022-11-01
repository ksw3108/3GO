<%@page import="search.beans.searchDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="search.service.*" %>

<%
	int like = Integer.parseInt(request.getParameter("like"));
	int fno = Integer.parseInt(request.getParameter("fno"));

	searchDao dao = searchDao.getInstance();

	like = like + 1;
	
	System.out.println(like);
	System.out.println(fno);
	dao.increaseFlikeCount(like, fno);
	
	out.print(like);
%>
