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
}
