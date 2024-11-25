<%@ page import="com.jjang051.member.common.JDBCConnection" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-25
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userId");
    JDBCConnection jdbcConnection = new JDBCConnection(application);
    String sql = "SELECT count(*) AS count FROM MEMBER WHERE userid=?";
    jdbcConnection.preparedStatement = jdbcConnection.connection.prepareStatement(sql);
    jdbcConnection.preparedStatement.setString(1,userId);
    jdbcConnection.resultSet = jdbcConnection.preparedStatement.executeQuery();
    int result = 0;
    if(jdbcConnection.resultSet.next()) {
        result = jdbcConnection.resultSet.getInt("count");
    }
    //jdbcConnection.connection = jdbcConnection/
%>
{
    "count":<%=result%>,
    "userId":<%=userId%>
}