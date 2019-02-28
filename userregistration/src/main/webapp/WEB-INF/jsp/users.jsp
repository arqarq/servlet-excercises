<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<jsp:useBean id="usersDTO" scope="request" type="java.util.List<pl.sdacademy.registration.DTO.UserDTO>"/>
<%
    // request.getSession(false).removeAttribute("userTemp");
%><!DOCTYPE html>
<html lang="pl">
<head>
    <title>Użytkownicy</title>
    <%@ include file="../includes/top.html" %>
</head>
<body>
<%@ include file="../includes/header.html" %>
<table>
    <caption>Zarejestrowani użytkownicy</caption>
    <thead>
    <tr>
        <th>imię</th>
        <th>nazwisko</th>
        <th>adres</th>
        <th>pokaż</th>
        <th>edytuj</th>
        <th>usuń</th>
    </tr>
    </thead>
    <tbody><%
        Object obj = request.getAttribute("usersDTO");
        usersDTO = new ArrayList<>();
        List<?> usersTempDTO;
        if (obj instanceof ArrayList) {
            usersTempDTO = (ArrayList) obj;
            if (!usersTempDTO.isEmpty()) {
                // if (usersTempDTO.get(0) instanceof UserDTO) {
                for (Object user : usersTempDTO) {
                    usersDTO.add((UserDTO) user);
                }
                // }
            }
        }

        if (usersDTO.isEmpty()) {
            out.write(System.lineSeparator() + "<tr>" +
                    "<td class=\"act\" colspan=\"6\">brak użytkowników</td>" +
                    "</tr>" + System.lineSeparator());
        } else {
            out.print(System.lineSeparator() + usersDTO.stream()
//                    .sorted((userDTO1, userDTO2) -> Long.compare(userDTO1.getId(), userDTO2.getId()))
                    .sorted(Comparator.comparingLong(UserDTO::getId))
                    .map(userDTO -> "<tr>" +
                            "<td>" + userDTO.getFirstName() + "</td>" +
                            "<td>" + userDTO.getLastName() + "</td>" +
                            "<td>" + userDTO.getAddressDTO() + "</td>" +
                            "<td class=\"act\"><a href=\"userProfile?id=" + userDTO.getId() +
                            "\"><div class=\"tab\">(klik)</div></a></td>" +
                            "<td class=\"act\"><a href=\"userProfileEdit?id=" + userDTO.getId() +
                            "\"><div class=\"tab\">(klik)</div></a></td>" +
                            "<td class=\"act\"><a href=\"userProfileDelete?id=" + userDTO.getId() +
                            "\"><div class=\"tab\">(klik)</div></a></td>" +
                            "</tr>" + System.lineSeparator())
                    .collect(Collectors.joining()));
        }
    %></tbody>
</table>
<br>
<table>
    <caption>Zarejestrowani użytkownicy (JSP Standard Tag Library)<br>(bez sortowania po numerze ID w DB)</caption>
    <thead>
    <tr>
        <th>imię</th>
        <th>nazwisko</th>
        <th>miasto</th>
        <th>ulica</th>
        <th>numer domu</th>
        <th>pokaż</th>
        <th>edytuj</th>
        <th>usuń</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${empty usersDTO}">
            <c:out value="<tr><td class=\"act\" colspan=\"8\">brak użytkowników</td></tr>"
                   escapeXml="false"/></c:when>
        <c:otherwise>
            <c:forEach var="user" items="${usersDTO}">
                <tr>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.addressDTO.city}</td>
                    <td>${user.addressDTO.street}</td>
                    <td>${user.addressDTO.houseNo}</td>
                    <td class="act"><a href="userProfile?id=${user.id}">
                        <div class="tab">(klik)</div>
                    </a></td>
                    <td class="act"><a href="userProfileEdit?id=${user.id}">
                        <div class="tab">(klik)</div>
                    </a></td>
                    <td class="act"><a href="userProfileDelete?id=${user.id}">
                        <div class="tab">(klik)</div>
                    </a></td>
                </tr>
            </c:forEach></c:otherwise>
    </c:choose>
    </tbody>
</table>
<br>
<table>
    <tbody>
    <tr>
        <td><a href="newUser">dodaj nowego użytkownika</a>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>
