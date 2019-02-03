<%--
  Created by IntelliJ IDEA.
  User: Madzia
  Date: 03.02.2019
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User added</title>
</head>
<body>
<p>User added: <%= request.getParameter("firstName")%> <%= request.getParameter("lastName") %>
</p>
<a href="users">Show users</a>
</body>
</html>