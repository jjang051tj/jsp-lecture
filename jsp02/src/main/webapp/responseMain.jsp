<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String error = request.getParameter("error");
        if(error!=null) {
            out.println("아이디 패스워드 확인해 주세요.");
        }
    %>

    <form action="responseLogin.jsp" method="post">
        <div>아이디 : <input type="text" name="userId"></div>
        <div>패스워드 : <input type="password" name="userPw"></div>
        <div><button>로그인</button></div>
    </form>
</body>
</html>
