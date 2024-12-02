package com.jjang051.model2.controller.board;

import com.jjang051.model2.dao.BoardDao;
import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.dto.BoardDto;
import com.jjang051.model2.dto.MemberDto;
import com.jjang051.model2.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/board/modify-password")
public class BoardModifyPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/board/modify-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        int no = Integer.parseInt(req.getParameter("no"));
        MemberDao memberDao = new MemberDao(req.getServletContext());
        String password = memberDao.getPassword(userId, userPw);
        if(password.equals(userPw)) {
            resp.sendRedirect("../board/modify?no=" + no);
        } else {
            JSFunction.alertAndBack("패스워드 확인해 주세요",resp);
        }
    }
}

