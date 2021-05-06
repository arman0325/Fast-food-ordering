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
    </head>
    <body>
        <c:choose>
            <c:when test="${empty RecordList}">
                <i>There are no comment in the system for this fast food.</i>
            </c:when>
            <c:otherwise>
                <table>
                    <c:forEach items="${RecordList}" var="recordItem">
                        <tr>
                            <td>${recordItem.orderlist}</td>

                            <td>${recordItem.orderdate}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
