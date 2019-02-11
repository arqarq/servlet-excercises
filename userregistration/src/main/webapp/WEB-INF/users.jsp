<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.stream.Collectors" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Użytkownicy</title>
</head>
<style>
    table {
        border-collapse: collapse;
    }

    td, th {
        border: 1px solid #dddddd;
        padding: 3px;
        /*background-color: darkgray;*/
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }

    span {
        font-size: 75%;
    }

    td.act {
        text-align: center;
    }
</style>
<body>
<%@ include file="header.html" %>
<table>
    <caption>Zarejestrowani użytkownicy</caption>
    <tbody>
    <tr>
        <th>imię</th>
        <th>nazwisko</th>
        <th>adres</th>
        <th>pokaż</th>
        <th>edytuj</th>
        <th>usuń</th>
    </tr>
    <%
        Collection<UserDTO> usersDTO = (Collection<UserDTO>) request.getAttribute("usersDTO");
        if (usersDTO.isEmpty()) {
            out.write("<tr>" +
                    "<td class=\"act\" colspan=\"6\">brak użytkowników</td>" +
                    "</tr>");
        } else {
            out.println(usersDTO.stream()
                    .map(userDTO -> "<tr>" +
                            "<td>" + userDTO.getFirstName() + "</td>" +
                            "<td>" + userDTO.getLastName() + "</td>" +
                            "<td>" + userDTO.getAddressDTO() + "</td>" +
                            "<td class=\"act\"><a href=\"userProfile?id=" + userDTO.getId() + "\"><span>(klik)</span></a></td>" +
                            "<td class=\"act\"><a href=\"userProfileEdit?id=" + userDTO.getId() + "\"><span>(klik)</span></a></td>" +
                            "<td class=\"act\"><a href=\"userProfileDelete?id=" + userDTO.getId() + "\"><span>(klik)</span></a></td>" +
                            "</tr>")
                    .collect(Collectors.joining()));
        }
    %>
    </tbody>
</table>
<br>
<a href="newUser">dodaj nowego użytkownika</a>
</body>
</html>
