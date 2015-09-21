function filter() {
  $(".cafes-container").on('click','.tag-container', function(e) {
    e.preventDefault();
    url = $(this).attr('href');
    $.ajax(url).done(function(data) {
      $(".cafes-container").html(data)
    }).fail(function(){console.log("failure to retrieve data");});
  });
};

// put this in a separate file when ready for refactor
$(document).ready(function() {
  filter();
});
