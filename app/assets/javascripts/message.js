// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
	$("#new-message").on("submit", function(event){
		event.preventDefault();
		var $form = $(this);
		var data = $form.serialize();
		var email = $form.find("#message_email_address").val();
		var zip = $form.find("#message_zip").val();
		var message = $form.find("#message_content").val();
		if (validateEmail(email) === false) {
			$('#message_email_address').css('border-color', 'red');
			var makeEmailBlack = function() {
				$('#message_email_address').css('border-color', 'black');
			};
			setTimeout(makeEmailBlack, 1500)
		};
		if (validateZip(zip) === false) {
			$('#message_zip').css('border-color', 'red');
			var makeZipBlack = function() {
				$('#message_zip').css('border-color', 'black');
			};
			setTimeout(makeZipBlack, 1500)
		};
		if (validateMessage(message) === false) {
			$('#message_content').css('border-color', 'red');
			var makeMessageBlack = function() {
				$('#message_content').css('border-color', 'black');
			};
			setTimeout(makeMessageBlack, 1500)
		};
		if (validateZip(zip) === true && validateEmail(email) === true && validateMessage(message) === true) {
			$.ajax({
				method: $form.attr('method'),
				url: $form.attr('action'),
				data: data
			}).done(function(){
				alert("Submission successful. Please check your email to confirm.");
				$form.trigger('reset');
			}).fail(function(){
				alert("An error occurred. Please try again.");
			});
		};
	});	
});
var validateEmail = function(email) {
  var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
};
var validateZip = function(zip) {
	if (/(^\d{5}$)|(^\d{5}-\d{4}$)/.test(zip) || zip.length === 0) {
		return true;
	} else {
		return false;
	};
};
var validateMessage = function(message) {
	if ((message.length < 50) || (message.toLowerCase().includes("trump 2020")) || (message.toLowerCase().includes("make america great again"))) {
		return false;
	} else {
		return true;
	};
};
