package com.jjang051.model2.dao;

import com.jjang051.model2.common.JDBCConnection;
import com.jjang051.model2.dto.BoardDto;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public List<BoardDto> getAllBoard() {
        List<BoardDto> list = null;

        try {
            String sql="select * from board  order by regDate desc";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            list = new ArrayList<>();
            while (resultSet.next()) {
                BoardDto boardDto = new BoardDto();
                boardDto.setNo(resultSet.getInt("no"));
                boardDto.setUserId(resultSet.getString("userId"));
                boardDto.setUserName(resultSet.getString("userName"));
                boardDto.setTitle(resultSet.getString("title"));
                boardDto.setContent(resultSet.getString("content"));
                boardDto.setHit(resultSet.getInt("hit"));
                boardDto.setRegDate(resultSet.getString("regDate"));
                list.add(boardDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return list;
    }

    public int updateHit(int no) {
        int result= 0;
        try {
            String sql="update board set hit = hit + 1 where no=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, no);
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }


    public BoardDto getBoard(int no) {
        BoardDto boardDto = null;
        try {
            updateHit(no);
            String sql="select * from board where no = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, no);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                boardDto = new BoardDto();
                boardDto.setNo(resultSet.getInt("no"));
                boardDto.setUserId(resultSet.getString("userId"));
                boardDto.setUserName(resultSet.getString("userName"));
                boardDto.setTitle(resultSet.getString("title"));
                boardDto.setContent(resultSet.getString("content"));
                boardDto.setHit(resultSet.getInt("hit"));
                boardDto.setRegDate(resultSet.getString("regDate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }


        return boardDto;
    }

    public int deleteBoard(int no) {
        int result =0;
        try {
            String sql =  "delete from board where no = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, no);
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public int modifyBoard(BoardDto boardDto) {
        int result= 0;
        try {
            String sql="UPDATE board SET title = ?,content = ?, regDate = sysdate WHERE no = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, boardDto.getTitle());
            preparedStatement.setString(2, boardDto.getContent());
            preparedStatement.setInt(3, boardDto.getNo());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }

    public List<BoardDto> searchBoard(String search) {
        List<BoardDto> searchBoardList = null;

        try {
            String sql="select * from board where title like ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + search + "%");
            resultSet = preparedStatement.executeQuery();
            searchBoardList = new ArrayList<>();
            while (resultSet.next()) {
                BoardDto boardDto = new BoardDto();
                boardDto.setNo(resultSet.getInt("no"));
                boardDto.setUserId(resultSet.getString("userId"));
                boardDto.setUserName(resultSet.getString("userName"));
                boardDto.setTitle(resultSet.getString("title"));
                boardDto.setContent(resultSet.getString("content"));
                boardDto.setHit(resultSet.getInt("hit"));
                boardDto.setRegDate(resultSet.getString("regDate"));
                searchBoardList.add(boardDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return searchBoardList;
    }

    public List<BoardDto> searchBoard(String search, String category) {
        List<BoardDto> searchBoardList = null;
        String sql = null;
        try {
            if(category.equals("userName")) {
                sql = "select * from board where userName like ?";
            } else if(category.equals("title")) {
                sql = "select * from board where title like ?";
            } else {
                sql = "select * from board where content like ?";
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + search + "%");
            resultSet = preparedStatement.executeQuery();
            searchBoardList = new ArrayList<>();
            while (resultSet.next()) {
                BoardDto boardDto = new BoardDto();
                boardDto.setNo(resultSet.getInt("no"));
                boardDto.setUserId(resultSet.getString("userId"));
                boardDto.setUserName(resultSet.getString("userName"));
                boardDto.setTitle(resultSet.getString("title"));
                boardDto.setContent(resultSet.getString("content"));
                boardDto.setHit(resultSet.getInt("hit"));
                boardDto.setRegDate(resultSet.getString("regDate"));
                searchBoardList.add(boardDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return searchBoardList;
    }
}
