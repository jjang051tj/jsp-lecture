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
        int listPerPage = 10;
        int startPage = req.getParameter("startPage") == null ? 1 : Integer.parseInt(req.getParameter("startPage"));
        int endPage = startPage + listPerPage;
        //1   1~10
        //2   11~20
        int total = pageBoardDao.getTotalCount();
        int serverStartPage = (startPage-1)*listPerPage + 1;  //1, 11
        int serverEndPage =  startPage*listPerPage;
        List<BoardDto> boardList  = boardDao.getPageBoard(serverStartPage,serverEndPage);
        req.setAttribute("boardList", boardList); //Collection
        req.setAttribute("total", total);
        req.getRequestDispatcher("/WEB-INF/board/list.jsp").forward(req, resp);
    }
}
