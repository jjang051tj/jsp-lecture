<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <ul>
        <li>데이터 전송 방식 : <%= request.getMethod()   %></li>
        <li>전송된 값 userId : <%= request.getParameter("userId")   %></li>
        <li>전송된 값 userPw : <%= request.getParameter("userPw")   %></li>
        <li>url : <%= request.getRequestURL()   %></li>
        <li>uri : <%= request.getRequestURI()   %></li>
        <li>프로토콜 : <%= request.getProtocol()   %></li>
        <li>서버포트 : <%= request.getServerPort()   %></li>
        <li>querystring : <%= request.getQueryString()   %></li>
        <li>client ip addrress : <%= request.getRemoteAddr()   %></li>
    </ul>
</body>
</html>
