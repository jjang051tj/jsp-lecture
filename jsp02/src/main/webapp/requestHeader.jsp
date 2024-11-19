<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오전 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>요청 header 정보 출력</h1>
    <%
        Enumeration headers = request.getHeaderNames();
        while (headers.hasMoreElements()) {
            String headerName = (String)headers.nextElement();
            String headrValue =  request.getHeader(headerName);
            out.println("헤더명 : "+headerName+", 헤더값 : "+headrValue+"<br>");
        }
        //클라이언트가 서버로 요청을 보낼때 눈에 보이는 것들 말고 눈에 보이지 않는 것들도 많이 넘겨준다.
        //서버는 이 정보들을 가지고 여러가지 것들을 처리한다.
    %>
</body>
</html>
