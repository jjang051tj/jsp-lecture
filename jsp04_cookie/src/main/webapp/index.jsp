<%@ page import="com.jjang051.jsp04_cookie.JDBConnect" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<%
//    JDBConnect jdbConnect = new JDBConnect();
//    jdbConnect.close();
    Class.forName("oracle.jdbc.OracleDriver");

    // DB에 연결
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String id = "scott";
    String pwd = "tiger";
    DriverManager.getConnection(url, id, pwd);
    System.out.println("DB 연결 성공");
%>
</body>
</html>