<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fast Food Ordering System</title>
    </head>
    <body>
        <h2>Fast Food Ordering System</h2>
        <security:authorize access="hasRole('ADMIN')">
            <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Logout" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <br />
        </security:authorize>

        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login" />"><button>Login</button></a><br /><br />
        </security:authorize>
        <c:choose>
            <c:when test="${fn:length(menuDatabase) == 0}">
                <i>There are no fast food in the system for ordering.</i>
            </c:when>
            <c:otherwise>
                List of Fast Foods:<br /><br />
                <c:forEach items="${menuDatabase}" var="entry" varStatus="loop">
                    ${loop.index + 1}. <a href="<c:url value="/menu/view/${entry.key}" />">
                        <c:out value="${entry.value.foodName}" /></a>

                    <security:authorize access="isAuthenticated()">
                        [<a href="<c:url value="/menu/addToCart/${entry.key}" />">Add to cart</a>]
                    </security:authorize>

                    <security:authorize access="hasRole('ADMIN')">
                        [<a href="<c:url value="/ticket/edit/${entry.key}" />">Edit</a>]
                        [<a href="<c:url value="/ticket/delete/${entry.key}" />">Delete</a>]
                    </security:authorize> 
                    <br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>

