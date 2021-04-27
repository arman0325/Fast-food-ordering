<%-- 
    Document   : addUser
    Created on : 2021年4月27日, 上午11:58:19
    Author     : arman
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Registration user</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <h2><spring:message code="register.title" /></h2>
            <form:form method="POST" enctype="multipart/form-data"
                       modelAttribute="ticketUser">
                <div class="form-group">
                    <form:label path="username"><spring:message code="register.username" /></form:label>
                    <form:input type="text" path="username" required="required"  class="form-control" />
                </div>
                <div class="form-group">
                    <form:label path="password"><spring:message code="register.pwd" /></form:label>
                    <form:input type="password" path="password" required="required"  class="form-control" />
                </div>
                <br/>
                <form:checkbox path="roles" value="ROLE_USER" checked="true"/>ROLE_USER

                <security:authorize access="hasRole('ADMIN')">
                    <form:checkbox path="roles" value="ROLE_ADMIN" />ROLE_ADMIN
                </security:authorize>
                <br /><br />
                <div class="form-group">
                    <form:label path="fullName"><spring:message code="register.fullName" /></form:label>
                    <form:input type="text" path="fullName" required="required" class="form-control" />
                </div>
                <div class="form-group">
                    <form:label path="phone"><spring:message code="register.phone" /></form:label>
                    <form:input type="tel" path="phone" pattern="[0-9]{8}" minlength="8" maxlength="8" required="required" class="form-control" />
                </div>
                <div class="form-group">
                    <form:label path="address"><spring:message code="register.address" /></form:label>
                    <form:input type="text" path="address" required="required"  class="form-control" />
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form:form>
        </div>
    </body>
</html>
