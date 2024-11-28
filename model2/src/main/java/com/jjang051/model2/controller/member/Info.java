package com.jjang051.model2.controller.member;

import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.dto.MemberDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/info")
public class Info extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        MemberDao memberDao = new MemberDao(req.getServletContext());
        MemberDto memberDto = memberDao.getMemberInfo(userId);
        req.setAttribute("memberDto", memberDto);
        System.out.println(memberDto);
        req.getRequestDispatcher("/WEB-INF/member/info.jsp").forward(req, resp);
    }
}
