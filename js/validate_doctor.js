function validate_doctor()
{ 
    var name = document.DoctorRegistration.name.value;
    var ref=/^[A-Za-z]+$/;
    if(!ref.test(name))
    {
        alert( "Invalid Name!" );
        document.DoctorRegistration.name.focus() ;
        return false;
    }
    if(document.DoctorRegistration.mobile.value === "" || isNaN( document.DoctorRegistration.mobile.value) || document.DoctorRegistration.mobile.value.length != 10)
    {
        alert("Please enter a valid mobile number");
        document.DoctorRegistration.mobile.focus();
        return false;
    }
    if ((DoctorRegistration.gender[0].checked === false) && (DoctorRegistration.gender[1].checked === false))
    {
        alert ("Please choose your gender");
        document.DoctorRegistration.gender[0].focus();
        return false;
    } 
    if(document.DoctorRegistration.designation.value === "")
    {
        alert("Please provide your designation");
        document.DoctorRegistration.designation.focus();
        return false;
    }
    
    var email = document.DoctorRegistration.email.value;
    var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if (!reg.test(email))
    {
        alert("Please enter a correct email address");
        document.DoctorRegistration.email.focus();
        return false;
    } 
    var password = document.getElementById("password").value;
    var confirm_psw = document.getElementById("passwordRepeat").value;
    if(password !== confirm_psw)
    {
        alert("Passwords do not match");
        return false;
    }
    var fileName = document.DoctorRegistration.document.value;
    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
    ext = ext.toUpperCase();
    if(ext!="JPEG" || ext!="JPG" || ext!="PDF" || ext!="DOC" || ext!="DOCX" || ext!="ODT")
    {
        alert("Upload JPEG/JPG/PDF/DOC/DOCX/ODT files only");
        document.DoctorRegistration.document.focus();
        return false;
    }
    document.getElementById("form").submit();
}

function fillContent() {
    populateHealthCenterOptions();
}

var healthCentersData = '{"healthCenters":[{"id":1,"coordinates":{"lat":17.4185,"lng":78.4222},"name":"Hyderabad Health Center","address":"Hyderabad","website":"www.hyderabad.com"},{"id":2,"coordinates":{"lat":17.4361075,"lng":78.4222},"name":"Lorem Ipsum Health Center","address":"Hyderabad","website":"www.loremipsum.com"}]}';
var healthCentersObj = JSON.parse(healthCentersData);
function populateHealthCenterOptions() {
    var hc;
    var option = document.getElementById("healthCenterModel");
    for(hc in healthCentersObj.healthCenters) {
        option.value = healthCentersObj.healthCenters[hc].id;
        option.innerHTML = healthCentersObj.healthCenters[hc].name+", "+healthCentersObj.healthCenters[hc].address;
        document.getElementById("healthCenterID").appendChild(option.cloneNode(true));
    }
    option.style.display = "none";
}