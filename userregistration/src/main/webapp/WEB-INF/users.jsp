<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.stream.Collectors" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Użytkownicy</title>
</head>
<body>
<table border="1" style="border-collapse: collapse; padding: 3px">
    <caption>Zarejestrowani użytkownicy</caption>
    <tbody>
    <th>first name</th>
    <th>last name</th>
    <th>address</th>
    <th>action</th>
    <th>action</th>
    <%
        Collection<UserDTO> usersDTO = (Collection<UserDTO>) request.getAttribute("usersDTO");
        out.println(usersDTO.stream()
                .map(userDTO -> "<tr>" +
                        "<td>" + userDTO.getFirstName() + "</td>" +
                        "<td>" + userDTO.getLastName() + "</td>" +
                        "<td>" + userDTO.getAddressDTO() + "</td>" +
                        "<td><a href=\"userProfile?id=" + userDTO.getId() + "\">show user</a></td>" +
                        "<td><a href=\"userProfileEdit?id=" + userDTO.getId() + "\">edit user</a></td>" +
                        "</tr>")
                .collect(Collectors.joining()));
    %>
    </tbody>
</table>
<br>
<a href="newUser">dodaj nowego użytkownika</a>
</body>
</html>
