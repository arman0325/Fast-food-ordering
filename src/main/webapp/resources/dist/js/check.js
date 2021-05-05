function validateForm() {
  var pwd = "{noop}"+document.forms["User"]["oldPwd"].value;
  var oldPwd = document.forms["User"]["oldPwdC"].value;
  if (pwd == "") {
    alert("Please input the old password");
    return false;
  }
  else if (pwd == oldPwd){
  	return true;
  }
  else{
  	alert("The old password is wrong.");
  	return false;
  }
}