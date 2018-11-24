<!DOCTYPE html>
<html>
<head>
	<title>Patient Sign Up</title>
	  <script type="text/javascript" src="js/validate_patient.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
		* {box-sizing: border-box; font-size: 15px;}
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
		.myFooter {
                left: 0;
                bottom: 0;
                width: 100%;
                height: 6vh;
                background-color: #2196F3;
                color: white;
                text-align: center;
                margin-top: 2vh;
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
                </ul>
            </div>
        </div>
    </nav>
	<div class = "container"  style="width:35%; height:70%; border:0px; border-radius: 10px">
					<form name = "patient" action="user_signup" method = "post" style="border:0px solid #ccc">
					    <h1 align = "center">Sign Up</h1>
					    <p align = "center">Please fill in this form to create an account.</p>
					    <hr>
              <label for="textnames"><b>Name</b></label>
					    <input type="text" placeholder="Enter Name" name="name" required>
					    <br>
					    <br>
					    <label for="email"><b>Email</b></label>
					    <input type="text" placeholder="Enter Email" name="email" required>
					    <br>
					    <br>
					    <label><b>Gender:   </b><br></label>

              <input type="radio" name="gender" value="male" size="10">Male
              <input type="radio" name="gender" value="female" size="10">Female
              <input type="radio" name="gender" value="other" size="10">Other
              <br>
              <br>
              <label for="mobileno"><b>Mobile Number:   </b><br></label><br>
              <input type="text" placeholder="Enter Mobile Number" name="mobileNo" id="mobileNo" required><br>

					    <label for="psw"><b>Password</b></label>
					    <input type="password" placeholder="Enter Password" name="password" required>
					    <br>	
					    <label for="psw-repeat"><b>Confirm Password</b></label>
					    <input type="password" placeholder="Confirm Password" name="passwordRepeat" required>
					    <br>
					    <div class="clearfix" style="display: flex; justify-content: center;">
					      <button type="submit" class="signupbtn" onclick="validate_patient()">Sign Up</button>
					    </div>
					    <br>
					    <p style="text-align: center;"> Already have an account? <a href = "#">Sign in</a>. </p>
					</form>
	</div>
	<footer class = "navbar-default myFooter">
            <div class = "container-fluid" style="vertical-align: middle; font-size: 80%; margin: auto;">
                <br>
                <div class = "row" style="padding: 0;">
                    <div class = "col-sm-3 col-xs-4" > 2018  </div>
                    <div class = "col-sm-3 col-xs-0"> </div>
                    <div class = "col-sm-3 col-xs-0">
                        <a href = "#" target = "_blank" style="color: white;">Contact Us</a>
                    </div>
                    <div class = "col-sm-1 col-xs-4" style="text-align: center;">
                        <a href = "#" target = "_blank" style="color: white;"> <img src = "images\facebook_small.png" style="vertical-align: middle; text-decoration: none; "> Facebook </a>
                    </div>
                    <div class= "col-sm-1 col-xs-0"> </div>
                    <div class = "col-sm-1 col-xs-4" style="text-align: center;">
                        <a href = "#" target = "_blank" style="color: white;"> <img src = "images\twitter_small.png" style="vertical-align: middle; text-decoration: none; "> Twitter </a>
                    </div>
                </div>
            </div>
        </footer>
</body>
</html>