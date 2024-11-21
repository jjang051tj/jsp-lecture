package com.jjang051.jsp05_db.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class DBConnectionPool {
    public Connection conn;
    public Statement stmt;
    public ResultSet rs;
    public PreparedStatement pstmt;

    public DBConnectionPool() {
        try {
            Context initContext = new InitialContext();
            Context env = (Context) initContext.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) env.lookup("dbcp_oracle");
            conn = dataSource.getConnection();
            System.out.println("db connection pool connected");

        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
