package com.jjang051.replyboard.controller.board;

import com.jjang051.replyboard.dao.BoardDao;
import com.jjang051.replyboard.dto.PageDto;
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
        int listPerPage = 10;
        int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
        int total =  boardDao.getTotalCount();
        int serverStartPage =  (page - 1) * listPerPage+1;
        int serverEndPage =  page*listPerPage;

        int listPerPagination = 5;
        int totalPagination =  (int)Math.ceil((double)total / listPerPage);


        int serverStartPagination = ((page - 1) / listPerPagination)*listPerPagination+1;
        int serverEndPagination = serverStartPagination+listPerPagination - 1;
        int serverNextPagination = serverStartPagination+listPerPagination;
        int serverPrevPagination = serverStartPagination - 1;

        if (serverNextPagination >= totalPagination) {
            serverNextPagination = totalPagination;

        }
        if (serverEndPagination >= totalPagination) {
            serverEndPagination = totalPagination;
        }



        PageDto pageDto = new PageDto(serverStartPage,serverEndPage);
        List<ReplyBoardDto> replyBoardList = boardDao.getAllList(pageDto);

        req.setAttribute("replyBoardList", replyBoardList);
        req.setAttribute("total", total);

        req.setAttribute("serverPrevPagination", serverPrevPagination);
        req.setAttribute("serverStartPagination", serverStartPagination); //1 == 1~5 , 2 == 6~10
        req.setAttribute("serverEndPagination", serverEndPagination);
        req.setAttribute("serverNextPagination", serverNextPagination);
        req.setAttribute("totalPagination", totalPagination);
        req.getRequestDispatcher("/WEB-INF/board/list.jsp").forward(req, resp);
    }
}
