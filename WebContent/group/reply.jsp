<%@ page language="java" import="java.sql.*"%>
<%@ page import="meeting.model.*,meeting.service.*" %> 

<%	
	request.setCharacterEncoding("utf-8");

	String m_board_content = request.getParameter("m_board_content");
	String m_id=request.getParameter("m_id");
	String m_board_password = request.getParameter("m_board_pass");	
	String parentId = request.getParameter("parentId");//�θ�Խù��� �Խù�ȣ�� �Ѱܹޱ�
	
	MeetingWriteService service = MeetingWriteService.getInstance();
	int m_no = service.findMemberNo(m_id);
	
	MeetingBean rec = new MeetingBean();
	rec.setm_board_content(m_board_content);
	rec.setm_board_pass(m_board_password);
	rec.setM_no(m_no);
	rec.setB_r_k_no(2);
%> 

<%
	
	
	// Service�� reply() ȣ���Ͽ� �亯�� ����ϱ�
	MeetingBean reRec = MeetingReplyService.getInstance().reply(parentId, rec);
	
%>    
