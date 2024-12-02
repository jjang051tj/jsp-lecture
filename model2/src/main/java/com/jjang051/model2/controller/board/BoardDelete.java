package com.jjang051.model2.controller.board;

import com.jjang051.model2.dao.BoardDao;
import com.jjang051.model2.dao.MemberDao;
import com.jjang051.model2.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/delete")
public class BoardDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/board/delete.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        int no = Integer.parseInt(req.getParameter("no"));
        MemberDao memberDao = new MemberDao(req.getServletContext());
        String password = memberDao.getPassword(userId, userPw);
        if(password != null && password.equals(userPw)) {
            BoardDao boardDao = new BoardDao(req.getServletContext());
            int result = boardDao.deleteBoard(no);
            if(result > 0) {
                JSFunction.alertAndLocation("게시글이 삭제되었습니다.", "../index/index", resp);
            } else {
                JSFunction.alertAndBack("패스워드 확인해 주세요.",  resp);
            }
        } else {
            JSFunction.alertAndBack("패스워드 확인해 주세요.",  resp);
        }
    }
}
