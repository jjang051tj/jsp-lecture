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
    String loggedUserName =(String)session.getAttribute("loggedUserName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<% if(loggedUserName!=null) {%>
    <h1><%= loggedUserName %></h1>
<%}%>
<a href="hello-servlet">Hello Servlet</a>

<% if(loggedUserName!=null) {%>
    <a href="logout.jsp">로그아웃</a>
    <a href="info-member.jsp"><%= loggedUserName %></a>
<%} else {%>
    <a href="login.jsp">로그인</a>
<%}%>
</body>
</html>