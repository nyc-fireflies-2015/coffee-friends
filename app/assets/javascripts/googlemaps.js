function initMap() {
  var geocoder = new google.maps.Geocoder();
  var address = document.getElementById("address").value;
  var mapOptions = {
    zoom: 16,
    scrollwheel: false
  }
  var map = new google.maps.Map(document.getElementById("map"), mapOptions);

    geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: map.center
      });
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });

};


