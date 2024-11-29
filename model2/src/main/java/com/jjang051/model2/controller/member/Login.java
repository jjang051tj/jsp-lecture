package com.jjang051.model2.controller.member;

import com.jjang051.model2.common.JDBCConnection;
import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.dto.LoginMemberDto;
import com.jjang051.model2.dto.MemberDto;
import com.jjang051.model2.utils.CookieManager;
import com.jjang051.model2.utils.JSFunction;
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
        String userId = CookieManager.readCookie(req, "rememberMe");
        System.out.println("cookie userId==="+userId);

        //req.setAttribute("cookieUserId", userId);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/member/login.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        String rememberMe = req.getParameter("rememberMe");
        System.out.println("rememberMe==="+rememberMe);
        MemberDao memberDao = new MemberDao(req.getServletContext());
        System.out.println("userId:" + userId+",userPw:" + userPw);
        //LoginMemberDto loginMemberDto = new LoginMemberDto();
        //loginMemberDto.setUserId(userId);
        //loginMemberDto.setUserPw(userPw);
        //memberDao.loginMember(loginMemberDto);
        MemberDto loggedMemberDto = memberDao.loginMember(new LoginMemberDto(userId, userPw));
        if(loggedMemberDto!=null) {
            if(rememberMe!=null) {
                CookieManager.makeCookie(resp, "rememberMe", userId, 60 * 60 * 24 * 30);
            } else {
                CookieManager.deleteCookie(resp, "rememberMe");
            }
            HttpSession session = req.getSession();
            session.setAttribute("loggedMemberDto", loggedMemberDto);
            resp.sendRedirect(req.getContextPath() + "/index/index");
            //서버는 응답하고 나면 끝이다 상태를 유지하지 않는다.stateless
        } else {
            JSFunction.alertAndBack("아이디 패스워드 확인해 주세요", resp);
        }
    }
}
