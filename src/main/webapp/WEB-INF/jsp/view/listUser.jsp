<%-- 
    Document   : listUser
    Created on : 2021年4月27日, 上午11:57:48
    Author     : arman
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>User List</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="<c:url value="/assets/js/bootstrap.bundle.min.js" />"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main class="container">
            <div class="py-5 px-3 mt-5">
                <h2><spring:message code="manage.title" /></h2>
                <a href="<c:url value="/user/create" />"><spring:message code="manage.link" /></a><br /><br />
                <c:choose>
                    <c:when test="${fn:length(Users) == 0}">
                        <i>There are no users in the system.</i>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <tr>
                                <th><spring:message code="manage.username" /></th>
                                <th><spring:message code="manage.pwd" /></th>
                                <th><spring:message code="manage.roles" /></th>
                                <th><spring:message code="manage.action" /></th>
                            </tr>
                            <c:forEach items="${Users}" var="user">
                                <tr>
                                    <td>${user.username}</td><td>${user.password}</td>
                                    <td>
                                        <c:forEach items="${user.roles}" var="role" varStatus="status">
                                            <c:if test="${!status.first}">, </c:if>
                                            ${role.role}
                                        </c:forEach>
                                    </td>
                                    <td>
                                        [<a href="<c:url value="/user/delete/${user.username}" />"><spring:message code="manage.del" /></a>]
                                        [<a href="<c:url value="/user/editInfoAdmin/${user.username}" />"><spring:message code="manage.edit" /></a>]
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </body>
</html>