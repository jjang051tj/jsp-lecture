package com.jjang051.model2.dao;

import com.jjang051.model2.common.JDBCConnection;
import com.jjang051.model2.dto.LoginMemberDto;
import com.jjang051.model2.dto.MemberDto;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;

//Dao Database Access Object
public class MemberDao extends JDBCConnection {
    public MemberDao(ServletContext application) {
        super(application);
    }
    public MemberDto loginMember(LoginMemberDto loginMemberDto) {
        MemberDto memberDto = null;
        try {
            String sql = "select * from member where userId=? and userPw=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, loginMemberDto.getUserId());
            preparedStatement.setString(2, loginMemberDto.getUserPw());
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                memberDto = new MemberDto();
                memberDto.setUserId(resultSet.getString("userId"));
                memberDto.setUserName(resultSet.getString("userName"));
                memberDto.setAddress(resultSet.getString("address"));
                memberDto.setRegDate(resultSet.getString("regDate"));
                memberDto.setTel(resultSet.getString("tel"));
            }
            System.out.println("login success");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return memberDto;
    }
    public int insertMember(MemberDto memberDto) {
        int result=0;
        try {
            String sql = "INSERT INTO MEMBER VALUES (seq_member.nextval,?,?,?,?,?,?,?,sysdate)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, memberDto.getUserId());
            preparedStatement.setString(2, memberDto.getUserPw());
            preparedStatement.setString(3, memberDto.getUserName());
            preparedStatement.setString(4, memberDto.getUserEmail());
            preparedStatement.setInt(5, Integer.parseInt(memberDto.getZipcode()));
            preparedStatement.setString(6, memberDto.getAddress());
            preparedStatement.setString(7, memberDto.getTel());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close();
        }
        return result;
    }
    public int idCheck(String userId) {
        int result=0;
        try {
            String sql =  "select count(*) as count from member where userId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userId);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                result = resultSet.getInt("count");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }

    public int emailCheck(String userEmail) {
        int result = 0;

        try {
            String sql =  "select count(*) as count from member where userEmail = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userEmail);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                result = resultSet.getInt("count");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }

    public MemberDto getMemberInfo(String userId) {
        MemberDto memberDto = null;
        try {
            String sql = "select * from member where userId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userId);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                System.out.println("resultSet");
                memberDto = new MemberDto();
                memberDto.setUserName(resultSet.getString("userName"));
                memberDto.setUserEmail(resultSet.getString("userEmail"));
                memberDto.setAddress(resultSet.getString("address"));
                memberDto.setTel(resultSet.getString("tel"));
                memberDto.setZipcode(resultSet.getString("zipcode"));
                memberDto.setRegDate(resultSet.getString("regDate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return memberDto;
    }
}
