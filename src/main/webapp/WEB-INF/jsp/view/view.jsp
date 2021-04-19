<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fast Food Ordering System</title>
    </head>
    <body>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Logout" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <br />
        </security:authorize>

        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login" />"><button>Login</button></a><br />
        </security:authorize>

        <h2>Fast Food #${foodId}: <c:out value="${food.foodName}" /></h2>

        <i><c:out value="${food.description}" /></i><br /><br />
        Price: $<c:out value="${food.price}" /><br /><br />
        Availability: <c:out value="${food.availability}" /><br /><br />
        <c:if test="${food.numberOfAttachments > 0}">
            Attachments:
            <c:forEach items="${food.attachments}" var="attachment"
                       varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="<c:url value="/menu/${foodId}/attachment/${attachment.name}" />">
                    <c:out value="${attachment.name}" /></a>
            </c:forEach><br /><br />
        </c:if>
        <a href="<c:url value="/menu" />">Return to list fast foods</a>
    </body>
</html>

