<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Status</title>
</head>
<body>
<%@ include file="header.html" %>
<% request.setCharacterEncoding("utf-8"); %>
<p>
    <c:choose>
        <c:when test="${empty errorsFromValidation}">
            użytkownik zaktualizowany: <%= request.getParameter("firstName")%> <%= request.getParameter("lastName") %>
        </c:when>
        <c:otherwise>
            <c:forEach var="string" items="${errorsFromValidation}">
                ${string}<br>
            </c:forEach>
            <a href="newUser">popraw</a>
        </c:otherwise>
    </c:choose>
</p>
<a href="users">pokaż użytkowników</a>
</body>
</html>
