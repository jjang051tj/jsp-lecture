package com.jjang051.member.common;

import jakarta.servlet.ServletContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection {
    public JDBCConnection() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String userId = "jjang052";
            String userPw = "1234";
            Connection connection = DriverManager.getConnection(url,userId,userPw);
            if(connection!=null) {
                System.out.println("db connected");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public JDBCConnection(ServletContext application) {
        String driver = application.getInitParameter("OracleDriver");
        String url = application.getInitParameter("OracleURL");
        String userId = application.getInitParameter("OracleId");
        String userPw = application.getInitParameter("OraclePw");
        System.out.println("application db connected");
        try {
            Class.forName(driver);
            DriverManager.getConnection(url, userId,userPw);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
