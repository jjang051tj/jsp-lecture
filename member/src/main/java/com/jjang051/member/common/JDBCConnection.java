package com.jjang051.member.common;

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
}
