<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <title><spring:message code="edit.title" /></title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="<c:url value="/assets/js/check.js" />"></script>
        <script src="<c:url value="/assets/js/bootstrap.bundle.min.js" />"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main class="container">
            <div class="py-5 px-3 mt-5">
                <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">

                    <h2><spring:message code="edit.title" /></h2>
                    <form:form method="POST" enctype="multipart/form-data" modelAttribute="User" name="User" onsubmit="return validateForm()">
   
                        <c:choose>
                            <c:when test="${empty Users}">
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${Users}" var="UserA">
                                    <c:if test="${UserA.username==NowUser}">

                                        <div class="form-group mt-2">
                                            <form:label path="password"><spring:message code="edita.pwd" /></form:label>
                                            <form:input type="password" path="password" required="required" class="form-control" value="${fn:replace(UserA.password,'{noop}','')}"/>
                                        </div>
                                        <div class="form-group mt-2">
                                            <form:checkbox path="roles" value="ROLE_USER" checked="true"/>ROLE_USER
                                        </div>
                                        <div class="form-group mt-2">
                                            <security:authorize access="hasRole('ADMIN')">
                                                <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN
                                            </security:authorize>
                                        </div>
                                        <div class="form-group mt-2">
                                            <form:label path="fullName"><spring:message code="edit.fullName" /></form:label>
                                            <form:input type="text" path="fullName" class="form-control" value="${UserA.fullName}"/>
                                        </div>
                                        <div class="form-group mt-2">
                                            <form:label path="phone"><spring:message code="edit.phone" /></form:label>
                                            <form:input type="tel" path="phone" pattern="[0-9]{8}" minlength="8" maxlength="8" class="form-control" value="${UserA.phone}"/>
                                        </div>
                                        <div class="form-group mt-2">
                                            <form:label path="address"><spring:message code="edit.address" /></form:label>
                                            <form:input type="text" path="address" class="form-control" value="${UserA.address}"/>
                                        </div>
                                        <div class="form-group mt-2">
                                            <button type="submit" class="btn btn-primary">Confirm</button>
                                        </div>

                                    </c:if>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </form:form>
                </div>
            </div>
        </main>
    </body>
</html>
