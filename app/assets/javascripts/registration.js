function initRegistrationPopups() {
	$("a[rel*=leanModal]").leanModal({top : 150, overlay : 0.6, closeButton: ".modal_close" });

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
};
