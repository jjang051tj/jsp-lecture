<%@ page import="com.jjang051.member.common.JDBCConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.jjang051.member.utils.JSFunction" %><%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-22
  Time: 오전 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userName = request.getParameter("userName");
  //1.연결
  JDBCConnection jdbcConnection = new JDBCConnection(application);

  String sql = "INSERT INTO MEMBER VALUES (?,?,?,sysdate)";
  jdbcConnection.preparedStatement =
          jdbcConnection.connection.prepareStatement(sql);
  jdbcConnection.preparedStatement.setString(1,userId);
  jdbcConnection.preparedStatement.setString(2,userPw);
  jdbcConnection.preparedStatement.setString(3,userName);
  int result = jdbcConnection.preparedStatement.executeUpdate();
  //  System.out.println("result==="+result);
  jdbcConnection.close();
  if(result>0) {
    JSFunction.alertAndLocation
            ("회원가입되었습니다. 로그인 페이지로 이동합니다.", "login.jsp", response);
  } else {
    JSFunction.alertAndBack
            ("알 수 없는 오류가 발생되었습니다. 잠시 후 다시 시도해 주세요.", response);
  }

%>