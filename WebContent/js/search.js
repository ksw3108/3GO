function searchmain(){
	var map = document.getElementById("mapHidden").value;
	var tema1 = document.getElementById("temaHidden1").value;
	var tema2 = document.getElementById("temaHidden2").value;
	var tema3 = document.getElementById("temaHidden3").value;
	
	sendDao(map,tema1,tema2,tema3);
}

function sendDao(smap, stema1, stema2, stema3){
	$.ajax({
		url : "searchService.java",
		type : "post",
		data : {
			'map':smap.toString(),
			'tema1':stema1.toString(),
			'tema2':stema2.toString(),
			'tema3':stema3.toString()
		},
		dataType : 'text',
		success : function(data) {
			alert("DB성공!");
		},
		beforeSend:function() {
			alert("통신시작");
		},
		complete:function() {
			alert("통신완료");
		}
	});
}

