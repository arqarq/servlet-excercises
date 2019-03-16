<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true" language="java" %>
<%@ page import="pl.sdacademy.registration.DTO.UserDTO" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>
        <%
            UserDTO userDTO = (UserDTO) request.getAttribute("userById");
            if (userDTO.getId() != null) {
                out.write("Edycja danych użytkownika");
            } else {
                out.write("Nowy użytkownik");
            }
        %>
    </title>
    <%@ include file="../includes/top.html" %>
</head>
<body>
<%@ include file="../includes/header.html" %>
<form id="1" method="post" action="
<%
if (userDTO.getId() != null) {
    out.write("userProfileEdit");
} else {
    out.write("newUser");
}
%>
">
    <%
        if (userDTO.getId() != null) {
            out.write("<input type=\"hidden\" name=\"id\" value=\"" + userDTO.getId() + "\">");
        }
    %>
    <label for="firstName">imię: </label>
    <input type="text" id="firstName" name="firstName"
           value="<%= userDTO.getFirstName() != null ? userDTO.getFirstName() : "" %>">
    <br>
    <label for="lastName">nazwisko: </label>
    <input type="text" id="lastName" name="lastName"
           value="<%= userDTO.getLastName() != null ? userDTO.getLastName() : "" %>">
    <br>
    <label for="city">miasto: </label>
    <input type="text" id="city" name="city"
           value="<%= userDTO.getAddressDTO().getCity() != null ? userDTO.getAddressDTO().getCity() : "" %>">
    <br>
    <label for="street">ulica: </label>
    <input type="text" id="street" name="street"
           value="<%= userDTO.getAddressDTO().getStreet() != null ? userDTO.getAddressDTO().getStreet() : "" %>">
    <br>
    <label for="houseNo">numer domu: </label>
    <input type="text" id="houseNo" name="houseNo"
           value="<%= userDTO.getAddressDTO().getHouseNo() != null ? userDTO.getAddressDTO().getHouseNo() : "" %>">
    <br>
</form>
<form style="display: inline" id="2" method="get" action="users">
    <input form="2" type="submit" value="Anuluj"/>
</form>
<input form="1" type="submit"
       value="<%= userDTO.getId() != null ? "Zaktualizuj dane użytkownika" : "Zarejestruj użytkownika" %>">
</body>
</html>
