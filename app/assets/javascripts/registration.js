$(document).ready(function() {
	$("#coffee_gift_receiver").chosen({placeholder_text_single: "Search for a friend"});
	$("#coffee_gift_menu_item").chosen({placeholder_text_single: "Choose menu item"});
	$("a[rel*=register-modal-trigger]").leanModal({top : 150, overlay : 0.6, closeButton: ".modal_close" });
	$("#login-modal-trigger").leanModal({top : 150, overlay : 0.6, closeButton: ".modal_close" });

	// $(function () {
	//     // Calling Login Form
	//     $("#login_form").click(function () {
	//         $(".social_login").hide();
	//         $(".user_login").show();
	//         return false;
	//     });

	//     // Calling Register Form
	//     $("#register_form").click(function () {
	//         $(".social_login").hide();
	//         $(".user_register").show();
	//         $(".header_title").text('Register');
	//         return false;
	//     });

	//     // Going back to Social Forms
	//     $(".back_btn").click(function () {
	//         $(".user_login").hide();
	//         $(".user_register").hide();
	//         $(".social_login").show();
	//         $(".header_title").text('Login');
	//         return false;
	//     });

	// });

})
