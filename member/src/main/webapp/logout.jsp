<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-25
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //session을 만든거는 연결하나 해둔거
    //  server stateless   client(request)   server(response) session
    session.invalidate();  //session종료됨
    response.sendRedirect("index.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
