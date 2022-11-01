<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="meeting.model.*,meeting.service.*" %> 
<%@ page import="java.util.*" %>  
<%@ page import="org.apache.commons.fileupload.FileItem" %>   
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<%	
	request.setCharacterEncoding("EUC-KR");
	System.out.println("aaa123456");
	//���� ȭ���� Form�� enctype�� multipart/form-data ���� Ȯ��
	boolean isMutipart = ServletFileUpload.isMultipartContent( request );
	if( !isMutipart ){	return;	}
	
	// FileItem�� Factory�� ���� - ������ �Ѱܹ����� FileItem���� �����Ǵµ� �װ��� �����ϴ� Ŭ���� 
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	// ���ε��û�� ó���ϴ� ServletFileUpload Ŭ���� ����
	ServletFileUpload upload = new ServletFileUpload( factory );
	
	// ���� ȭ�鿡�� ����Ÿ�� �Ѱܹ޴� request ��ü�� �Ľ��Ͽ� ����Ÿ�� FileItem Ŭ������ List�� �Ѱܹ���
	List <FileItem> items = upload.parseRequest( request );
	
	// List�� ����ִ� ������� �ϳ��� �������� Iterator�� ��ȯ
	Iterator <FileItem> iters = items.iterator();	
	
	
%>

<%
	MeetingWriteService service = MeetingWriteService.getInstance();
	
	MeetingBean rec = new MeetingBean();
	String kind=null;
	while(iters.hasNext()){
		FileItem item = iters.next();
		
		if(item.isFormField()){//�Է��׸��̸�
			String name = item.getFieldName();
			if(name.equals("m_id")){
				String m_id = item.getString();
				int m_no = service.findMemberNo(m_id);
				rec.setM_no(m_no);
			}else if(name.equals("kind")){
				kind= item.getString();
			}else if(name.equals("m_board_title")){
				String m_board_title = item.getString("euc-kr");
				rec.setm_board_title(m_board_title);
			}else if(name.equals("m_board_content")){
				String m_board_content = item.getString("euc-kr");
				rec.setm_board_content(m_board_content);
			}else if(name.equals("m_board_pass")){
				String m_board_pass = item.getString("euc-kr");
				rec.setm_board_pass(m_board_pass);
			}else if(name.equals("b_r_k_no")){
				String b_r_k_no = item.getString();
				rec.setB_r_k_no(Integer.parseInt(b_r_k_no));
			}
		}	
	}	
	service.write(rec, kind);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Է�</title>
</head>
<body>
�ԷµǾ����ϴ�.<br/>


	<a href="../community/Meeting.jsp">[��� ����]</a>
</body>
</html>