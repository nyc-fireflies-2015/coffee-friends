function initGiftFormDropdown() {
  $(".gift-form-dropdown").on('click', function(e) {
    var classStr = $(this).attr('class');
    var index = classStr.lastIndexOf("menu-item-id-") + 13;
    var itemId = classStr.slice(index,(index+1));
    var cafeId = $(this).attr('href').slice(6,7);
    $.ajax('/cafes/' + cafeId + '/coffee_gifts/new').done(function(data) {
      var modData = data.replace("$menu_item_id", itemId);
      $(".gift-form").html(modData);
      initDropdowns();
    }).fail(function(){console.log("failure to retrieve data");});
  });
};
