<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Status</title>
</head>
<body>
<%@ include file="header.html" %>
<% UserDTO userDTO = (UserDTO) request.getAttribute("userById"); %>
<p>usunąć użytkownika: <%= userDTO.getFirstName() %> <%= userDTO.getLastName() %>?
</p>
<table>
    <tbody>
    <tr>
        <td><a href="userProfileDeleteConfirmed?id=<%= userDTO.getId() %>">tak</a></td>
        <td><a href="users">nie</a></td>
    </tr>
    </tbody>
</table>
</body>
</html>
