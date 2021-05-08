<%-- 
   Document   : recordList
   Created on : 2021年4月29日, 下午08:25:54
   Author     : arman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="<c:url value="/assets/js/bootstrap.bundle.min.js" />"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main class="container">
            <div class="py-5 px-3 mt-5">
        <c:choose>
            <c:when test="${empty RecordList}">
                <i>There are no record.</i>
            </c:when>
            <c:otherwise>
                <table class="table ">
                    <thead class="thead-light table-info">
                        <tr>
                            <th scope="col">購買項目及數量</th>
                            <th scope="col">購買時間</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${RecordList}" var="recordItem">
                            <tr>
                                <td>${recordItem.orderlist}</td>

                                <td>${recordItem.orderdate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
                </div>
        </main>
    </body>
</html>
