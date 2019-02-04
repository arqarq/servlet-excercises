<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Użytkownik dodany</title>
</head>
<body>
<%@ include file="header.html" %>
<p>user added: <%= request.getParameter("firstName")%> <%= request.getParameter("lastName") %>
</p>
<a href="users">pokaż użytkowników</a>
</body>
</html>
