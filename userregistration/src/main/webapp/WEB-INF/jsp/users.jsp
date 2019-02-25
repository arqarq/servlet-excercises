<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.stream.Collectors" %>
<% request.getSession(false).removeAttribute("userTemp"); %><% out.clear(); %><!DOCTYPE html>
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
    <tbody><% Collection<UserDTO> usersDTO = (Collection<UserDTO>) request.getAttribute("usersDTO");
        if (usersDTO.isEmpty()) {
            out.write(System.lineSeparator() + "    <tr>" +
                    "<td class=\"act\" colspan=\"6\">brak użytkowników</td>" +
                    "</tr>" + System.lineSeparator());
        } else {
            out.print(System.lineSeparator() + usersDTO.stream()
//                    .sorted((userDTO1, userDTO2) -> Long.compare(userDTO1.getId(), userDTO2.getId()))
                    .sorted(Comparator.comparingLong(UserDTO::getId))
                    .map(userDTO -> "    <tr>" +
                            "<td>" + userDTO.getFirstName() + "</td>" +
                            "<td>" + userDTO.getLastName() + "</td>" +
                            "<td>" + userDTO.getAddressDTO() + "</td>" +
                            "<td class=\"act\"><a href=\"userProfile?id=" + userDTO.getId() + "\"><span class=\"tab\">(klik)</span></a></td>" +
                            "<td class=\"act\"><a href=\"userProfileEdit?id=" + userDTO.getId() + "\"><span class=\"tab\">(klik)</span></a></td>" +
                            "<td class=\"act\"><a href=\"userProfileDelete?id=" + userDTO.getId() + "\"><span class=\"tab\">(klik)</span></a></td>" +
                            "</tr>" + System.lineSeparator())
                    .collect(Collectors.joining()));
        } %></tbody>
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
            <c:out value="<tr><td class=\"act\" colspan=\"8\">brak użytkowników</td></tr>" escapeXml="false"/>
        </c:when>
        <c:otherwise>
            <c:forEach var="user" items="${usersDTO}">
                <tr>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.addressDTO.city}</td>
                    <td>${user.addressDTO.street}</td>
                    <td>${user.addressDTO.houseNo}</td>
                    <td class="act"><a href="userProfile?id=${user.id}"><span class="tab">(klik)</span></a></td>
                    <td class="act"><a href="userProfileEdit?id=${user.id}"><span class="tab">(klik)</span></a></td>
                    <td class="act"><a href="userProfileDelete?id=${user.id}"><span class="tab">(klik)</span></a></td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<br>
<a href="newUser">dodaj nowego użytkownika</a>
</body>
</html>
