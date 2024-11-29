package com.jjang051.model2.dao;

import com.jjang051.model2.common.JDBCConnection;
import com.jjang051.model2.dto.BoardDto;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;

public class BoardDao extends JDBCConnection {
    public BoardDao(ServletContext application) {
        super(application);
    }
    public int writeBoard(BoardDto boardDto) {
        int result= 0;
        try {
            String sql="INSERT INTO board VALUES(seq_board.nextval , ?, ? , ? , ?,0,sysdate)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, boardDto.getUserId());
            preparedStatement.setString(2, boardDto.getUserName());
            preparedStatement.setString(3, boardDto.getTitle());
            preparedStatement.setString(4, boardDto.getContent());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }
}
