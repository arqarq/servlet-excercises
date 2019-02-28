<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true" language="java" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Status</title>
    <%@ include file="../includes/top.html" %>
</head>
<body>
<%@ include file="../includes/header.html" %>
<% UserDTO userDTO = (UserDTO) request.getAttribute("userById"); %>
<p>usunąć użytkownika: <%= userDTO.getFirstName() %><%= " " + userDTO.getLastName() %>?
</p>
<table>
    <tbody>
    <tr>
        <td><a href="userProfileDeleteConfirmed?id=<%= userDTO.getId() %>">tak</a>&ensp;</td>
        <td><a href="users">nie</a></td>
    </tr>
    </tbody>
</table>
</body>
</html>
