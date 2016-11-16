$(document).ready(function() {
	$('#start').hover(function() {
		$(this).css("background-color", "black");
		$(this).css("color", "white");
		}, function() {
			$(this).css("background-color", "transparent");
			$(this).css("color", "black");
		} 
	);
});