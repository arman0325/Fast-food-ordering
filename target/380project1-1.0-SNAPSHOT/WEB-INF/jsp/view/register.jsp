<%-- 
    Document   : register
    Created on : 2021年4月20日, 上午11:01:23
    Author     : arman
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
    </head>
    <body>
        <div class="form-control" >
            <form class="form-horizontal" role="form" action="register" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required="required"  class="form-control" />
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required="required"  class="form-control" />
                </div>
                <div class="form-group">
                    <label  for="ConfirmPwd">Confirm password:</label>
                    <input type="password" id="ConfirmPwd" name="ConfirmPwd" required="required"  class="form-control" />
                </div>
                <div class="form-group">
                    <label for="fullName">Full name:</label>
                    <input type="text" id="fullName" name="fullName" required="required" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="phone">Phone number:</label>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" minlength="8" maxlength="8" required="required" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required="required"  class="form-control" />
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </body>
</html>
