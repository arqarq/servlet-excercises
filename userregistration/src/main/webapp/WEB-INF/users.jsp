<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.stream.Collectors" %>
<!DOCTYPE html>
<html>
<head>
    <title>Użytkownicy</title>
</head>
<style>
    th {
        padding: 3px;
        background-color: darkgray;
    }

    td {
        padding: 3px;
        background-color: lightgray;
    }

    span {
        font-size: 75%%;
    }

    td.act {
        text-align: center;
    }
</style>
<body>
<%@ include file="header.html" %>
<table border="1" style="border-collapse: collapse">
    <caption>Zarejestrowani użytkownicy</caption>
    <tbody>
    <th>first name</th>
    <th>last name</th>
    <th>address</th>
    <th>pokaż</th>
    <th>edytuj</th>
    <th>usuń</th>
    <%
        Collection<UserDTO> usersDTO = (Collection<UserDTO>) request.getAttribute("usersDTO");
        out.println(usersDTO.stream()
                .map(userDTO -> "<tr>" +
                        "<td>" + userDTO.getFirstName() + "</td>" +
                        "<td>" + userDTO.getLastName() + "</td>" +
                        "<td>" + userDTO.getAddressDTO() + "</td>" +
                        "<td class=\"act\"><a href=\"userProfile?id=" + userDTO.getId() + "\"><span>(klik)</span></a></td>" +
                        "<td class=\"act\"><a href=\"userProfileEdit?id=" + userDTO.getId() + "\"><span>(klik)</span></a></td>" +
                        "<td class=\"act\"><span>(klik)</span></td>" +
                        "</tr>")
                .collect(Collectors.joining()));
    %>
    </tbody>
</table>
<br>
<a href="newUser">dodaj nowego użytkownika</a>
</body>
</html>
