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
                    <form:form method="POST" enctype="multipart/form-data" modelAttribute="User" name="User" onsubmit="validateForm()">
                        <c:choose>
                            <c:when test="${empty Users}">
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${Users}" var="UserA">
                                    <c:if test="${UserA.username==NowUser}">

                                        <div class="form-group mt-2 row">
                                            <form:label path="password"><spring:message code="edit.pwd" /></form:label>
                                            <div class="col-sm-10">
                                            <form:input type="password" path="password" class="form-control"/>
                                            </div>
                                            <div class="col-sm-2">
                                            <input type="checkbox" onclick="showPwd()"><spring:message code="edit.show" />
                                            </div>
                                        </div>
                                        <div class="form-group mt-2">
                                            <label id="passwordConfirm"><spring:message code="edit.pwdCon" /></label>
                                            <input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control"/>
                                            
                                        </div>
                                        <div class="form-group mt-2">
                                             <label id="roles">Role:</label>
                                            <form:checkbox path="roles" value="ROLE_USER" checked="true"  style="display:none"/>ROLE_USER
                                            <security:authorize access="hasRole('ADMIN')">
                                                <form:checkbox path="roles" value="ROLE_ADMIN"  style="display:none"/>ROLE_ADMIN
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
                                            <label id="oldPwd"><spring:message code="edit.oldPwd" /></label>
                                            <input class="form-control" type="password" id="oldPwd" name="oldPwd" >
                                            <input type="hidden" id="oldPwdC" name="oldPwdC" value="${UserA.password}">
                                            <button type="submit" class="btn btn-primary mt-3">Confirm</button>
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
