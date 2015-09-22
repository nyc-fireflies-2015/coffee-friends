function initGiftFormDropdown() {
  $(".gift-form-dropdown").on('click', function(e) {

    var index = $(this).attr('href').slice(6,7);
    $.ajax('/cafes/' + index + '/coffee_gifts/new').done(function(data) {
      $(".gift-form").html(data);
    });
  });
};
