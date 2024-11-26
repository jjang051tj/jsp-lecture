package com.jjang051.model2.controller.member;

import com.jjang051.model2.common.JDBCConnection;
import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.dto.LoginMemberDto;
import com.jjang051.model2.dto.MemberDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/member/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/member/login.jsp");
        dispatcher.forward(req, resp);
        /*
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("{!DOCTYPE html}");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Login</title>");
        out.println("</head>");
        out.println("<form>");
        out.println("<input type=\"text\" name=\"userId\">");
        out.println("<input type=\"text\" name=\"userPw\">");
        out.println("<button>로그인</button>");
        out.println("</form>");
         */
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        MemberDao memberDao = new MemberDao(req.getServletContext());
        System.out.println("userId:" + userId+",userPw:" + userPw);
        //LoginMemberDto loginMemberDto = new LoginMemberDto();
        //loginMemberDto.setUserId(userId);
        //loginMemberDto.setUserPw(userPw);
        //memberDao.loginMember(loginMemberDto);
        MemberDto loggedMemberDto = memberDao.loginMember(new LoginMemberDto(userId, userPw));
        HttpSession session = req.getSession();
        session.setAttribute("loggedMemberDto", loggedMemberDto);
        resp.sendRedirect(req.getContextPath()+"/index/index");
    }
}
