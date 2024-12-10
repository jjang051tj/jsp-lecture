package com.jjang051.replyboard.dao;

import com.jjang051.replyboard.common.JDBCConnection;
import com.jjang051.replyboard.dto.ReplyBoardDto;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends JDBCConnection {
    public BoardDao(ServletContext application) {
        super(application);
    }
    public int writeBoard(ReplyBoardDto replyBoardDto) {
        int result = 0;
        try {
            String sql = "insert into replyboard values(seq_reply_board.nextval,?,?,?,?,?,?,0,0,1,sysdate,1,0)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, replyBoardDto.getTitle());
            preparedStatement.setString(2, replyBoardDto.getContent());
            preparedStatement.setString(3, replyBoardDto.getUserId());
            preparedStatement.setString(4, replyBoardDto.getUserName());
            preparedStatement.setString(5, replyBoardDto.getPassword());
            preparedStatement.setInt(6, replyBoardDto.getRegroup());
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

    public List<ReplyBoardDto> getAllList() {
        List<ReplyBoardDto> replyBoardList = null;

        try {
            String sql = "SELECT * FROM replyboard ORDER BY regroup DESC, relevel asc";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            replyBoardList = new ArrayList<>();
            while (resultSet.next()) {
                ReplyBoardDto replyBoardDto = ReplyBoardDto.builder()
                        .no(resultSet.getInt("no"))
                        .title(resultSet.getString("title"))
                        .content(resultSet.getString("content"))
                        .userId(resultSet.getString("userId"))
                        .userName(resultSet.getString("userName"))
                        .regroup(resultSet.getInt("regroup"))
                        .relevel(resultSet.getInt("relevel"))
                        .restep(resultSet.getInt("restep"))
                        .hit(resultSet.getInt("hit"))
                        .available(resultSet.getInt("available"))
                        .regDate(resultSet.getString("regDate"))
                        .build();
                replyBoardList.add(replyBoardDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return replyBoardList;
    }

    public ReplyBoardDto getBoard(int no) {
        ReplyBoardDto replyBoardDto = null;
        try {
            String sql = "SELECT * FROM replyboard WHERE no = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, no);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                replyBoardDto = ReplyBoardDto.builder()
                        .no(resultSet.getInt("no"))
                        .title(resultSet.getString("title"))
                        .content(resultSet.getString("content"))
                        .userId(resultSet.getString("userId"))
                        .userName(resultSet.getString("userName"))
                        .regroup(resultSet.getInt("regroup"))
                        .relevel(resultSet.getInt("relevel"))
                        .restep(resultSet.getInt("restep"))
                        .hit(resultSet.getInt("hit"))
                        .available(resultSet.getInt("available"))
                        .regDate(resultSet.getString("regDate"))
                        .parentId(resultSet.getInt("parentId"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return replyBoardDto;
    }

    public int updateRelevel(ReplyBoardDto replyBoardDto) {
        int result = 0;

        try {
            String sql = "UPDATE replyboard SET relevel = relevel+1 WHERE regroup = ? AND relevel > ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, replyBoardDto.getRegroup());
            preparedStatement.setInt(2, replyBoardDto.getRelevel());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }

    public int replyBoard(ReplyBoardDto replyBoardDto) {
        int result = 0;
        try {
            String sql = "insert into replyboard values(seq_reply_board.nextval,?,?,?,?,?,?,?,?,1,sysdate,1,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, replyBoardDto.getTitle());
            preparedStatement.setString(2, replyBoardDto.getContent());
            preparedStatement.setString(3, replyBoardDto.getUserId());
            preparedStatement.setString(4, replyBoardDto.getUserName());
            preparedStatement.setString(5, replyBoardDto.getPassword());
            preparedStatement.setInt(6, replyBoardDto.getRegroup());
            preparedStatement.setInt(7, replyBoardDto.getRelevel());
            preparedStatement.setInt(8, replyBoardDto.getRestep());
            preparedStatement.setInt(9, replyBoardDto.getParentId());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }

    private int getparentId(int no,String password) {
        int parentId = 0;
        try {
            String sql = "SELECT parentId FROM replyboard WHERE no = ? AND password = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, no);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                parentId = resultSet.getInt("parentId");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return parentId;
    }

    public int hardDeleteBoard(String password,int parentId, int no) {

        int result = 0;
        System.out.println("parentId==="+parentId);

        try {
            String originalDeleteSql = "DELETE FROM replyboard WHERE no = ? AND password = ?";
            preparedStatement = connection.prepareStatement(originalDeleteSql);
            preparedStatement.setInt(1, no);
            preparedStatement.setString(2, password);
            int originalDeleteResult = preparedStatement.executeUpdate();
            if(parentId==0 && originalDeleteResult > 0) {
                String sql = "DELETE FROM replyboard WHERE parentId = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, no);
                result = preparedStatement.executeUpdate();
                System.out.println("all delete success");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }
}
