<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String userId = "scott";
    String userPw = "tiger";
    Connection connection = DriverManager.getConnection(url,userId,userPw);
    if(connection!=null) {
        System.out.println("db connected");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>