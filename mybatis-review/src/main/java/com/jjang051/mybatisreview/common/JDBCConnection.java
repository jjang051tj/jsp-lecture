package com.jjang051.mybatisreview.common;

import jakarta.servlet.ServletContext;
import java.sql.*;

public class JDBCConnection {
    public Connection connection;
    public PreparedStatement preparedStatement;
    public ResultSet resultSet;
    public JDBCConnection(ServletContext application) {
        try {
            String driver = application.getInitParameter("OracleDriver");
            String url = application.getInitParameter("OracleURL");
            String userId = application.getInitParameter("OracleId");
            String userPw = application.getInitParameter("OraclePw");
            System.out.println("application db connected");
            Class.forName(driver);
            connection = DriverManager.getConnection(url, userId,userPw);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void close() {
        try {
            if(resultSet!=null) resultSet.close();
            if(preparedStatement!=null) preparedStatement.close();
            if(connection!=null) connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}