<%@ page import="com.jjang051.jsp05_db.common.JDBCConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-21
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //1.연결
    JDBCConnect jdbcConnect = new JDBCConnect(application);
    String sql = "select * from member";
    jdbcConnect.pstmt = jdbcConnect.conn.prepareStatement(sql);
    jdbcConnect.rs = jdbcConnect.pstmt.executeQuery();
    while(jdbcConnect.rs.next()) {
        System.out.print(jdbcConnect.rs.getString("USERID")+"/");
        System.out.print(jdbcConnect.rs.getString("USERpw")+"/");
        System.out.print(jdbcConnect.rs.getString("userName")+"/");
        System.out.print(jdbcConnect.rs.getString("regDate"));
        System.out.println();
        System.out.println("=====================");
    }
    jdbcConnect.close();
%>


<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
