<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                    <img src="images/maleUser.png" style="border-radius:50%; width:60%; margin-right:4%;"/>
                </div>
                <div style="width:60%; display:flex; flex-direction:column; justify-content:center; font-size:12px; color:#4285F4;">
                    <p style="margin:0;">Richard Roe</p>
                    <p style="margin:0;">Therapist</p>
                </div>
            </div>
            <!--Navigation Items-->
            <div id="sidebarItemModel" style="width:100%; height:8%; display:flex; border:1px solid #E6EBF1;">
                <div style="width:2%; height:100%; background:#4285F4"></div>
                <div style="width:93%; height:100%; display:flex; justify-content:flex-start; align-items:center; font-size:12px; padding-left:16%; color:#74838B;"></div>
                <div style="width:5%; height:100%; display:flex; justify-content:flex-start; align-items:center; font-size:12px; padding-right:12%; color:#74838B;">&gt;</div>
            </div>
            <div style="height:37%;"></div>
            <div style="width:100%; height:8%; display:flex; border:1px solid #E6EBF1;">
                <div style="width:2%; height:100%; background:#FFF"></div>
                <div style="width:93%; height:100%; display:flex; justify-content:flex-start; align-items:center; font-size:12px; padding-left:16%; color:#74838B;"><a href="professional_logout">Sign Out</a></div>
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
                    <!--Upcoming Appointments Column-->
                    <div class="col-sm-4" style="height:100%; display:flex; flex-direction:column; align-items:center; justify-content:space-around; background:#F8F9FA;">
                        <div style="height:94.5%; width:80%; background:#FFF; overflow-y:auto; overflow-x:hidden; box-shadow:2px 2px 20px #AAA;">
                            <div id="nextAppts" style="height:100%; width:100%; display:initial;">
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
                    <!--Slots Column-->
                    <div class="col-sm-8" style="height:100%; display:flex; flex-direction:column; align-items:center; justify-content:space-around; background:#F8F9FA;">
                        <div style="height:94.5%; width:85%; background:#FFF; box-shadow:2px 2px 20px #AAA;">
                            <div style="height:10%; display:flex; flex-direction:row; margin-top:4px; padding-bottom:2px; border-bottom:1px solid #DDD;">
                                <div style="height:100%; width:60%; color:#74838B; font-weight:600; display:flex; align-items:center; padding-left:16px;">YOUR APPOINTMENTS</div>
                                <div style="height:100%; width:20%; display:flex; align-items:center; justify-content:center;">
                                    <button style="background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; cursor:pointer; height:30px; width:70%; min-width:35px; border-radius:6px;" data-toggle="modal" data-target="#editSlotsModal">Edit</button>
                                </div>
                                <div style="height:100%; width:20%; display:flex; flex-direction:column; align-items:space-around;">
                                    <div style="height:33%;display:flex; flex-direction:row; align-items:center; justify-content:flex-end;">
                                        <div style="height:12px; width:12px; border-radius:50%; background:#87D37C;"></div>
                                        <div style="height:100%; width:4px;"></div>
                                        <div style="height:100%; width:70%; font-size:11px; color:#979797;">Available</div>
                                    </div>
                                    <div style="height:33%; display:flex; flex-direction:row; align-items:center; justify-content:flex-end;">
                                        <div style="height:12px; width:12px; border-radius:50%; background:#D24D57"></div>
                                        <div style="height:100%; width:4px;"></div>
                                        <div style="height:100%; width:70%; font-size:11px; color:#979797;">Booked</div>
                                    </div>
                                    <div style="height:33%; display:flex; flex-direction:row; align-items:center; justify-content:flex-end;">
                                        <div style="height:12px; width:12px; border-radius:50%; background:#A7A7A7;"></div>
                                        <div style="height:100%; width:4px;"></div>
                                        <div style="height:100%; width:70%; font-size:11px; color:#979797;">Not available</div>
                                    </div>
                                </div>
                            </div>
                            <div style="overflow:auto; height:90%;" id="currentSlots">
                                <div id="slotsModel" style="display:flex; flex-direction:row; align-items:center; justify-content:space-around; border-top:1px solid #DDD; min-height:150px;">
                                    <div id="dateModel" style="width:20%; height:150px; min-width:100px; display:flex; flex-direction:column; flex-wrap:wrap; justify-content:center; align-items: center; color:#A7A7A7;"></div>
                                    <div id="timeModel" style="width:80%; display:flex; flex-direction:row; flex-wrap:wrap; justify-content:flex-start; align-items: flex-start; padding:12px;">
                                        <div id="slotModel" style="height:33px; width:85px; border:1px solid #DDD; border-radius:4px; margin:8px; display:flex; justify-content:center; align-items:center; color:#A7A7A7;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Modal -->
            <div class="modal fade" id="editSlotsModal" role="dialog">
                <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="height:90vh;">
                    <div class="modal-body" style="height:100%;">
                        <div style="height:10%; display:flex; flex-direction:row; margin-top:4px; padding-bottom:2px; border-bottom:1px solid #DDD;">
                            <div style="height:100%; width:50%; color:#74838B; font-weight:500; display:flex; align-items:center; padding-left:16px;">EDIT YOUR APPOINTMENT SLOTS</div>
                            <div style="height:100%; width:30%; display:flex; align-items:center; justify-content:space-around;">
                                <button style="background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; cursor:pointer; height:30px; width:80px; min-width:45px; border-radius:6px;" onclick="postEdits()">Done</button>
                                <button style="background-color:#1C8FEB; border:none; color:white; text-align:center; text-decoration:none; cursor:pointer; height:30px; width:80px; min-width:45px; border-radius:6px;" onclick="cancelEdits()">Cancel</button>
                            </div>
                            <div style="height:100%; width:20%; display:flex; flex-direction:column; align-items:space-around;">
                                <div style="height:33%;display:flex; flex-direction:row; align-items:center; justify-content:flex-end;">
                                    <div style="height:12px; width:12px; border-radius:50%; background:#87D37C;"></div>
                                    <div style="height:100%; width:4px;"></div>
                                    <div style="height:100%; width:70%; font-size:11px; color:#979797;">Available</div>
                                </div>
                                <div style="height:33%; display:flex; flex-direction:row; align-items:center; justify-content:flex-end;">
                                    <div style="height:12px; width:12px; border-radius:50%; background:#D24D57"></div>
                                    <div style="height:100%; width:4px;"></div>
                                    <div style="height:100%; width:70%; font-size:11px; color:#979797;">Booked</div>
                                </div>
                                <div style="height:33%; display:flex; flex-direction:row; align-items:center; justify-content:flex-end;">
                                    <div style="height:12px; width:12px; border-radius:50%; background:#A7A7A7;"></div>
                                    <div style="height:100%; width:4px;"></div>
                                    <div style="height:100%; width:70%; font-size:11px; color:#979797;">Not available</div>
                                </div>
                            </div>
                        </div>
                        <div style="overflow:auto; height:82%;" id="editSlots">
                            <div id="slotsEditModel" style="display:flex; flex-direction:row; align-items:center; justify-content:space-around; border-top:1px solid #DDD; min-height:150px;">
                                <div id="dateEditModel" style="width:20%; height:150px; min-width:100px; display:flex; flex-direction:column; flex-wrap:wrap; justify-content:center; align-items: center; color:#A7A7A7;"></div>
                                <div id="timeEditModel" style="width:80%; display:flex; flex-direction:row; flex-wrap:wrap; justify-content:flex-start; align-items: flex-start; padding:12px;">
                                    <div id="slotEditModel" onclick="changeAvailability(this)" style="height:33px; width:85px; border:1px solid #DDD; border-radius:4px; margin:8px; display:flex; justify-content:center; align-items:center; color:#A7A7A7;"></div>
                                </div>
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
                populateSidebar();
                upcomingAppointment();
                showSlots();
                editSlots();
            }
            
            $('#editSlotsModal').on('shown.bs.modal',function(e){editSlots()})
            
            function populateSidebar() {
                var items = ["Dashboard", "Account Settings"];
                var links = ["#", "acct_settings_dashboard_doctor.html"];
                
                var sidebarItemModel = document.getElementById("sidebarItemModel");
                for(itemNo in items) {
                    var item = items[itemNo];
                    if(document.title == item)
                        sidebarItemModel.children[0].style.visibility = "visible";
                    else
                        sidebarItemModel.children[0].style.visibility = "hidden";
                    sidebarItemModel.children[1].innerHTML = "<a href='"+links[itemNo]+"'>"+item+"</a>";
                    if(document.title == item)
                        sidebarItemModel.children[1].style.color = "#000";
                    if(document.title == item)
                        sidebarItemModel.children[2].style.visibility = "visible";
                    else
                        sidebarItemModel.children[2].style.visibility = "hidden";
                    sidebarItemModel.parentElement.insertBefore(sidebarItemModel.cloneNode(true), sidebarItemModel);
                }
                sidebarItemModel.remove();
            }
            
            function upcomingAppointment() {
                var nextApptsJSON = '{"pastAppts":[{"patientName":"Jane Doe","patientAge":"21","patientGender":"Female","patientDiagnosis":"Lorem Ipsum","patientImage":"images/femaleUser.png","apptDateTime":"1970-01-01T00:00:00"},{"patientName":"Jane Doe","patientAge":"21","patientGender":"Female","patientDiagnosis":"Lorem Ipsum","patientImage":"images/femaleUser.png","apptDateTime":"1970-01-01T00:00:00"},{"patientName":"Jane Doe","patientAge":"21","patientGender":"Female","patientDiagnosis":"Lorem Ipsum","patientImage":"images/femaleUser.png","apptDateTime":"1970-01-01T00:00:00"},{"patientName":"Jane Doe","patientAge":"21","patientGender":"Female","patientDiagnosis":"Lorem Ipsum","patientImage":"images/femaleUser.png","apptDateTime":"1970-01-01T00:00:00"},{"patientName":"Jane Doe","patientAge":"21","patientGender":"Female","patientDiagnosis":"Lorem Ipsum","patientImage":"images/femaleUser.png","apptDateTime":"1970-01-01T00:00:00"},{"patientName":"Jane Doe","patientAge":"21","patientGender":"Female","patientDiagnosis":"Lorem Ipsum","patientImage":"images/femaleUser.png","apptDateTime":"1970-01-01T00:00:00"}]}';
                var nextApptsObj = JSON.parse(nextApptsJSON);
                
                var nextApptModel = document.getElementById("nextApptModel");
                for(apptNo in nextApptsObj.pastAppts) {
                    var appt = nextApptsObj.pastAppts[apptNo];
                    if(appt.patientName == null || appt.patientAge == null || appt.patientGender == null || appt.patientDiagnosis == null || appt.patientImage == null || appt.apptDateTime == null) {
                        document.getElementById("noNextAppts").style.display = "initial";
                        return;
                    }
                    var apptDateTime = new Date(appt.apptDateTime);
                    nextApptModel.firstElementChild.firstElementChild.setAttribute("src", appt.patientImage);
                    nextApptModel.lastElementChild.firstElementChild.innerHTML = appt.patientName+", "+appt.patientAge+", "+appt.patientGender+"<br/>"+appt.patientDiagnosis+"<br/>"+apptDateTime.toLocaleDateString()+" | "+apptDateTime.toLocaleTimeString();
                    nextApptModel.parentElement.appendChild(nextApptModel.cloneNode(true));
                }
                document.getElementById("nextApptModel").remove();
                document.getElementById("nextAppts").style.display = "initial";
            }
            
            var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
            var slots;
			var slotsJSON;
			var res;
			
            
            function showSlots() {
            	res = $.ajax({url:'professional_get_slots', method:'get',success:function(){
                	slotsJSON = res.responseText;
                	slots= JSON.parse(slotsJSON);
                	var prevDate = new Date("1970-01-01T00:00:00+05:30");
                    
                    document.getElementById("slotsModel").style.display = "flex";
                    document.getElementById("currentSlots").innerHTML = document.getElementById("slotsModel").outerHTML;
                    
                    var slotsModel = document.getElementById("slotsModel");
                    var dateModel = document.getElementById("dateModel");
                    var timeModel = document.getElementById("timeModel");
                    var slotModel = document.getElementById("slotModel");
                    var currentDate = dateModel, currentTimes = timeModel;
                    var slot;
                    for(slot in slots) {
                        var thisDate = new Date(slots[slot].date);
                        var thisDateStatus = slots[slot].status;
                        
                        // if thisDate never occured before
                        if(prevDate.toLocaleDateString() != thisDate.toLocaleDateString()) {
                            if(slot != 0) {
                                var prevSlots = slotsModel.cloneNode(true);
                                prevSlots.removeAttribute("id");
                                prevSlots.children[0].outerHTML = currentDate.outerHTML;
                                prevSlots.children[1].outerHTML = currentTimes.outerHTML;
                                slotsModel.parentElement.appendChild(prevSlots);
                            }
                            currentDate = dateModel.cloneNode(true);
                            currentDate.innerHTML = "<p style='color:#A7A7A7'>"+days[thisDate.getDay()]+"</p><p style='color:#555;'>"+thisDate.getDate()+"/"+(thisDate.getMonth()+1)+"/"+thisDate.getFullYear()+"</p>";
                            currentDate.removeAttribute("id");

                            currentTimes = timeModel.cloneNode(true);
                            currentTimes.innerHTML = "";
                            prevDate = thisDate;
                        }
                        var currentSlot = slotModel.cloneNode(true)
                        currentSlot.innerHTML = thisDate.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true});
                        currentSlot.removeAttribute("id");
                        if(thisDateStatus == "available") {
                            currentSlot.style.color = "#87D37C";
                            currentSlot.style.borderColor = "#87D37C";
                            currentSlot.style.cursor = "default";
                            currentSlot.setAttribute("class", "available");
                        }
                        else if(thisDateStatus == "booked") {
                            currentSlot.style.color = "#D24D57";
                            currentSlot.style.borderColor = "#D24D57";
                            currentSlot.style.cursor = "pointer";
                            currentSlot.setAttribute("class", "booked");
                        }
                        else {
                            currentSlot.style.cursor = "default";
                            currentSlot.setAttribute("class", "not-available");
                        }
                            
                        currentTimes.appendChild(currentSlot);
                        
                    }
                    if(slot > 0) {
                        var prevSlots = slotsModel.cloneNode(true);
                        prevSlots.children[0].outerHTML = currentDate.outerHTML;
                        prevSlots.children[1].outerHTML = currentTimes.outerHTML;
                        prevSlots.removeAttribute("id");
                        slotsModel.parentElement.appendChild(prevSlots);
                    }
                    document.getElementById("slotsModel").style.display = "none";
                }}); 
                
            }
            
            function editSlots() {
    			var tempRes = $.ajax({url:'professional_get_slots', method:'get',success:function(){
                	slotsJSON = tempRes.responseText;
                	slots= JSON.parse(slotsJSON);
                	console.log(slots);
                	editsNotPosted = [];
                	document.getElementById("slotsEditModel").style.display="flex";
                   document.getElementById("editSlots").innerHTML=document.getElementById("slotsEditModel").outerHTML;
                    var prevDate = new Date("1970-01-01T00:00:00+05:30");
                    
                    var slotsEditModel = document.getElementById("slotsEditModel");
                    var dateEditModel = document.getElementById("dateEditModel");
                    var timeEditModel = document.getElementById("timeEditModel");
                    var slotEditModel = document.getElementById("slotEditModel");
                    var currentDate = dateEditModel, currentTimes = timeEditModel;
                    var slot;
                    for(slot in slots) {
                        var thisDate = new Date(slots[slot].date);
                        var thisDateStatus = slots[slot].status;
                        
                        // if thisDate never occured before
                        if(prevDate.toLocaleDateString() != thisDate.toLocaleDateString()) {
                            if(slot != 0) {
                                var prevSlots = slotsEditModel.cloneNode(true);
                                prevSlots.removeAttribute("id");
                                prevSlots.children[0].outerHTML = currentDate.outerHTML;
                                prevSlots.children[1].outerHTML = currentTimes.outerHTML;
                                slotsEditModel.parentElement.appendChild(prevSlots);
                            }
                            currentDate = dateEditModel.cloneNode(true);
                            currentDate.innerHTML = "<p style='color:#A7A7A7'>"+days[thisDate.getDay()]+"</p><p style='color:#555;'>"+thisDate.getDate()+"/"+(thisDate.getMonth()+1)+"/"+thisDate.getFullYear()+"</p>";
                            currentDate.removeAttribute("id");

                            currentTimes = timeEditModel.cloneNode(true);
                            currentTimes.innerHTML = "";
                            
                            prevDate = thisDate;
                        }
                        var currentSlot = slotEditModel.cloneNode(true);
                        currentSlot.innerHTML = thisDate.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', hour12: true});
                        currentSlot.removeAttribute("id");
                        var myjson= JSON.stringify(slots);
                        currentSlot.setAttribute("data", slots[slot].date);
                        if(thisDateStatus == "available") {
                            currentSlot.style.color = "#87D37C";
                            currentSlot.style.borderColor = "#87D37C";
                            currentSlot.style.cursor = "pointer";
                            currentSlot.setAttribute("class", "available");
                        }
                        else if(thisDateStatus == "booked") {
                            currentSlot.style.color = "#D24D57";
                            currentSlot.style.borderColor = "#D24D57";
                            currentSlot.style.cursor = "default";
                            currentSlot.setAttribute("class", "booked");
                        }
                        else {
                            currentSlot.style.cursor = "pointer";
                            currentSlot.setAttribute("class", "not-available");
                        }
                        currentTimes.appendChild(currentSlot);
                    }
                    if(slot > 0) {
                        var prevSlots = slotsEditModel.cloneNode(true);
                        prevSlots.children[0].outerHTML = currentDate.outerHTML;
                        prevSlots.children[1].outerHTML = currentTimes.outerHTML;
                        prevSlots.removeAttribute("id");
                        slotsEditModel.parentElement.appendChild(prevSlots);
                    }
                    document.getElementById("slotsEditModel").style.display = "none";                	
    			
    			
    			}});
                
            } 

            var editsNotPosted = [];
            function changeAvailability(el) {
                var thisDate = el.getAttribute("data");
                editsNotPosted.push(el);
                for(slot in slots) {
                    if(thisDate == slots[slot].date) {
                        if (slots[slot].status == "available") {
                                slots[slot].status = "not-available";
                                el.style.background = "";
                                el.style.color = "#A7A7A7";
                                el.style.border = "1px solid #DDD";
                                break;
                        }
                        else if (slots[slot].status == "not-available") {       
                            slots[slot].status = "available";
                            el.style.background = "";
                            el.style.color = "#87D37C";
                            el.style.border = "1px solid #87D37C";
                            break;
                        }
                    }
                }
            }
            
            function postEdits() {
            	/* slotsJSON = JSON.stringify(slots) ;
            	var result = $.ajax({
            		url:'professional_update_slots',
            		method:'post',
            		data:'&slotsString='+slotsJSON;
            	});
    			res = $.ajax({url:'professional_get_slots', method:'post',success:function(){
                	slotsJSON = res.responseText;
                	slots= JSON.parse(slotsJSON);
                	showSlots();
                }});  */
                
                $('#editSlotsModal').modal('toggle');
                var slotsString = JSON.stringify(slots);
                var reslt = $.ajax({url:'professional_update_slots',method:'post',data:'&slotsString='+slotsString, success:function(){
                	showSlots();
                	editSlots();}
                });
            }
            
            function cancelEdits() {
                for(edit in editsNotPosted) {
                    var thisDate = editsNotPosted[edit].getAttribute("data");
                    for(slot in slots) {
                        if(thisDate == slots[slot].date) {
                            if (slots[slot].status == "available") {
                                slots[slot].status = "not-available";
                                editsNotPosted[edit].style.background = "";
                                editsNotPosted[edit].style.color = "#A7A7A7";
                                editsNotPosted[edit].style.border = "1px solid #DDD";
                                break;
                            }
                            else if (slots[slot].status == "not-available") {       
                                slots[slot].status = "available";
                                editsNotPosted[edit].style.background = "";
                                editsNotPosted[edit].style.color = "#87D37C";
                                editsNotPosted[edit].style.border = "1px solid #87D37C";
                                break;
                            }
                        }
                    }
                }
                editsNotPosted = [];
            }
            
            // When the modal is being closed, deselect all selected slots
            $('#editSlotsModal').on('hidden.bs.modal', function () {
                cancelEdits();
            })
        </script>
    </body>
</html>