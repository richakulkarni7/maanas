function validate_contactform()
{ 
  var email = document.contactform.email.value;
  if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(patient.email.value)===false)
  {
  alert("You have entered an invalid email address!");
  return false;
  }
  var msge = document.contactform.msg.value;
	if(msge==" ")
	{
		alert("Please enter the message");
	}
}