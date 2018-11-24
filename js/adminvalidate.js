function validate_admin()
{ 
  var email = document.admin.email.value;
  if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(admin.email.value)===false)
  {
  alert("You have entered an invalid email address!");
  return false;
  }
	
  if(admin.psw.value !== "" && admin.psw.value == admin.pswcfm.value)
	{
      if(admin.psw.value.length < 6)
	  {
        alert("Error: Password must contain at least six characters!");
        admin.psw.focus();
        return false;
      }
      
      re = /[0-9]/;
      if(!re.test(admin.psw.value)) 
	  {
        alert("Error: password must contain at least one number (0-9)!");
        admin.psw.focus();
        return false;
      }
      
    }
	else 
	{
      alert("Error: passwords do not match");
      admin.psw.focus();
      return false;
    }
	if( document.admin.mobilenumber.value === "" ||
           isNaN( document.admin.mobilenumber.value) ||
           document.admin.mobilenumber.value.length != 10 )
   {
     alert( "Please enter a valid mobile number " );
     document.admin.mobilenumber.focus();
     return false;
   }
 }