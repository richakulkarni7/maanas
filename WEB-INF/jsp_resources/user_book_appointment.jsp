<!--TODO: Change the JSON format: content is same, just the structuring-->
<!--TODO: Adjust sidebar items color-->
<!DOCTYPE html>
<html>
    <head>
        <title>Book An Appointment</title>
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
    <body onresize="w3_close()" onload="fillContent()">
        <!--Collapsible sidebar-->
        <div class="w3-sidebar w3-bar-block w3-collapse w3-card w3-animate-left" style="width: 17%;" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large w3-hide-large" onclick="w3_close()">&times;</button>
            <!--User profile-->
            <div style="width:100%; height:15%; display:flex;">
                <div style="width:40%; display:flex; justify-content:flex-end; align-items:center;">
                    <img id="patientProfilePic" src="" style="border-radius:50%; width:60%; margin-right:4%;"/>
                </div>
                <div style="width:60%; display:flex; flex-direction:column; justify-content:center; font-size:12px; color:#4285F4;">
                    <p id="patientName" style="margin:0;"></p>
                </div>
            </div>
            <!--Navigation Items-->
            <div id="sidebarItemModel" style="width:100%; height:8%; display:flex; border:1px solid #E6EBF1;">
                <div style="width:2%; height:100%; background:#4285F4"></div>
                <div style="width:93%; height:100%; display:flex; justify-content:flex-start; align-items:center; font-size:12px; padding-left:16%; color:#74838B;"></div>
                <div style="width:5%; height:100%; display:flex; justify-content:flex-start; align-items:center; font-size:12px; padding-right:12%; color:#74838B;">&gt;</div>
            </div>
            <div style="height:29%;"></div>
            <div style="width:100%; height:8%; display:flex; border:1px solid #E6EBF1;">
                <div style="width:2%; height:100%; background:#FFF"></div>
                <div style="width:93%; height:100%; display:flex; justify-content:flex-start; align-items:center; font-size:12px; padding-left:16%; color:#74838B;"><a href="user_logout">Sign Out</a></div>
                <div style="width:5%; height:100%; display:flex; justify-content:flex-start; align-items:center; font-size:12px; padding-right:12%; color:#FFF;">&gt;</div>
            </div>
        </div>
        <!--Heading-->
        <div class="w3-main" style="margin-left:17%; height:100vh;">
            <div style="height:15vh; display:flex; align-items:center; background:#4285F4;">
                <button class="w3-button w3-xlarge w3-hide-large" style="width:5%; color:#FFF;" onclick="w3_open()">&#9776;</button>
                <!--Logo & Branding-->
                <div style="width:95%; height:100%; display:flex; flex-direction:row; align-items:center;">
                    <div style="margin-left:4%;">
                        <img src="images/logo_name_h_blue.png" style="height:55px; display:block;"/>
                    </div>
                </div>
            </div>
            <!--Content-->
            <div id="map" class="container" style="height:85vh;"></div>
            <!-- Modal -->
            <div class="modal fade" id="professionals" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="height:90vh;">
                        <div class="modal-header">
                            <button class="close" data-dismiss="modal">&times;</button>
                            <p class="modal-title" style="font-size:24px; color:#74838B; padding-top:4px;">Health Center</p>
                            <p style="font-size:12px; color:#74838B; margin-bottom:0;">Choose your doctor</p>
                        </div>
                        <div class="modal-body" style="overflow:auto; height:75vh;">
                            <div id="professionals" style="height:100%; weight:100%; display:initial;">
                                <div style="display:flex; flex-direction:row; flex-wrap:wrap;">
                                    <div id="professionalsModel" style="height:90px; width:250px; padding-left:8px; display:flex; flex-direction:row; justify-content:space-around; align-items:center;">
                                        <div>
                                            <p style="font-size:16px; color:#74838B;"></p>
                                            <p style="font-size:12px; color:#74838B; margin-top:-10px;"></p>
                                            <p style="font-size:12px; color:#74838B; margin-top:-10px;"></p>
                                        </div>
                                        <div>
                                            <br/>
                                            <button style="background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; font-size:12px; cursor:pointer; height:30px; min-width:90px; border-radius:6px; margin-top:-20px;" onclick='chooseProfessional(event)'>Select</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="noProfessionals" style="display:none;">
                                <p style="font-size:12px; color:#74838B; text-align:center; margin-top:30vh;">No doctors found in this health center. Please consider another center nearby.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("mySidebar").style.width = "70%";
            }
            
            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("mySidebar").style.width = "17%";
            }
            
            function fillContent() {
                fillProfileInfo();
                populateSidebar();
            }
            
            function fillProfileInfo() {
                var result = $.ajax({
                	url :'user_profile',
                	method:'get',
                	success: function(){
                		var patientData= result.responseJSON;
                        document.getElementById("patientProfilePic").setAttribute('src', "data:img/*;base64, " + patientData.profilePicture);
                        document.getElementById("patientName").innerHTML = patientData.name;
                	}
                
                });
            }
            
            function populateSidebar() {
                var items = ["Dashboard", "Account Settings", "Health Assessment", "Book An Appointment", "Resources"];
                var links = ["user_dashboard", "acct_settings_dashboard.html", "Self_Assessment_dashboard.html", "#", "resources_dashboard.html"];
                
                var sidebarItemModel = document.getElementById("sidebarItemModel");
                for(itemNo in items) {
                    var item = items[itemNo];
                        sidebarItemModel.children[0].style.visibility = "hidden";
                    sidebarItemModel.children[1].innerHTML = "<a href='"+links[itemNo]+"'>"+item+"</a>";
                    if(document.title == item) {
                        sidebarItemModel.children[0].style.visibility = "visible";
                        sidebarItemModel.children[1].style.color = "#000";
                        sidebarItemModel.children[2].style.visibility = "visible";
                    }
                    else
                        sidebarItemModel.children[2].style.visibility = "hidden";
                    sidebarItemModel.parentElement.insertBefore(sidebarItemModel.cloneNode(true), sidebarItemModel);
                }
                sidebarItemModel.remove();
            }
            
            var map;
            var markers = new Array();
            var info = new Array();
            var openInfoWindow = -1;
            var bounds;
            
            var healthCentersData;
            
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
                        map.setCenter(pos);
                    });
                }
				
				               
                google.maps.event.addListener(map, "bounds_changed", function() {
                	bounds = map.getBounds();
                	update();
                });
                
                google.maps.event.addListener(map, "dragend", function() {
                    update();
                });

                google.maps.event.addListener(map, "zoom_changed", function() {
                    update();
                });
            }
            
            function markLocations(healthCentersData) {
                var centerNo;
                for(centerNo in healthCentersData) {
                    var thisMarkerLabel = parseInt(centerNo)+parseInt(1);
                    markers.push(
                        new google.maps.Marker({
                            position: healthCentersData[centerNo].coordinates,
                            label: thisMarkerLabel.toString(),
                            map: map
                    }));
                    
                    var temp = "<div id='healthCenter"+centerNo+"'><p style='margin-left:8px; color:#74838B; font-size:16px;'>"+healthCentersData[centerNo].name + "</p><p style='margin-left:8px; color:#74838B; font-size:12px;'>" + healthCentersData[centerNo].address + "</p><a target='_blank' style='margin-left:8px;' href='" + healthCentersData[centerNo].website + "'>Website</a><br/><button style='background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; font-size:11px; cursor:pointer; height:30px; min-width:120px; border-radius:4px; margin-top:8px;' data-toggle='modal' data-target='#professionals' onclick='populateModal(event)' value='"+healthCentersData[centerNo].id+"'>Select Health Center</button></div>";
                    info.push(
                        new google.maps.InfoWindow({
                            content: temp
                    }));
                    
                    (function (i) {
                        google.maps.event.addListener(markers[i], 'click', function() {
                            if(openInfoWindow != -1)
                                info[openInfoWindow].close();
                            info[i].open(map, markers[i]);
                            openInfoWindow = i;
                        });
                    })(centerNo);
                }
                return;
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
                if(openInfoWindow != -1)
                    info[openInfoWindow].close();
                openInfoWindow = -1;
                
                var resp = $.ajax({url:'health_centers',method:'get',
                    success: function(){
                    	healthCentersData= JSON.parse(resp.responseText);
                    	removeMarkers();
                    	markLocations(healthCentersData);
                    }	
                });
            }
            
            function populateModal(event) {
            	var professionalsData;
                var centerNo = parseInt(event.target.value);
                var parameters = '&healthCenterID='+centerNo;
                var resp = $.ajax({url:'get_professionals', method:'get', data:'&healthCenterID='+centerNo,
                    success: function(){
                    	console.log(centerNo);
						professionalsData = resp.responseJSON;
						console.log(professionalsData);
                        var professionalsModel = document.getElementById("professionalsModel");
                        professionalsModel.style.display = "flex";
                        while(professionalsModel.parentElement.children.length > 1) {
                            professionalsModel.parentElement.children[1].remove();
                        }
                        for(profNo in professionalsData) {
                            var prof = professionalsData[profNo];
                            if(prof.id == null || prof.name == null || prof.designation == null || prof.qualification == null) {
                                document.getElementById("noProfessionals").style.display = "initial";
                                return;
                            }
                            professionalsModel.lastElementChild.children[1].value=prof.id;
                            professionalsModel.firstElementChild.children[0].innerHTML = prof.name;
                            professionalsModel.firstElementChild.children[1].innerHTML = prof.designation;
                            professionalsModel.firstElementChild.children[2].innerHTML = prof.qualification;
                            var newNode = professionalsModel.cloneNode(true);
                            newNode.removeAttribute("id");
                            professionalsModel.parentElement.appendChild(newNode);
                        }
                        document.getElementById("professionalsModel").style.display = "none";
                        document.getElementById("professionals").style.display = "initial";
                    }	
                });
            }
            
            function chooseProfessional(event){
            	var id = event.target.value;
            	var form = document.createElement("form");
            	var element= document.createElement("input");
            	
            	form.method = 'GET';
            	form.action = 'user_book_slot';
            	
            	element.value = id;
            	element.name = 'id';
            	form.appendChild(element);
            	
            	document.body.appendChild(form);
            	
            	form.submit();
            }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaL2SxEqUfezl5egeaMjTcaA7t7snPEjo&callback=initMap" async defer></script>
    </body>
</html>