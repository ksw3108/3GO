<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="review.model.*,review.service.*" %> 
<%@ page import="java.util.*" %>  
<%@ page import="org.apache.commons.fileupload.FileItem" %>   
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<%	
	request.setCharacterEncoding("EUC-KR");
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
	ReviewWriteService service = ReviewWriteService.getInstance();
	
	ReviewBean rec = new ReviewBean();
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
				
			}else if(name.equals("b_title")){
				String b_title = item.getString("euc-kr");
				rec.setB_title(b_title);
			}else if(name.equals("b_content")){
				String b_content = item.getString("euc-kr");
				rec.setB_content(b_content);
			}else if(name.equals("b_password")){
				String b_password = item.getString("euc-kr");
				rec.setB_password(b_password);
			}else if(name.equals("b_r_k_no")){
				String b_r_k_no = item.getString();
				rec.setB_r_k_no(Integer.parseInt(b_r_k_no));
			}
		}else{
			String name = item.getFieldName();
			if(name!=null){
				if(name.equals("b_file1")){
					String b_file1 = service.save("C:\\workspace\\JSP\\project\\WebContent\\jsp\\review\\uploadImage", item.getInputStream());
					rec.setB_file1(b_file1);
				}else if(name.equals("b_file2")){
					String b_file2 = service.save("C:\\workspace\\JSP\\project\\WebContent\\jsp\\review\\uploadImage", item.getInputStream());
					rec.setB_file2(b_file2);
				}else if(name.equals("b_file3")){
					String b_file3 = service.save("C:\\workspace\\JSP\\project\\WebContent\\jsp\\review\\uploadImage", item.getInputStream());
					rec.setB_file3(b_file3);
				}
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


	<a href="list.jsp">[��� ����]</a>
</body>
</html>