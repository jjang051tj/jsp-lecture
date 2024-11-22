<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.jjang051.member.common.JDBCConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    /*
    Class.forName("oracle.jdbc.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String userId = "jjang052";
    String userPw = "1234";
    Connection connection = DriverManager.getConnection(url,userId,userPw);
    if(connection!=null) {
        System.out.println("db connected");
    }
    */
    //JDBCConnection jdbcConnection = new JDBCConnection();
    JDBCConnection jdbcConnection = new JDBCConnection(application);
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
<a href="insert-member.jsp">회원가입</a>
</body>
</html>