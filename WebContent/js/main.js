/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

function idCheck(){	
	document.frm.submit();
}

function searchbtn(){
	if($("#mapHidden").val()==0){
		alert("지역을 선택하세요.")
	} else {
		document.afterfrm.submit();
	}
	
}

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'Fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});

$(function(){
	$(".sel_table").on("mouseover", function() {
		$(this).css("background-color", "#20B2AA");
		$(this).children("td").css("cursor", "pointer");
		$(this).css("border-radius", "0 0 10px 10px / 0 0 10px 10px")
	});
	$(".sel_table").on("mouseleave", function() {
		$(this).css("background-color", "#ffffff");
	}); 
});

$(".go-button").click(function() {

	$.ajax({
		url : "./locationSearch.jsp",
		type : "get",
		data : {
			'location' : $(this).val()
		},
		dataType : 'text',
		success : function(data) {
			$('.category').html(data);
		},
		error : function(request, error) {
			alert("message:" + request.responseText);
		}

	});

	var valueMap = "";

	if (!$(this).disabled) {
		valueMap = $(this).val();
		$(".mapHidden").attr("value", valueMap);
	} else {
		alert("error-404 다시 시도하세요.");
	}
});

$(".go-button-ov1").click(function() {
	var a = $(".temaHidden1").val();
	var valueTema = "";
	$(".go-button-ov1").css("background-color", "Transparent");
	if (a == "0") {
		valueTema = $(this).val();
		$(".temaHidden1").attr("value", valueTema);
		$(this).css("background-color", "#D5D5D5");
	} else if (a != "0") {
		valueTema = $(this).val();
		if (a == $(this).val()) {
			$(this).css("background-color", "Transparent");
			$(".temaHidden1").attr("value", "0");
		} else {
			$(".temaHidden1").attr("value", valueTema);
			$(this).css("background-color", "#D5D5D5");
		}
	}
});

$(".go-button-ov2").click(function() {
	var b = $(".temaHidden2").val();
	var valueTema = "";
	$(".go-button-ov2").css("background-color", "Transparent");
	if (b == "0") {
		valueTema = $(this).val();
		$(".temaHidden2").attr("value", valueTema);
		$(this).css("background-color", "#D5D5D5");
	} else if (b != "0") {
		valueTema = $(this).val();
		if (b == $(this).val()) {
			$(this).css("background-color", "Transparent");
			$(".temaHidden2").attr("value", "0");
		} else {
			$(".temaHidden2").attr("value", valueTema);
			$(this).css("background-color", "#D5D5D5");
		}
	}
});

$(".go-button-ov3").click(function() {
	var c = $(".temaHidden3").val();
	var valueTema = "";
	$(".go-button-ov3").css("background-color", "Transparent");
	if (c == "0") {
		valueTema = $(this).val();
		$(".temaHidden3").attr("value", valueTema);
		$(this).css("background-color", "#D5D5D5");
	} else if (c != "0") {
		valueTema = $(this).val();
		if (c == $(this).val()) {
			$(this).css("background-color", "Transparent");
			$(".temaHidden3").attr("value", "0");
		} else {
			$(".temaHidden3").attr("value", valueTema);
			$(this).css("background-color", "#D5D5D5");
		}
	}
});



