<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fast Food Ordering System</title>
    </head>
    <body>
        <h2><spring:message code="orderSystem.title" /></h2>
        <a href="?language=en">Eng</a>
        <a href="?language=zh">中文</a>
        
        <security:authorize access="hasRole('ADMIN')">
            <a href="<c:url value="/user" />"><spring:message code="orderSystem.manageAccount" /></a><br /><br />
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="<spring:message code="orderSystem.logout" />" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <br />
        </security:authorize>

        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login" />"><button><spring:message code="login.title" /></button></a><br /><br />
        </security:authorize>
        <c:choose>
            <c:when test="${fn:length(menuDatabase) == 0}">
                <h2> <spring:message code="orderSystem.noneValue" /></h2>
            </c:when>
            <c:otherwise>
                <spring:message code="orderSystem.listTitle" /><br /><br />
                <c:forEach items="${menuDatabase}" var="entry" varStatus="loop">
                    ${loop.index + 1}. <a href="<c:url value="/menu/view/${entry.key}" />">
                        <c:out value="${entry.value.foodName}" /></a>

                    <security:authorize access="isAuthenticated()">
                        [<a href="<c:url value="/menu/addToCart/${entry.key}" />"><spring:message code="orderSystem.addToCart" /></a>]
                    </security:authorize>

                    <security:authorize access="hasRole('ADMIN')">
                        [<a href="<c:url value="/ticket/edit/${entry.key}" />"><spring:message code="orderSystem.edit" /></a>]
                        [<a href="<c:url value="/ticket/delete/${entry.key}" />"><spring:message code="orderSystem.delete" /></a>]
                    </security:authorize> 
                    <br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>

