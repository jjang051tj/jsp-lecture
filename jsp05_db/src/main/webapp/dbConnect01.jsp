<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.jjang051.jsp05_db.common.JDBCConnect" %>
<%@ page import="com.jjang051.jsp05_db.common.DBConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-21
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    Class.forName("oracle.jdbc.OracleDriver");
//    String url = "jdbc:oracle:thin:@localhost:1521:xe";
//    String userId = "jjang052";
//    String userPw = "1234";
//    Connection conn = DriverManager.getConnection(url,userId,userPw);
//    System.out.println(userId+"/"+userPw+"   oracle connected");
      //JDBCConnect jdbcConnect = new JDBCConnect();


//    String driver = application.getInitParameter("OracleDriver");
//    String url = application.getInitParameter("OracleUrl");
//    String userId = application.getInitParameter("OracleId");
//    String userPw = application.getInitParameter("OraclePw");
//    JDBCConnect jdbcConnect = new JDBCConnect(driver, url,userId,userPw);

    JDBCConnect jdbcConnect = new JDBCConnect(application);
    //connection pool   was(톰캣이 제공한다.)

    //DBConnectionPool dbConnectionPool = new DBConnectionPool();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
