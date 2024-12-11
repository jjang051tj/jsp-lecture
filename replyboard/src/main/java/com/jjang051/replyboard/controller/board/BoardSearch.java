package com.jjang051.replyboard.controller.board;

import com.jjang051.replyboard.dao.BoardDao;
import com.jjang051.replyboard.dto.PageDto;
import com.jjang051.replyboard.dto.ReplyBoardDto;
import com.jjang051.replyboard.dto.SearchDto;
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
        SearchDto searchDto = new SearchDto();
        //searchDto.setStartPage(1);
        //searchDto.setEndPage(10);
        searchDto.setCategory("userName");
        searchDto.setPageDto(new PageDto(1,20));
        searchDto.setKeyword("장성호5");
        List<ReplyBoardDto> searchBoardList = boardDao.setSearchList(searchDto);
        req.setAttribute("searchBoardList", searchBoardList);
        req.getRequestDispatcher("/WEB-INF/board/search.jsp").forward(req, resp);
    }
}
