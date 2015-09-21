function initDropdowns() {
  $("#coffee_gift_receiver").chosen({
    placeholder_text_single: "Search for a friend",
    no_results_text: "There's no registered coffee friend named"
  });

  $("#coffee_gift_menu_item").chosen({
    placeholder_text_single: "Choose menu item",
    disable_search_threshold: 5
  });
};
