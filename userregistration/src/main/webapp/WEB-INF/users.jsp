<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.stream.Collectors" %>
<%--
  Created by IntelliJ IDEA.
  User: Madzia
  Date: 03.02.2019
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
</head>
<body>
<table border="1" style="border-collapse: collapse; padding: 3px">
    <caption>Users</caption>
    <tbody>
    <th>first name</th>
    <th>last name</th>
    <th>address</th>
    <%
        Collection<UserDTO> usersDTO = (Collection<UserDTO>) request.getAttribute("usersDTO");
        out.println(usersDTO.stream()
                .map(userDTO -> "<tr>" +
                        "<td>" + userDTO.getFirstName() + "</td>" +
                        "<td>" + userDTO.getLastName() + "</td>" +
                        "<td>" + userDTO.getAddressDTO() + "</td></tr>")
                .collect(Collectors.joining()));
    %>
    <%--<tr>--%>
    <%--<td>1</td>--%>
    <%--<td>2</td>--%>
    <%--<td>3</td>--%>
    <%--</tr>--%>
    </tbody>
</table>
<a href="newUser">Dodaj nowego użytkownika</a>
</body>
</html>