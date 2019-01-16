$(function() {
	
	var headerImg = $(".spec-img img");
	var firstImg = $(".spec-list ul li:first-child");
	firstImg.css("border", "2px solid #017DB9");
	
	$(".spec-list ul li").mouseover(function() {
		$(this).css("border", "2px solid #017DB9");
		$(this).siblings().css("border", "2px solid #fff");
		var src = $(this).children().get(0).src;
		headerImg.attr("src", src);
	});
	
	$(".number_btn a:last-child").addClass("disabled");
	
	var maxNum = Number($(".number .rest-num").text());
	$(".number_btn a:first-child").click(function() {
		var num = $("#buy-num").val();
		$(".number_btn a:last-child").removeClass("disabled");
		$("#buy-num").val(++num);
		if(num >= maxNum) {
			$("#buy-num").val(maxNum);
			$(this).addClass("disabled");
		}
	});
	$(".number_btn a:last-child").click(function() {
		var num = $("#buy-num").val();
		$(".number_btn a:first-child").removeClass("disabled");
		$("#buy-num").val(--num);
		if(num <= 1) {
			$("#buy-num").val(1);
			$(this).addClass("disabled");
		}
	});
	$("#buy-num").on("change", function() {
		var num = $(this).val();
		if(num <= 1 || num >= maxNum) {
			$("#buy-num").val(1);
		}
	});
	
});