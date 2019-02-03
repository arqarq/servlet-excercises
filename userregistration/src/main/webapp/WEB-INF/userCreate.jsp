<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<html lang="en">
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<head>
    <title>New user account</title>
    <meta charset="UTF-8">
</head>
<body>
<%@ include file="header.html" %>
<%
    UserDTO userDTO = (UserDTO) request.getAttribute("userById");
%>
<form method="post">
    <label for="firstName">First name: </label>
    <input type="text" id="firstName" name="firstName" value="<%= userDTO != null ? userDTO.getFirstName() : "" %>">
    <br>
    <label for="lastName">Last name: </label>
    <input type="text" id="lastName" name="lastName" value="<%= userDTO != null ? userDTO.getLastName() : "" %>">
    <br>
    <label for="city">City: </label>
    <input type="text" id="city" name="city" value="<%= userDTO != null ? userDTO.getAddressDTO().getCity() : "" %>">
    <br>
    <label for="street">Street: </label>
    <input type="text" id="street" name="street"
           value="<%= userDTO != null ? userDTO.getAddressDTO().getStreet() : "" %>">
    <br>
    <label for="houseNo">House No.: </label>
    <input type="text" id="houseNo" name="houseNo"
           value="<%= userDTO != null ? userDTO.getAddressDTO().getHouseNo() : "" %>">
    <br>
    <input type="submit" value="<%= userDTO != null ? "Update user data" : "Register user" %>">
</form>
</body>
</html>