$(document).ready(function() {

  initRegistrationPopups();

  // adjust scope
  initGiftFormDropdown();

  if ($('#map').length) {
    initMap()
  }

  if ($('#user_profile').length) {
    initProfileToggle()
  }

  if ($('#cafe_index').length) {
    initCafeFilter();
  }

  if ($('#new_coffee').length) {
    initDropdowns();
  }

  if ($('#dropin').length) {
    initPayments();
  }

});
