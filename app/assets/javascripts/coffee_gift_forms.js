function initGiftFormDropdown() {
  $(".gift-form-dropdown").on('click', function(e) {
    var classStr = $(this).attr('class');
    var itemId = idFinder(classStr, "menu-item-id-");
    var cafeId = idFinder(classStr, "cafe-id-");
    var formContainer = $(this).siblings('.gift-form');
    $("#new_coffee").remove();
    $.ajax('/cafes/' + cafeId + '/coffee_gifts/new').done(function(data) {
      var modData = data.replace("$menu_item_id", itemId);
      formContainer.html(modData);
      initDropdowns();
    }).fail(function(){console.log("failure to retrieve data");});
  });

  function idFinder(classStr, finderStr) {
    var index = classStr.indexOf(finderStr) + finderStr.length;
    return classStr.slice(index,(index+1));
  };
};



