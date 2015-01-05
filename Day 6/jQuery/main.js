$(document).ready(function(){
	$(".container").click(function(){
		$(".container").css("background","white");
		$(".container").css("color","red");
		$(this).css("background","red");
		$(this).css("color","white");
	});	
});
