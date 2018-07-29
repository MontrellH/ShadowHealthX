var map;
function initMap(){
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 29.64335, lng: -82.3357407},
    zoom: 14
  });
}

// $( document ).ready(function() {
//   var shelters = $('#map').data('shelters');
//   var curr_shelter = $('#map').data('shelter');
//   var index;
//   if(curr_shelter == null) {
//     for (index = 0; index < shelters.length; index++) {
//       var shelter = shelters[index]
//       var position = {lat: parseFloat(shelter.Lat), lng: parseFloat(shelter.Lng)};
//
//       var marker = new google.maps.Marker({title: shelter.Name, position: position, map: map});
//     }
//   }
//   else {
//     var pos = {lat: parseFloat(curr_shelter.Lat), lng: parseFloat(curr_shelter.Lng)};
//     var marker = new google.maps.Marker({title: curr_shelter.Name, position: pos, map: map});
//   }
// });
