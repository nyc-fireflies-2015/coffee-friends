function initRegistrationPopups() {
	$("a[rel*=leanModal]").leanModal({top : 100, overlay : 0.6, closeButton: ".modal_close" });

	$("#login-as-cafe").on("click", function(e){
		e.preventDefault();
		$("#user-login").hide();
		$("#cafe-login").show();
	})

	$("#login-as-user").on("click", function(e){
		e.preventDefault();
		$("#cafe-login").hide();
		$("#user-login").show();
	})

	if ($("#registration-errors").text().length > 3) {
		$("#register-modal-trigger").click();
	}

	if ($("#cafe-login-errors").text().length > 3) {
		$("#login-modal-trigger").click();
		$("#user-login").hide();
		$("#cafe-login").show();
	}

	if ($("#user-login-errors").text().length > 5) {
		$("#login-modal-trigger").click();
	}
};
