
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/menu" />">FastFood</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link active" href="<c:url value="/menu" />"><spring:message code="orderSystem.home" /></a>
                </li>
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/recordList" />"><spring:message code="orderSystem.record" /></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/menu/cart" />"><spring:message code="orderSystem.cart" /></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/editInfo" />"><spring:message code="edit.portal" /></a>
                    </li>
                </security:authorize>
                <li class="nav-item dropdown">
                    <security:authorize access="hasRole('ADMIN')">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false"><spring:message code="orderSystem.admin" /></a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown01">
                            <li><a class="dropdown-item" href="<c:url value="/user" />"><spring:message code="orderSystem.manageAccount" /></a></li>
                            <li><a class="dropdown-item" href="<c:url value="/menu/create" />"><spring:message code="viewList.create" /></a></li>
                        </ul>
                    </security:authorize>
                </li>
            </ul>

            <ul class="navbar-nav my-2 my-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="?language=en">Eng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?language=zh">中文</a>
                </li>
                <li>
                    <security:authorize access="isAuthenticated()">
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post">
                            <input class="btn btn-outline-light" type="submit" value="<spring:message code="orderSystem.logout" />" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </security:authorize>
                    <security:authorize access="!isAuthenticated()">
                        <a href="<c:url value="/login" />"><button class="btn btn-outline-light"><spring:message code="login.title" /></button></a>
                    </security:authorize>
                </li>
            </ul>
        </div>
    </div>
</nav>