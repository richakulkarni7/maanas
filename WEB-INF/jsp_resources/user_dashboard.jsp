<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
            body{
                font-family: Arial, Helvetica, sans-serif;
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
            <div class="container" style="height:85vh;">
                <div class="row" style="height:100%;">
                    <!--Upcoming Appointment & Diagnosis Columns-->
                    <div class="col-sm-4" style="height:100%; display:flex; flex-direction:column; align-items:center; justify-content:space-around; background:#F8F9FA;">
                        <div style="height:94.5%; width:80%; background:#FFF; overflow-y:auto; overflow-x:hidden; box-shadow:2px 2px 20px #AAA;">
                            <div id="nextAppts" style="height:100%; width:100%; display:none;">
                                <p style="text-align:center; color:#74838B; margin-top:8px; margin-bottom:8px; font-weight:600;">UPCOMING APPOINTMENTS</p>
                                <div id="nextApptModel" style="height:15%; width:90%; margin-left:5%; margin-right:5%; margin-top:12px; display:flex; flex-direction:row;">
                                    <div style="display:flex; flex-direction:row; align-items:center; width:20%;">
                                        <img src="images/maleUser.png" style="border-radius:50%; width:100%;"/>
                                    </div>
                                    <div style="width:80%; display:flex; flex-direction:column; justify-content:center; padding-left:4px; padding-top:6px;">
                                        <p style="font-size:11px; color:#74838B;">Richard Roe, Designation<br/>Main Street, Anytown, Your Country<br/>DD MM YYYY | HH:MM</p>
                                    </div>
                                </div>
                            </div>
                            <div id="noNextAppts" style="height:100%; width:100%; display:none;">
                                <div style="height:100%; width:100%; display:flex; flex-direction:column; align-items:center; justify-content:center; background:#F4FAFE;">
                                    <p style="font-size:12px; color:#74838B;">No past appointments found</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Past Appointments Column-->
                    <div class="col-sm-4" style="height:100%; display:flex; flex-direction:column; align-items:center; justify-content:space-around; background:#F8F9FA;">
                        <div style="height:94.5%; width:80%; background:#FFF; overflow-y:auto; overflow-x:hidden; box-shadow:2px 2px 20px #AAA;">
                            <div id="pastAppts" style="height:100%; width:100%; display:none;">
                                <p style="text-align:center; color:#74838B; margin-top:8px; margin-bottom:8px; font-weight:600;">PAST APPOINTMENTS</p>
                                <div id="pastApptModel" style="height:15%; width:90%; margin-left:5%; margin-right:5%; margin-top:12px; display:flex; flex-direction:row;">
                                    <div style="display:flex; flex-direction:row; align-items:center; width:20%;">
                                        <img src="images/maleUser.png" style="border-radius:50%; width:100%;"/>
                                    </div>
                                    <div style="width:80%; display:flex; flex-direction:column; justify-content:center; padding-left:4px; padding-top:6px;">
                                        <p style="font-size:11px; color:#74838B;">Richard Roe, Designation<br/>Main Street, Anytown, Your Country<br/>DD MM YYYY | HH:MM</p>
                                    </div>
                                </div>
                            </div>
                            <div id="noPastAppts" style="height:100%; width:100%; display:none;">
                                <div style="height:100%; width:100%; display:flex; flex-direction:column; align-items:center; justify-content:center; background:#F4FAFE;">
                                    <p style="font-size:12px; color:#74838B;">No past appointments found</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Your Doctors Column-->
                    <div class="col-sm-4" style="height:100%;display:flex; flex-direction:column; align-items:center; justify-content:center; background:#F8F9FA;">
                        <div style="width:80%; height:94.5%; background:#FFF; display:flex; flex-direction:column; overflow-y:auto; overflow-x:hidden; box-shadow:2px 2px 20px #AAA;">
                            <div id="professionals" style="height:100%; width:100%; display:none;">
                                <p style="text-align:center; color:#74838B; margin-top:8px; margin-bottom:8px; font-weight:600; text-align:center;">YOUR DOCTORS</p>
                                <div id="professionalsModel" style="width:90%; height:25%; margin-left:5%; margin-right:5%; margin-top:12px;">
                                    <img src="images/maleUser.png" style="border-radius:50%; width:30%; display:block; margin-left:auto; margin-right:auto;"/>
                                    <p style="text-align:center; font-size:12px; color:#74838B;">Richard Roe, Designation</p>
                                    <p style="text-align:center; font-size:12px; color:#74838B;">Main Street, Anytown, Your Country</p>
                                </div>
                            </div>
                            <div id="noProfessionals" style="height:100%; weight:100%; display:none;">
                                <div style="height:100%; weight:100%; display:flex; flex-direction:column; align-items:center; justify-content:center; background:#F4FAFE;">
                                    <p style="font-size:12px; color:#74838B;">No past appointments found</p>
                                </div>
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
                upcomingAppointment();
                pastAppointments();
                professionals();
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
                var links = ["#", "acct_settings_dashboard.html", "Self_Assessment_dashboard.html", "user_book_appointment", "resources_dashboard.html"];
                
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
            
            function upcomingAppointment() {
                var result = $.ajax({
                	url:'user_upcoming_appointments',
                	method:'get',
                	success: function(){
                		var nextApptsObj = result.responseJSON;
                        
                        var nextApptModel = document.getElementById("nextApptModel");
                        for(apptNo in nextApptsObj) {
                            var appt = nextApptsObj[apptNo];
                            if(appt.professionalName == null || appt.designation == null || appt.healthCenterAddress == null || appt.professionalPicture == null || appt.date == null) {
                                document.getElementById("noNextAppts").style.display = "initial";
                                return;
                            }
                            var apptDateTime = new Date(appt.date);
                            nextApptModel.firstElementChild.firstElementChild.setAttribute('src', "data:img/*;base64, " + appt.professionalPicture);
                            nextApptModel.lastElementChild.firstElementChild.innerHTML = appt.professionalName+", "+appt.designation+"<br/>"+appt.healthCenterAddress+"<br/>"+apptDateTime.toLocaleDateString()+" | "+apptDateTime.toLocaleTimeString();
                            nextApptModel.parentElement.appendChild(nextApptModel.cloneNode(true));
                        }
                        document.getElementById("nextApptModel").remove();
                        document.getElementById("nextAppts").style.display = "initial";
                		
                	}
                	
                });
            }
            
            function pastAppointments() {
                var result = $.ajax({
                	url:'user_past_appointments',
                	method:'get',
                	success: function(){
                		var pastApptsObj = result.responseJSON;
                        
                        var pastApptModel = document.getElementById("pastApptModel");
                        for(apptNo in pastApptsObj) {
                            var appt = pastApptsObj[apptNo];
                            if(appt.professionalName == null || appt.designation == null || appt.healthCenterAddress == null || appt.professionalPicture == null || appt.date == null) {
                                document.getElementById("noPastAppts").style.display = "initial";
                                return;
                            }
                            var apptDateTime = new Date(appt.date);
                            pastApptModel.firstElementChild.firstElementChild.setAttribute('src', "data:img/*;base64, " + appt.professionalPicture);
                            pastApptModel.lastElementChild.firstElementChild.innerHTML = appt.professionalName+", "+appt.designation+"<br/>"+appt.healthCenterAddress+"<br/>"+apptDateTime.toLocaleDateString()+" | "+apptDateTime.toLocaleTimeString();
                            pastApptModel.parentElement.appendChild(pastApptModel.cloneNode(true));
                        }
                        document.getElementById("pastApptModel").remove();
                        document.getElementById("pastAppts").style.display = "initial";
                	}
                });
            }
            
            function professionals() {
                var result = $.ajax({
                	
                	url:'user_get_connected_professionals',
                	method:'get',
                	success:function(){
                		var professionalsObj = result.responseJSON;
                        
                        var professionalsModel = document.getElementById("professionalsModel");
                        for(profNo in professionalsObj) {
                            var prof = professionalsObj[profNo];
                            if(prof.name == null || prof.designation == null || prof.address == null || prof.profilePicture == null) {
                                document.getElementById("noProfessionals").style.display = "initial";
                                return;
                            }
                            professionalsModel.children[0].setAttribute("src", "data:img/*;base64, " + prof.profilePicture);
                            professionalsModel.children[1].innerHTML = prof.name+", "+prof.designation;
                            professionalsModel.children[2].innerHTML = prof.address;
                            professionalsModel.parentElement.appendChild(professionalsModel.cloneNode(true));
                        }
                        document.getElementById("professionalsModel").remove();
                        document.getElementById("professionals").style.display = "initial";
                		
                	}
                	
                	
                });
            }
        </script>
    </body>
</html>