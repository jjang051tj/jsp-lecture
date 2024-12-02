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

@WebServlet("/board/search")
public class BoardSearch extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao boardDao = new BoardDao(req.getServletContext());
        String search = req.getParameter("search");
        String category = req.getParameter("category");
        System.out.println(category+"==="+search);
        List<BoardDto> searchBoardList = boardDao.searchBoard(search,category);
        req.setAttribute("boardList", searchBoardList);
        req.getRequestDispatcher("/WEB-INF/board/list.jsp").forward(req, resp);
    }
}
