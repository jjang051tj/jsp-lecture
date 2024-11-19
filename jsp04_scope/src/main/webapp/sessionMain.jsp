<%@ page import="com.jjang051.jsp04_scope.Person" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오후 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("sessionString", "session영역의 문자열");
    session.setAttribute("sessionPerson", new Person("고길동", 40));
    Person sessionPerson = (Person) session.getAttribute("sessionPerson");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul>
    <li><%=session.getAttribute("sessionString")%>    </li>
    <li>이름 : <%=sessionPerson.getName()%>,나이 : <%=sessionPerson.getAge()%>    </li>
</ul>
<a href="sessionLocation.jsp">session변경</a>
</body>
</html>
