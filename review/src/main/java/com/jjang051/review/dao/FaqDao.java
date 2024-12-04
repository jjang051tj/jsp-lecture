package com.jjang051.review.dao;

import com.jjang051.review.Faq;
import com.jjang051.review.common.JDBCConnection;
import com.jjang051.review.dto.FaqDto;
import jakarta.servlet.ServletContext;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public List<FaqDto> getFaqList() {
        List<FaqDto> faqList = new ArrayList<>();
        try {
            String sql = "select * from faq order by no desc";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                FaqDto faqDto = new FaqDto();
                faqDto.setNo(resultSet.getInt("no"));
                faqDto.setQuestion(resultSet.getString("question"));
                faqDto.setAnswer(resultSet.getString("answer"));
                faqDto.setRegDate(resultSet.getString("regDate"));
                faqList.add(faqDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return faqList;
    }
}
