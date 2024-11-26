<%@ page import="com.jjang051.model2.dto.MemberDto" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-26
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberDto loggedMemberDto = (MemberDto) session.getAttribute("loggedMemberDto");
    if(loggedMemberDto!=null) {
        System.out.println(loggedMemberDto.getUserName());
    }
    System.out.println("why");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>forward로 httpServlet에서 get방식으로 호출됨</h1>
</body>
</html>
