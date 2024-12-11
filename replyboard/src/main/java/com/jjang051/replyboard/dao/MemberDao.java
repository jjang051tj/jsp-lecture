package com.jjang051.replyboard.dao;

import com.jjang051.replyboard.dto.MemberDto;
import com.jjang051.replyboard.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

public class MemberDao {
    public int insertMember(MemberDto memberDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("signUp",memberDto);
        sqlSession.close();
        return result;
    }

    public MemberDto loginMember(MemberDto memberDto) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        MemberDto loggedMemberDto = sqlSession.selectOne("loginMemberString",memberDto.getUserId());
        sqlSession.close();
        return loggedMemberDto;
    }
}
