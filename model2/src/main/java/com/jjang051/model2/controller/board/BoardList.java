package com.jjang051.model2.controller.board;

import com.jjang051.model2.dao.BoardDao;
import com.jjang051.model2.dto.BoardDto;
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
        BoardDao pageBoardDao = new BoardDao(req.getServletContext());
        int total = pageBoardDao.getTotalCount();
        System.out.println("total==="+total);
        //List<BoardDto> boardList  = boardDao.getAllBoard();
        List<BoardDto> boardList  = boardDao.getPageBoard(1,10);
        req.setAttribute("boardList", boardList); //Collection
        req.setAttribute("total", total);
        req.getRequestDispatcher("/WEB-INF/board/list.jsp").forward(req, resp);
    }
}
