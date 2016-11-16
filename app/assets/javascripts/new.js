$(document).ready(function() {
	$('#start').hover(function() {
		$(this).css("background-color", "black");
		$(this).css("color", "white");
		}, function() {
			$(this).css("background-color", "transparent");
			$(this).css("color", "black");
		} 
	);
	$('.button').on('click', function(event) {
		event.preventDefault();
		$('#message_email_address').fadeTo( 600, 1, function() {
			$(this).css("border-color", "red");
		});
		$('#message_email_address').delay(600).fadeTo( 600, 1, function() {
			$(this).css("border-color", "black");
		});
	})
	$('#save').on('click', function(event) {
		event.preventDefault();
		$('#message_content').fadeTo( 600, 1, function() {
			$(this).css("border-color", "red");
		});
		$('#message_content').delay(600).fadeTo( 600, 1, function() {
			$(this).css("border-color", "black");
		});
	})
});
