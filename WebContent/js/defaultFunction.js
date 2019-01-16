/*搜索功能*/
$("#search-btn").click(function(){
	var keyword = $("#search-text").val();
	window.location = "ProductSearch?key=" + keyword;
});