<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fast Food Ordering System</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main class="container">
            <div class="py-5 px-3 mt-3">
            <h2><spring:message code="orderSystem.title" /></h2>

            <security:authorize access="hasRole('ADMIN')">
                <a href="<c:url value="/user" />"><spring:message code="orderSystem.manageAccount" /></a><br /><br />
                <a href="<c:url value="/menu/create" />"><spring:message code="viewList.create" /></a><br /><br />
            </security:authorize>
            <security:authorize access="isAuthenticated()">
                <a href="<c:url value="/user/recordList" />"><spring:message code="orderSystem.record" /></a>
                <a href="<c:url value="/menu/cart" />"><spring:message code="orderSystem.cart" /></a>
                <a href="<c:url value="/user/editInfo" />"><spring:message code="edit.portal" /></a>
                <br />
            </security:authorize>

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
            
        <script src="<c:url value="/assets/js/bootstrap.bundle.min.js" />"></script>
    </body>
</html>

