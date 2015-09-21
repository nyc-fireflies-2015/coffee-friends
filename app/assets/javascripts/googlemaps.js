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


    var request = {
    location: new google.maps.LatLng(-33.8665433,151.1956316),
    radius: '500',
    types: ['store']
  };

    service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback);
};


function callback(results, status) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      var place = results[i];
      console.log(place)
      createMarker(results[i]);
    }
  }
}
