<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/validate_doctor.js"></script>
 
	<title>Doctor Sign Up</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
        ul {
            li: right;
        }
        .navbar-default .navbar-nav > li > a {
            color: black;
            font-weight: bold;
            margin: 0;
        }
        .navbar-header > a {
            color: black;
            font-weight: bold;
        }
        .navbar {
            margin:0;
        }
		* {
            box-sizing: border-box;
            font-size: 15px;
        }
        
		/* Full-width input fields */
        input[type=text], input[type=password] {
		    width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
		}
		input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
		}
		hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
		}
		/* Set a style for all buttons */
		button {
            background-color: #2196F3;
            color: white;
            padding: auto;
            height: 6vh;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
		}
		button:hover {
            opacity:1;
		}
		/* Extra styles for the cancel button */
		.cancelbtn {
            padding: auto;
            background-color: #f44336;
		}
		/* Float cancel and signup buttons and add an equal width */
		.cancelbtn, .signupbtn {
            margin: auto;
            width: 50%;
		}
		/* Add padding to container elements */
		.container {
            padding: 10vh auto;
            margin: auto;
		}
		/* Clear floats */
		.clearfix::after {
            content: "";
            clear: both;
            display: table;
            visibility: hidden;
		}
		.sign-up {
			width: 100%;
			border: 2px;
			border-radius: 25px;
			background-color: white;
			margin: auto;
			padding: 5vh 5vh 3vh 5vh;
		}
		/* Change styles for cancel button and signup button on extra small screens */
		@media only screen and (max-width: 600px) {
            .cancelbtn, .signupbtn {
                width: 100%;
            }
            .sign-up {
                width: 100%;
                margin: 0;
            }
		}
	</style>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                <a class="navbar-brand" href="#">Maanas</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="get-started.html">Get Started</a></li> 
                    <li><a href="resources.html">Resources</a></li> 
                    <li><a href="faqs.html">FAQs</a></li> 
                    <li><a href="login.html">Login</a></li> 
                </ul>
            </div>
        </div>
    </nav>
     <script type="text/javascript">
  	$(document).ready(function(){
  		var healthCentersData = $.ajax({url : 'health_centers' , method : 'get', success: function(){var healthCentersObj=healthCentersData.responseJSON;
  	    var option = document.getElementById("healthCenterModel");
  	    for(var hc in healthCentersObj) {
  	        option.value = healthCentersObj[hc].id;
  	        option.innerHTML = healthCentersObj[hc].name+", "+healthCentersObj[hc].address;
  	        document.getElementById("healthCenterID").appendChild(option.cloneNode(true));
  	    }
  	    option.style.display = "none";
  		}});
  		
  	});
  
  </script>
    <div class = "container">
        <h2 align = "center">Join Us</h2>
            <p>If you are a professional working in the field of mental health, join us and contribute your services to improving the mental health of our communities. Individual licensed practitioners can apply to join us, either by themselves,m or through their hop</p>
        <hr>
    </div>
    <h2 align = "center">Sign Up</h2>
    <div class = "container" style="width:35%; height:70%; border:0px; border-radius: 10px">
        <form action="professional_signup" name="DoctorRegistration" id="form" method="post" enctype= "multipart/form-data">
            <label for="name"><b>Name</b></label>
            <input type="text" placeholder="Enter name" name="name" required><br>
            <label for="mobile"><b>Mobile</b></label>
            <input type="text" placeholder="Enter mobile number" name="mobile" required><br>
            <label for="gender"><b>Sex:</b><br/></label>
            <input type="radio" name="gender" id="male" value="male">Male
            <input type="radio" name="gender" id="female" value="female">Female<br/><br/>
            <label for="designation"><b>Designation</b></label>
            <input type="text" placeholder="Enter your designation" name="designation" required><br/>
            <label for="qualification"><b>Qualification(s)</b></label>
            <input type="text" placeholder="Enter your qualifications(s)" name="qualification" required><br/><br/>
            <label for="healthCenterID"><b>Health Center</b></label><br/>
            <select id="healthCenterID" name = "healthCenterID">
                <option id="healthCenterModel" value=""></option>
            </select>
            <p style="font-size:12px;">Can't find your Health Center? Register it <a href="register_health_center" style="font-size:12px;">here</a></p><br/>
            <label for="email"><b>Email</b></label><br/>
            <input type="text" placeholder="Enter Email" name="email" required><br/>
            <label for="password"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" id="password" required><br/>
            <label for="passwordRepeat"><b>Confirm Password</b></label>
            <input type="password" placeholder="Confirm Password" name="passwordRepeat" id="passwordRepeat" required><br/>
            <label for="document"><b>Document</b></label>
            <input type="file" name="document"  accept="image/*, .pdf, .doc, .docx, .odt" required><br/>
            <button value="Submit Form" type="submit">Submit</button>
        </form>	        		
    </div>
</body>
</html>