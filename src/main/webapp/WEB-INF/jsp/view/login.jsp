<!DOCTYPE html>
<html>
    <head>
        <title>User Login</title>
    </head>
    <body>
        <h2><spring:message code="register.title" /></h2>
        <c:if test="${param.error != null}">
            <p>Login failed.</p>
        </c:if>
        <c:if test="${param.logout != null}">
            <p>You have logged out.</p>
        </c:if>
        <form action="login" method="POST">
            <label for="username"><spring:message code="login.username" /></label><br/>
            <input type="text" id="username" name="username" /><br/><br/>
            <label for="password"><spring:message code="login.pwd" /></label><br/>
            <input type="password" id="password" name="password" /><br/><br/>
            <input type="checkbox" id="remember-me" name="remember-me" />
            <label for="remember-me"><spring:message code="login.remember" /></label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="<spring:message code="login.loginBtn"/>"/>
        </form>
        <br /><br /><spring:message code="login.registerMsg" />
        <a href="<c:url value="/user/create" />"><button><spring:message code="login.registerBtn" /></button></a><br /><br />
        <a href="<c:url value="/menu" />"><spring:message code="login.backURL" /></a>
    </body>
</html>