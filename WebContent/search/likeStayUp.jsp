<%@page import="search.beans.searchDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="search.service.*" %>

<%
	int like = Integer.parseInt(request.getParameter("like"));
	int sno = Integer.parseInt(request.getParameter("sno"));

	searchDao dao = searchDao.getInstance();
	
	like = like + 1;

	dao.increaseSlikeCount(like, sno);
	
	out.print(like);
%>
