<!DOCTYPE html>
<html>
    <head>
        <title>Fast Food Ordering System</title>
    </head>
    <body>
        <h2>Add New Food</h2>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="<spring:message code="orderSystem.logout" />" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <br />
        </security:authorize>

        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="foodForm">
            <form:label path="foodName">Food Name</form:label><br />
            <form:input type="text" path="foodName" required="required"/><br /><br />
            <form:label path="description">Description</form:label><br />
            <form:textarea path="description" rows="5" cols="30" required="required"/><br /><br />
            <form:label path="price">Price</form:label><br />
            <form:input type="number" step="0.1" path="price" min="0" required="required"/><br /><br />
            <form:radiobutton path="availability"  value="true" />Available
            <form:radiobutton path="availability"  value="false" />Not Available
            <br /><br />
            <b>Attachments</b><br />
            <input type="file" name="attachments" multiple="multiple" accept="image/*"/><br /><br />
            <input type="submit" value="Submit"/>
        </form:form>
    </body>
</html>
