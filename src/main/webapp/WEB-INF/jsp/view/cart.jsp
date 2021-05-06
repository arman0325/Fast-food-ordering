<%-- 
    Document   : cart
    Created on : 2021年4月29日, 下午12:03:24
    Author     : arman
--%>
<%@ page import="java.util.Map" %>
<h1>This is cart.</h1>

<c:choose>
    <c:when test="${empty UserCart}">
        <i>There are no comment in the system for this fast food.</i>
    </c:when>
    <c:otherwise>
        <table>
            <th>Food Item</th>
            <th>Quantity</th>
                <c:forEach items="${UserCart}" var="cartItem">
                <tr>
                    <td>${cartItem.key}</td>
                    <td>${cartItem.value}</td>
                </tr>
            </c:forEach>
        </table>

        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="recordForm">
            <form:input type="hidden" path="order" value="${UserCart}"/>
            <button type="submit">submit</button>
        </form:form>
    </c:otherwise>
</c:choose>





