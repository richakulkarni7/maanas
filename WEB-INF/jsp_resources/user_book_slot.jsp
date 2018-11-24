<!--TODO: Change the JSON format: content is same, just the structuring-->
<!--TODO: Adjust sidebar items color-->
<!--TODO: Handle confirm and cancellation of appointment-->

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            .table-bordered > thead > tr > th {
                border:1px solid #DDD;
            }
            .table-bordered > tbody > tr > th {
                border:1px solid #DDD;
            }
            .table-bordered > tbody > tr > td {
                border:1px solid #DDD;
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
            <div style="height:45%;"></div>
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
            <div style="height:85vh; background:#F8F9FA;">
                <div style="height:85vh; margin:12px; background:#FFF;">
                    <div style="height:7.5vh; display:flex; flex-direction:row; align-items:center; padding-left:8px;">
                        <p style="color:#74838B; font-size:14px; padding: 0 0 0 4px; margin:0; width:70%;">Richard Roe, Therapist, MBBS</p>
                    </div>
                    <div style="overflow:auto;">
                        <div id="slotsModel" style="display:flex; flex-direction:row; align-items:center; justify-content:space-around; border-top:1px solid #DDD; min-height:150px;">
                            <div id="dateModel" style="width:20%; height:150px; min-width:100px; display:flex; flex-direction:column; flex-wrap:wrap; justify-content:center; align-items: center; color:#A7A7A7;"></div>
                            <div id="timeModel" style="width:80%; display:flex; flex-direction:row; flex-wrap:wrap; justify-content:flex-start; align-items: flex-start; padding:12px;">
                                <div id="slotModel" style="height:33px; width:85px; border:1px solid #DDD; border-radius:4px; margin:8px; display:flex; justify-content:center; align-items:center; color:#A7A7A7;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="askConfirmationModal" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body" style="padding:15px 30px;">
                                <p id="confirmQuery" style="color:#A7A7A7;"></p>
                                <div style="height:40px; display:flex; flex-direction:row; justify-content:space-around; align-items:center; padding:10px;">
                                    <button id="confirmButton" style="background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; cursor:pointer; height:30px; width:30%; min-width:35px; border-radius:4px;" onclick="confirmSlot(event)">Confirm</button>
                                    <button style="background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; cursor:pointer; height:30px; width:30%; min-width:35px; border-radius:4px;" onclick="$('#askConfirmationModal').modal('toggle')">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="slotStatusModal" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body" style="padding:15px 30px;">
                                <p id="slotStatus" style="color:#A7A7A7;"></p>
                                <div style="height:40px; display:flex; flex-direction:row; justify-content:space-around; align-items:center; padding:10px;">
                                    <button id="slotStatusButton" style="background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; cursor:pointer; height:30px; width:30%; min-width:35px; border-radius:4px;" onclick="handleBooking(event)">Ok</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
        	
        	var id = ${id}; 
        	var slots;
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
                
                var resp = $.ajax({url:'user_get_slots',method:'get',data:'&id='+id,success:function(){
                	slots= resp.responseJSON;
                	showSlots();
                }
                	
                });
                
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
            
            var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
            var times = ["1970-01-01T09:00:00+05:30", "1970-01-01T09:30:00+05:30", "1970-01-01T10:00:00+05:30", "1970-01-01T10:30:00+05:30", "1970-01-01T11:00:00+05:30", "1970-01-01T11:30:00+05:30", "1970-01-01T12:00:00+05:30", "1970-01-01T12:30:00+05:30", "1970-01-01T13:00:00+05:30", "1970-01-01T13:30:00+05:30", "1970-01-01T14:00:00+05:30", "1970-01-01T14:30:00+05:30", "1970-01-01T15:00:00+05:30", "1970-01-01T15:30:00+05:30", "1970-01-01T16:00:00+05:30", "1970-01-01T16:30:00+05:30", "1970-01-01T17:00:00+05:30", "1970-01-01T17:30:00+05:30", "1970-01-01T18:00:00+05:30", "1970-01-01T18:30:00+05:30", "1970-01-01T19:00:00+05:30", "1970-01-01T19:30:00+05:30", "1970-01-01T20:00:00+05:30", "1970-01-01T20:30:00+05:30"];
           // var slots;
             
            var dates = new Array();
            
            function showSlots() {
                var prevDate = -1;
                dates = [];
                for(slot in slots) {
                    var thisDate = new Date(slots[slot].date);
                    if(dates.indexOf(thisDate.toLocaleDateString()) == -1) {
                        dates.push(thisDate.toLocaleDateString());
                        document.getElementById("timeModel").innerHTML = document.getElementById("slotModel").outerHTML;
                        for(var i in times) {
                            var slotModel = document.getElementById("slotModel");
                            var time = new Date(times[i]);
                            slotModel.innerHTML = time.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true});
                            var newSlot = slotModel.cloneNode(true);
                            newSlot.removeAttribute("id");
                            newSlot.style.display="flex";
                            slotModel.parentElement.appendChild(newSlot);
                        }
                        document.getElementById("slotModel").style.display="none";
                        var dateModel = document.getElementById("dateModel");
                        dateModel.innerHTML = "<p style='color:#A7A7A7'>"+days[thisDate.getDay()]+"</p><p style='color:#555;'>"+thisDate.getDate()+"/"+(thisDate.getMonth()+1)+"/"+thisDate.getFullYear()+"</p>";
                        
                        var slotsModel = document.getElementById("slotsModel");
                        var newSlots = slotsModel.cloneNode("true");
                        newSlots.removeAttribute("id");
                        slotsModel.parentElement.appendChild(newSlots);
                        // change color
                        var dateIndex = parseInt(getDateIndex(thisDate));
                        var timeIndex = parseInt(getTimeIndex(thisDate));
                        if(dateIndex != -1 && timeIndex != -1 && slots[slot].status == "available") {
                            var availableSlot = document.getElementById("slotsModel").parentElement.children[1+dateIndex].children[1].children[1+timeIndex];
                            availableSlot.style.color = "#4285F4";
                            availableSlot.style.borderColor = "#4285F4";
                            availableSlot.style.cursor = "pointer";
                            (function (dateTime) {
                                availableSlot.addEventListener('click', function() {
//                                    if (confirm("Confirm appointment on "+dateTime.toLocaleDateString("en-GB")+" at "+dateTime.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true})+"?")) {
//                                        console.log("Confirmed");
//                                        var form = document.createElement("form");
//                                        var element1 = document.createElement("input");
//                                        var element2 = document.createElement("input");
//                                        
//                                        form.method = 'post';
//                                        form.action = 'user_confirm_slot';
//                                        
//                                        element1.name = 'date';
//                                        element1.value = dateTime;
//                                        
//                                        element2.name = 'id';
//                                        element2.value = id;
//                                        
//                                        form.appendChild(element1);
//                                        form.appendChild(element2);
//                                        
//                                        document.body.appendChild(form);
//                                        
//                                        form.submit();
//                                        
//                                    } else {
//                                        console.log("Cancelled");
//                                    }
                                    document.getElementById('confirmQuery').innerHTML = "Confirm appointment on "+dateTime.toLocaleDateString("en-GB")+" at "+dateTime.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true})+"?";
                                    document.getElementById('confirmButton').value = dateTime.toISOString();
                                    $('#askConfirmationModal').modal();
                                });
                            })(thisDate);
                        }
                    }
                    else {
                        // change color
                        var dateIndex = parseInt(getDateIndex(thisDate));
                        var timeIndex = parseInt(getTimeIndex(thisDate));
                        if(dateIndex != -1 && timeIndex != -1 && slots[slot].status == "available") {
                            var availableSlot = document.getElementById("slotsModel").parentElement.children[1+dateIndex].children[1].children[1+timeIndex];
                            availableSlot.style.color = "#4285F4";
                            availableSlot.style.borderColor = "#4285F4";
                            availableSlot.style.cursor = "pointer";
                            (function (dateTime) {
                                availableSlot.addEventListener('click', function() {
//                                    if (confirm("Confirm appointment on "+dateTime.toLocaleDateString("en-GB")+" at "+dateTime.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true})+"?")) {
//                                        console.log("Confirmed");
//                                        var form = document.createElement("form");
//                                        var element1 = document.createElement("input");
//                                        var element2 = document.createElement("input");
//                                        
//                                        form.method = 'post';
//                                        form.action = 'user_confirm_slot';
//                                        
//                                        element1.name = 'date';
//                                        element1.value = dateTime;
//                                        
//                                        element2.name = 'id';
//                                        element2.value = id;
//                                        
//                                        form.appendChild(element1);
//                                        form.appendChild(element2);
//                                        
//                                        document.body.appendChild(form);
//                                        
//                                        form.submit();
//                                    } else {
//                                        console.log("Cancelled");
//                                    }
                                    document.getElementById('confirmQuery').innerHTML = "Confirm appointment on "+dateTime.toLocaleDateString("en-GB")+" at "+dateTime.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true})+"?";
                                    document.getElementById('confirmButton').value = dateTime.toISOString();
                                    $('#askConfirmationModal').modal();
                                });
                            })(thisDate);
                        }
                    }
                }
                document.getElementById("slotsModel").style.display = "none";
            }
            
            function confirmSlot(event) {
                var dateTime = new Date(event.target.value);
              	var dateISO = dateTime.toISOString();
				var result = $.ajax({
					url:'user_confirm_slot',
					method: 'post',
					data: '&date='+dateISO+'&id='+id,
					error:function(){
                        document.getElementById("slotStatusButton").value = result.responseText;
                        console.log(result.responseText);
                        if(document.getElementById("slotStatusButton").value == "success") {
                            document.getElementById("slotStatus").innerHTML = "Your slot is booked on "+dateTime.toLocaleDateString("en-GB")+" at "+dateTime.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true});
                            $('#slotStatusModal').modal();
                        }
						else {
                            document.getElementById("slotStatus").innerHTML = "Could not book slot on "+dateTime.toLocaleDateString("en-GB")+" at "+dateTime.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true});
							$('#slotStatusModal').modal();
                        }
                     }   
					
				});
				
                
            }
            
            function handleBooking(event) {
                if(event.target.value == "success") {
                    // redirect to user's dashboard
                    window.location = "user_dashboard";
                }
                else {
                    $('#slotStatusModal').modal('toggle');
                    $('#askConfirmationModal').modal('toggle');
                }
            }
            
            function getDateIndex(date) {
                for(var i in dates) {
                    if(dates[i] == date.toLocaleDateString())
                        return i;
                }
                return -1;
            }
            
            function getTimeIndex(date) {
                for(var i in times) {
                    if((new Date(times[i])).toLocaleTimeString() == date.toLocaleTimeString())
                        return i;
                }
                return -1;
            }
        </script>
    </body>
</html>