<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-20
  Time: 오전 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie cookie = new Cookie("myCookie","새우깡");
    cookie.setPath(request.getContextPath());
    cookie.setMaxAge(60*60*24); //분 단위로 설정
    response.addCookie(cookie);

    Cookie testCookie = new Cookie("testCookie","jjang051");
    testCookie.setPath(request.getContextPath());
    System.out.println("request.getContextPath()=="+request.getContextPath());
    testCookie.setMaxAge(60*60);
    response.addCookie(testCookie);
    //최대 3000개 까지 만들 수 있음...
    //쿠키 최대 용량은 1.2m
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Cookie cookies[] =  request.getCookies();
        if(cookies!=null) {
            for(Cookie c:cookies) {
                String cookieName = c.getName();
                String cookieValue = c.getValue();
                out.println(cookieName+":"+cookieValue);
            }
        }
    %>
</body>
</html>
