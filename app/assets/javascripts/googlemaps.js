function initMap() {
  var geocoder;
  var map;
  var service;


  var address = document.getElementById("address").value;
  geocoder = new google.maps.Geocoder();

  var mapOptions = {
    zoom: 16
  }
  map = new google.maps.Map(document.getElementById("map"), mapOptions);

    geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
    service = new google.maps.places.PlacesService(map);
    console.log(service)
};


