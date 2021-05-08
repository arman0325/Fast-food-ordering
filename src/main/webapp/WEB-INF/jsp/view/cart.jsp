<%-- 
    Document   : cart
    Created on : 2021年4月29日, 下午12:03:24
    Author     : arman
--%>
<%@ page import="java.util.Map" %>

<html>
    <head>
        <title>Cart</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="<c:url value="/assets/js/bootstrap.bundle.min.js" />"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main class="container">
            <div class="py-5 px-3 mt-5">
                <c:choose>
                    <c:when test="${empty UserCart}">
                        <i>There are no food in your cart.</i>
                    </c:when>
                    <c:otherwise>
                        <table class="table ">
                            <thead class="thead-light table-info">
                                <tr>
                                    <th><spring:message code="cart.foodItem" /></th>
                                    <th><spring:message code="cart.qty" /></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${UserCart}" var="cartItem">
                                    <tr>
                                        <td>${cartItem.key}</td>
                                        <td>${cartItem.value}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <form:form method="POST" enctype="multipart/form-data"
                                   modelAttribute="recordForm">
                            <form:input type="hidden" path="order" value="${UserCart}"/>
                            <button type="submit" class="btn btn-secondary"><spring:message code="cart.btn" /></button>
                        </form:form>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </body>
</html>


