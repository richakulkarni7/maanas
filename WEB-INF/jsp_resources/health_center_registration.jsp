<!DOCTYPE html>
<html>
    <head>
        <title>Health Center Registration</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body{
                font-family: Arial, Helvetica, sans-serif;
                height: 100%;
            }
        </style>
    </head>
    <body>
            <div style="height:25vh;display:flex; flex-direction:row;">
                <div style="width:50%; height:25vh; display:flex; flex-direction:column; justify-content:center; align-items:flex-start;">
                    <form action="register_health_center" method="post" id="form" style="width:50%; height:25vh; display:flex; flex-direction:column; justify-content:space-around; align-items:flex-start; padding-left:28px; padding-top:24px;">
                        <input name="name" type="text" placeholder="Name" style="border:1px solid #DDD; width:65vw; padding-left:8px;"/><br/>
                        <input name="address" type="text" placeholder="Address" style="border:1px solid #DDD; width:65vw; padding-left:8px;"/><br/>
                        <input name="website" type="text" placeholder="Website" style="border:1px solid #DDD; width:65vw; padding-left:8px;"/><br/>
                        <input id="lat"  name = "lat" type="hidden" value=""/>
                        <input id="lng"  name = "lng" type="hidden" value=""/>
                    </form>
                </div>
                <div style="width:50%; height:25vh; display:flex; flex-direction:column; justify-content:center; align-items:flex-end;">
                    <input type="submit" value="Submit" onclick="submitForm()" style="background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; font-size:14px; cursor:pointer; height:30px; width:7vw; min-width:70px; border-radius:6px; margin-right:5vw; margin-bottom:-15vh;"/>
                </div>
            </div>
        
            <div style="border:1px solid #DDD; height:5vh;">
                <p style="height:5vh; font-size:14px; color:#74838B; margin-left:28px; display:flex; flex-direction:column; justify-content:center;">Choose location:</p>
            </div>
        
            <div id="map" style="height:70vh;"></div>

        <script>
            var map;
            var marker;
            var markerCoords = {lat: 28.644800, lng: 77.216721};
            
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 28.644800, lng: 77.216721},
                    zoom: 12
                });
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };
                        markerCoords = pos;
                        map.setCenter(pos);
                        update();
                    });
                }
                marker = new google.maps.Marker({
                            position: markerCoords,
                            map: map
                });
                google.maps.event.addListener(map, "drag", function() {
                    update();
                });

                google.maps.event.addListener(map, "zoom_changed", function() {
                    update();
                });
            }
            
            
            function removeMarkers() {
                openInfoWindow = -1;
                for(var j = 0; j < markers.length; j++){
                    markers[j].setMap(null);
                }
                markers = [];
                info = [];
            }
            
            function update() {
                var mapCenter = map.getBounds().getCenter();
                markerCoords.lat = mapCenter.lat();
                markerCoords.lng = mapCenter.lng();
                marker.setMap(null);
                marker = new google.maps.Marker({
                            position: markerCoords,
                            map: map
                });
                document.getElementById("lat").value = markerCoords.lat;
                document.getElementById("lng").value = markerCoords.lng;
            }
            
             function submitForm() {
                document.getElementById("form").submit();
                console.log(document.getElementById("lat").value);
                return true;
            } 
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaL2SxEqUfezl5egeaMjTcaA7t7snPEjo&callback=initMap" async defer></script>
    </body>
</html>