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

        <h2><spring:message code="viewList.title" />${foodId}: <c:out value="${food.foodName}" /></h2>

        <i><c:out value="${food.description}" /></i><br /><br />
        <spring:message code="viewList.price" />: $<c:out value="${food.price}" /><br /><br />
        <spring:message code="viewList.ava" />: <c:out value="${food.availability}" /><br /><br />
        <c:if test="${food.numberOfAttachments > 0}">
            Attachments:
            <c:forEach items="${food.attachments}" var="attachment"
                       varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="<c:url value="/menu/${foodId}/attachment/${attachment.name}" />">
                    <c:out value="${attachment.name}" /></a>
            </c:forEach><br /><br />
        </c:if>
        <a href="<c:url value="/menu" />"><spring:message code="viewList.backURL" /></a>
        <br /><br /><h2><spring:message code="viewList.comTitle" /></h2>

        <security:authorize access="isAuthenticated()">
            <form:form method="POST" enctype="multipart/form-data"
                       modelAttribute="commentForm">
            <sec:authentication var="user" property="principal.username" />
            <c:out value="${user}" />
            <input type="hidden" name="name" value="${user}" />
            <input type="hidden" name="id" value="${foodId}"/>
            <form:textarea path="body" rows="5" cols="30" /><br />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="<spring:message code="viewList.comBtn" />"/>
        </form:form>
    </security:authorize>

    <br />
    <c:choose>
        <c:when test="${fn:length(commentDatabase) == 0}">
            <i>There are no comment in the system for this fast food.</i>
        </c:when>
        <c:otherwise>
            <table>
                <c:forEach items="${commentDatabase}" var="entry">
                    <tr>
                        <th>${entry.value.userName}</th>
                        <th>${entry.value.contents}</th>
                        <th><security:authorize access="hasRole('ADMIN')">
                                [<a href="<c:url value="/menu/view/${foodId}/delete/${entry.key}" />">Delete</a>]
                            </security:authorize> </th>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>

