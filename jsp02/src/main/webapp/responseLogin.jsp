<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    if(userId.equals("jjang051") && userPw.equals("1234")) {
        response.sendRedirect("welcome.jsp");
    } else {
        //response.sendRedirect("responseMain.jsp");
        //페이지를 링크 거는 것과 같다.
        request.getRequestDispatcher("responseMain.jsp?error=1")
               .forward(request,response);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
