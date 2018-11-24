function validate_acctsettings()
{ 
  var email = document.acctsettings.email.value;
  if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(acctsettings.email.value)===false)
  {
  alert("You have entered an invalid email address!");
  return false;
  }
	
  if(document.acctsettings.psw.value !== "" && document.acctsettings.psw.value == acctsettings.pswcfm.value)
	{
      if(document.acctsettings.psw.value.length < 6)
	  {
        alert("Error: Password must contain at least six characters!");
        document.acctsettings.psw.focus();
        return false;
      }
      
      re = /[0-9]/;
      if(!re.test(document.acctsettings.psw.value)) 
	  {
        alert("Error: password must contain at least one number (0-9)!");
        document.acctsettings.psw.focus();
        return false;
      }
      
    }
	else 
	{
      alert("Error: passwords do not match");
      document.acctsettings.psw.focus();
      return false;
    }
	if( document.acctsettings.mobilenumber.value === "" ||
           isNaN( document.acctsettings.mobilenumber.value) ||
           document.acctsettings.mobilenumber.value.length != 10 )
   {
     alert( "Please enter a valid mobile number " );
     document.acctsettings.mobilenumber.focus();
     return false;
   }
	
	

    alert("successful login");
    return true;
 
}   