<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${ param.location eq 1 }">${'강남'}</c:when>
	<c:when test="${ param.location eq 2 }">${'강동'}</c:when>
	<c:when test="${ param.location eq 3 }">${'강북'}</c:when>
	<c:when test="${ param.location eq 4 }">${'강서'}</c:when>
	<c:when test="${ param.location eq 5 }">${'관악'}</c:when>
	<c:when test="${ param.location eq 6 }">${'광진'}</c:when>
	<c:when test="${ param.location eq 7 }">${'구로'}</c:when>
	<c:when test="${ param.location eq 8 }">${'금천'}</c:when>
	<c:when test="${ param.location eq 9 }">${'노원'}</c:when>
	<c:when test="${ param.location eq 10 }">${'도봉'}</c:when>
	<c:when test="${ param.location eq 11 }">${'동대문'}</c:when>
	<c:when test="${ param.location eq 12 }">${'동작'}</c:when>
	<c:when test="${ param.location eq 13 }">${'마포'}</c:when>
	<c:when test="${ param.location eq 14 }">${'서대문'}</c:when>
	<c:when test="${ param.location eq 15 }">${'서초'}</c:when>
	<c:when test="${ param.location eq 16 }">${'성동'}</c:when>
	<c:when test="${ param.location eq 17 }">${'성북'}</c:when>
	<c:when test="${ param.location eq 18 }">${'송파'}</c:when>
	<c:when test="${ param.location eq 19 }">${'양천'}</c:when>
	<c:when test="${ param.location eq 20 }">${'영등포'}</c:when>
	<c:when test="${ param.location eq 21 }">${'용산'}</c:when>
	<c:when test="${ param.location eq 22 }">${'은평'}</c:when>
	<c:when test="${ param.location eq 23 }">${'종로'}</c:when>
	<c:when test="${ param.location eq 24 }">${'중구'}</c:when>
	<c:when test="${ param.location eq 25 }">${'중랑'}</c:when>
</c:choose>