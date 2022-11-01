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
	//앞의 화면의 Form의 enctype이 multipart/form-data 인지 확인
	boolean isMutipart = ServletFileUpload.isMultipartContent( request );
	if( !isMutipart ){	return;	}
	
	// FileItem의 Factory를 설정 - 파일을 넘겨받으면 FileItem으로 지정되는데 그것을 관리하는 클래스 
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	// 업로드요청을 처리하는 ServletFileUpload 클래스 생성
	ServletFileUpload upload = new ServletFileUpload( factory );
	
	// 이전 화면에서 데이타를 넘겨받는 request 객체를 파싱하여 데이타를 FileItem 클래스의 List로 넘겨받음
	List <FileItem> items = upload.parseRequest( request );
	
	// List에 들어있는 내용들을 하나씩 얻어오고자 Iterator로 변환
	Iterator <FileItem> iters = items.iterator();	
	
	
%>

<%
	MeetingWriteService service = MeetingWriteService.getInstance();
	
	MeetingBean rec = new MeetingBean();
	String kind=null;
	while(iters.hasNext()){
		FileItem item = iters.next();
		
		if(item.isFormField()){//입력항목이면
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
<title>리뷰 입력</title>
</head>
<body>
입력되었습니다.<br/>


	<a href="../community/Meeting.jsp">[목록 보기]</a>
</body>
</html>