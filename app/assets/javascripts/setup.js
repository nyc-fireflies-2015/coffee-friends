$(document).ready(function() {
  initCafeFilter();
  initRegistrationPopups();
  initDropdowns();
  initProfileToggle()

  if ($('#map').length) {
      initMap()
  }

});
