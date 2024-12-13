package com.jjang051.mybatisreview.controller.member;

import com.jjang051.mybatisreview.dao.MemberDao;
import com.jjang051.mybatisreview.dto.MemberDto;
import com.jjang051.mybatisreview.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDto loginMemberDto = MemberDto.builder()
                .userId(req.getParameter("userId"))
                .userPw(req.getParameter("userPw"))
                .build();
        MemberDao loginMemberDao = new MemberDao();
        MemberDto loggedMemberDto = loginMemberDao.loginMember(loginMemberDto);
        if(loggedMemberDto!=null){
            resp.sendRedirect("../index/index");
        } else {
            JSFunction.alertAndBack("오류",resp);
        }
    }
}
