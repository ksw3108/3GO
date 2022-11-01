<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="meeting.model.*,meeting.service.*" %>
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
	        String m_no = "1";//세션으로 넘겨받은 회원번호
	    	String b_no = request.getParameter("m_board_no");
	    	String group_no = request.getParameter("group_no");
	    	
	    	boolean isModify = false;
	    	// 2. Service에 getArticleById() 호출하여 그 게시글번호를 갖는 레코드를 검색한다.
	    	MeetingViewService service = MeetingViewService.getInstance();
	    	MeetingBean meeting = service.getMeetingById(b_no, isModify);
	    	MeetingListService lService = MeetingListService.getInstance();
	    	MeetingWriteService wService = MeetingWriteService.getInstance();	
	    	
	    	List<MeetingBean> reply = MeetingListService.getInstance().getReplyList(group_no);
	    
	    	
	    	
	    	String writer = lService.getMeetingId(meeting.getM_no());
	    	String loginId = lService.getMeetingId(Integer.parseInt(m_no));
	    	
	    	/* System.out.println(meeting.getm_board_file1()); */
        %>
        <style type="text/css">
        	.img{
        		display:block;
        		margin-left:auto;
        		margin-right:auto;	
        	}
        
        </style>
        <!-- Bootstrap -->
        <link href="./bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->        
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        
    </head>
    
    <body>
        <!-- 좌우측의 공간 확보 -->
        <form action="#" name = "frm"><input type="hidden" name="bno" value="<%=meeting.getm_board_no() %>" /></form>
      	<input type="hidden" name="userId" id="userId" value="<%=lService.getMeetingId(Integer.parseInt(m_no)) %>" />
        <div class="container">
         
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">제목</th>
                                <th width="60%"><%= meeting.getm_board_title() %></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성일
                                </td>
                                <td>
                                <%= meeting.getm_board_date() %>
                                </td>
                            </tr>
                            <tr>
                                <td>글쓴이
                                </td>
                                <td>
                                <%= writer %> <span style='float:right'>조회 : <%= meeting.getm_board_count() %></span>
                                </td>
                            </tr>
                           <tr>
                                <td colspan="2">
                                    <p>
                                    	<%= meeting.getm_board_content()%>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <% if( reply == null ) { %>
						등록된 댓글이 없습니다.
					<% }else{						
						for(int i=0; i<reply.size(); i++){
							String id = MeetingListService.getInstance().getMeetingId(reply.get(i).getM_no());						
						%>								
							<table id='commentTable' class='<%= reply.get(i).getm_board_no() %>'>
								<% if(reply.get(i).getLevel()==1){ %>
									<tr id="r1" name="commentParentCode">
		                                <td colspan=2>
		                                <input type="hidden" value="<%= reply.get(i).getm_board_no() %>"   />
										<strong><%=lService.getMeetingId(reply.get(i).getM_no()) %></strong>
										<a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a>
										<p><%=reply.get(i).getm_board_content() %></p>
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
												<strong><%=lService.getMeetingId(reply.get(j).getM_no()) %></strong>
												<a style="cursor:pointer;" name="cAdd">답글</a> | <a style="cursor:pointer;" name="cDel">삭제</a>
												<p><%=reply.get(j).getm_board_content() %></p>
												</td>
											</tr>										
									<%		
										}										
										break;
									}
								} %>
							</table>	
							<hr/>									
					<%
						}
					}
					%>							
                    <table id="commentTable" class="table table-condensed"></table>
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
                                            <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">확인</button>
                                        </div>
                                    </p>
                                        <textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <%-- <% System.out.println(b_no); %> --%>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <button type="button" id="list" class="btn btn-default">목록</button>
                                        <button type="button" id="modify" class="btn btn-default">수정</button>
                                        <button type="button" id="delete" class="btn btn-default">삭제</button>
                                        <button type="button" id="write" class="btn btn-default">글쓰기</button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                    
                    <script>
                    
                    	function sendReply(pName, pPassword, pText, parentId){
                    		alert("1");
                    		$.ajax({
                    			url:"reply.jsp",
                    			type:"get",
                    			data:{
                    				'm_id':pName.toString(),
                    				'm_board_pass':pPassword.toString(),
                    				'm_board_content':pText.toString(),
                    				'parentId':parentId.toString()
                    			},
                    			dataType:'text',
                    			contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
                    			success:function(data){
                    				alert("댓글달기 성공!");
                    			},complite:function(){
                    				alert("complite");
                    			},
                    			error:function(e){
                    				alert(e.responseText);                    				
                    			}
                    		});
                    	}
                    	
                        $(function(){
                               
                            //제일 하단에 있는 depth1의 댓글을 다는 이벤트
                            $("#commentParentSubmit").click(function( event ) {
                                   
                                //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
                                var pName = $("#commentParentName");
                                var pPassword = $("#commentParentPassword");//패스워드를 노출 시켰는데 저장하고 나서 저장한 날짜를 보여줄 예정
                                var pText = $("#commentParentText");
                                var parentId = $("#b_no");
                                   
                                if($.trim(pName.val())==""){
                                    alert("이름을 입력하세요.");
                                    pName.focus();
                                    return;
                                }else if($.trim(pPassword.val())==""){
                                    alert("패스워드를 입력하세요.");
                                    pPassword.focus();
                                    return;
                                }else if($.trim(pText.val())==""){
                                    alert("내용을 입력하세요.");
                                    pText.focus();
                                    return;
                                }
                                   
                                var commentParentText = '<tr id="r1" name="commentParentCode">'+
                                                            '<td colspan=2>'+
                                                                '<strong>'+pName.val()+'</strong> '+pPassword.val()+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>';
                                   
                                //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
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
                               
                            //댓글의 댓글을 다는 이벤트
                            $(document).on("click","#commentChildSubmit", function(){
                                   
                                var cName = $("#commentChildName");
                                var cPassword = $("#commentChildPassword");
                                var cText = $("#commentChildText");
                                var parentId=$(this).parent().parent().parent().parent().parent().parent().attr('class');
                               
                                
                               
                                if($.trim(cName.val())==""){
                                    alert("이름을 입력하세요.");
                                    cName.focus();
                                    return;
                                }else if($.trim(cPassword.val())==""){
                                    alert("패스워드를 입력하세요.");
                                    cPassword.focus();
                                    return;
                                }else if($.trim(cText.val())==""){
                                    alert("내용을 입력하세요.");
                                    cText.focus();
                                    return;
                                }
                                
                                sendReply( cName.val(), cPassword.val(), cText.val(), parentId);
                                <!-- -->
                                var commentChildText = '<tr name="commentChildCode">'+
                                                            '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                                            '<td style="width:99%">'+
                                                                '<strong>'+cName.val()+'</strong> '+cPassword.val()+' <a style="cursor:pointer;" name="cAdd">답글</a> | <a style="cursor:pointer;" name="cDel">삭제</a>'+
                                                                '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>';
                                
                                
                                //앞의 tr노드 찾기
                                var prevTr = $(this).parent().parent().parent().parent().prev();
                                
                                //댓글 적는 에디터 삭제
                                $("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.
                                   
                                //댓글을 타고 올라가며 부모 tr을 찾음
                                while(prevTr.attr("name")!="commentParentCode"){
                                    prevTr = prevTr.prev();
                                }
                                //while를 타는지 체크
                                var check = false;
                                //다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
                                var nextTr = prevTr.next();
                                //뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
                                if(nextTr.attr("name")!="commentChildCode"){
                                    prevTr.after(commentChildText);
                                }else{
                                    //댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
                                    while(nextTr.attr("name")=="commentChildCode"){
                                        nextTr = nextTr.next();
                                        check = true;
                                    }
                                }
                                
                                if(check){//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
                                    nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
                                    nextTr.after(commentChildText);
                                }
                              
                               
                                   
                            });
                               
                            //답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
                            $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
                                   
                                if($(this).attr("name")=="pDel"){
                                    if (confirm("답글을 삭제 하시면 밑에 답글도 모두 삭제 됩니다. 정말 삭제하시겠습니까?") == true){    //확인
                                           
                                        var delComment = $(this).parent().parent();
                                        var nextTr = delComment.next();
                                        var delTr;
                                        //댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
                                        while(nextTr.attr("name")=="commentCode"){
                                            nextTr = nextTr.next();
                                            delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
                                            delTr.remove();
                                        }
                                           
                                        delComment.remove();
                                           
                                    }else{   //취소
                                        return;
                                    }
                                }else if($(this).attr("name")=="cDel"){
                                    if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                                        $(this).parent().parent().remove();
                                    }else{   //취소
                                        return;
                                    }
                                }else{
                                    //자기 부모의 tr을 알아낸다.
                                    var parentElement = $(this).parent().parent();
                                    //댓글달기 창을 없앤다.
                                    $("#commentEditor").remove();
                                    //부모의 하단에 댓글달기 창을 삽입
                                    var commentEditor = '<tr id="commentEditor">'+
                                                            '<td style="width:1%"> </td>'+
                                                            '<td>'+
                                                                '<span class="form-inline" role="form">'+
                                                                    '<p>'+
                                                                        '<div class="form-group">'+
                                                                            '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" value="'+$("#userId").val()+'" maxlength="10">'+
                                                                        '</div>'+
                                                                        '<div class="form-group">'+
                                                                            ' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">'+
                                                                        '</div>'+
                                                                        '<div class="form-group">'+
                                                                            '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'+
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
                                location.href='../community/Meeting.jsp';
                            });
                            $( "#modify" ).click(function( event ) {
                            	var b_no=document.frm.bno.value;
                                location.href='modifyForm.jsp?b_no='+b_no;
                                
                            });
                            $( "#delete" ).click(function( event ) {
                                var b_no=document.frm.bno.value;
                                location.href="deleteForm.jsp?b_no="+b_no;
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
    </body>
</html>