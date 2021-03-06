<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="errorsFromValidation"
             scope="request"
             type="java.util.Collection<java.lang.String>">
</jsp:useBean>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Status</title>
    <%@ include file="../includes/top.html" %>
</head>
<body>
<%@ include file="../includes/header.html" %>
<% request.setCharacterEncoding("utf-8"); %>
<p>
    <c:choose>
        <c:when test="${empty errorsFromValidation}">
            użytkownik zaktualizowany: <%= request.getParameter("firstName") %><%= " " + request.getParameter("lastName") %>
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
