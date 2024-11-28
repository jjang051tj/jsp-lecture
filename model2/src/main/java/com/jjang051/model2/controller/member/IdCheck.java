package com.jjang051.model2.controller.member;

import com.jjang051.model2.dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/id-check")
public class IdCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String userId = req.getParameter("userId");
        MemberDao memberDao = new MemberDao(req.getServletContext());
        int result = memberDao.idCheck(userId);
        String resultJson =  "{\"result\":" + result + "}";  //{"result":1}
        req.setAttribute("resultJson", resultJson);
        req.getRequestDispatcher("/WEB-INF/member/id-check.jsp").forward(req, resp);
    }
}
