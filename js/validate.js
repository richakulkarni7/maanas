function validate()
{ 
   var name=document.StudentRegistration.textnames.value;
   var ref=/^[A-Za-z ]+$/;
   if(!ref.test(name) )
   {
     alert( "Re-enter your Name!" );
     document.StudentRegistration.textnames.focus() ;
     return false;
   }
   
   if( document.StudentRegistration.personaladdress.value === "" )
   {
     alert( "Please provide your Personal Address!" );
     document.StudentRegistration.personaladdress.focus() ;
     return false;
   }
   if ( ( StudentRegistration.sex[0].checked === false ) && ( StudentRegistration.sex[1].checked === false ) )
   {
   alert ( "Please choose your Gender: Male or Female" );
   return false;
   }   
   if( document.StudentRegistration.State.value == "-1" )
   {
     alert( "Please provide your Select State!" );
     return false;
   }
   if( document.StudentRegistration.pincode.value === "" ||
           isNaN( document.StudentRegistration.pincode.value) ||
           document.StudentRegistration.pincode.value.length != 6 )
   {
     alert( "Please provide a pincode in the format ######." );
     document.StudentRegistration.pincode.focus() ;
     return false;
   }
	
  var email = document.StudentRegistration.emailid.value;
var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
 if (!reg.test(email))
	{
		alert("Please enter correct email");
		return false;
	} 
  var db= document.StudentRegistration.dob.value;
	var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
    if (db === null || db === "" || !pattern.test(db)) {
        alert("Please enter correct DOB");
        return false;
    }
  
  if( document.StudentRegistration.mobileno.value === "" ||
           isNaN( document.StudentRegistration.mobileno.value) ||
           document.StudentRegistration.mobileno.value.length != 10 )
   {
     alert( "Please provide a Mobile No in the format 123." );
     document.StudentRegistration.mobileno.focus() ;
     return false;
   }
   return( true );
}