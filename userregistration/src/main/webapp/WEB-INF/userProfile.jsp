<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<jsp:useBean id="userById" class="pl.sdacademy.registration.DTO.UserDTO" scope="request"/>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Dane użytkownika</title>
</head>
<body>
<%@ include file="header.html" %>
<% UserDTO userDTOById = (UserDTO) request.getAttribute("userById"); %>
<br>
<label for="first">imię: </label>
<%--<span id="first"><%= userDTOById.getFirstName() %></span>--%>
<span id="first"><jsp:getProperty name="userById" property="firstName"/></span>
<br>
<label for="second">nazwisko: </label>
<%--<span id="second"><%= userDTOById.getLastName() %></span>--%>
<span id="second"><jsp:getProperty name="userById" property="lastName"/></span>
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
