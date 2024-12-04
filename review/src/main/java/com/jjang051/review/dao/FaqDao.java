package com.jjang051.review.dao;

import com.jjang051.review.Faq;
import com.jjang051.review.common.JDBCConnection;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;

public class FaqDao extends JDBCConnection {
    public FaqDao(ServletContext application) {
        super(application);
        System.out.println("jdbc connect");
    }
    public int writeFaq(String question, String answer) {
        int result = 0;

        try {
            String sql = "insert into faq values(faq_seq.nextval,?,?,sysdate)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, question);
            preparedStatement.setString(2, answer);
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }
}
