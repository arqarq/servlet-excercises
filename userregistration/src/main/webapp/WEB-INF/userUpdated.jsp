<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Status</title>
</head>
<body>
<%@ include file="header.html" %>
<% request.setCharacterEncoding("utf-8"); %>
<p>użytkownik zaktualizowany: <%= request.getParameter("firstName")%> <%= request.getParameter("lastName") %>
</p>
<a href="users">pokaż użytkowników</a>
</body>
</html>
