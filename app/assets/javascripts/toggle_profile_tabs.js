function initProfileToggle() {
  setupProfile();

  $(".profile-filter-tag").on('click', function(e) {
    e.preventDefault();
    var tag = $(this).html();

    if( tag == "given") {
      $(".given-coffees-container").show();
      $(".received-coffees-container").hide();
    } else if( tag == "received" ){
      $(".given-coffees-container").hide();
      $(".received-coffees-container").show();
    };
  });
};

function setupProfile() {
  $(".given-coffees-container").hide();
  $(".received-coffees-container").show();
};






