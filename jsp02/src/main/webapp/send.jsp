<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="info.jsp" method="get">
        <input type="text" name="userId">
        <input type="password" name="userPw">
        <button>보내기</button>
    </form>
    <a href="requestHeader.jsp">요청 헤더 정보 읽기</a>
</body>
</html>
