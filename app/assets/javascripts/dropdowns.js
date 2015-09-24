function initDropdowns() {
  $("#coffee_gift_receiver").chosen({
    placeholder_text_single: "Option 1: Search for a user",
    no_results_text: "There's no registered coffee friend named"
  });

  $("#coffee_gift_charitable").on("click", function(){
  	if (this.checked) {
  		$("#coffee_gift_receiver").prop("disabled", true).trigger("chosen:updated");
  		$("#coffee_gift_phone").prop("disabled", true);
  	} else {
  		$("#coffee_gift_receiver").prop("disabled", false).trigger("chosen:updated");
  		$("#coffee_gift_phone").prop("disabled", false);
  	}
  })
};
