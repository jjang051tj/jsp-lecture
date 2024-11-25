<%@ page import="com.jjang051.member.common.JDBCConnection"%><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-25
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json;charset=UTF-8" language="java" %>
<%
    String userEmail = request.getParameter("userEmail");
    JDBCConnection jdbcConnection = new JDBCConnection(application);
    String sql = "SELECT count(*) AS count FROM MEMBER WHERE useremail=?";
    jdbcConnection.preparedStatement = jdbcConnection.connection.prepareStatement(sql);
    jdbcConnection.preparedStatement.setString(1,userEmail);
    jdbcConnection.resultSet = jdbcConnection.preparedStatement.executeQuery();
    int result = 0;
    if(jdbcConnection.resultSet.next()) {
        result = jdbcConnection.resultSet.getInt("count");
    }
%>
{
    "count":<%=result%>
}
