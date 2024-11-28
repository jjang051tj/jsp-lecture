package com.jjang051.model2.controller.member;

import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.dto.MemberDto;
import com.jjang051.model2.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/password-check")
public class PasswordCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/password-check.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        MemberDao memberDao = new MemberDao(req.getServletContext());
        MemberDto memberDto = memberDao.passwordCheck(userId,userPw);
        if(memberDto != null){
            resp.sendRedirect(req.getContextPath() + "/member/member-info-change");
        } else {
            JSFunction.alertAndBack("아이디 패스워드 확인해 주세요",resp);
        }
    }
}
