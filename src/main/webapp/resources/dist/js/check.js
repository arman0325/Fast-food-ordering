function validateForm() {
  var pwd = document.forms["User"]["password"].value;
  var pwdCon = document.forms["User"]["passwordConfirm"].value;
  var pwdInput = "{noop}"+document.forms["User"]["oldPwd"].value;
  var oldPwd = document.forms["User"]["oldPwdC"].value;

  if(pwd != pwdCon){
    alert("The new password not match");
    return false;
  } 
  else if (pwdInput == "") {
    alert("Please input the old password");
    return false;
  }
  else if(pwdInput != oldPwd){
    alert("The old password is wrong.");
    return false;
  }

  if (pwdInput == oldPwd){
      if (pwd==""){
         document.User.password.value=oldPwd.replace("{noop}","");
      } 
  }


  
}


function showPwd() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}