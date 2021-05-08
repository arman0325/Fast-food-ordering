<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fast Food Ordering System</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="<c:url value="/assets/js/bootstrap.bundle.min.js" />"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main class="container">
            <div class="py-5 px-3 mt-5">
                <c:choose>
                    <c:when test="${fn:length(menuDatabase) == 0}">
                        <h2> <spring:message code="orderSystem.noneValue" /></h2>
                    </c:when>
                    <c:otherwise>
                        <spring:message code="orderSystem.listTitle" /><br /><br />
                        <c:forEach items="${menuDatabase}" var="entry" varStatus="loop">
                            ${loop.index + 1}. <a href="<c:url value="/menu/view/${entry.id}" />">
                                <c:out value="${entry.foodName}" /></a>

                            <security:authorize access="isAuthenticated()">
                                <c:if test="${entry.availability==true}">
                                    [<a href="<c:url value="/menu/addToCart/${entry.id}" />"><spring:message code="orderSystem.addToCart" /></a>]
                                </c:if>
                            </security:authorize>

                            <security:authorize access="hasRole('ADMIN')">
                                [<a href="<c:url value="/menu/availability/${entry.id}" />"><spring:message code="orderSystem.availability" /></a>]
                                [<a href="<c:url value="/menu/delete/${entry.id}" />"><spring:message code="orderSystem.delete" /></a>]
                            </security:authorize> 
                            <br />
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </body>
</html>

