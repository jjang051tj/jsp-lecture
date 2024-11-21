package com.jjang051.jsp05_db.common;

import jakarta.servlet.ServletContext;

import java.sql.*;

public class JDBCConnect {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public JDBCConnect() {
        //reflection
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String userId = "jjang051";
            String userPw = "1234";
            Connection conn = DriverManager.getConnection(url,userId,userPw);
            System.out.println(userId+"/"+userPw+"   oracle connected");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public JDBCConnect(String driver, String url, String userId, String userPw ) {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url,userId,userPw);
            System.out.println(userId+"/"+userPw+"   oracle parameter connected");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public JDBCConnect(ServletContext application) {
        try {
            //jsp는 java를 가지고 html좀 편하게 쓰자고 만든거
            // application = ServletContext
            // request = HttpServletRequest
            // response = HttpServletResponse
            String driver = application.getInitParameter("OracleDriver");
            String url = application.getInitParameter("OracleUrl");
            String userId = application.getInitParameter("OracleId");
            String userPw = application.getInitParameter("OraclePw");
            Class.forName(driver);
            conn = DriverManager.getConnection(url,userId,userPw);
            System.out.println(userId+"/"+userPw+"   oracle application connected");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void close() {
        try {
            if(rs!=null)  rs.close();
            if(stmt!=null)  stmt.close();
            if(pstmt!=null)  pstmt.close();
            if(conn!=null)  conn.close();
            System.out.println("JDBC connection closed");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
