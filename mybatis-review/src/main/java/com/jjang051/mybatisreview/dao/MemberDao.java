package com.jjang051.mybatisreview.dao;

import com.jjang051.mybatisreview.common.JDBCConnection;
import com.jjang051.mybatisreview.dto.MemberDto;
import com.jjang051.mybatisreview.mybatis.MybatisConnectionFactory;
import jakarta.servlet.ServletContext;
import org.apache.ibatis.session.SqlSession;

public class MemberDao {


    public int signupMember(MemberDto memberDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        result = sqlSession.insert("signupMember", memberDto);
        System.out.println("result:" + result);
        sqlSession.close();
        return result;
    }

    public MemberDto loginMember(MemberDto loginMemberDto) {
        MemberDto loggedMemberDto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        loggedMemberDto = sqlSession.selectOne("loginMember", loginMemberDto);
        sqlSession.close();
        return loggedMemberDto;
    }
}
