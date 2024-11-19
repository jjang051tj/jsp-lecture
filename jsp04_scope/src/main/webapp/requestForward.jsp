<%@ page import="com.jjang051.jsp04_scope.Person" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Person requestPerson =  (Person)request.getAttribute("requestPerson");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>request 영역의 속성값 읽기</h2>
<ul>
    <li><%=request.getAttribute("requestString")%></li>
    <li>이름 : <%=requestPerson.getName()%>,나이 : <%=requestPerson.getAge()%></li>
</ul>
</body>
