<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="review.model.*,review.service.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="euc-kr">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <%
			String userid = null;
			if(session.getAttribute("id") != "") {
				userid = (String)session.getAttribute("id");
			} else {
				session.invalidate();
				//response.sendRedirect("../main/.jsp");
			}	
		%>
        <%
	        String m_no = "1";//�������� �Ѱܹ��� ȸ����ȣ
	    	String b_no = request.getParameter("b_no");
	    	String group_no=request.getParameter("group_no");
	    	
	    	boolean isModify = false;
	    	// 2. Service�� getArticleById() ȣ���Ͽ� �� �Խñ۹�ȣ�� ���� ���ڵ带 �˻��Ѵ�.
	    	ReviewViewService service = ReviewViewService.getInstance();
	    	ReviewBean review = service.getReviewById(b_no, isModify);
	    	ReviewListService lService = ReviewListService.getInstance();
	    	ReviewWriteService wService = ReviewWriteService.getInstance();	
	    	
	    	List<ReviewBean> reply = ReviewListService.getInstance().getReplyList(group_no);

	    	String writer = lService.getReviewId(review.getM_no());
	    	String loginId = lService.getReviewId(Integer.parseInt(m_no));
	    	
	    	System.out.println(review.getB_file1());
        %>
        <style type="text/css">
        	.img{
        		display:block;
        		margin-left:auto;
        		margin-right:auto;	
        	}
        
        </style>
        <!-- Bootstrap -->
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
	        
        <link href="review/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ���) -->        
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        
    </head>
    
    <body>
    <%if(userid!=null) {%>
		<jsp:include page="../main/mainheaderlogin.jsp"/>
	<%}else{ %>
		<jsp:include page="../main/mainheader.jsp"/>
	<%} %>
        <!-- �¿����� ���� Ȯ�� -->
        <form action="#" name = "frm"><input type="hidden" name="bno" value="<%=review.getB_no() %>" /></form>
      	<input type="hidden" name="userId" id="userId" value="<%=lService.getReviewId(Integer.parseInt(m_no)) %>" />
        <div class="container" >
         
            <hr/>
            <div class="row">
                <div class="col-md-10">
                <div>
                    <table class="table table-condensed" >
                        <thead>
                            <tr align="center">
                                <th width="10%">����</th>
                                <th width="60%"><%= review.getB_title() %></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>�ۼ���
                                </td>
                                <td>
                                <%= review.getB_date() %>
                                </td>
                            </tr>
                            <tr>
                                <td>�۾���
                                </td>
                                <td>
                                <%= writer %> <span style='float:right'>��ȸ : <%= review.getB_count() %></span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p>
                                    	<%= review.getB_content()%><br />
                                    	<%
                                    	if(review.getB_file1()!=null){
                                    		//System.out.println(review.getB_file1());
                                    	%>
                                    		<img class="img" src="<%=review.getB_file1() %>" alt="img1" /><br />
                                    	<%}
                                    	if(review.getB_file2()!=null){%>
                                    		<img class="img" src="<%=review.getB_file2() %>" alt="img2" /><br />
                                    	<%}
										if(review.getB_file3()!=null){%>
                                    		<img class="img" src="<%=review.getB_file3() %>" alt="img3" /><br />
                                    	<%}%>
                                    </p>
                        		
                                </td>
                                
                            </tr>
                        </tbody>
                    </table>
                    
                    </div>
                    
                    
                    <table class="table table-condensed">
                    
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                        	<input type="hidden" name = "b_no" id ="b_no" value="<%= b_no %>" />
                                        	<input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" value="<%=userid %>" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="�н�����" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">Ȯ��</button>
                                        </div>
                                    </p>
                                        <textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <table id="commentTable" class="table table-condensed"></table>
                    
                    <% if( reply == null ) { %>
						��ϵ� ����� �����ϴ�.
					<% }else{						
						for(int i=0; i<reply.size(); i++){
							String id = ReviewListService.getInstance().getReviewId(reply.get(i).getM_no());						
						%>
					<div>
					
							<table id='commentTable' class='<%= reply.get(i).getB_no() %>'>
								<% if(reply.get(i).getLevel()==1){ %>
									<tr id="r1" name="commentParentCode">
		                                <td colspan=2>
		                                <input type="hidden" value="<%= reply.get(i).getB_no() %>"   />
										<strong><%=lService.getReviewId(reply.get(i).getM_no()) %></strong>
										<a style="cursor:pointer;" name="pAdd">���</a> | <a style="cursor:pointer;" name="pDel">����</a>
										<p><%=reply.get(i).getB_content() %></p>
		                                </td>
		                            </tr>   
	                            	<%}
									else{
									%>
									<%for(int j=i; j<reply.size(); j++){ 
										if(reply.get(j).getLevel()>1){
									%>							
											<tr name="commentChildCode">
												<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>
												<td style="width:99%">
												<strong><%=lService.getReviewId(reply.get(j).getM_no()) %></strong>
												<a style="cursor:pointer;" name="cAdd">���</a> | <a style="cursor:pointer;" name="cDel">����</a>
												<p><%=reply.get(j).getB_content() %></p>
												</td>
											</tr>										
									<%		
										}										
										break;
									}
								} %>
							</table>
							</div>
							<hr/>
					<%
						}
					}
					%>							

                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <button type="button" id="list" class="btn btn-default">���</button>
                                        <button type="button" id="modify" class="btn btn-default">����</button>
                                        <button type="button" id="delete" class="btn btn-default">����</button>
                                        <button type="button" id="write" class="btn btn-default">�۾���</button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                    
                    <script>
                    
                    	function sendReply(pName, pPassword, pText, parentId){
                    		
                    		$.ajax({
                    			url:"review/reply.jsp",
                    			type:"get",
                    			data:{
                    				'm_id':pName.toString(),
                    				'b_password':pPassword.toString(),
                    				'b_content':pText.toString(),
                    				'parentId':parentId.toString()
                    			},
                    			dataType:'text',
                    			contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
                    			success:function(data){
                    				alert("��۴ޱ� ����!");
                    			},complite:function(){
                    				alert("complite");
                    			},
                    			error:function(e){
                    				alert(e.responseText);                    				
                    			}
                    		});
                    	}
                    	
                        $(function(){
                               
                            //���� �ϴܿ� �ִ� depth1�� ����� �ٴ� �̺�Ʈ
                            $("#commentParentSubmit").click(function( event ) {
                                   
                                //ajax�� �����ϰ� �����ϸ� ������ �����͸� ������ �־�� �ϴµ� ���⼭�� �׽�Ʈ�� �׳� �Է°��� ������
                                var pName = $("#commentParentName");
                                var pPassword = $("#commentParentPassword");//�н����带 ���� ���״µ� �����ϰ� ���� ������ ��¥�� ������ ����
                                var pText = $("#commentParentText");
                                var parentId = $("#b_no");
                                   
                                if($.trim(pName.val())==""){
                                    alert("�̸��� �Է��ϼ���.");
                                    pName.focus();
                                    return;
                                }else if($.trim(pPassword.val())==""){
                                    alert("�н����带 �Է��ϼ���.");
                                    pPassword.focus();
                                    return;
                                }else if($.trim(pText.val())==""){
                                    alert("������ �Է��ϼ���.");
                                    pText.focus();
                                    return;
                                }
                                   
                                var commentParentText = '<tr id="r1" name="commentParentCode">'+
                                                            '<td colspan=2>'+
                                                                '<strong>'+pName.val()+'</strong> '+pPassword.val()+' <a style="cursor:pointer;" name="pAdd">���</a> | <a style="cursor:pointer;" name="pDel">����</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>';
                                   
                                //���̺��� tr�ڽ��� ������ tr �ڿ� ���δ�. ������ ���̺� �ȿ� tr�� ���δ�.
                                if($('#commentTable').contents().size()==0){
                                    $('#commentTable').append(commentParentText);
                                }else{
                                    $('#commentTable tr:last').after(commentParentText);
                                }
								                                                              
                                sendReply( pName.val(), pPassword.val(), pText.val(), parentId.val() );
                                   
                                $("#commentParentName").val("");
                                $("#commentParentPassword").val("");
                                $("#commentParentText").val("");
                                   
                            });
                               
                            //����� ����� �ٴ� �̺�Ʈ
                            $(document).on("click","#commentChildSubmit", function(){
                                   
                                var cName = $("#commentChildName");
                                var cPassword = $("#commentChildPassword");
                                var cText = $("#commentChildText");
                                var parentId=$(this).parent().parent().parent().parent().parent().parent().attr('class');
                               
                                
                               
                                if($.trim(cName.val())==""){
                                    alert("�̸��� �Է��ϼ���.");
                                    cName.focus();
                                    return;
                                }else if($.trim(cPassword.val())==""){
                                    alert("�н����带 �Է��ϼ���.");
                                    cPassword.focus();
                                    return;
                                }else if($.trim(cText.val())==""){
                                    alert("������ �Է��ϼ���.");
                                    cText.focus();
                                    return;
                                }
                                
                                sendReply( cName.val(), cPassword.val(), cText.val(), parentId);
                                <!-- -->
                                var commentChildText = '<tr name="commentChildCode">'+
                                                            '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                                            '<td style="width:99%">'+
                                                                '<strong>'+cName.val()+'</strong> '+cPassword.val()+' <a style="cursor:pointer;" name="cAdd">���</a> | <a style="cursor:pointer;" name="cDel">����</a>'+
                                                                '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>';
                                
                                
                                //���� tr��� ã��
                                var prevTr = $(this).parent().parent().parent().parent().prev();
                                
                                //��� ���� ������ ����
                                $("#commentEditor").remove();//���⿡�� ������ ����� ������tr�� �� ã�´�.
                                   
                                //����� Ÿ�� �ö󰡸� �θ� tr�� ã��
                                while(prevTr.attr("name")!="commentParentCode"){
                                    prevTr = prevTr.prev();
                                }
                                //while�� Ÿ���� üũ
                                var check = false;
                                //���� ��尡 ���(depth1)�� ������� ã������ next
                                var nextTr = prevTr.next();
                                //�ڿ� ���(depth1)�� ���(depth2_1)�� ���ٸ� �ٷ� ���δ�.
                                if(nextTr.attr("name")!="commentChildCode"){
                                    prevTr.after(commentChildText);
                                }else{
                                    //���(depth1)�� ���(depth2_n)�� �ִ°�� ���������� ã�´�.
                                    while(nextTr.attr("name")=="commentChildCode"){
                                        nextTr = nextTr.next();
                                        check = true;
                                    }
                                }
                                
                                if(check){//���(depth1)�� ���(depth2_n)�� �ִٸ� �� ���(depth2_n) �ڿ� ���(depth2_n+1) �߰�
                                    nextTr = nextTr.prev();//while������ �˻��ϴ��� next�� �ѰŰ����� �ٽ� ������ ������
                                    nextTr.after(commentChildText);
                                }
                              
                               
                                   
                            });
                               
                            //��۸�ũ�� �������� ������ â�� �ѷ��ִ� �̺�Ʈ, ������ũ�� �������� �ش� ����� �����ϴ� �̺�Ʈ
                            $(document).on("click","table#commentTable a", function(){//�������� ��ư�� ���� ��� ó�� ���
                                   
                                if($(this).attr("name")=="pDel"){
                                    if (confirm("����� ���� �Ͻø� �ؿ� ��۵� ��� ���� �˴ϴ�. ���� �����Ͻðڽ��ϱ�?") == true){    //Ȯ��
                                           
                                        var delComment = $(this).parent().parent();
                                        var nextTr = delComment.next();
                                        var delTr;
                                        //���(depth1)�� ���(depth2_1)�� �ִ��� �˻��Ͽ� ����
                                        while(nextTr.attr("name")=="commentCode"){
                                            nextTr = nextTr.next();
                                            delTr = nextTr.prev();//�����ϰ� �ѱ�� �����Ǽ� ���� ������ �������� �������� ����� �ٽ� ������ ������ ã�� ���� ����
                                            delTr.remove();
                                        }
                                           
                                        delComment.remove();
                                           
                                    }else{   //���
                                        return;
                                    }
                                }else if($(this).attr("name")=="cDel"){
                                    if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��
                                        $(this).parent().parent().remove();
                                    }else{   //���
                                        return;
                                    }
                                }else{
                                    //�ڱ� �θ��� tr�� �˾Ƴ���.
                                    var parentElement = $(this).parent().parent();
                                    //��۴ޱ� â�� ���ش�.
                                    $("#commentEditor").remove();
                                    //�θ��� �ϴܿ� ��۴ޱ� â�� ����
                                    var commentEditor = '<tr id="commentEditor">'+
                                                            '<td style="width:1%"> </td>'+
                                                            '<td>'+
                                                                '<span class="form-inline" role="form">'+
                                                                    '<p>'+
                                                                        '<div class="form-group">'+
                                                                            '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" value="'+$("#userId").val()+'" maxlength="10">'+
                                                                        '</div>'+
                                                                        '<div class="form-group">'+
                                                                            ' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="�н�����" maxlength="10">'+
                                                                        '</div>'+
                                                                        '<div class="form-group">'+
                                                                            '<button type="button" id="commentChildSubmit" class="btn btn-default">Ȯ��</button>'+
                                                                        '</div>'+
                                                                    '</p>'+
                                                                        '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'+
                                                                '</span>'+
                                                            '</td>'+
                                                        '</tr>';
                                                           
                                    parentElement.after(commentEditor); 
                                }
                                   
                            });
                               
                            $( "#list" ).click(function( event ) {
                                location.href='list.jsp';
                            });
                            $( "#modify" ).click(function( event ) {
                            	var b_no=document.frm.bno.value;
                                location.href='modifyForm.jsp?b_no='+b_no;
                                
                            });
                            $( "#delete" ).click(function( event ) {
                                var b_no=document.frm.bno.value;
                                window.open("deleteForm.jsp?b_no="+b_no,"delete","width=200, height=200");
                                return false;
                            });
                            $( "#write" ).click(function( event ) {
                                location.href='insertForm.jsp';
                            });
                        });
                        
                        
                    </script>
                </div>
            </div>
            <hr/>
        </div>    
        <jsp:include page="../main/mainfooter.jsp"/>
    </body>
</html>