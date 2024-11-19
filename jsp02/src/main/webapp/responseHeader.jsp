<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오후 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    long addDate = simpleDateFormat.parse(request.getParameter("addDate")).getTime();
    int addInt =  Integer.parseInt(request.getParameter("addInt"));
    String addString = request.getParameter("addString");
    //응답헤더에 값을 실어 보낼 수 있음
    response.addDateHeader("currentDay",addDate);
    response.addIntHeader("myNumber",addInt);
    response.addIntHeader("myNumber",1234);
    response.addHeader("myName",addString);
    response.setHeader("myName","성춘향");
    //add는 추가
    //set으로 시작하는 건 값을 바꾼다.
    //headaer정보는 요청을 보낼때 그리고 응답을 할때도 쓸 수 있다.
%>


<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>응답 헤더 출력</h2>
    <!-- model1 방식 스파게티 코드-->
    <ul>
    <%
        Collection<String> headerNames = response.getHeaderNames();
        for(String name:headerNames) {
            String headerValue =  response.getHeader(name);
    %>
        <li><%= name %>:<%= headerValue %></li>
    <%
        }
    %>
    </ul>
</body>
</html>
