
  let mapInstance
  let latitude = 35.691574;
  let longitude = 139.704647;

  function initMap(){
    mapInstance = new google.maps.Map(document.getElementById('map'), {
    center: {lat: latitude, lng: longitude},
    zoom: 13
    });

    let new_marker = new google.maps.Marker({
      map: mapInstance,
    	position: new google.maps.LatLng( latitude, longitude ) ,
      draggable: true
    });

    google.maps.event.addListener( new_marker, 'dragend', function(ev){
      document.getElementById('latitude').value = ev.latLng.lat();
      document.getElementById('longitude').value = ev.latLng.lng();
    });
  }
