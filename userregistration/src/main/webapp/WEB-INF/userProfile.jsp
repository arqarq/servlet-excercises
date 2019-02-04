<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dane użytkownika</title>
</head>
<body>
<%@ include file="header.html" %>
<% UserDTO userDTOById = (UserDTO) request.getAttribute("userById"); %>
<br>
<label for="first">imię: </label>
<span id="first"><%= userDTOById.getFirstName() %></span>
<br>
<label for="second">nazwisko: </label>
<span id="second"><%= userDTOById.getLastName() %></span>
<br>
<label for="street">ulica: </label>
<span id="street"><%= userDTOById.getAddressDTO().getStreet() %> <%= userDTOById.getAddressDTO().getHouseNo() %></span>
<%--<label for="houseNo">mię</label>--%>
<%--<span id="houseNo"><%= userDTOById.getAddressDTO().getHouseNo() %></span>--%>
<br>
<label for="miasto">miasto: </label>
<span id="miasto"><%= userDTOById.getAddressDTO().getCity() %></span>
<br><br>
<a href="users">wróć</a>
</body>
</html>
