<%@ page import="com.jjang051.jsp04_scope.Person" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오후 4:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>page 이동 후 pageContext값 읽어오기</h2>
    <%
        Object pageInteger = pageContext.getAttribute("pageInteger");
        Object pageString  = pageContext.getAttribute("pageString");
        Object pagePerson  = pageContext.getAttribute("pagePerson");
    %>
    <ul>
        <li><%= (pageInteger==null?"null":pageInteger) %></li>
        <li><%= (pageString==null?"null":pageString) %></li>
        <li>이름 : <%= (pagePerson==null?"null":((Person)pagePerson).getName()) %>
            ,나이 : <%= (pagePerson==null?"null":((Person)pagePerson).getAge()) %></li>
    </ul>
</body>
</html>
