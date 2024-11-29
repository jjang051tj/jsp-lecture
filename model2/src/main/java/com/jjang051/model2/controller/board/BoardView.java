package com.jjang051.model2.controller.board;

import com.jjang051.model2.dao.BoardDao;
import com.jjang051.model2.dto.BoardDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/board/view")
public class BoardView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int no = Integer.parseInt(req.getParameter("no"));
        BoardDao boardDao = new BoardDao(req.getServletContext());
        BoardDto boardDto = boardDao.getBoard(no);
        req.setAttribute("boardDto", boardDto);
        req.getRequestDispatcher("/WEB-INF/board/view.jsp").forward(req, resp);
    }
}
