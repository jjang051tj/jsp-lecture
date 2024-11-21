<%@ page import="com.jjang051.jsp05_db.common.JDBCConnect" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-21
  Time: 오후 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //1. db연결
    JDBCConnect jdbcConnect = new JDBCConnect(application);
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userName = request.getParameter("userName");
    //sql injection"


    String sql = "insert into member values('"+userId+"','"+userPw+"','"+userName+"',sysdate)";
    //String sql = "update member set username = '아무개'";
    jdbcConnect.pstmt = jdbcConnect.conn.prepareStatement(sql);
    int result = jdbcConnect.pstmt.executeUpdate(); //쿼리가 실행된다.
    jdbcConnect.close();
    System.out.println("테이블의 행에 영향을 미친 갯수 : "+result);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
