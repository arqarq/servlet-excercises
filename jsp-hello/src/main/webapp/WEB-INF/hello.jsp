<%@ page import="pl.sdacademy.Counter" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: Madzia
  Date: 02.02.2019
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello World!</title>
</head>
<body>
<p>Dzisiaj jest: <%= LocalDateTime.now() %>
</p>
<p>Dzisiaj jest: <% out.print(LocalDateTime.now());
    out.print(" aaa"); %>
</p>
<%--<%! private int counter; %>--%>
<%--<p>Stronę odwiedzono: <%= ++counter %> razy.</p>--%>
<p>
    <%= request.getParameter("name") %>
    <br>
    Stronę odwiedzono: <% out.print(Counter.INSTANCE.getCount()); %> razy.
</p>
</body>
</html>
