package com.jjang051.mybatisreview.controller.member;

import com.jjang051.mybatisreview.dao.MemberDao;
import com.jjang051.mybatisreview.dto.MemberDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/signup")
public class SignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        boolean hasError = false;
        if(userId.trim().equals("") || userId==null) {
            hasError = true;
            req.setAttribute("idError", "아이디는 필수입력사항입니다.");
        }
        if(userPw.trim().equals("") || userPw==null) {
            hasError = true;
            req.setAttribute("passwordError", "패스워드는 필수입력사항입니다.");
        }
        if(hasError) {
            req.getRequestDispatcher("/WEB-INF/member/signup.jsp").forward(req, resp);
        }
        MemberDto signupMemberDto =
                MemberDto.builder()
                        .userId(userId)
                        .userName(userPw)
                        .userEmail(req.getParameter("userEmail"))
                        .tel(req.getParameter("tel"))
                        .zipcode(req.getParameter("zipcode"))
                        .userPw(req.getParameter("userPw"))
                        .address(req.getParameter("addr01")+"-"+req.getParameter("addr02"))
                        .build();
        MemberDao memberDao = new MemberDao();
        int result = memberDao.signupMember(signupMemberDto);


        if (result > 0) {
            resp.sendRedirect("../member/login");
        } else {

        }

    }
}
