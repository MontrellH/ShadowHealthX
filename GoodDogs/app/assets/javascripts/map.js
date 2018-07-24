var map;
function initMap(){
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 29.6175842, lng: -82.3804339},
    zoom: 14
  });
}

$( document ).ready(function() {
  var shelters = $('#map').data('shelters');
  var curr_shelter = $('#map').data('shelter');
  var index;
  for (index = 0; index < shelters.length; index++) {
    var shelter = shelters[index]
    var position = {lat: 29.6175842, lng: -82.3804339};

    var marker = new google.maps.Marker({title: shelter.Name, position: position, map: map});
  }
});

