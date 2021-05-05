<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title><spring:message code="edit.title" /></title>
    </head>
    <body>
        <h2><spring:message code="edit.title" /></h2>
            <form:form method="POST" enctype="multipart/form-data" modelAttribute="User">
                <p><spring:message code="edit.info" /></p>
                <div class="form-group">
                    <form:label path="password"><spring:message code="edit.pwd" /></form:label>
                    <form:input type="password" path="password" required="required" class="form-control" />
                </div>
                <div class="form-group">
                    <form:checkbox path="roles" value="ROLE_USER" checked="true"/>ROLE_USER
                </div>
                <div class="form-group">
                    <security:authorize access="hasRole('ADMIN')">
                        <form:checkbox path="roles" value="ROLE_ADMIN" />ROLE_ADMIN
                    </security:authorize>
                </div>
                <div class="form-group">
                    <form:label path="fullName"><spring:message code="edit.fullName" /></form:label>
                    <form:input type="text" path="fullName" class="form-control" />
                </div>
                <div class="form-group">
                    <form:label path="phone"><spring:message code="edit.phone" /></form:label>
                    <form:input type="tel" path="phone" pattern="[0-9]{8}" minlength="8" maxlength="8" class="form-control" />
                </div>
                <div class="form-group">
                    <form:label path="address"><spring:message code="edit.address" /></form:label>
                    <form:input type="text" path="address" class="form-control" />
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form:form>
    </body>
</html>
