<%-- 
    Document   : addUser
    Created on : 2021年4月27日, 上午11:58:19
    Author     : arman
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Create a User</h2>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="ticketUser">
            <div class="form-group">
                <form:label path="username">Username:</form:label>
                <form:input type="text" path="username" required="required"  class="form-control" />
            </div>
            <div class="form-group">
                <form:label path="password">Password:</form:label>
                <form:input type="password" path="password" required="required"  class="form-control" />
            </div>
            <br/>
            <form:checkbox path="roles" value="ROLE_USER" />ROLE_USER

            <security:authorize access="hasRole('ADMIN')">
                <form:checkbox path="roles" value="ROLE_ADMIN" />ROLE_ADMIN
            </security:authorize>
            <br /><br />
            <div class="form-group">
                <form:label path="fullName">Full name:</form:label>
                <form:input type="text" path="fullName" required="required" class="form-control" />
            </div>
            <div class="form-group">
                <form:label path="phone">Phone number:</form:label>
                <form:input type="tel" path="phone" pattern="[0-9]{8}" minlength="8" maxlength="8" required="required" class="form-control" />
            </div>
            <div class="form-group">
                <form:label path="address">Address</form:label>
                <form:input type="text" path="address" required="required"  class="form-control" />
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            <input type="submit" value="Add User"/>
        </form:form>
    </body>
</html>
