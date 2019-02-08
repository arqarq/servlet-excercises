<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Nowy użytkownik</title>
</head>
<body>
<%@ include file="header.html" %>
<%
    UserDTO userDTO = (UserDTO) request.getAttribute("userById");
%>
<form method="post" action="
<%
if (userDTO != null) {
    out.write("userProfileEdit");
} else {
    out.write("newUser");
}
%>
">
    <%
        if (userDTO != null) {
            out.write("<input type=\"hidden\" name=\"id\" value=\"" + userDTO.getId() + "\">");
        }
    %>
    <label for="firstName">imię: </label>
    <input type="text" id="firstName" name="firstName" value="<%= userDTO != null ? userDTO.getFirstName() : "" %>">
    <br>
    <label for="lastName">nazwisko: </label>
    <input type="text" id="lastName" name="lastName" value="<%= userDTO != null ? userDTO.getLastName() : "" %>">
    <br>
    <label for="city">miasto: </label>
    <input type="text" id="city" name="city" value="<%= userDTO != null ? userDTO.getAddressDTO().getCity() : "" %>">
    <br>
    <label for="street">ulica: </label>
    <input type="text" id="street" name="street"
           value="<%= userDTO != null ? userDTO.getAddressDTO().getStreet() : "" %>">
    <br>
    <label for="houseNo">numer domu: </label>
    <input type="text" id="houseNo" name="houseNo"
           value="<%= userDTO != null ? userDTO.getAddressDTO().getHouseNo() : "" %>">
    <br>
    <input type="submit" value="<%= userDTO != null ? "Zaktualizuj dane użytkownika" : "Zarejestruj użytkownika" %>">
</form>
</body>
</html>
