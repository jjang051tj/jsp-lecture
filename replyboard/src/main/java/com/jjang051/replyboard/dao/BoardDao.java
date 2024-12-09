package com.jjang051.replyboard.dao;

import com.jjang051.replyboard.common.JDBCConnection;
import com.jjang051.replyboard.dto.ReplyBoardDto;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;

public class BoardDao extends JDBCConnection {
    public BoardDao(ServletContext application) {
        super(application);
    }
    public int writeBoard(ReplyBoardDto replyBoardDto) {
        int result = 0;
        try {
            String sql = "insert into replyboard values(seq_reply_board.nextval,?,?,?,?,?,?,0,0,1,sysdate,1)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,replyBoardDto.getTitle());
            preparedStatement.setString(2,replyBoardDto.getContent());
            preparedStatement.setString(3,replyBoardDto.getUserId());
            preparedStatement.setString(4,replyBoardDto.getUserName());
            preparedStatement.setString(5,replyBoardDto.getPassword());
            preparedStatement.setInt(6,replyBoardDto.getRegroup());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }
    public int getMaxRegroup() {
        int result = 0;
        try {
            String sql = "SELECT nvl(max(regroup),0) AS max FROM replyboard";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                result = resultSet.getInt("max");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }
}
