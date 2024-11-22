<%@ page import="com.jjang051.member.common.JDBCConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %><%--
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

  String sql = "INSERT INTO MEMBER VALUES ('"+userId+"','"+userPw+"','"+userName+"',sysdate)";
  PreparedStatement preparedStatement =
          jdbcConnection.connection.prepareStatement(sql);
  int result = preparedStatement.executeUpdate();
  //  System.out.println("result==="+result);
  if(result>0) {
    out.println(
            "<script>" +
                    "alert('회원가입 되었습니다. 로그인 페이지로 이동합니다.');" +
                    "location.href='login.jsp';" +
            "</script>"
    );
  } else {
    out.println(
            "<script>" +
                    "alert('알 수 없는 오류가 발생하였습니다.');" +
                    "history.back();" +
            "</script>"
    );
  }
%>