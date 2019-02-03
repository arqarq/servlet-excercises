<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<%--
  Created by IntelliJ IDEA.
  User: Madzia
  Date: 03.02.2019
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <meta charset="UTF-8">
</head>
<body>
<% UserDTO userDTOById = (UserDTO) request.getAttribute("userById"); %>
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
</body>
</html>