$(document).ready(function() {
	$("#coffee_gift_receiver").chosen({
		placeholder_text_single: "Search for a friend",
		no_results_text: "There's no registered coffee friend named"
	});

	$("#coffee_gift_menu_item").chosen({
		placeholder_text_single: "Choose menu item",
		disable_search_threshold: 5
	});

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
})
