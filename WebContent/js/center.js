$(function() {
	var idcheck = $("#idhidden").val();
	
	$("#likebtn").click(function() {
		if (idcheck == "null") {
			alert("로그인 후 사용하세요.");
			
		} else {
			if ($("#tnohidden").val() != null) {
				
				$.ajax({
					url : "../search/likeTourUp.jsp",
					type : "get",
					data : {
						'like' : $("#likebtn").val(),
						'tno' : $("#tnohidden").val()
					},
					dataType : 'text',
					success : function(data) {
						$('#likebtn').html(data);
					},
					error : function(request, error) {
						alert("message:" + request.responseText);
					}

				});
				
			} else if ($("#snohidden").val() != null) {
				$.ajax({
					url : "../search/likeStayUp.jsp",
					type : "get",
					data : {
						'like' : $("#likebtn").val(),
						'sno' : $("#snohidden").val()
					},
					dataType : 'text',
					success : function(data) {
						$('#likebtn').html(data);
					},
					error : function(request, error) {
						alert("message:" + request.responseText);
					}

				});
				
			} else if ($("#fnohidden").val() != null) {
				
				$.ajax({
					url : "../search/likeFoodUp.jsp",
					type : "get",
					data : {
						'like' : $("#likebtn").val(),
						'fno' : $("#fnohidden").val()
					},
					dataType : 'text',
					success : function(data) {
						$('#likebtn').html(data);
					},
					error : function(request, error) {
						alert("message:" + request.responseText);
					}

				});
			}
		}
	});
});