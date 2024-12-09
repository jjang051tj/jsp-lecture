package com.jjang051.replyboard.controller.board;

import com.jjang051.replyboard.dao.BoardDao;
import com.jjang051.replyboard.dto.ReplyBoardDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/board/list")
public class BoardList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao boardDao = new BoardDao(req.getServletContext());
        List<ReplyBoardDto> replyBoardList = boardDao.getAllList();
        req.setAttribute("replyBoardList", replyBoardList);
        req.getRequestDispatcher("/WEB-INF/board/list.jsp").forward(req, resp);
    }
}
