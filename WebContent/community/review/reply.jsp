<%@ page language="java" import="java.sql.*"%>
<%@ page import="review.model.*,review.service.*" %> 

<%	
	request.setCharacterEncoding("utf-8");

	String b_content = request.getParameter("b_content");
	String m_id=request.getParameter("m_id");
	String b_password = request.getParameter("b_password");	
	String parentId = request.getParameter("parentId");//부모게시물의 게시번호를 넘겨받기
	
	
	ReviewWriteService service = ReviewWriteService.getInstance();
	int m_no = service.findMemberNo(m_id);
	
	ReviewBean rec = new ReviewBean();
	rec.setB_content(b_content);
	rec.setB_password(b_password);
	rec.setM_no(m_no);
	rec.setB_r_k_no(2);
%> 

<%
	
	
	// Service에 reply() 호출하여 답변글 등록하기
	ReviewBean reRec = ReviewReplyService.getInstance().reply(parentId, rec);
	
%>    
