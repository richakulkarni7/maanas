function validate_patient()
{ 
   var name=document.patient.textnames.value;
   var ref=/^[A-Za-z]+$/;
   if(!ref.test(name))
   {
     alert( "InValid Name!" );
     document.patient.textnames.focus() ;
     return false;
   }
  var email = document.patient.email.value;
  if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(patient.email.value)===false)
  {
  alert("You have entered an invalid email address!");
  return false;
  }
	if ( ( patient.sex[0].checked === false ) && ( patient.sex[1].checked === false ) && (patient.sex[2].checked === false) )
   {
   alert ( "Please choose your Gender" );
   return false;
   }   
   if( document.patient.mobileno.value === "" ||
           isNaN( document.patient.mobileno.value) ||
           document.patient.mobileno.value.length != 10 )
   {
     alert( "Please provide a valid Mobile No " );
     document.patient.mobileno.focus() ;
     return false;
   }
  if(patient.psw.value !== "" && patient.psw.value == patient.pswcfm.value)
		{
      if(patient.psw.value.length < 6) {
        alert("Error: Password must contain at least six characters!");
        patient.psw.focus();
        return false;
      }
      
      re = /[0-9]/;
      if(!re.test(patient.psw.value)) {
        alert("Error: password must contain at least one number (0-9)!");
        patient.psw.focus();
        return false;
      }
      
    } else {
      alert("Error: passwords do not match");
      patient.psw.focus();
      return false;
    }

    alert("successful login");
    return true;
 
}   