<%@ page import="com.jjang051.jsp04_scope.Person" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-19
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 값을 저장하는 곳이 4군데
    // pageContext < request < session < application
    pageContext.setAttribute("pageInteger",100);
    pageContext.setAttribute("pageString","문자열 저장");
    pageContext.setAttribute("pagePerson",new Person("홍길동", 30));
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>pageContext 속성 읽기</h2>
    <%
        int pageInteger = (int)pageContext.getAttribute("pageInteger");
        String pageString = (String)pageContext.getAttribute("pageString");
        Person pagePerson = (Person)pageContext.getAttribute("pagePerson");
    %>
    <ul>
        <li><%=pageInteger%></li>
        <li><%=pageString%></li>
        <li>이름 : <%=pagePerson.getName()%>,나이 : <%=pagePerson.getAge()%></li>
    </ul>
    <a href="pageLocation.jsp">page변경</a>
</body>
</html>
