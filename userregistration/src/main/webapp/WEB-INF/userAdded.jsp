<%@ page pageEncoding="UTF-8" contentType="text/html; UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Użytkownik dodany</title>
</head>
<body>
<%@ include file="header.html" %>
<p>user added: <%= request.getParameter("firstName")%> <%= request.getParameter("lastName") %>
</p>
<a href="users">pokaż użytkowników</a>
</body>
</html>
