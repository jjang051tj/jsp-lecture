package com.jjang051.review.common;

import jakarta.servlet.ServletContext;

import java.sql.*;

public class JDBCConnection {
    public Connection connection;
    public PreparedStatement preparedStatement;
    public ResultSet resultSet;

    public JDBCConnection(ServletContext servletContext) {
        try {
            String driver = servletContext.getInitParameter("OracleDriver");
            String url = servletContext.getInitParameter("OracleURL");
            String userId = servletContext.getInitParameter("OracleId");
            String userPw = servletContext.getInitParameter("OraclePw");
            Class.forName(driver);
            connection = DriverManager.getConnection(url, userId, userPw);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void close() {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}






