<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    out.clear();
%><!DOCTYPE html>
<html lang="pl">
<head>
    <title>Status</title>
    <%@ include file="../includes/top.html" %>
</head>
<body>
<%@ include file="../includes/header.html" %>
<p>
    <c:choose>
        <c:when test="${empty errorsFromValidation}">
            użytkownik dodany: <%= request.getParameter("firstName") %> <%= request.getParameter("lastName") %>
            <%
                request.getSession(false).removeAttribute("userTemp");
            %>
        </c:when>
        <c:otherwise>
            <c:forEach var="string" items="${errorsFromValidation}">
                ${string}<br>
            </c:forEach>
            <a href="newUser">popraw</a>
        </c:otherwise>
    </c:choose>
</p>
<table>
    <tbody>
    <tr>
        <td><a href="users">pokaż użytkowników</a>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>
