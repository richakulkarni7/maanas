function validate1()
{ 
    var name=document.appointment.textnames.value;
   var ref=/^[A-Za-z]+$/;
   console.log("%");
   if(!ref.test(name))
   {
     alert( "Invlaid name!" );
     document.appointment.textnames.focus() ;
     return false;
   }
    if( document.appointment.mobilenumber.value === "" ||
           isNaN( document.appointment.mobilenumber.value) ||
           document.appointment.mobilenumber.value.length != 10 )
   {
     alert( "Please provide a Mobile No in the format 123." );
     document.appointment.mobilenumber.focus();
     return false;
   }
   if ( ( appointment.gender[0].checked === false ) && ( appointment.gender[1].checked === false ) )
   {
   alert ( "Please choose your Gender: Male or Female" );
   return false;
   }   
   var age=document.getElementById('ageTextBox').value;
age = parseInt(age, 10);
if (isNaN(age) || age < 1 || age > 100)
{ 
  alert("The age must be a number between 1 and 100");
  return false;
  }
  return( true );
}