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
                <h2>Change the Availability of #${food.id}</h2>
                <security:authorize access="isAuthenticated()">
                    <c:url var="logoutUrl" value="/logout"/>
                    <form action="${logoutUrl}" method="post">
                        <input type="submit" value="<spring:message code="orderSystem.logout" />" />
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <br />
                </security:authorize>

                <form:form method="POST" enctype="multipart/form-data"
                           modelAttribute="availabilityForm">
                    <form:radiobutton path="availability"  value="true" />Available
                    <form:radiobutton path="availability"  value="false" />Not Available
                    <br /><br />
                    <input type="submit" value="Submit"/>
                </form:form>
            </div>
        </main>
    </body>
</html>
