<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support Login</title>
    </head>
    <body>
        <h2>Customer Support Login</h2>
        <c:if test="${param.error != null}">
            <p>Login failed.</p>
        </c:if>
        <c:if test="${param.logout != null}">
            <p>You have logged out.</p>
        </c:if>
        <form action="login" method="POST">
            <label for="username">Username:</label><br/>
            <input type="text" id="username" name="username" /><br/><br/>
            <label for="password">Password:</label><br/>
            <input type="password" id="password" name="password" /><br/><br/>
            <input type="checkbox" id="remember-me" name="remember-me" />
            <label for="remember-me">Remember me</label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="Log In"/>
        </form>
        <br /><br />Don't have an account?
        <a href="<c:url value="/user/create" />"><button>Create an account</button></a><br /><br />
        <a href="<c:url value="/menu" />">Return to Menu</a>
    </body>
</html>