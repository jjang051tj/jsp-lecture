<%@ page import="com.jjang051.member.common.JDBCConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jjang051.member.utils.JSFunction" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-22
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    JDBCConnection jdbcConnection = new JDBCConnection(application);
    String sql =  "select * from member where userId = '"+userId+"' and userPw = '"+userPw+"'";
    PreparedStatement preparedStatement = jdbcConnection.connection.prepareStatement(sql);
    ResultSet resultSet = preparedStatement.executeQuery();
    String loggedUserId = "";
    String loggedUserName = "";
    String loggedUserRegdate = "";
    if(resultSet.next()) {
        loggedUserId = resultSet.getString("userId");
        loggedUserName = resultSet.getString("userName");
        loggedUserRegdate = resultSet.getString("regDate");
        System.out.println(loggedUserId+"/"+loggedUserName+"/"+loggedUserRegdate);
    }else {
        JSFunction.alertAndBack("아이디 패스워드 확인해 주세요",response);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>id : <%=loggedUserId%></h1>
<h1>name : <%=loggedUserName%></h1>
<h1>date : <%=loggedUserRegdate%></h1>
</body>
</html>